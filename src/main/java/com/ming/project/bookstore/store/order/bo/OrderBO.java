package com.ming.project.bookstore.store.order.bo;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.store.order.dao.OrderDAO;
import com.ming.project.bookstore.user.bo.UserBO;

@Service
public class OrderBO {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderDAO orderDAO;

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
	
	
	// 주문 내역 저장
	public int addOrder(List<String> shippingList, Integer userId) {
		
		int memberId = userId;
		int nonMemberId = userBO.getNonMember().getId();
		
		String orderNumber = setOrderNumber();
		int totalCount = 0;
		int totalPrice = 0;
		int deliveryCost;
		if (totalPrice > 30000) {
			deliveryCost = 0;
		} else {
			deliveryCost = 3000;
		}
		
		String name = shippingList.get(0);
		String phoneNumber = shippingList.get(1);
		String address1 = shippingList.get(2);
		String address2 = shippingList.get(3);
		String address3 = shippingList.get(4);
		
		
		return orderDAO.insertOrder(memberId, nonMemberId, orderNumber, totalCount, totalPrice
				, deliveryCost, name, phoneNumber, address1, address2, address3);
	}
	
	// 상품 정보 저장
	public int addOrderDetail(List<String> bookDetail) {
		
		
		int orderId = 0;
		String isbn = bookDetail.get(0);
		int count = Integer.parseInt(bookDetail.get(1));
		int price = Integer.parseInt(bookDetail.get(2));
		
		return orderDAO.insertOrderDetail(orderId, isbn, count, price);
	}
	
	// 상품 정보 저장 후 주문 내역 수정
	
}
