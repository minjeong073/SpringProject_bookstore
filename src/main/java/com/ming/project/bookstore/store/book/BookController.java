package com.ming.project.bookstore.store.book;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store/book")
public class BookController {

	@GetMapping("/detail/view")
	public String bookDetailView() {
		return "store/book/bookDetail";
	}
}
