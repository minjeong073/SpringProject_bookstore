package com.ming.project.bookstore.store.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ming.project.bookstore.store.order.bo.OrderBO;
import com.ming.project.bookstore.store.order.model.OrderInfo;
import com.ming.project.bookstore.user.bo.UserBO;
import com.ming.project.bookstore.user.model.NonMember;

@RestController
@RequestMapping("/store")
public class OrderRestController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderBO orderBO;

	// 주문 내역 저장
	@PostMapping("/order")
	public Map<String, String> orderInfo(
			@RequestParam("bookDetail") List<String> bookDetail
			, @RequestParam("nonMemberList") List<String> nonMemberList
			, @RequestParam("shippingList") List<String> shippingList
			, HttpServletRequest req) {
		
		Map<String, String> result = new HashMap<>();
		
		HttpSession session = req.getSession();
		
		int userId = -1;
		
		boolean memberBool = false;
		boolean nonMemberBool = false;
		
		// 비회원일 경우
		if (session.getAttribute("userId") == null) {
			
			// 비회원 정보 저장
			int nonMemberId = userBO.addNonMemberInfo(nonMemberList);
			
			nonMemberBool = orderBO.addOrderNonMember(nonMemberId, shippingList, bookDetail);
			
			if (nonMemberBool) {
				result.put("result", "success");
			}
			
		} else {	// 회원일 경우
			
			userId = (Integer) session.getAttribute("userId");
			memberBool = orderBO.addOrderMember(userId, shippingList, bookDetail);
			
			if(memberBool) {
				result.put("result", "fail");
			}
		}
		
		return result;
	}
	
	// 구매 내역 조회
	
	@PostMapping("/order/info")
	public Map<String, Object> lookUpOrder(
			@RequestParam("name") String name
			, @RequestParam("email") String email
			, @RequestParam("password") String password) {
		
		Map<String, Object> result = new HashMap<>();
		
		NonMember nonMember = userBO.getNonMemberByName(name, email, password);
		int nonMemberId = nonMember.getId();
		
		int count = orderBO.getOrderCountByNonMember(nonMemberId);
		
		if (count != 0) {
			result.put("result", "success");
			result.put("nonMemberId", nonMemberId);
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
