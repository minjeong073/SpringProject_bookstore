package com.ming.project.bookstore.store.book.model;

import java.util.Date;

public class BookDetail {

	private String title;
	private String author;
	private Date pubDate;
	private String description;
	private String isbn;
	private int pricesales;
	private String cover;
	private String publisher;
	private int customerReviewRank;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPubDate() {
		return pubDate;
	}
	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getPricesales() {
		return pricesales;
	}
	public void setPricesales(int pricesales) {
		this.pricesales = pricesales;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getCustomerReviewRank() {
		return customerReviewRank;
	}
	public void setCustomerReviewRank(int customerReviewRank) {
		this.customerReviewRank = customerReviewRank;
	}
	
}
