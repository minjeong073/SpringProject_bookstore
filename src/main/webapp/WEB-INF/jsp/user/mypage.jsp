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
						<div class="outer-form mypage-user m-4">
							<div class="bg-white m-4">
								<div class="mypage-user-info py-3 pl-5 pr-3">
									<div>${user.loginId }</div>
									<div>${user.email }</div>
								</div>
							</div>
						</div>
						
						<div class="outer-form m-4 mypage-user">
							<div class="bg-white m-4">
								<div class="mypage-user-link p-3 d-flex flex-column align-items-center">
									<div><a href="#" >review link</a></div>
									<div><a href="#" >cart link</a></div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 주문 내역 리스트 -->
					<div class=" my-5 w-100">
						<div class="">
							<table class="table mypage-order-list">
								<tr>
									<th>주문 날짜</th>
									<th>주문 번호</th>
									<th>받는사람</th>
									<th>책 제목</th>
									<th>상세보기</th>
								</tr>
								
								<c:forEach var="orderInfo" items="${orderInfoList }" varStatus="status">
								<c:set value="0" var="i" />
								<tr>
									<td><fmt:formatDate value="${orderInfo.order.orderDate }" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
									<td>${orderInfo.order.orderNumber }</td>
									<td>${orderInfo.order.name }</td>
									<td>${orderInfo.orderBookDetailList[i].bookDetail.title }</td>
									<td><a href="/store/order/info/view?orderId=${orderInfo.order.id }" >상세보기</a></td>
									
								</tr>
								</c:forEach>
							</table>
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
	
</body>
</html>