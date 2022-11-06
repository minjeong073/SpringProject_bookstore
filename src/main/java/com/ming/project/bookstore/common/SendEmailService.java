package com.ming.project.bookstore.common;

import java.io.Console;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendEmailService {

	private static JavaMailSender mailSender;

	private static final String title = "around book 임시 비밀번호 안내 메일 입니다.";
	private static final String fromAddress = "kim.mj80730@gmail.com";
	
	public static Mail createMail(String loginId, String email) {
		
		String tempPassword = getTemporaryPassword();
		Mail mail = new Mail();
		
		mail.setToAddress(email);
		mail.setTitle(title);
		mail.setMessage(
				"<h1>임시비밀번호 발급</h1>" +
				"<br> <b>" + loginId + "</b>  님 " +
				"<br>비밀번호 찾기를 통한 임시 비밀번호입니다." +
				"<br>임시 비밀번호 :   <h3>" + tempPassword + "</h3>" +
				"<br>로그인 후 비밀번호를 변경을 해주세요." +
				"<br> <a href='http://localhost:8080/user/signin/view" + ">로그인 페이지</a>");
		
		return mail;
	}
	
	public static String getTemporaryPassword() {
		
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
	
	public static boolean sendEmail(Mail mail) {
		
		try {
			SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
			
			simpleMailMessage.setTo(mail.getToAddress());
			simpleMailMessage.setSubject(mail.getTitle());
			simpleMailMessage.setText(mail.getMessage());
			simpleMailMessage.setFrom(fromAddress);
			
			mailSender.send(simpleMailMessage);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
