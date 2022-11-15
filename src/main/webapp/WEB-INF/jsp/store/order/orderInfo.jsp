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
<title>주문 내역</title>

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
						<h2 class="main-font-text my-2">주문 내역</h2>
					</div>
					
					<!-- forEach -->

					<c:forEach var="orderInfo" items="${orderInfoList }">
						
						<div class="border my-4 w-75">
							<div class="m-4"><h3>주문 정보</h3></div>
							
							<div class="d-flex flex-column justify-content-center align-items-center">
								<table class="table m-3 w-75 text-center">
									<c:forEach var="details" items="${orderInfo.orderBookDetailList }">
									<tr>
										<th class=" w-25">주문 번호</th>
										<td>${orderInfo.order.orderNumber }</td>
									</tr>
									
									<!-- 책 정보 -->
									<tr>
										<th><img src="${details.bookDetail.cover }" width="110px"></th>
										<td class=" d-flex justify-content-center">
											<div class="d-flex flex-column justify-content-around align-items-around pl-4">
												<div class="orderInfo-text orderInfo-title mt-2 mb-3">
												<c:choose>
													<c:when test="${fn:length(details.bookDetail.title) > 70 }">
														${fn:substring(details.bookDetail.title, 0, 70) } ...
													</c:when>
													<c:otherwise>
														${details.bookDetail.title }
													</c:otherwise>
												</c:choose>	
												</div>
												<div class="orderInfo-text pb-2">${details.bookDetail.author }</div>
												<div class="orderInfo-text">${details.bookDetail.publisher }</div>
											</div>
										</td>
									<tr>
									
									<tr>
										<th>수량</th>
										<td>${details.orderDetail.count } 권</td>
									</tr>
									<tr>
										<th class="w-25">결제 금액</th>
										<td>
											<c:choose>
												<c:when test="${not empty orderInfo.order.deliveryCost }">
													<fmt:formatNumber value="${orderInfo.order.totalPrice + orderInfo.order.deliveryCost }" pattern="#,###"/> 원
													<span class="text-secondary small">(배송비 3,000 원 포함)</span>
												</c:when>
												<c:otherwise>
													<fmt:formatNumber value="${orderInfo.order.totalPrice }" pattern="#,###"/> 원
												</c:otherwise>
											</c:choose>
										 </td>
									</tr>
									
									</c:forEach>
								</table>
								<div class="text-right w-75">
									<button class="btn w-btn-outline w-btn-color-outline" id="orderCancelBtn" data-order-id=${orderInfo.order.id }>주문 취소</button>
								</div>
							</div>
							
							<div class="d-flex justify-content-center">
								<table class="table m-3 w-75 text-center">
								</table>
							</div>
						</div>
					<!-- 주문자 정보 -->
					<div class="border my-4 w-75">
						<div class="m-4"><h3>주문자 정보</h3></div>
						
						<c:choose>
							<c:when test="${not empty userId }">
								<div class="d-flex justify-content-center">
									<table class="table m-3 w-75 text-center">
										<tr>
											<th class=" w-25">주문자명</th>
											<td>${user.name }</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>${user.phoneNumber }</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>${user.email }</td>
										</tr>
									</table>
								</div>
							</c:when>
							
							<c:otherwise>
								<div class="d-flex justify-content-center">
									<table class="table m-3 w-75 text-center">
										<tr>
											<th class=" w-25">주문자명</th>
											<td>${nonMember.name }</td>
										</tr>
										<tr>
											<th>전화번호</th>
											<td>${nonMember.phoneNumber }</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td>${nonMember.email }</td>
										</tr>
									</table>
								</div>
							</c:otherwise>
						</c:choose>
						
					</div>
					
					<!-- 배송 정보 -->
					<div class="border my-4 w-75">
						<div class="m-4"><h3>배송 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th class=" w-25">이름</th>
									<td>${orderInfo.order.name }
								</tr>
								<tr>
									<th>전화번호</th>
									<td>${orderInfo.order.phoneNumber }
								</tr>
								<tr>
									<th>우편번호</th>
									<td>${orderInfo.order.address1 }</td>
								</tr>
								<tr>
									<th>주소</th>
									<td>${orderInfo.order.address2 }</td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td>${orderInfo.order.address3 }</td>
								</tr>
								
							</table>
						</div>
					</div>
					
				</c:forEach>
				</div> <!--  -->
			</div>
			
		</div> <!-- body -->
	</div> <!-- wrap -->
	
	<script>
	
		$(document).ready(function() {
		
			// 주문 취소
			
			$("#orderCancelBtn").on("click", function() {
				
				let orderId = $(this).data("order-id");

				$.ajax({
					type:"get"
					, url:"/store/order/cancelOrder"
					, data:{"orderId":orderId}
					, success:function(data) {
						if (data.result == "success") {
							alert("주문이 취소되었습니다");
							location.href = "/store/main/view";
						} else {
							alert("주문 취소에 실패하였습니다");
						}
					}
					, error:function() {
						alert("주문 취소 에러");
					}
				});
			})
		});
		
	</script>
</body>
</html>