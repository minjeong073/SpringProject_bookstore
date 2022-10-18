package com.ming.project.bookstore.store.book.model;

import java.util.Date;

public class BookDetail {

	private String url;
	
	// request parameter
	
	private String TTBKey;
	private int reqItemId;
	private String reqItemIdType;
	private String reqOutput;
	private int reqVersion;
	private String reqOptResult;
	
	// response field
	
	private String title;
	private String author;
	private Date pubDate;
	private String description;
	private String isbn13;
	private int pricesales;
	private String cover;
	private String publisher;
	private int customerReviewRank;
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	public String getTTBKey() {
		return TTBKey;
	}
	public void setTTBKey(String tTBKey) {
		TTBKey = tTBKey;
	}
	public int getReqItemId() {
		return reqItemId;
	}
	public void setReqItemId(int reqItemId) {
		this.reqItemId = reqItemId;
	}
	public String getReqItemIdType() {
		return reqItemIdType;
	}
	public void setReqItemIdType(String reqItemIdType) {
		this.reqItemIdType = reqItemIdType;
	}
	public String getReqOutput() {
		return reqOutput;
	}
	public void setReqOutput(String reqOutput) {
		this.reqOutput = reqOutput;
	}
	public int getReqVersion() {
		return reqVersion;
	}
	public void setReqVersion(int reqVersion) {
		this.reqVersion = reqVersion;
	}
	public String getReqOptResult() {
		return reqOptResult;
	}
	public void setReqOptResult(String reqOptResult) {
		this.reqOptResult = reqOptResult;
	}
	
	
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
	public String getIsbn13() {
		return isbn13;
	}
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
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
