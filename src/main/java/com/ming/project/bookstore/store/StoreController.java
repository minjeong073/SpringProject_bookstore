package com.ming.project.bookstore.store;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreController {

	private static final String TTBKEY = "ttbminjungseok1333001";
	
	@GetMapping("/main/view")
	public String mainView(Model model) {
		
		String apiUrl = "https://www.aladin.co.kr/ttb/api/ItemList.aspx";
		String queryType = "Bestseller";
		String option = "&SearchTarget=Book&output=js&Version=20131101";
		
		String result;

		try {
			URL url = new URL(apiUrl + "?ttbkey=" + TTBKEY + "&QueryType=" + queryType + option);
			
			BufferedReader br;
			br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = br.readLine();
			
			JSONParser parser = new JSONParser();
			JSONObject object = (JSONObject) parser.parse(result);
			JSONArray array = (JSONArray) object.get("item");

			model.addAttribute("bestsellerList", array);
			
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		
		return "store/main";
	}
}
