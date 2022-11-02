<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<!-- bootstrap jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css" >

</head>
<body>
	
	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class="container  d-flex justify-content-center">
			<div class="col-1"></div>
			<div class="outer-form m-5">
				<div class="bg-white m-4 d-flex flex-column align-items-center">
				
					<div class="signin-form d-flex justify-content-center align-items-start">
						
						<div class=" p-3 mx-2 col-5">
							<div class="text-center pt-3 mb-4">
								<h4 class="main-font-text">회원 로그인</h4>
							</div>
							
							<hr class="border">
							
							<!-- id pw input -->
							<div class="border form-control d-flex flex-column align-items-center">
								<input type="text" class="form-control m-3" placeholder="아이디" id="inputLoginId">
								<input type="password" class="form-control m-3" placeholder="비밀번호" id="inputPassword">
								<div class="text-center m-3">
									<button type="button" class="btn w-btn-outline w-btn-color-outline" id="signinBtn">로그인</button>
								</div>
							</div>
						</div>
						<div class=" p-3 mx-2 col-6">
							<div class="text-center pt-3 mb-4">
								<h4 class="font-text">비회원 주문 조회</h4>
							</div>
							
							<hr class="border">
							
							<!-- name email pw input -->
							<div class="border form-control d-flex flex-column align-items-center">
								<input type="text" class="form-control m-2" placeholder="이름" id="nonMemberInputName">
								<div class="d-flex">
									<input type="text" class="form-control w-50" placeholder="이메일" id="emailId">
									<span class="m-2">@</span>
									<input type="text" class="form-control mr-1 w-50" id="emailDomain">
									<select class="form-select form-control w-50" id="selectEmailDomain">
										<option value="">-선택-</option>
										<option value="aroundbook.com">aroundbook.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option>직접입력</option>
									</select>
								</div>
								<input type="password" class="form-control m-2" placeholder="비밀번호" id="nonMemberInputPassword">
								<div class="text-center m-3">
									<button type="button" class="btn w-btn-outline w-btn-color-outline" id="lookUpBtn">주문 조회</button>
								</div>
							</div>
						</div>
						
					</div>
					
					<!-- 회원가입 링크 -->
					<div class="w-100 d-flex flex-column justify-content-center align-items-center mb-3">
						<a href="/user/signup/view" class="btn w-btn-outline link-text">회원가입</a>
						<div class="d-flex justify-content-around">
							<a href="/user/findId/view" class="btn w-btn-outline link-text">아이디 찾기</a>
							<a href="/user/findPw/member/view" class="btn w-btn-outline link-text">비밀번호 찾기</a>
							<a href="/user/findPw/view" class="btn w-btn-outline link-text">비회원 비밀번호 찾기</a>
						</div>
					</div>
				
				</div>
			</div> <!-- outer-form -->
			<div class="col-1"></div>
			
		</div> <!-- body -->
		
	</div> <!-- wrap -->
	
	<script>
		
	$(document).ready(function() {
		
		// 로그인
		
		$("#signinBtn").on("click", function() {
			
			// 변수 저장
			let loginId = $("#inputLoginId").val();
			let password = $("#inputPassword").val();
			
			// validation
			
			if (loginId == "") {
				alert("아이디를 입력하세요");
				return ;
			}
			
			if (password == "") {
				alert("비밀번호를 입력하세요");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/user/signin"
				, data:{"loginId":loginId, "password":password}
				, success:function(data) {
					if (data.result == "success") {
						alert("로그인 성공");
						location.href = "/store/main/view"
					} else {
						alert("로그인 실패");
					}
				}
				, error:function() {
					alert("로그인 에러");
				}
			});
			
		});
		
		
		// 이메일 도메인 입력
			
		var email_regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		$("#selectEmailDomain").change(function() {
			
			if ($(this).val() == "직접입력") {
				$("#emailDomain").val("");
				$("#emailDomain").focus();
			} else {
				$("#emailDomain").val($(this).val());
			}
			
		});
		
		// 비회원 주문 조회
		
		$("#lookUpBtn").on("click", function() {
			
			// 변수 저장
			
			let name = $("#nonMemberInputName").val();
			let emailId = $("#emailId").val();
			let emailDomain = $("#emailDomain").val();
			let email = emailId + "@" + emailDomain;
			let password = $("#nonMemberInputPassword").val();
			
			// validation
			
			if (name == "") {
				alert("이름을 입력하세요");
				$("#nonMemberInputName").focus();
				return ;
			}				
			
			if (emailId == "") {
				alert("이메일을 입력하세요");
				return ;
			}
			
			if (emailDomain == "") {
				alert("도메인을 입력하세요");
				return ;
			}
			
			if (!email_regEx.test(email)) {
				alert("이메일을 형식에 맞게 입력하세요");
				return ;
			}
			
			if (password == "") {
				alert("비밀번호를 입력하세요");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/store/order/info"
				, data:{"name":name, "email":email, "password":password}
				, success:function(data) {
					var nonMember;
					var orderInfoList;
					if (data.result == "success") {
						alert("조회 성공!");
						location.href = "/store/order/info/view?nonMemberId=" + data.nonMemberId;
						
					} else {
						alert("주문 조회에 실패했습니다");
					}
				}
				, error:function() {
					alert("비회원 주문 조회 에러");
				}
			});
			
		});
		
	});
	
	</script>
	
</body>
</html>