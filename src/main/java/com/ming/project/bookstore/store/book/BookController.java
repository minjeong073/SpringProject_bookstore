package com.ming.project.bookstore.store.book;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/store/book")
public class BookController {
	
	private static final String TTBKEY = "ttbminjungseok1333001";
	
	@GetMapping("/detail/view")
	public String bookDetailView(
			@RequestParam("isbn") String isbn
			,Model model) {
		
		String result;
		
		String apiUrl = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";
		String itemId = isbn;
		String option = "&ItemType=ISBN&output=js&Version=20131101&OptResult=ratingInfo";
		
		try {
			URL url = new URL(apiUrl + "?ttbkey=" + TTBKEY + "&ItemId=" + itemId + option);
			
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(result);
			JSONArray array = (JSONArray) object.get("item");
			JSONObject bookDetail = (JSONObject) array.get(0);
			model.addAttribute("bookDetail", bookDetail);
			
			JSONObject subInfo = (JSONObject) bookDetail.get("subInfo");
			JSONObject ratingInfo = (JSONObject) subInfo.get(0);
			model.addAttribute("subInfo", subInfo);
			model.addAttribute("ratingInfo", ratingInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "store/book/bookDetail";
	}
}
