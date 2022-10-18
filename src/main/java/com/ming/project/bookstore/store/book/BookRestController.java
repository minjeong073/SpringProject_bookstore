package com.ming.project.bookstore.store.book;

import org.springframework.stereotype.Controller;

@Controller
public class BookRestController {
	
	private static final String TTBKEY = "ttbminjungseok1333001"; 

	public String apiWithJson() {
		
		StringBuffer sbResult = new StringBuffer();
		String jsonPrintString = null;
		
		// String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
		
		// 상품 리스트 - 베스트셀러
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx?"
				+ "ttbkey=" + TTBKEY
				+ "&QueryType=Bestseller"
				+ "&MaxResults=10";
	}
}
