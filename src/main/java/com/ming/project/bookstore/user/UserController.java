package com.ming.project.bookstore.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup/view")
	public String signupView() {
		return "user/signup";
	}
	
	@GetMapping("/signin/view")
	public String signinView() {
		return "user/signin";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest req) {
		
		// session 에 저장한 로그인 정보 삭제
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/signin/view";
	}
	
	@GetMapping("/findId/view")
	public String findIdView() {
		return "user/findId";
	}
	
	@GetMapping("/findPw/member/view")
	public String findPwMemberView() {
		return "user/findPw_member";
	}
	
	// 비회원 비밀번호 찾기
	
	@GetMapping("/findPw/view")
	public String findPwView() {
		return "user/findPw";
	}
}