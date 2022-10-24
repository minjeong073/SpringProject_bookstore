package com.ming.project.bookstore.store;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.dao.BookDAO;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private BookDAO bookDAO;
	
	@GetMapping("/main/view")
	public String mainView(Model model) {
		
		// 베스트 셀러
		JSONArray bestsellerList = bookDAO.getBookListForJson("Bestseller", "book"); 
		
		model.addAttribute("bestsellerList", bestsellerList);
		// 카테고리
		
		// 평점 순위
		
		return "store/main";
	}
	
	@GetMapping("/category/view")
	public String categoryView(
			@RequestParam("CID") String CID
			, Model model) {
		
		JSONArray bestSellerList = bookDAO.getBookListForJson("Bestseller",  CID);
		JSONArray newSpecialList = bookDAO.getBookListForJson("ItemNewSpecial",  CID);
		
		model.addAttribute("bestSellerList", bestSellerList);
		model.addAttribute("newSpecialList", newSpecialList);
		
		return "store/category/" + CID;
		
		
		
	}
}