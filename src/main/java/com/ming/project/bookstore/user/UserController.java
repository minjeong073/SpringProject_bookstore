package com.ming.project.bookstore.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.bo.BookBO;
import com.ming.project.bookstore.store.book.model.BookDetail;
import com.ming.project.bookstore.store.order.bo.OrderBO;
import com.ming.project.bookstore.store.order.model.Order;
import com.ming.project.bookstore.store.order.model.OrderDetail;
import com.ming.project.bookstore.store.order.model.OrderInfo;
import com.ming.project.bookstore.user.bo.UserBO;
import com.ming.project.bookstore.user.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderBO orderBO;
	
	@Autowired
	private BookBO bookBO;
	

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
	public String findIdResultView() {
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
	
	// 비밀번호 찾기 결과
	
	@GetMapping("/findPw/result/view")
	public String findPwResultView() {
		return "user/find/findPw_result";
	}
	
	// 마이페이지
	
	@GetMapping("/mypage/view")
	public String myPageView(
			@RequestParam("id") int userId
			, Model model) {
		
		User user = userBO.getUserByUserId(userId);
		
		List<OrderInfo> orderInfoList = orderBO.getOrderInfoByUserId(userId);
		List<Order> orderList = orderBO.getOrderListByUserId(userId);
		
		model.addAttribute("user", user);
		model.addAttribute("orderList", orderList);
		model.addAttribute("orderInfoList", orderInfoList);
		
		return "user/mypage";
	}
	
	// 비밀번호 변경하기
	
	@GetMapping("/mypage/password/view")
	public String myPagePasswordView() {
		return "user/mypage-password";
	}
	
	@GetMapping("/cart/view")
	public String cartView(@RequestParam("id") int id) {
		return "user/cart/mycart";
	}
	
	
}