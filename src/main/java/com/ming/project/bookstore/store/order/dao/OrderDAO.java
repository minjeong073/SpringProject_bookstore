package com.ming.project.bookstore.store.order.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
}
