package com.ming.project.bookstore.store.order.bo;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.common.EncryptUtils;
import com.ming.project.bookstore.store.order.dao.OrderDAO;

@Service
public class OrderBO {
	
	@Autowired
	private OrderDAO orderDAO;

	// 비회원 정보 저장
	public int addNonMemberInfo(List<String> nonMemberList) {
		
		String name = nonMemberList.get(0);
		String phoneNumber = nonMemberList.get(1);
		String email = nonMemberList.get(2);
		String password = nonMemberList.get(3);
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return orderDAO.insertNonMemberInfo(name, phoneNumber, email, encryptPassword);
	}
	
	// 주문번호 난수
	public String setOrderNumber() {
		String orderNumber = "";

		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		String month = new DecimalFormat("00").format(cal.get(Calendar.MONTH + 1));
		String day = new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		String subNumber = "";
		for (int i = 0; i < 6; i++) {
			subNumber += (int) (Math.random() * 10);
		}
		
		orderNumber = year + month + day + "_" + subNumber;
		
		return orderNumber;
	}
	
	
	// 주문 내역 저장
	
	
	// 주문 상품 정보 저장
	
	
}
