<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<!-- bootstrap jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css" >

<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- sweetalert -->
	<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	
</head>
<body>

	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class="container">
			
			<div class="d-flex justify-content-center mt-3">
			
				<div class="w-25 mt-4 pl-4">
					<span class="btn" onclick="history.go(-1)"><i class="bi bi-arrow-left-short"></i></span>
				</div>
				
				<div class="outer-form w-50 m-4 d-flex justify-content-center">
					
					<div class="border form-control m-4 p-5 d-flex flex-column justify-content-center">
						
						<h3 class="text-center mb-2">비밀번호 찾기</h3>
						<span class="small text-center text-info mt-2">입력된 이메일로 임시 비밀번호가 전송됩니다</span>
						<hr class="border" width="100%">
						
						<div class="px-3 d-flex flex-column align-items-center">
							<input type="text" class="form-control my-3" placeholder="아이디" id="inputLoginId">
							
							<div class="d-flex my-3 w-100">
								<input type="text" class="form-control" placeholder="이메일" id="inputEmailId">
								<span class="m-1">@</span>
								
								<input type="text" class="form-control mr-1" id="inputEmailDomain">
								<select class="form-select form-control" id="selectEmailDomain">
									<option value="">--선택--</option>
									<option value="aroundbook.com">aroundbook.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option>직접입력</option>
								</select>
							</div>
						</div>
					
						<div class="text-center">						
							<button type="button" class="btn w-btn-outline w-btn-color-outline mt-3 my-3 w-75" id="findPwBtn">비밀번호 찾기</button>
						</div>
					</div>
				</div>
				
				<div class="w-25"></div>
			</div>
			
		</div>
		
	</div>
	
	<script>
	
		$(document).ready(function() {
			
			// 이메일 도메인 입력
			
			var email_regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			$("#selectEmailDomain").change(function() {
				
				if ($(this).val() == "직접입력") {
					$("#inputEmailDomain").val("");
					$("#inputEmailDomain").focus();
				} else {
					$("#inputEmailDomain").val($(this).val());
				}
				
			}); <%-- 이메일 도메인 선택 --%>
			
			// 비밀번호 찾기
			
			$("#findPwBtn").on("click", function() {
				
				// 변수 저장
				
				let loginId = $("#inputLoginId").val();
				let emailId = $("#inputEmailId").val();
				let emailDomain = $("#inputEmailDomain").val();
				let email = emailId + "@" + emailDomain;
				
				// validation
				
				if (loginId == "") {
					alert("아이디를 입력하세요");
					$("#inputLoginID").focus();
					return ;
				}
				
				if (emailId == "") {
					alert("이메일을 입력하세요");
					$("#inputEmailId").focus();
					return ;
				}
				
				if (emailDomain == "") {
					alert("도메인을 입력하세요");
					$("#inputEmailDomain").focus();
					return ;
				}
				
				// 이메일 정규식 검사
				if (!email_regEx.test(email)) {
					alert("이메일을 형식에 맞게 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/findPw/member"
					, data:{"loginId":loginId, "email":email}
					, success:function(data) {
						if (data.result == "success") {
							// mail 전송
							$.ajax({
								type:"post"
								, url:"/user/findPw/sendEmail"
								, data:{"loginId":loginId, "email":email}
								, success:function(data2) {
									if (data2.result == "success") {
										location.href = "/user/findPw/result/view";
									} else {
										alert("임시 비밀번호 전송에 실패했습니다");
									}	
								}
								, error:function() {
									alert("임시 비밀번호 전송 에러");
								}
							});
						} else {
							swal("", "일치하는 정보가 없습니다", "error");
						}
					}
					, error:function() {
						alert("비밀번호 찾기 에러");
					}
				});
				
			});
			
		});
		
	</script>
	

</body>
</html>