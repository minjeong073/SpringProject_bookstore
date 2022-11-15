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
<title>'${query }' 검색 결과</title>

<!-- bootstrap jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css" >

<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	
</head>
<body onload="unload();">
	
	<div class="wrap " data-query=${query }>
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class=" container d-flex flex-column justify-content-center">
			<div class="my-4"></div>
			
			
			<!-- 검색 결과 -->
			<div class="my-3">
				<div class=" m-3 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center my-3">
						<h2 class="my-2">'${query }' 검색 결과 </h2>
					</div>
				
				<!-- 조회 조건 -->
				<div class="d-flex w-100 mt-4 mb-1">
					<nav class=" col-5">
						<ul class="nav nav-fill">
							<li class="nav-item"><a href="#" class="sort" id="bookCategory">국내도서</a></li>
							<li class="nav-item"><a href="#" class="sort" id="foreignCategory">외국도서</a></li>
						</ul>
					</nav>
					<nav class=" col-7">
						<ul class="nav nav-fill">
							<li class="nav-item"><a href="#" class="sort" id="accuracy">관련도</a></li>
							<li class="nav-item"><a href="#" class="sort" id="publishTime">출간일</a></li>
							<li class="nav-item"><a href="#" class="sort" id="salesPoint">판매량</a></li>
						</ul>
					</nav>
				</div>
				
					<!-- table -->
					<div class="mt-2 mb-4 d-flex justify-content-center align-item-center">
						<table class="table main-table m-2">
						
						<c:forEach var="result" items="${searchResult }">
						<c:set var="i" value="${i + 1 }"/>
							<tr>
								<th class="bestseller-th">
									<div class=" list-number text-center">${i }</div>
								</th>
								
								<td class=" d-flex justify-content-around bestseller-td">
									<!-- cover -->
									<div class=" w-25 text-center">
										<img src="${result.cover }" class="bestseller-cover">
									</div>
									
									<!-- info -->
									<div class="bestseller-info w-50 p-4">
										<div class="bestseller-title ">
											<a href="/store/book/detail/view?isbn=${result.isbn }">
											<c:choose>
												<c:when test="${fn:length(result.title) > 25 }">
													${fn:substring(result.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${result.title }
												</c:otherwise>
											</c:choose>
											</a>
										</div>
										
										<hr>
										
										<div class="book-detail-text">
											<c:choose>
											<c:when test="${fn:length(result.author) > 20 }">
											${fn:substring(result.author, 0, 20) } ...  <br>  ${result.publisher }  <br>  ${result.pubDate }
											</c:when>
											<c:otherwise>
												${result.author }  <br>  ${result.publisher }  <br>  ${result.pubDate }
											</c:otherwise>
											</c:choose>
										</div>
										
										<hr>
										
										<div>
											<fmt:formatNumber value="${result.priceSales }" pattern="#,### 원"/>
										</div>
									</div>
									<div class="my-5">
										<div class="my-2"><button class="btn w-btn-outline w-btn-color-outline">cart</button></div>
										<div><button class="btn w-btn-outline w-btn-color-outline buy-btn" data-toggle="modal" data-target="#buyModalBtn" data-isbn=${result.isbn }>buy</button></div>
									</div>
								</td>
							</tr>
						</c:forEach>
							
						</table>
						
					</div> <!-- table -->
				</div>
			</div> <!-- 검색 결과 -->
			
		</div>
		
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
		
		// 검색 조건
		
		$(".sort").on("click", function(e) {

			e.preventDefault();
			
			let query = $(".wrap").data("query");
			let id = $(this).attr("id");
			
			if (id.includes("Category")) {
				location.href = "/store/search/view?query=" + query + "&target=" + id;
			} else {
				location.href = "/store/search/view?query=" + query + "&sort=" + id;
			}
			
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
	
	function unload() {
		widow.onbeforeunload = function(e) {
			return 0;
		}
	}
	
	</script>
</body>
</html>