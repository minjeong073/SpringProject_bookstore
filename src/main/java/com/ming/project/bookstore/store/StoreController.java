package com.ming.project.bookstore.store;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.bo.BookBO;
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
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("week", week);
		
		return "store/main";
	}
	
	@GetMapping("/main/category/view")
	public String mainCategoryView(
			@RequestParam("mainCid") String mainCid
			, Model model) {
		
		JSONArray bestsellerList = bookBO.getBookList("Bestseller", mainCid);
		JSONArray newSpecialList = bookBO.getBookList("ItemNewSpecial", mainCid);
		
		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("newSpecialList", newSpecialList);
		model.addAttribute("mainCid", mainCid);
		
		// 카테고리 cid

		List<Category> categoryList = categoryBO.getCategory();
		
		model.addAttribute("categoryList", categoryList);
		
		return "store/category/category";
	}
	
	@GetMapping("/category/view")
	public String categoryView(
			@RequestParam("mainCid") String mainCid
			, @RequestParam(value="cid", required = false) String cid
			, Model model) {
		
		JSONArray bestsellerList;
		JSONArray newSpecialList; 
		
		if (cid == null) {	// book, foreign
			bestsellerList = bookBO.getBookList("Bestseller", mainCid);
			newSpecialList = bookBO.getBookList("ItemNewSpecial", mainCid);
		} else {
			bestsellerList = bookBO.getBookListByCategoryId("Bestseller", mainCid, cid);
			newSpecialList = bookBO.getBookListByCategoryId("ItemNewSpecial", mainCid, cid);
		}
		
		JSONArray editorChoiceList = bookBO.getBookListByCategoryId("ItemEditorChoice", mainCid, cid);
		JSONArray newAllList = bookBO.getBookListByCategoryId("ItemNewAll", mainCid, cid);
		
		List<Category> categoryList = categoryBO.getCategory();

		model.addAttribute("bestsellerList", bestsellerList);
		model.addAttribute("newSpecialList", newSpecialList);
		model.addAttribute("editorChoiceList", editorChoiceList);
		model.addAttribute("newAllList", newAllList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("mainCid", mainCid);
		model.addAttribute("cid", cid);
		
		return "store/category/category";
	}
	
	// nav - bestseller
	
	@GetMapping("/nav/main/bestseller/view")
	public String mainBestsellerView(
			@RequestParam(value = "year", required = false) String year
			, @RequestParam(value = "month", required = false) String month
			, @RequestParam(value = "week", required = false) String week
			,Model model) {
		
		JSONArray bookBestsellerList;
		JSONArray  foreignBestsellerList;
		
		if (year == null && month == null && week == null) {
			bookBestsellerList = bookBO.getBookList("Bestseller", "book");
		} else {
			bookBestsellerList = bookBO.getBookListByWeek("Bestseller", "book", year, month, week);
		}
		
		if (year == null && month == null && week == null) {
			foreignBestsellerList = bookBO.getBookList("Bestseller", "foreign");
		} else {
			foreignBestsellerList = bookBO.getBookListByWeek("Bestseller", "foreign", year, month, week);
		}
		
		model.addAttribute("bookBestsellerList", bookBestsellerList);
		model.addAttribute("foreignBestsellerList", foreignBestsellerList);
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("week", week);
		
		return "store/main-bestseller";
	}
	
	// nav - category
	
	@GetMapping("/nav/main/category/view")
	public String mainCategoryView(Model model) {
		
		List<Category> categoryList = categoryBO.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "store/main-category";
	}
	
	// 검색
	
	@GetMapping("/search/view")
	public String searchView(
			@RequestParam("query") String query
			, @RequestParam(value = "target", required = false) String target
			, @RequestParam(value = "sort", required = false) String sort
			, Model model) {
		
		JSONArray searchResult;
		
		if (target != null) {
			target = target.replace("Category", "");
		}
		
		if (target != null) {	// 국내도서, 외국도서
			searchResult = bookBO.getBookSearchResult(query, target, "Accuracy");
		} else if (sort != null) {
			searchResult = bookBO.getBookSearchResult(query, "Book", sort);
		} else {
			searchResult = bookBO.getBookSearchResult(query, "Book", "Accuracy");
		}
		
		model.addAttribute("searchResult", searchResult);
		model.addAttribute("query", query);
		
		return "store/search";
	}
}