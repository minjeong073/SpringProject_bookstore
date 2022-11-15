package com.ming.project.bookstore.store.order.model;

import java.util.List;

public class OrderInfo {

	private Order order;
	private List<OrderBookDetail> orderBookDetailList;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<OrderBookDetail> getOrderBookDetailList() {
		return orderBookDetailList;
	}
	public void setOrderBookDetailList(List<OrderBookDetail> orderBookDetailList) {
		this.orderBookDetailList = orderBookDetailList;
	}
	
}
