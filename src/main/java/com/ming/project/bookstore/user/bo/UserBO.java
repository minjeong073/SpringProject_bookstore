package com.ming.project.bookstore.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.user.dao.UserDAO;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int addUser(String loginId, String password, String name, String phoneNumber, String email) {
		
		// TODO : 비밀번호 암호화
		
		
		return userDAO.insertUser(loginId, password, name, phoneNumber, email);
	}
	
	// 아이디 중복 확인
	public boolean checkDuplicateId(String loginId) {
		// 중복일 경우 1 - true, 중복 아닐 경우 0 - false
		return userDAO.countLoginId(loginId) != 0; 
	}
}
