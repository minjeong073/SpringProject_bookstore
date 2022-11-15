package com.ming.project.bookstore.store.order.model;

import com.ming.project.bookstore.store.book.model.BookDetail;

public class OrderBookDetail {

	private OrderDetail orderDetail;
	private BookDetail bookDetail;
	
	public OrderDetail getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}
	public BookDetail getBookDetail() {
		return bookDetail;
	}
	public void setBookDetail(BookDetail bookDetail) {
		this.bookDetail = bookDetail;
	}
	
}
