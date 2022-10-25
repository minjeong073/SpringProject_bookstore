package com.ming.project.bookstore.store.book;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.bo.BookBO;
import com.ming.project.bookstore.store.book.dao.BookDAO;

@Controller
@RequestMapping("/store/book")
public class BookController {
	
	@Autowired
	private BookBO bookBO;
	
	@GetMapping("/detail/view")
	public String bookDetailView(
			@RequestParam("isbn") String isbn
			,Model model) {
	
		JSONObject bookDetail = bookBO.getBookDetail(isbn);
		JSONObject subInfo = (JSONObject) bookDetail.get("subInfo");
		
		model.addAttribute("bookDetail", bookDetail);
		model.addAttribute("subInfo", subInfo);
		
		return "store/book/bookDetail";		
	}
}