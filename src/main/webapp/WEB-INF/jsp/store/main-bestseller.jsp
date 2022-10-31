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
<title>베스트셀러</title>

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
			
			<!-- 조회할 주간 -->
			<div class="w-100 d-flex justify-content-end">
				<div class="d-flex w-25 bestsellerDate">
					<select id="bestsellerYear" class="bestsellerDate form-control col-6 mx-2" data-select-year=${year }>
					</select>
					<select id="bestsellerMonth" class="bestsellerDate form-control col-3 mx-2" data-select-month=${month }>
					</select>
					<select id="bestsellerWeek" class="bestsellerDate form-control col-3 mx-2" data-select-week=${week }>
						<option value="" disabled="disabled">주차</option>
						<option value="1" selected>1</option>
						<c:forEach var="i" begin="2" end="5">
							<option value="${i }">${i }</option>
						</c:forEach>
					</select>
				</div>
			</div>
					
			<div class="text-center mt-4">
				<span class="lookup-div">
					<c:choose>
						<c:when test="${empty year }">
							<h4>2022 년 10 월 4 주차 조회</h4>
						</c:when>
						<c:otherwise>
							<h4>${year } 년 ${month } 월 ${week } 주차 조회</h4>
						</c:otherwise>
					</c:choose>
				</span>
			</div>
			
			
			<!-- 국내 도서 -->
			<div class="my-3">
				<div class=" m-3 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center my-3">
						<h2 class="my-2">국내 도서</h2>
					</div>
					
					
					<!-- 체크한 품목 장바구니, 구매  -->
					<div class="w-100">
						<div class="text-right">
							<label class="link-text">전체 선택<input type="checkbox" class="mx-2"></label>
							<button class="btn w-btn-outline w-btn-color-outline mx-2">cart</button>
							<button class="btn w-btn-outline w-btn-color-outline">buy</button>
						</div>
					</div>
					
					<!-- table -->
					<div class="mt-2 mb-4 d-flex justify-content-center align-item-center">
						<table class="table main-table m-2">
						
						<c:forEach var="bestseller" items="${bookBestsellerList }">
						<c:set var="i" value="${i + 1 }"/>
							<tr>
								<th class="bestseller-th">
									<div class=" list-number text-center">${i }</div>
								</th>
								
								<td class=" d-flex justify-content-around bestseller-td">
									<!-- cover -->
									<div class=" w-25 text-center">
										<img src="${bestseller.cover }" class="bestseller-cover">
									</div>
									
									<!-- info -->
									<div class="bestseller-info w-50 p-4">
										<div class="bestseller-title ">
											<a href="/store/book/detail/view?isbn=${bestseller.isbn }">
											<c:choose>
												<c:when test="${fn:length(bestseller.title) > 25 }">
													${fn:substring(bestseller.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${bestseller.title }
												</c:otherwise>
											</c:choose>
											</a>
										</div>
										
										<hr>
										
										<div class="book-detail-text">
											<c:choose>
											<c:when test="${fn:length(bestseller.author) > 20 }">
											${fn:substring(bestseller.author, 0, 20) } ...  <br>  ${bestseller.publisher }  <br>  ${bestseller.pubDate }
											</c:when>
											<c:otherwise>
												${bestseller.author }  <br>  ${bestseller.publisher }  <br>  ${bestseller.pubDate }
											</c:otherwise>
											</c:choose>
										</div>
										
										<hr>
										
										<div>
											<fmt:formatNumber value="${bestseller.priceSales }" pattern="#,### 원"/>
										</div>
									</div>
									<div class="my-2">
										<div class="my-3"><input type="checkbox" class="form-control bestseller-check-btn" data-isbn=${bestseller.isbn }></div>
										<div>
											<div class="my-2"><button class="btn w-btn-outline w-btn-color-outline">cart</button></div>
											<div><button class="btn w-btn-outline w-btn-color-outline buy-btn" data-toggle="modal" data-target="#buyModalBtn" data-isbn=${bestseller.isbn }>buy</button></div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
							
						</table>
						
					</div> <!-- table -->
				</div>
			</div> <!-- 국내 도서 -->
			
			<!-- 해외 도서 -->
			<div class="my-3">
				<div class=" m-3 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center my-3">
						<h2 class="my-2">해외 도서</h2>
					</div>
					
					<!-- 체크한 품목 장바구니, 구매  -->
					<div class="w-100">
						<div class="text-right">
							<label class="link-text">전체 선택<input type="checkbox" class="mx-2"></label>
							<button class="btn w-btn-outline w-btn-color-outline mx-2">cart</button>
							<button class="btn w-btn-outline w-btn-color-outline">buy</button>
						</div>
					</div>
					
					<!-- table -->
					<div class="mt-2 mb-4 d-flex justify-content-center align-item-center">
						<table class="table main-table m-2">
						
						<c:forEach var="bestseller" items="${foreignBestsellerList }">
						<c:set var="j" value="${j + 1 }"/>
							<tr>
								<th class="bestseller-th">
									<div class=" list-number text-center">${j }</div>
								</th>
								
								<td class=" d-flex justify-content-around bestseller-td">
									<!-- cover -->
									<div class=" w-25 text-center">
										<img src="${bestseller.cover }" class="bestseller-cover">
									</div>
									
									<!-- info -->
									<div class="bestseller-info w-50 p-4">
										<div class="bestseller-title ">
											<a href="/store/book/detail/view?isbn=${bestseller.isbn }">
											<c:choose>
												<c:when test="${fn:length(bestseller.title) > 25 }">
													${fn:substring(bestseller.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${bestseller.title }
												</c:otherwise>
											</c:choose>
											</a>
										</div>
										
										<hr>
										
										<div class="book-detail-text">
											<c:choose>
											<c:when test="${fn:length(bestseller.author) > 20 }">
											${fn:substring(bestseller.author, 0, 20) } ...  <br>  ${bestseller.publisher }  <br>  ${bestseller.pubDate }
											</c:when>
											<c:otherwise>
												${bestseller.author }  <br>  ${bestseller.publisher }  <br>  ${bestseller.pubDate }
											</c:otherwise>
											</c:choose>
										</div>
										
										<hr>
										
										<div>
											<fmt:formatNumber value="${bestseller.priceSales }" pattern="#,### 원"/>
										</div>
									</div>
									<div class="my-2">
										<div class="my-3"><input type="checkbox" class="form-control bestseller-check-btn" data-isbn=${bestseller.isbn }></div>
										<div>
											<div class="my-2"><button class="btn w-btn-outline w-btn-color-outline">cart</button></div>
											<div><button class="btn w-btn-outline w-btn-color-outline buy-btn" data-toggle="modal" data-target="#buyModalBtn" data-isbn=${bestseller.isbn }>buy</button></div>
										</div>
									</div>
								</td>
							</tr>
						</c:forEach>
							
						</table>
						
					</div> <!-- table -->
				</div>
			</div> <!-- 해외 도서 -->
			
		</div> <!-- body -->
		
		<!-- Modal -->
		<div class="modal fade" id="buyModalBtn" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		    	<div class="modal-header text-center m-2">
			    	<h3 class="modal-title">수량</h3>
			    	<button class="close" type="button" aria-label="Close" data-dismiss="modal">
			    		<span aria-hidden="true">X</span>
			    	</button>
		    	</div>
		    	
			    <div class="modal-body">
			    	<div class="d-flex justify-content-center mb-3">
				    	<button class="btn btn-link link-text count-minus">-</button>
						<input type="text" class="form-control w-25 w-btn-color-outline-non" id="countResult" value="1">
						<button class="btn btn-link link-text count-plus">+</button>
			    	</div>
		        	<button type="button" class="btn btn-block w-btn-color" id="buyBtn${bestseller.isbn }" data-isbn=${bestseller.isbn }>구매하기</button>
		      </div> <!-- modal-body -->
		    </div>
		    
		  </div>
		</div><!-- modal -->
		
	</div> <!-- wrap -->
	
	<script>
	
		$(document).ready(function() {
		
			// 베스트셀러 조회 주간 선택
			
			var date = new Date();
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			
			getSelectYears(year);
			getSelectMonths(month);
			
			$("#bestsellerYear").val(year);
			$("#bestsellerMonth").val(month);
			
			$("#bestsellerYear").on("change", function(){
				var changeYear = $(this).val();
				getSelectYears(changeYear);
				$("#bestsellerYear").val(changeYear);
			});
			
			$("#bestsellerMonth").on("change", function(){
				var changeMonth = $(this).val();
				getSelectMonths(changeMonth);
				$("#bestsellerMonth").val(changeMonth);
			});
			
			
			// 베스트셀러 조회
			$(".bestsellerDate select").on("change", function() {
				
				let year = $("#bestsellerYear").val();
				let month = $("#bestsellerMonth").val();
				let week = $("#bestsellerWeek").val();
				
				location.href="/store/nav/main/bestseller/view?year=" + year 
				+ "&month=" + month + "&week=" + week;
				
			});
			
			
			// 체크한 상품
			
			$(".bestseller-check-btn").on("click", function() {
				
				let checkIsbn = $(this).data("isbn");
				
				alert(checkIsbn);
			});
			
			
			// 구매하기 버튼
			
			$(".buy-btn").on("click", function() {
				
				let isbn = $(this).data("isbn");
				
				$("#buyBtn").on("click", function() {
					
					let count = $("#countResult").val();
					location.href = "/store/order/view?isbn=" + isbn + "&count=" + count;
				});
					
			});
			
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
			
			
		});
		
		
		
		// select 박스 year option 추가
		
		function getSelectYears(getYear) {
			
			$("#bestsellerYear option").remove();
			
			var startYear = Number(getYear) - 7;
			
			$("#bestsellerYear").append("<option value='' disabled='disabled'>연도</option>");
			
			for(var y = startYear; y <= getYear; y++) {
				if (y == getYear) {
					$("#bestsellerYear").append("<option value='" + y + "' selected>" + y + "</option>");
				} else {
					$("#bestsellerYear").append("<option value='" + y + "'>" + y + "</option>");
				}
			}
		}
		
		// select 박스 month option 추가
		
		function getSelectMonths(getMonth) {
			
			$("#bestsellerMonth option").remove();
			
			$("#bestsellerMonth").append("<option value='' disabled='disabled'>월</option>");
			
			for(var m = 1; m <= 12; m++ ) {
				if (m == getMonth) {
					$("#bestsellerMonth").append("<option value='" + m + "' selected>" + m + "</option>");
				} else {
				$("#bestsellerMonth").append("<option value='" + m + "'>" + m + "</option>");
				}
			}
		}
		
	</script>
</body>
</html>