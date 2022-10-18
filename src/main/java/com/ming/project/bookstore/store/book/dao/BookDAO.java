package com.ming.project.bookstore.store.book.dao;

import java.io.InputStreamReader;
import java.net.URLConnection;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ming.project.bookstore.store.book.model.BookDetail;

import ch.qos.logback.classic.Logger;

@Repository
public class BookDAO {
	
	private String getUrlForJson(String apiUrl) {
		
		StringBuilder sb = new StringBuilder();
		URLConnection urlConnection = null;
		InputStreamReader inReader = null;
		
		// Json 결과 저장
		String jsonStringResult = null;
		
		
	}
	
	public Map<String, Object> getBookDetailForJson(BookDetail bookDetail) {
		
		
	}
	
}
