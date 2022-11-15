package com.ming.project.bookstore.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.ming.project.bookstore.user.bo.UserBO;

@Service
public class SendEmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private UserBO userBO;
	
	private static final String title = "around book 임시 비밀번호 안내 메일 입니다.";
	private static final String fromAddress = "aroundbookadm@gmail.com";
	
	public Map<String, Boolean> sendEmail(String loginId, String email, boolean isMember) {
		
		Map<String, Boolean> result = new HashMap<>();
		
		String tempPassword = getTemporaryPassword();
		
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			messageHelper.setSubject(title);
			messageHelper.setTo(email);
			messageHelper.setFrom(fromAddress);
			messageHelper.setText("<h1>임시비밀번호 발급</h1>" +
				"<br> <b>" + loginId + "</b>  님 " +
				"<br>비밀번호 찾기를 통한 임시 비밀번호입니다." +
				"<br>임시 비밀번호 :   <h3>" + tempPassword + "</h3>" +
				"<br>로그인 후 비밀번호를 변경을 해주세요." +
				"<br> <a href='http://localhost:8080/user/signin/view" + ">로그인 페이지</a>", true);
			
			// 메일 전송
			
			mailSender.send(message);
			
			result.put("mailSend", true);
			
			
			// 임시 비밀번호 변경
			
			int count = 0;
			
			if (isMember) {	// 회원
				count = userBO.updatePassword(loginId, email, tempPassword);
			} else {	// 비회원
				count = userBO.updateNonMemberPassword(loginId, email, tempPassword);
			}
			
			// 임시 비밀번호 업데이트 성공 여부
			if (count == 1) {
				result.put("update", true);
			} else {
				result.put("update", false);
			}
			
			return result;
			
		} catch (MessagingException e) {
			e.printStackTrace();
			result.put("mailSend", false);
			return result;
		}
		
	}
	
	public String getTemporaryPassword() {
		
		String tempPassword = "";
		
		char[] charSet = new char[] {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};
		
		int index = 0;
		
		for (int i = 0; i < 10; i++) {
			index = (int) (charSet.length * Math.random());
			tempPassword += charSet[index];
		}
		
		return tempPassword;
	}
	
}
