package com.ming.project.bookstore.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreController {

	@GetMapping("/main/view")
	public String mainView() {
		return "store/main";
	}
}
