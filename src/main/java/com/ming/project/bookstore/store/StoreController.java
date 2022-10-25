package com.ming.project.bookstore.store;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.dao.BookDAO;
import com.ming.project.bookstore.store.category.bo.CategoryBO;
import com.ming.project.bookstore.store.category.model.Category;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private CategoryBO categoryBO;
	
	@GetMapping("/main/view")
	public String mainView(Model model) {
		
		// 베스트 셀러
		JSONArray bestsellerList = bookDAO.getBookListForJson("Bestseller", "book"); 
		
		model.addAttribute("bestsellerList", bestsellerList);
		// 카테고리
		
		// 평점 순위
		
		// 카테고리 cid
		
		List<Category> categoryList = categoryBO.getCategory();
		
		model.addAttribute("categoryList", categoryList);
		
		return "store/main";
	}
	
	@GetMapping("/category/view")
	public String categoryView(
			@RequestParam("cid") String cid
			, Model model) {
		
		JSONArray bestsellerList = bookDAO.getBookListForJson("Bestseller",  cid);
		JSONArray newSpecialList = bookDAO.getBookListForJson("ItemNewSpecial",  cid);
		
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("newSpecialList", newSpecialList);
		model.addAttribute("cid", cid);
		
		// 카테고리 cid

		List<Category> categoryList = categoryBO.getCategory();
		
		model.addAttribute("categoryList", categoryList);
		
		return "store/category/category";
	}
	
}