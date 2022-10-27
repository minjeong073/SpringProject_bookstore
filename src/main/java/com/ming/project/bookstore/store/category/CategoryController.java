package com.ming.project.bookstore.store.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ming.project.bookstore.store.category.bo.CategoryBO;

@Controller
public class CategoryController {

	@Autowired
	private CategoryBO categoryBO;
	
	@GetMapping("/store/admin/category/setting")
	@ResponseBody
	public String settingCategory() {
		int count = categoryBO.setCategory();
		
		if (count == 24) {
			return "24 category setting success";
		} else {
			return "category setting error";
		}
	}
	
}
