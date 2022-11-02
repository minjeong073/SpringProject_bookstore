package com.ming.project.bookstore.store.order.model;

import com.ming.project.bookstore.store.book.model.BookDetail;

public class OrderBookDetail {

	private OrderDetail orderDetailList;
	private BookDetail bookDetailList;
	
	public OrderDetail getOrderDetailList() {
		return orderDetailList;
	}
	public void setOrderDetailList(OrderDetail orderDetailList) {
		this.orderDetailList = orderDetailList;
	}
	public BookDetail getBookDetailList() {
		return bookDetailList;
	}
	public void setBookDetailList(BookDetail bookDetailList) {
		this.bookDetailList = bookDetailList;
	}
	
}
