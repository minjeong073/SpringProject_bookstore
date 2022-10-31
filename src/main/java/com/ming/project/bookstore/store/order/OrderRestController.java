package com.ming.project.bookstore.store.order;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ming.project.bookstore.store.order.bo.OrderBO;

@RestController
@RequestMapping("/store")
public class OrderRestController {
	
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
			, @RequestParam("shippingList") List<String> shippingList) {
		
		Map<String, String> result = new HashMap<>();
		
		// 비회원 정보 저장
		int count = orderBO.addNonMemberInfo(nonMemberList);
		
		// 주문 내역 저장
		
		// 주문 상세 정보 저장
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
