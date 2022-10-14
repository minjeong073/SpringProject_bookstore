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
    
</head>
<body>

	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class="container">
			
			<div class="d-flex justify-content-center mt-3">
				<div class="outer-form w-50 m-4 d-flex justify-content-center">
					
					<div class="border form-control m-4 p-5 d-flex flex-column justify-content-center">
						
						<h3 class="text-center mb-2">비밀번호 찾기</h3>
						
						<hr class="border" width="100%">
						
						<div class="px-5 d-flex flex-column align-items-center">
							<input type="text" class="form-control m-3" placeholder="아이디" id="inputLoginId">
							<input type="text" class="form-control m-3" placeholder="이메일" id="inputEmail">
						</div>
					
						<div class="text-center">						
							<button type="button" class="btn w-btn-outline w-btn-color-outline mt-3 my-3 w-75" id="findPwBtn">비밀번호 찾기</button>
						</div>
					</div>
				</div>
			</div>
			
		</div>
		
	</div>
	

</body>
</html>