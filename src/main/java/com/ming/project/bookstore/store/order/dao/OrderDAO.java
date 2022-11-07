package com.ming.project.bookstore.store.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.bookstore.store.order.model.Order;
import com.ming.project.bookstore.store.order.model.OrderDetail;

@Repository
public interface OrderDAO {

	// 주문 내역 저장 - 회원
	public int insertOrder(Order order);
	
	public int insertOrderDetail(
			@Param("orderId") int orderId
			,@Param("isbn") String isbn
			, @Param("count") int count
			, @Param("price") int price);
	
	public Order selectOrderByOrderId(@Param("orderId") int orderId);
	
	public Order selectOrderByUserId(@Param("userId") int userId);
	
	public Order selectOrderByNonMemberId(@Param("nonMemberId") int nonMemberId);
	
	public int selectOrderCountByNonMember(@Param("nonMemberId") int nonMemberId);
	
	public List<Order> selectOrderListByUserId(@Param("userId") int userId);
	
	public List<Order> selectOrderListByNonMemberId(@Param("nonMemberId") int nonMemberId);
	
	public List<Order> selectOrderListByOrderId(@Param("orderId") int orderId);
	
	public List<OrderDetail> selectOrderDetailByOrderId(@Param("orderId") int orderId);
	
	public int updateOrder(
			@Param("orderId") int orderId
			, @Param("totalCount") int totalCount
			, @Param("totalPrice") int totalPrice
			, @Param("deliveryCost") int deliveryCost);
	
	public int deleteOrder(@Param("orderId") int orderId);
	
	public int selectCountNonMemberOrder(
			@Param("nonMemberId") int nonMemberId
			, @Param("orderNumber") String orderNumber);
}
