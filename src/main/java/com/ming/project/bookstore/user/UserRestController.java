package com.ming.project.bookstore.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ming.project.bookstore.common.Mail;
import com.ming.project.bookstore.common.SendEmailService;
import com.ming.project.bookstore.user.bo.UserBO;
import com.ming.project.bookstore.user.model.User;

@RestController
@RequestMapping("/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;

	@PostMapping("/signup")
	public Map<String, String> signup(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email) {
		
		int count = userBO.addUser(loginId, password, name, phoneNumber, email);
		
		Map<String, String> result = new HashMap<>();
		
		if (count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/duplicate_id")
	public Map<String, Boolean> duplicateId(@RequestParam("loginId") String loginId) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		result.put("id_duplicate", userBO.checkDuplicateId(loginId));
		
		return result;
	}
	
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest req) {
		
		User user = userBO.getUser(loginId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if (user != null) {
			result.put("result", "success");
			
			// session 에 로그인 정보 저장
			HttpSession session = req.getSession();
			
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/findId")
	public Map<String, Object> findId(
			@RequestParam("name") String name
			, @RequestParam("email") String email
			, Model model) {
		
		Map<String, Object> result = new HashMap<>();

		User user = userBO.getUserLoginId(name, email);
		
		if (user != null) {
			result.put("result", "success");
			result.put("user", user);
		} else {
			result.put("result", "fail");
		}
		return result; 
	}
	
	// 회원 비밀번호 찾기
	
	@PostMapping("/findPw/member")
	public Map<String, String> findPwMember(
			@RequestParam("loginId") String loginId
			, @RequestParam("email") String email) {
		
		Map<String, String> result = new HashMap<>();
		
		int count = userBO.checkUserPassword(loginId, email);
		
		int updateCount = 0;
		boolean sendEmailResult = false;
		
		if (count == 1) {	// 있을 경우
			
			Mail mail = SendEmailService.createMail(loginId, email);
			sendEmailResult = SendEmailService.sendEmail(mail);
			
			// 임시 비밀번호 변경
			updateCount = userBO.updatePassword(loginId, email, SendEmailService.getTemporaryPassword());
			
		} else {
			result.put("result", "fail");
		}
		
		if (updateCount != 1) {	// db에서 비밀번호가 변경되지 않았을 경우
			return null;
		} else {
			
			if (sendEmailResult) {	// 메일이 전송됐을 경우
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
		}
		
		return result;
	}
	
	// 비회원 비밀번호 찾기
	
	@PostMapping("/findPw")
	public Map<String, String> findPwNonMember(
			@RequestParam("orderNumber") String orderNumber
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email) {
		
		Map<String, String> result = new HashMap<>();
		
		int count = userBO.checkNonMemberPassword(orderNumber, name, phoneNumber, email);
		
		if (count == 1) {
			result.put("result", "success");
			result.put("name", name);
			result.put("email", email);
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@Transactional
	@PostMapping("/findPw/member/sendEmail")
	public Map<String, String> sendEmail(
			@RequestParam("loginId") String loginId
			, @RequestParam("email") String email) {
		
		Mail mail = SendEmailService.createMail(loginId, email);
		boolean sendEmailResult = SendEmailService.sendEmail(mail);
		
		Map<String, String> result = new HashMap<>();
		
		// 임시 비밀번호 변경
		int count = userBO.updatePassword(loginId, email, SendEmailService.getTemporaryPassword()); 
		
		if (count != 1) {	// db에서 비밀번호가 변경되지 않았을 경우
			return null;
		} else {
			if (sendEmailResult) {	// 메일이 전송됐을 경우
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
		}
		
		return result;
	}
	
	@PostMapping("findPw/sendEmail")
	public Map<String, String> sendEmailByNonMember(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email) {
		
		Mail mail = SendEmailService.createMail(name, email);
		boolean sendEmailResult = SendEmailService.sendEmail(mail);
		
		Map<String, String> result = new HashMap<>();
		
		int count = userBO.updateNonMemberPassword(name, phoneNumber, email, SendEmailService.getTemporaryPassword());
		
		if (count != 1) {	// db 에서 비밀번호 변경되지 않았을 경우
			return null;
		} else {
			if (sendEmailResult) {
				result.put("result", "success");
			} else {
				result.put("result", "fail");
			}
		}
		
		return result;
	}
	
}
