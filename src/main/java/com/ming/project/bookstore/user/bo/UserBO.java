package com.ming.project.bookstore.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.common.EncryptUtils;
import com.ming.project.bookstore.store.order.dao.OrderDAO;
import com.ming.project.bookstore.user.dao.UserDAO;
import com.ming.project.bookstore.user.model.NonMember;
import com.ming.project.bookstore.user.model.User;

@Service
public class UserBO {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private OrderDAO orderDAO;
	
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
	
	public User getUserByUserId(int userId) {
		return userDAO.selectUserByUserId(userId);
	}
	
	// 아이디 찾기
	public User getUserLoginId(String name, String email) {
		return userDAO.selectUserLoginId(name, email);
	}
	
	// 비밀번호 찾기 - 확인
	public int checkUserPassword(String loginId, String email) {
		return userDAO.selectCountUserPassword(loginId, email);
	}
	
	// 임시 비밀번호 변경
	public int updatePassword(String loginId, String email, String password) {
		
		// 비밀번호 암호화
		
		String encryptPassword = EncryptUtils.md5(password);
		
		int userId = userDAO.selectUserPassword(loginId, email).getId();
		
		return userDAO.updateUserPassword(userId, encryptPassword);
	}
	
	
	// 비회원
	
	// 비회원 정보 저장
	
	public int addNonMemberInfo(List<String> nonMemberList) {
		
		NonMember nonMember = new NonMember();
		
		nonMember.setName(nonMemberList.get(0));
		nonMember.setPhoneNumber(nonMemberList.get(1));
		nonMember.setEmail(nonMemberList.get(2));
		nonMember.setPassword(nonMemberList.get(3));
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(nonMember.getPassword());
		
		nonMember.setPassword(encryptPassword);
		
		userDAO.insertNonMemberInfo(nonMember);
		
		return nonMember.getId();
	}
	
	public NonMember getNonMember(int id) {
		return userDAO.selectNonMember(id);
	}
	
	public NonMember getNonMemberByName(String name, String email, String password) {
		
		String encryptPassword = EncryptUtils.md5(password);
		
		return userDAO.selectNonMemberByName(name, email, encryptPassword);
	}
	
	// 비밀번호 찾기
	
	public int checkNonMemberPassword(String orderNumber, String name, String email) {
		
		NonMember nonMember = userDAO.selectNonMemberPassword(name, email);
		return orderDAO.selectCountNonMemberOrder(nonMember.getId(), orderNumber);
	}
	
	// 임시 비밀번호 변경
	
	public int updateNonMemberPassword(String name, String email, String password) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		int nonMemberId = userDAO.selectNonMemberPassword(name, email).getId();
		return userDAO.updateNonMemberPassword(nonMemberId, encryptPassword);
	}
}
