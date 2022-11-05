package com.ming.project.bookstore.store.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ming.project.bookstore.store.book.bo.BookBO;
import com.ming.project.bookstore.store.order.bo.OrderBO;
import com.ming.project.bookstore.store.order.model.Order;
import com.ming.project.bookstore.store.order.model.OrderInfo;
import com.ming.project.bookstore.user.bo.UserBO;
import com.ming.project.bookstore.user.model.NonMember;
import com.ming.project.bookstore.user.model.User;

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
			, HttpServletRequest req
			, Model model) {
		
		HttpSession session = req.getSession();
		Integer userId = (Integer) session.getAttribute("userId");

		JSONObject bookDetail = bookBO.getBookDetail(isbn);
		
		model.addAttribute("bookDetail", bookDetail);
		model.addAttribute("isbn", isbn);
		model.addAttribute("count", count);
		
		if (userId != null) {	// 회원일 경우
			
			User user = userBO.getUserByUserId(userId);
			
			model.addAttribute("user", user);
			
			return "store/order/order-member";
		} else {	// 비회원일 경우
			return "store/order/order";
		}
		
	}
	
	@GetMapping("/order/result/view")
	public String orderResultView(
			@RequestParam("orderId") int orderId
			, Model model) {
		
		model.addAttribute("orderId", orderId);
		return "store/order/order-result";
	}
	
	@GetMapping("/order/info/view")
	public String lookUpOrder(
			@RequestParam(value = "orderId", required = false) Integer orderId
			, @RequestParam(value = "nonMemberId", required = false) Integer nonMemberId
			, Model model) {
		
		List<OrderInfo> orderInfoList ;
		
		if (orderId == null) {	// 비회원
			
			NonMember nonMember = userBO.getNonMember(nonMemberId);
			model.addAttribute("nonMember", nonMember);
			orderInfoList = orderBO.getOrderInfoByNonMember(nonMemberId);
		} else {	// 회원
			
			// TODO
			Order order = orderBO.getOrderByOrderId(orderId);
			User user = userBO.getUserByUserId(order.getUserId());
			model.addAttribute("user", user);
			model.addAttribute("orderId", orderId);
			orderInfoList = orderBO.getOrderInfoByUserId(user.getId());
		}
		
		model.addAttribute("orderInfoList", orderInfoList);
		
		return "store/order/orderInfo";
	}
	
}
