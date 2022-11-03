package com.ming.project.bookstore.store.order.bo;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.store.book.bo.BookBO;
import com.ming.project.bookstore.store.book.model.BookDetail;
import com.ming.project.bookstore.store.order.dao.OrderDAO;
import com.ming.project.bookstore.store.order.model.Order;
import com.ming.project.bookstore.store.order.model.OrderBookDetail;
import com.ming.project.bookstore.store.order.model.OrderDetail;
import com.ming.project.bookstore.store.order.model.OrderInfo;
import com.ming.project.bookstore.user.bo.UserBO;

@Service
public class OrderBO {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private BookBO bookBO;

	// 주문번호 난수
	public String setOrderNumber() {
		String orderNumber = "";

		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		String month = new DecimalFormat("00").format(cal.get(Calendar.MONTH + 1));
		String day = new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String subNumber = "";
		for (int i = 0; i < 6; i++) {
			subNumber += (int) (Math.random() * 10);
		}
		
		orderNumber = year + month + day + "_" + subNumber;
		
		return orderNumber;
	}
	
	// 주문 정보 저장 - 회원
	public boolean addOrderMember(int userId, List<String> shippingList, List<String> bookDetail) {
		
		// 여러 query 동시 수행 시 트랜잭션
		
		int orderCount = addOrder(shippingList, userId, null);
		
		int orderId = getOrderByUserId(userId).getId();
		int orderDetailCount = addOrderDetail(bookDetail, orderId);
		
		int updateOrderCount = updateOrder(orderId); 

		if (updateOrderCount == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	// 주문 정보 저장 - 비회원
	public boolean addOrderNonMember(int nonMemberId, List<String> shippingList, List<String> bookDetail) {
		
		// 여러 query 동시 수행 시 트랜잭션
		
		int orderCount = addOrder(shippingList, null, nonMemberId);
		
		int orderId = getOrderByNonMemberId(nonMemberId).getId();
		int orderDetailCount = addOrderDetail(bookDetail, orderId);
		
		int updateOrderCount = updateOrder(orderId);
		
		if (updateOrderCount == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	// 주문 내역 저장
	public int addOrder(List<String> shippingList, Integer userId, Integer nonMemberId) {
		
		String orderNumber = setOrderNumber();
		int totalCount = 0;
		int totalPrice = 0;
		int deliveryCost = 0;
		
		String name = shippingList.get(0);
		String phoneNumber = shippingList.get(1);
		String address1 = shippingList.get(2);
		String address2 = shippingList.get(3);
		String address3 = shippingList.get(4);
		
		return orderDAO.insertOrder(userId, nonMemberId, orderNumber, totalCount, totalPrice
				, deliveryCost, name, phoneNumber, address1, address2, address3);
	}
	
	public Order getOrderByUserId(int userId) {
		return orderDAO.selectOrderByUserId(userId);
	}
	
	public Order getOrderByNonMemberId(int nonMemberId) {
		return orderDAO.selectOrderByNonMemberId(nonMemberId);
	}
	
	public List<Order> getOrderListByNonMemberId(int nonMemberId) {
		return orderDAO.selectOrderListByNonMemberId(nonMemberId);
	}
	
	// 상세 정보 저장
	public int addOrderDetail(List<String> bookDetail, int orderId) {
		
		String isbn = bookDetail.get(0);
		int count = Integer.parseInt(bookDetail.get(1));
		int price = Integer.parseInt(bookDetail.get(2));
		
		return orderDAO.insertOrderDetail(orderId, isbn, count, price);
	}
	
	// 상세 정보 저장 후 주문 내역 수정
	
	public List<OrderDetail> getOrderDetailByOrderId(int orderId) {
		return orderDAO.selectOrderDetailByOrderId(orderId);
	}
	
	public int updateOrder(int orderId) {
		
		List<OrderDetail> detailList = getOrderDetailByOrderId(orderId);

		int totalCount = 0;
		int totalPrice = 0;

		for (int i = 0; i < detailList.size(); i++) {
			int count = detailList.get(i).getCount();
			int price = detailList.get(i).getPrice();
			totalCount += count;
			totalPrice += count * price;
		}
		
		int deliveryCost = 0;
		
		if (totalPrice > 30000) {
			deliveryCost = 0;
		} else {
			deliveryCost = 3000;
		}
		
		return orderDAO.updateOrder(orderId, totalCount, totalPrice, deliveryCost);
	}
	
	// 구매 내역 조회
	
	public int getOrderCountByNonMember(int nonMemberId) {
		return orderDAO.selectOrderCountByNonMember(nonMemberId);
	}
	
	public List<OrderInfo> getOrderInfoByNonMember(int nonMemberId) {
		
		List<Order> orderList = getOrderListByNonMemberId(nonMemberId);

		List<OrderInfo> orderInfoList = new ArrayList<>();
		OrderInfo orderInfo = new OrderInfo();
		
		List<OrderBookDetail> orderBookDetailList = new ArrayList<>();
		
		for(Order order : orderList) {
			
			OrderBookDetail orderBookDetail = new OrderBookDetail();

			List<OrderDetail> orderDetailList = getOrderDetailByOrderId(order.getId());
			
			for(OrderDetail detail : orderDetailList) {
				
				BookDetail bookDetail = bookBO.getBookDetailObject(detail.getIsbn());
				
				orderBookDetail.setOrderDetail(detail);
				orderBookDetail.setBookDetail(bookDetail);
				
				orderBookDetailList.add(orderBookDetail);
			}
			
			orderInfo.setOrder(order);
			orderInfo.setOrderBookDetailList(orderBookDetailList);
			
			orderInfoList.add(orderInfo);
		}
		
		return orderInfoList;
	}
}
