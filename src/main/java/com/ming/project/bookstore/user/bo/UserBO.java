package com.ming.project.bookstore.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.common.EncryptUtils;
import com.ming.project.bookstore.user.dao.UserDAO;
import com.ming.project.bookstore.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	// 회원가입
	public int addUser(String loginId, String password, String name, String phoneNumber, String email) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, phoneNumber, email);
	}
	
	// 아이디 중복 확인
	public boolean checkDuplicateId(String loginId) {
		// 중복일 경우 1 - true, 중복 아닐 경우 0 - false
		return userDAO.countLoginId(loginId) != 0; 
	}
	
	// 로그인
	public User getUser(String loginId, String password) {
		
		// 비밀번호 암호화
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	// 아이디 찾기
	public User getUserLoginId(String name, String email) {
		return userDAO.selectUserLoginId(name, email);
	}
}
