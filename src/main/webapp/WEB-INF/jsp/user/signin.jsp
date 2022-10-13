<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

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
		<div class="container  d-flex justify-content-center">
		
			<div class="outer-form m-5 p-3">
				<div class="bg-white m-4 p-3  d-flex flex-column align-items-center">
				
					<div class="signin-form d-flex align-items-start">
					
						<div class=" p-3 m-3 w-50">
							<div class="text-center pt-3 mb-4">
								<h4>회원 로그인</h4>
							</div>
							
							<hr class="border">
							
							<!-- id pw input -->
							<div class="border form-control d-flex flex-column align-items-center">
								<input type="text" class="form-control m-3" placeholder="아이디" id="inputLoginId">
								<input type="password" class="form-control m-3" placeholder="비밀번호" id="inputPassword">
								<div class="text-center m-3">
									<button type="button" class="btn w-btn-outline w-btn-green-outline" id="signinBtn">로그인</button>
								</div>
							</div>
						</div>
						
						<div class=" p-3 m-3 w-50">
							<div class="text-center pt-3 mb-4">
								<h4>비회원 주문 조회</h4>
							</div>
							
							<hr class="border">
							
							<!-- name email pw input -->
							<div class="border form-control d-flex flex-column align-items-center">
								<input type="text" class="form-control m-2" placeholder="이름">
								<input type="text" class="form-control m-2" placeholder="이메일">
								<input type="password" class="form-control m-2" placeholder="비밀번호">
								<div class="text-center m-3">
									<button type="button" class="btn w-btn-outline w-btn-green-outline">주문 조회</button>
								</div>
							</div>
						</div>
						
					</div>
					
					<!-- 회원가입 링크 -->
					<div class=" w-50 text-center m-3">
						<a href="/user/signup/view" class=" btn w-btn-outline w-btn-green">회원가입</a>
					</div>
				
				</div>
			</div> <!-- outer-form -->
		
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
						location.href = "/shop/main/view"
					} else {
						alert("로그인 실패");
					}
				}
				, error:function() {
					alert("로그인 에러");
				}
			});
			
		});
	});
	
	</script>
	
</body>
</html>