package com.ming.project.bookstore.store;

import java.util.List;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.bo.BookBO;
import com.ming.project.bookstore.store.book.dao.BookDAO;
import com.ming.project.bookstore.store.category.bo.CategoryBO;
import com.ming.project.bookstore.store.category.model.Category;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	private BookBO bookBO;
	
	@Autowired
	private CategoryBO categoryBO;
	
	@GetMapping("/main/view")
	public String mainView(
			@RequestParam(value = "year", required = false) String year
			, @RequestParam(value = "month", required = false) String month
			, @RequestParam(value = "week", required = false) String week
			, Model model) {
		
		// 베스트 셀러
		
		JSONArray bestsellerList;
		
		if (year == null && month == null && week == null) {
			bestsellerList = bookBO.getBookList("Bestseller", "book"); 
		} else {
			bestsellerList = bookBO.getBookListByWeek("Bestseller", "book", year, month, week);
		}
		
		model.addAttribute("bestsellerList", bestsellerList);
		
		
		// 카테고리
		List<Category> categoryList = categoryBO.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		// 블로그 베스트
		JSONArray blogBestList = bookBO.getBookList("BlogBest", "book");
		model.addAttribute("blogBestList", blogBestList);
		
		// 신간 전체
		JSONArray itemNewAllList = bookBO.getBookList("ItemNewAll", "book");
		model.addAttribute("itemNewAllList", itemNewAllList);
		
		return "store/main";
	}
	
	@GetMapping("/category/view")
	public String categoryView(
			@RequestParam("cid") String cid
			, Model model) {
		
		JSONArray bestsellerList = bookBO.getBookList("Bestseller",  cid);
		JSONArray newSpecialList = bookBO.getBookList("ItemNewSpecial",  cid);
		
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("newSpecialList", newSpecialList);
		model.addAttribute("cid", cid);
		
		// 카테고리 cid

		List<Category> categoryList = categoryBO.getCategory();
		
		model.addAttribute("categoryList", categoryList);
		
		return "store/category/category";
	}
	
}