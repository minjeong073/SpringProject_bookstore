package com.ming.project.bookstore.store.book.bo;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.store.book.dao.BookDAO;

@Service
public class BookBO {

	@Autowired BookDAO bookDAO;
	
	// 상품 리스트 - 베스트셀러
	public JSONArray getBookList(String queryType, String searchTarget) {
		return bookDAO.getBookListForJson(queryType, searchTarget);
	}
	
	public JSONObject getBookDetail(String isbn) {
		return bookDAO.getBookDetailForJson(isbn);
	}
}
