package com.ming.project.bookstore.store.book.bo;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.store.book.dao.BookDAO;

@Service
public class BookBO {

	@Autowired BookDAO bookDAO;
	
	// 상품 리스트
	public JSONArray getBookList(String queryType, String searchTarget) {
		return bookDAO.getBookListForJson(queryType, searchTarget);
	}
	
	public JSONObject getBookDetail(String isbn) {
		return bookDAO.getBookDetailForJson(isbn);
	}
	
	public JSONArray getBookListByWeek(String queryType, String searchTarget, String year, String month, String week) {
		return bookDAO.getBookListByWeek(queryType, searchTarget, year, month, week);
	}
	
	public JSONArray getBookListByCategoryId(String queryType, String searchTarget, String categoryId) {
		return bookDAO.getBookListByCategoryId(queryType, searchTarget, categoryId);
	}
	
	public JSONArray getBookSearchResult(String query, String searchTarget, String sort) {
		return bookDAO.getBookSearch(query, searchTarget, sort);
	}
}
