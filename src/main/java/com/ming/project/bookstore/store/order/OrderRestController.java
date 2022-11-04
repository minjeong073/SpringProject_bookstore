package com.ming.project.bookstore.store.order;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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

	// 구매 내역 저장
	@PostMapping("/order")
	public Map<String, String> orderInfo(
			@RequestParam("bookDetail") List<String> bookDetail
			, @RequestParam(value="nonMemberList", required = false) List<String> nonMemberList
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
			
			Map<String, Object> resultMap = orderBO.addOrderNonMember(nonMemberId, shippingList, bookDetail);
			
			nonMemberBool = (boolean) resultMap.get("result");
			
			if (nonMemberBool) {
				result.put("result", "success");
				result.put("orderId", (String) resultMap.get("orderId"));
			} else {
				result.put("result", "fail");
			}
			
		} else {	// 회원일 경우
			
			userId = (Integer) session.getAttribute("userId");
			Map<String, Object> resultMap = orderBO.addOrderMember(userId, shippingList, bookDetail);
			
			memberBool = (boolean) resultMap.get("result");
			
			if(memberBool) {
				result.put("result", "success");
				result.put("orderId", (String) resultMap.get("orderId"));
			} else {
				
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
		
		// 해당 비회원이 없을 경우
		if (nonMember == null) {
			result.put("result", "fail");
			return result;
		}
		
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
	
	// 주문 취소
	
	@GetMapping("/order/cancelOrder")
	public Map<String, String> cancelOrder(
			@RequestParam("orderId") int orderId) {
		
		Map<String, String> result = new HashMap<>();
		
		int count = orderBO.cancelOrder(orderId);

		if (count == 1) {
			result.put("result", "success");
			
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
}
