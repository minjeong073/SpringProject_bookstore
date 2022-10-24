package com.ming.project.bookstore.store.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.ming.project.bookstore.store.category.bo.CategoryBO;

@Controller
public class CategoryController {

	@Autowired
	private CategoryBO categoryBO;
	
	@GetMapping("/store/admin/category/setting")
	public String settingCategory() {
		categoryBO.setCategory();
		return "category setting";
	}
	
}
