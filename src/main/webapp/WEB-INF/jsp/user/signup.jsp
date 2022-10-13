<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- bootstrap jquery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css" >
    
</head>
<body>

	<div class="wrap ">
	
		<!-- 헤더 -->
		<div class="main-header d-flex justify-content-center">
			
			<div>
				<!-- logo, user nav -->
				
				<header class=" d-flex justify-content-between">
				
					<div class="header-logo mx-3 "><a href="#">around book</a></div>
					<div class="header-user-nav mx-3 ">
						<nav>
							<!-- 비로그인 상태 -->
							<ul class="nav nav-fill d-flex justify-content-center">
								<li class="nav-item"><a href="/user/signin/view">로그인</a></li>
								<li class="nav-item"><a href="/user/signup/view">회원가입</a></li>
								<li class="nav-item"><a href="#">장바구니</a></li>
							</ul>
							
							<!-- 로그인 상태 -->
							<!-- <ul>
								<li>아이디</li>
								<li>로그아웃</li>
								<li>마이페이지</li>
								<li>장바구니</li>
							</ul> -->
							
						</nav>
					</div>
				</header>
				
				<!-- main nav -->
				<div class="header-main-nav pb-3 pt-2">
					<nav>
						<ul class="nav nav-fill d-flex justify-content-center">
							<li class="nav-item"><a href="#">국내도서</a></li>
							<li class="nav-item"><a href="#">해외도서</a></li>
							<li class="nav-item"><a href="#">베스트셀러</a></li>
							<li class="nav-item"><a href="#">카테고리</a></li>
						</ul>
					</nav>
				</div>
			
			</div>
		</div>
		
		<!-- body -->
		<div class="container">
			<div class="d-flex justify-content-center pt-5">
			<h3>회원가입</h3>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="outer-form w-50 m-4 d-flex justify-content-center">
					
					<div class="border form-control m-4 p-5 d-flex flex-column justify-content-center">
					
						<div class="d-flex align-items-center justify-content-around">
							<input type="text" class="form-control m-3" placeholder="아이디" id="inputLoginId">
							<button type="button" class="btn btn-sm w-btn-outline w-btn-green-outline m-2 ml-4" id="loginIdDuplicateBtn">중복 확인</button>
						</div>
						
						<span class="small text-danger ml-3 d-none" id="duplicateIdText">이미 사용중인 아이디 입니다</span>
						<span class="small text-primary ml-3 d-none" id="possibleIdText">사용 가능한 아이디 입니다</span>
						
						<input type="password" class="form-control m-3" placeholder="비밀번호" id="inputPassword">
						<input type="password" class="form-control m-3" placeholder="비밀번호 확인" id="inputPasswordConfirm">
						
						<span class="small text-warning ml-3 d-none" id="wrongPwText">비밀번호가 일치하지 않습니다</span>
						<span class="small text-primary ml-3 d-none" id="correctPwText">비밀번호가 일치합니다</span>
						
						<input type="text" class="form-control m-3" placeholder="이름" id="inputName">
						<input type="text" class="form-control m-3" placeholder="전화번호" id="inputPhoneNumber">
						<input type="text" class="form-control m-3" placeholder="이메일" id="inputEmail">
						
						<div class="text-center">						
							<button type="button" class="btn w-btn-outline w-btn-green-outline mt-3 my-3 w-75" id="signupBtn">가입하기</button>
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
				
			});
			
			
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
			
			// 비밀번호 확인
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
				
			});
			
			$("#signupBtn").on("click", function() {
				
				// 변수 저장
				let loginId = $("#inputLoginId").val();
				let password = $("#inputPassword").val();
				// let passwordConfirm = $("#inputPasswordConfirm").val();
				let name = $("#inputName").val();
				let phoneNumber = $("#inputPhoneNumber").val();
				let email = $("#inputEmail").val();
				
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
				
				if (email == "") {
					alert("이메일을 입력하세요");
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