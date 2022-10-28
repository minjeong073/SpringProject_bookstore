<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl fmt library -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결제 페이지</title>

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
						<h2 class="main-font-text my-2">주문 결제</h2>
					</div>
					
					<div class="border d-flex w-75 my-4 px-5">
						<div class=" m-4 p-2"><img src="${bookDetail.cover }" width="160px"></div>
						<div class="book-detail-text mt-5 ml-3">
							<div><h2>${bookDetail.title }</h2></div>
							<div>${bookDetail.author } ${bookDetail.publisher }</div>
							<div><fmt:formatNumber value="${bookDetail.priceSales }" pattern="#,### 원"/></div>
							<div class="mt-2">수량 : 2</div>
						</div>
						<div class="book-detail-text bg-danger m-4">
						</div>
					</div>
					
					<div class="border my-4 w-75">
						<div class="m-4"><h3>주문자 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th class=" w-25">주문자명</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type="password" class="form-control w-50"></td>
								</tr>
								
							</table>
						</div>
					</div>
					
					<div class="border my-4 w-75">
						<div class="m-4"><h3>배송 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th class=" w-25">이름</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>주소1</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>주소2</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								<tr>
									<th>주소3</th>
									<td><input type="text" class="form-control w-50"></td>
								</tr>
								
							</table>
						</div>
					</div>
					
					<div class="border my-4 w-75">
						<div class="m-4"><h3>결제 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th>상품 금액</th>
									<td>${bookDetail.priceSales } * 2</td>
								<tr>
								<tr>
									<th>배송비</th>
									<td>3,000 원</td>
								</tr>
							</table>
						</div>
					</div>			
					
					<div class="my-4">					
						<button class="btn btn-lg w-btn-outline w-btn-color-outline mx-3">결제하기</button>
						<button class="btn btn-lg w-btn-outline w-btn-color-outline mx-3">장바구니 가기</button>
					</div>		
				</div>
			</div>
			
		</div>
	</div>
	
</body>
</html>