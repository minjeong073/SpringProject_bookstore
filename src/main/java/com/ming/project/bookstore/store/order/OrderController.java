package com.ming.project.bookstore.store.order;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.bo.BookBO;
import com.ming.project.bookstore.store.book.model.BookDetail;
import com.ming.project.bookstore.store.order.bo.OrderBO;
import com.ming.project.bookstore.store.order.model.OrderDetail;
import com.ming.project.bookstore.store.order.model.OrderInfo;
import com.ming.project.bookstore.user.bo.UserBO;
import com.ming.project.bookstore.user.model.NonMember;

@Controller
@RequestMapping("/store")
public class OrderController {
	
	@Autowired
	private BookBO bookBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private OrderBO orderBO;

	@GetMapping("/order/view")
	public String orderView(
			@RequestParam("isbn") String isbn
			, @RequestParam("count") int count
			, Model model) {
		
		JSONObject bookDetail = bookBO.getBookDetail(isbn);
		
		model.addAttribute("bookDetail", bookDetail);
		model.addAttribute("isbn", isbn);
		model.addAttribute("count", count);
		
		return "store/order/order";
	}
	
	@GetMapping("/order/result/view")
	public String orderResultView() {
		return "store/order/order-result";
	}
	
	@GetMapping("/order/info/view")
	public String lookUpOrder(
			@RequestParam("nonMemberId") int nonMemberId
			, Model model) {
		
		List<OrderInfo> orderInfoList = orderBO.getOrderInfoByNonMember(nonMemberId);
		NonMember nonMember = userBO.getNonMember(nonMemberId);
		
		model.addAttribute("orderInfoList", orderInfoList);
		model.addAttribute("nonMember", nonMember);
		
		return "store/order/orderInfo";
	}
}
