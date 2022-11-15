<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl function library -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- jstl fmt library -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<!-- bootstrap jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css" >

<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
</head>
<body>
	
	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class=" container d-flex flex-column justify-content-center">
			<div class="my-4"></div>
			
			<div class="my-3">
				<div class="mx-3 my-5 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center mb-5">
						<h2 class="main-font-text my-2">마이페이지</h2>
					</div>
					<c:choose>
						<c:when test="${not empty userId }">
					
					<div class="d-flex justify-content-around w-100">
					
						<div class="outer-form mypage-user m-4 w-50">
							<div class="bg-white m-4">
								
								<div class="d-flex flex-column align-items-center m-4 p-4">
									<h3 class="my-3">비밀번호 변경</h3>
									
									<input type="password" class="form-control my-4" placeholder="현재 비밀번호" id="inputCurPw">
									<input type="password" class="form-control my-3" placeholder="새 비밀번호" id="inputNewPw">
									<input type="password" class="form-control" placeholder="새 비밀번호 확인" id="inputNewPwConfirm">
									<div class="w-100 ml-5">
										<span class="small text-warning d-none" id="wrongPwText">비밀번호가 일치하지 않습니다</span>
										<span class="small text-primary d-none" id="correctPwText">비밀번호가 일치합니다</span>
									</div>
									
									<button class="btn w-btn-outline w-btn-color-outline my-4" id="changeBtn" data-user-id=${userId }>비밀번호 변경</button>
								</div>
							
							</div>
						</div>
					</div>
					
					</c:when>
					
					<c:otherwise>
						<div class="w-50 d-flex justify-content-around align-items-center my-3">
							<a href="/user/signin/view" class="btn w-btn-outline link-text mypage-link-text">로그인</a>
							<a href="/user/signup/view" class="btn w-btn-outline link-text mypage-link-text">회원가입</a>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			
		</div> <!-- body -->
	</div> <!-- wrap -->
	
	
	<script>
	
		$(document).ready(function() {
			
			// 비밀번호 변경
			
			$("#changeBtn").on("click", function() {
				
				let userId = $(this).data("user-id");
				
				let curPw = $("#inputCurPw").val();
				let newPw = $("#inputNewPw").val();
				let newPwConfirm = $("#inputNewPwConfirm").val();
				
				// validation
				
				if (curPw == "") {
					alert("현재 비밀번호를 입력하세요");
					$("#inputCurPw").focus();
					return ;
				}
				
				if (newPw == "") {
					alert("새 비밀번호를 입력하세요");
					$("#inputNewPw").focus();
					return ;
				}
				
				if ($("#correctPwText").hasClass("d-none")) {
					alert("비밀번호가 일치하지 않습니다");
					$("#inputNewPwConfirm").focus();
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/mypage/password"
					, data:{"curPw":curPw, "newPw":newPw}
					, success:function(data) {
						if (data.result == "success") {
							alert("비밀번호가 변경되었습니다");
							location.href = "/user/mypage/view?id=" + userId;
						} else if (data.result == "null") {
							alert("해당하는 회원 정보가 없습니다");
							
						} else {
							alert("비밀번호 변경에 실패하였습니다");
						}
					}
					, error:function() {
						alert("비밀번호 변경 에러");
					}
					
				});
				
			});
			
			$("#inputNewPwConfirm").on("input", function() {
				
				let password = $("#inputNewPw").val();
				let passwordConfirm = $("#inputNewPwConfirm").val();
				
				if (password != passwordConfirm) {
					$("#correctPwText").addClass("d-none");
					$("#wrongPwText").removeClass("d-none");
				} else {
					$("#correctPwText").removeClass("d-none");
					$("#wrongPwText").addClass("d-none");
				}
			});
			
		});
		
	</script>
</body>
</html>