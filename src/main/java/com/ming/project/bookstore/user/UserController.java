package com.ming.project.bookstore.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ming.project.bookstore.user.bo.UserBO;
import com.ming.project.bookstore.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;

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
		return "user/find/findId";
	}
	
	// 아이디 찾기 결과
	
	@GetMapping("/findId/result/view")
	public String findIdResultView(Model model) {
		return "user/find/findId_result";
	}
	
	// 회원 비밀번호 찾기
	
	@GetMapping("/findPw/member/view")
	public String findPwMemberView() {
		return "user/find/findPw_member";
	}
	
	// 비회원 비밀번호 찾기
	
	@GetMapping("/findPw/view")
	public String findPwView() {
		return "user/find/findPw";
	}
}