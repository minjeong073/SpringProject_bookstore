<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

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
		<div class="container">

			<div class="d-flex justify-content-center mt-3">
				<div class="outer-form w-50 m-4 d-flex justify-content-center">
					
					<div class="border form-control m-4 p-5 d-flex flex-column justify-content-center">
						<h3 class="text-center mb-2">회원가입</h3>
					
						<div class="d-flex align-items-center justify-content-around">
							<input type="text" class="form-control m-3" placeholder="아이디" id="inputLoginId">
							<button type="button" class="btn btn-sm w-btn-outline w-btn-color-outline m-2 ml-4" id="loginIdDuplicateBtn">중복 확인</button>
						</div>
						
						<span class="small text-danger ml-3 d-none" id="duplicateIdText">이미 사용중인 아이디 입니다</span>
						<span class="small text-primary ml-3 d-none" id="possibleIdText">사용 가능한 아이디 입니다</span>
						
						<input type="password" class="form-control m-3" placeholder="비밀번호" id="inputPassword">
						<input type="password" class="form-control m-3" placeholder="비밀번호 확인" id="inputPasswordConfirm">
						
						<span class="small text-warning ml-3 d-none" id="wrongPwText">비밀번호가 일치하지 않습니다</span>
						<span class="small text-primary ml-3 d-none" id="correctPwText">비밀번호가 일치합니다</span>
						
						<input type="text" class="form-control m-3" placeholder="이름" id="inputName">
						<input type="text" class="form-control m-3" placeholder="전화번호" id="inputPhoneNumber">
						
						<div class="d-flex ml-3 my-3 w-100">
							<input type="text" class="form-control" placeholder="이메일" id="inputEmailId">
							<span class="m-2">@</span>
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
						
						<div class="text-center">						
							<button type="button" class="btn w-btn-outline w-btn-color-outline mt-3 my-3 w-75" id="signupBtn">가입하기</button>
						</div>
					</div>
					
				</div>
				
			</div>
		</div> <!-- body -->
		
	</div> <!-- wrap -->
	
	<script>
	
		$(document).ready(function() {
			
			// 아이디 중복 확인
			
			// 아이디 중복 확인 유무
			var isCheck = false; 
			
			// 아이디 중복 상태
			var isDuplicate = true;
			
			// 아이디 입력 값 변경될 경우
			$("#inputLoginId").on("input", function() {
				
				isCheck = false;
				isDuplicate = true;
				
				$("#duplicateIdText").addClass("d-none");
				$("#possibleIdText").addClass("d-none");
				
			}); <%-- 아이디 값 변경 --%>
			
			
			// 아이디 중복 확인
			$("#loginIdDuplicateBtn").on("click", function() {
				
				let loginId = $("#inputLoginId").val();
				
				// validation
				
				if (loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate_id"
					, data:{"loginId":loginId}
					, success:function(data) {
						
						isCheck = true;
						
						// 중복일 경우
						if (data.id_duplicate) {
							$("#duplicateIdText").removeClass("d-none");
							$("#possibleIdText").addClass("d-none");
							isDuplicate = true;
						} 
						// 중복이 아닐 경우
						else {
							$("#duplicateIdText").addClass("d-none");
							$("#possibleIdText").removeClass("d-none");
							isDuplicate = false;
						}
					}
					, error:function() {
						alert("아이디 중복 확인 에러");
					}
				});
				
			}); <%-- 아이디 중복 확인 --%>
			
			
			// 회원가입
			
			// - 비밀번호 확인
			
			$("#inputPasswordConfirm").on("input", function() {
				
				let password = $("#inputPassword").val();
				let passwordConfirm = $("#inputPasswordConfirm").val();
				
				if (password != passwordConfirm) {
					$("#correctPwText").addClass("d-none");
					$("#wrongPwText").removeClass("d-none");
				} else {
					$("#correctPwText").removeClass("d-none");
					$("#wrongPwText").addClass("d-none");
				}
				
			}); <%-- 비밀번호 확인 --%>
			
			
			// - 이메일 도메인 입력
			
			var email_regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			$("#selectEmailDomain").change(function() {
				
				if ($(this).val() == "직접입력") {
					$("#inputEmailDomain").val("");
					$("#inputEmailDomain").focus();
				} else {
					$("#inputEmailDomain").val($(this).val());
				}
				
			}); <%-- 이메일 도메인 선택 --%>
			
			
			$("#signupBtn").on("click", function() {
				
				// 변수 저장
				let loginId = $("#inputLoginId").val();
				let password = $("#inputPassword").val();
				let name = $("#inputName").val();
				let phoneNumber = $("#inputPhoneNumber").val();
				
				let emailId = $("#inputEmailId").val();
				let emailDomain = $("#inputEmailDomain").val();
				let email = emailId + "@" + emailDomain;
				
				// validation
				
				if (loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if (!$("#wrongPwText").hasClass("d-none")) {
					alert("비밀번호가 일치하지 않습니다");
					return ;
				}
				
				if (name == "") {
					alert("이름을 입력하세요");
					return ;
				}
				
				if (phoneNumber == "") {
					alert("전화번호를 입력하세요");
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
				
				// 아이디 중복 확인
				if (!isCheck) {
					alert("아이디 중복 확인을 해주세요");
					return ;
				}
				
				if (isDuplicate) {
					alert("중복된 아이디 입니다");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":loginId, "password":password, "name":name, 
						"phoneNumber":phoneNumber, "email":email}
					, success:function(data) {
						if (data.result == "success") {
							alert("회원가입이 완료되었습니다");
							location.href = "/user/signin/view";
						} else {
							alert("회원가입 실패");
						}
					}
					, error:function() {
						alert("회원가입 에러");
					}
					
				})
				
				
			}); <%-- 회원가입 --%>
			
		});
	
	</script>
	
</body>
</html>