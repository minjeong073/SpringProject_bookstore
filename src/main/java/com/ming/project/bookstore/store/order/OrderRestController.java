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
import com.ming.project.bookstore.user.bo.UserBO;

@RestController
@RequestMapping("/store")
public class OrderRestController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderBO orderBO;

	// 구매 정보 저장
	// 주문자 정보 저장
	// 주문 상세 저장 (책 isbn, count)
	
	/*
	  order jsp 에서 전달할 것 : nonMember (name, phone ,email, pw)
 , order(deliveryCost, name, phone, address1 2 3, orderDate)
, orderDetail(isbn, count, price)
	 */
	
	
	@PostMapping("/order")
	public Map<String, String> orderInfo(
			@RequestParam("bookDetail") List<String> bookDetail
			, @RequestParam("nonMemberList") List<String> nonMemberList
			, @RequestParam("shippingList") List<String> shippingList
			, HttpServletRequest req) {
		
		Map<String, String> result = new HashMap<>();
		
		HttpSession session = req.getSession();
		String userLoginId = (String) session.getAttribute("userLoginId");
		int userId = (Integer) session.getAttribute("userId");
		
		int count = 0;
		
		// 회원일 경우
		if (userLoginId != null) {
			
			// 주문 내역 저장
			orderBO.addOrder(shippingList, userId);
			
		} else {
			
			// 비회원 정보 저장
			count = userBO.addNonMemberInfo(nonMemberList);
			// 주문 내역 저장
			orderBO.addOrder(shippingList, null);
		}
		
		// 주문 상세 정보 저장
		orderBO.addOrderDetail(bookDetail);
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
