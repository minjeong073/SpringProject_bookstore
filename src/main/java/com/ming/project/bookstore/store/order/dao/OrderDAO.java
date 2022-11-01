package com.ming.project.bookstore.store.order.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ming.project.bookstore.store.order.model.Order;
import com.ming.project.bookstore.store.order.model.OrderDetail;

@Repository
public interface OrderDAO {

	public int insertOrder(
			@Param("memberId") int memberId
			, @Param("nonMemberId") int nonMemberId
			, @Param("orderNumber") String orderNumber
			, @Param("totalCount") int totalCount
			, @Param("totalPrice") int totalPrice
			, @Param("deliveryCost") int deliveryCost
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("address1") String address1
			, @Param("address2") String address2
			, @Param("address3") String address3);
	
	public int insertOrderDetail(
			@Param("orderId") int orderId
			,@Param("isbn") String isbn
			, @Param("count") int count
			, @Param("price") int price);
	
	public Order selectOrderByUserId(@Param("userId") int userId);
	
	public Order selectOrderByNonMemberId(@Param("nonMemberId") int nonMemberId);
	
	public List<OrderDetail> selectOrderDetailByOrderId(@Param("orderId") int orderId);
	
	public int updateOrder(
			@Param("orderId") int orderId
			, @Param("totalCount") int totalCount
			, @Param("totalPrice") int totalPrice
			, @Param("deliveryCost") int deliveryCost);
}
