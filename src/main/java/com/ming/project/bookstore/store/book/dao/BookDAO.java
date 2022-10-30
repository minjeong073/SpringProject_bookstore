package com.ming.project.bookstore.store.book.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Repository;


@Repository
public class BookDAO {
	
	private final String TTBKEY = "ttbminjungseok1333001";
	
	public JSONObject getBookDetailForJson(String isbn) {
		
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
		String option = "&ItemType=ISBN&output=js&Version=20131101&Cover=Big&OptResult=ratingInfo";
		
		String result;

		try {
			URL url = new URL(apiUrl + "?ttbkey=" + TTBKEY + "&ItemId=" + isbn + option);
			
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(result);
			JSONArray array = (JSONArray) object.get("item");
			JSONObject bookDetail = (JSONObject) array.get(0);
			
			return bookDetail;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	
	public JSONArray getBookListForJson(String queryType, String searchTarget) {
	
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
		String option = "&QueryType=" + queryType + "&SearchTarget=" + searchTarget + "&Cover=Big&output=js&Version=20131101";
		
		String result;

		try {
			URL url = new URL(apiUrl + "?ttbkey=" + TTBKEY + option);
			
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(result);
			JSONArray array = (JSONArray) object.get("item");
			
			return array;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// cid 별 
	public JSONArray getBookListByCategoryId(String queryType, String searchTarget, String categoryId) {
		
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
		String option = "&QueryType=" + queryType + "&SearchTarget=" + searchTarget + "&CategoryId=" + categoryId + "&Cover=Big&output=js&Version=20131101";
		
		String result;

		try {
			URL url = new URL(apiUrl + "?ttbkey=" + TTBKEY + option);
			
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(result);
			JSONArray array = (JSONArray) object.get("item");
			
			return array;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 베스트셀러 주차 별
	public JSONArray getBookListByWeek(String queryType, String searchTarget, String year, String month, String week) {
		
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemList.aspx";
		String option = "&QueryType=" + queryType + "&SearchTarget=" + searchTarget + "&Cover=Big&output=js&Version=20131101";
		String dateOption = "&Year=" + year + "&Month=" + month + "&Week=" + week;
		
		String result;

		try {
			URL url = new URL(apiUrl + "?ttbkey=" + TTBKEY + option + dateOption);
			
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(result);
			JSONArray array = (JSONArray) object.get("item");
			
			return array;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// 검색 결과 (기본)
	
	public JSONArray getBookSearch(String query, String searchTarget, String sort) {
		
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
		String option = "&SearchTarget=" + searchTarget + "&Sort=" + sort + "&Cover=Big&output=js&Version=20131101";
		
		String result;

		try {
			URL url = new URL(apiUrl + "?ttbkey=" + TTBKEY + "&Query=" + query + option);
			
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(result);
			JSONArray array = (JSONArray) object.get("item");
			
			return array;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
