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
<title>${bookDetail.title }</title>

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
		<div class=" container d-flex flex-column justify-content-center mb-5 p-3">
			<div class="my-4"></div>
			<!-- 책 정보 -->
			<div class="book-detail-container d-flex justify-content-center align-items-center my-5 p-4">
				<div class=" book-detail-div d-flex justify-content-center">
					<div class="mr-4 col-5">
						<img src="${bookDetail.cover }" alt="book" class="book-cover">
					</div>
					<div class="left-border-div col-1 mr-2"></div>
					<div class=" book-detail-div2 ml-3 col-5">
						<div class="">
							<div class="my-5 ml-3"><h2>${bookDetail.title }</h2></div>
							<div class="">
								<table class="book-detail-text mx-3">
									<tr>
										<td class="book-detail-table-width">저자</td>
										<td>${bookDetail.author }</td>
									</tr>
									<tr>
										<td>출판사</td>
										<td>${bookDetail.publisher }</td>
									</tr>
									<tr>
										<td>출간일</td>
										<td>${bookDetail.pubDate }</td>
									</tr>	
									<tr>
										<td>평점</td>
										<td>${subInfo.ratingInfo.ratingScore } <span class="score-text">   / 10</span></td>
									</tr>
								</table>
							</div>
						</div>
						
						<div class="my-3">
							<table class="book-detail-text mx-3">
								<tr>
									<td class="book-detail-table-width">판매가</td>
									<td><fmt:formatNumber value="${bookDetail.priceSales }" pattern="#,### 원"/></td>
								</tr>
								<tr>
									<td>수량</td>
									<td class=" d-flex">
										<button class="btn btn-link link-text count-minus">-</button>
										<input type="text" class="form-control w-25 w-btn-color-outline-non" id="countResult" value="1">
										<button class="btn btn-link link-text count-plus">+</button>
									</td>
								</tr>
							</table>
						</div>
						
						<div class="d-flex mt-2">
							<button class="btn mx-3 w-btn-outline w-btn-color-outline" id="cartBtn" data-isbn=${bookDetail.isbn }>장바구니 담기</button>
							<button class="btn w-btn-outline w-btn-color-outline" id="buyBtn" data-isbn=${bookDetail.isbn }>구매하기</button>
						</div>
						
					</div>
				</div>
				
			</div>

			<div class="my-5"><hr></div>			
			
			<!-- 책 소개 -->
			<div class="mt-3">
				<div class="d-flex justify-content-center">
					<div class="w-25 text-center outer-form-text my-2"><h3>책 소개</h3></div>
				</div>
				<div class="d-flex justify-content-center">
					<div class=""></div>
					<div class="m-3 book-description-width">
						<div class="my-5 book-description">
							<h5>출간일 : ${bookDetail.pubDate }</h5>
							<h5>카테고리 : ${bookDetail.categoryName }</h5>
							<h5>isbn : ${bookDetail.isbn }</h5>
						</div>
						<hr>
						<div class="my-5">
							<h5 class="book-description description-text">${bookDetail.description }</h5>					
						</div>
						<div><a href="${bookDetail.link }" class="text-info" target="_blank"><h5>책 정보 더보기</h5></a></div>
					</div>
					<div class=""></div>
				</div>
			</div>
			
			<hr>
			
			<!-- 책 리뷰 -->
			<div class="mt-3">
				
				<div class="d-flex justify-content-center">
					<div class="w-25 text-center outer-form-text my-2"><h3>책 리뷰</h3></div>
				</div>
				
				<div class=" my-4">
					
					<div class="d-flex justify-content-around my-3"> 
						<div class=" score-div mt-4 d-flex flex-column justify-content-start align-items-center"> <!-- 별점 평균 -->
							<i class="bi bi-star-fill bi-star-fill-avg"></i>
							<div class="text-center score-text">${subInfo.ratingInfo.ratingScore } / 10.0</div>
						</div>
						
						<div class=" review-div border py-4 my-3"> <!-- 리뷰 쓰기 -->
							<div class="d-flex justify-content-around mb-2 mx-5">
								<div class="d-flex"> <!-- 별점 -->
									<div class="d-flex">
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
									</div>
									<div class="mx-2"><input type="text" class="form-control w-50" placeholder="0.5 ~ 10"></div>
								</div>
								<div><button class="btn">리뷰 쓰기</button></div>
							</div>
							
							<div class="d-flex justify-content-center">
								<textarea rows="5" placeholder="review" class="form-control review-textarea"></textarea>
							</div>
						</div>
					</div>
					
					<hr>
					
					<div class="d-flex flex-column align-items-center my-5"> <!-- 리뷰 리스트 -->
					</div>
				</div>
			</div>
		
		</div> <!-- container -->
		
	</div> <!-- wrap -->

	<script>
	
		$(document).ready(function() {
		
			// 수량
			
			// 수량 감소
			$(".count-minus").on("click", function() {
				let count = $("#countResult").val();
				if (count > 1) {
					$("#countResult").val(--count);
				}
			});
			
			// 수량 증가
			$(".count-plus").on("click", function() {
				let count = $("#countResult").val();
				$("#countResult").val(++count);
			});
			
			
			// 구매하기 버튼
			
			$("#buyBtn").on("click", function() {
				
				let isbn = $(this).data("isbn");
				let count = $("#countResult").val();
				
				location.href = "/store/order/view?isbn=" + isbn + "&count=" + count;
			});
			
			
			// 장바구니 버튼
			
			$("#cartBtn").on("click", function() {
				
				let isbn = $(this).data("isbn");
				let count = $("#countResult").val();
				
				// location.href = "/user/cart/view?isbn=" + isbn + "&count=" + count;
			});
		});
		
	</script>
</body>
</html>