package com.ming.project.bookstore.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ming.project.bookstore.user.bo.UserBO;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email) {
		
		int count = userBO.addUser(loginId, password, name, phoneNumber, email);
		
		Map<String, String> result = new HashMap<>();
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/duplicate_id")
	public Map<String, Boolean> duplicateId(@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("id_duplicate", userBO.checkDuplicateId(loginId));
		
		return result;
	}
}
