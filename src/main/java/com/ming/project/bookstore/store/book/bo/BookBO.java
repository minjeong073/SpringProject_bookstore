package com.ming.project.bookstore.store.book.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.store.book.dao.BookDAO;

@Service
public class BookBO {

	@Autowired BookDAO bookDAO;
	
	// 상품 리스트 - 베스트셀러
	
}
