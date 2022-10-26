<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl function library -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<select id="bestsellerYear" class="bestsellerDate form-control col-6 mx-2">
								<c:forEach var="i" begin="2015" end="2022">
									<c:choose>
										<c:when test="${i eq 2022 }">
											<option value="${i }" selected>${i }</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<select id="bestsellerMonth" class="bestsellerDate form-control col-3 mx-2">
								<c:forEach var="i" begin="1" end="12">
									<c:choose>
										<c:when test="${i eq 10 }">
											<option value="${i }" selected>${i }</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
							<select id="bestsellerWeek" class="bestsellerDate form-control col-3 mx-2">
								<option value="" disabled="disabled">주차</option>
								<c:forEach var="i" begin="1" end="5">
									<c:choose>
										<c:when test="${i eq 4 }">
											<option value="${i }" selected>${i }</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
					
			<!-- 국내 도서 -->
			<div class="my-3">
				<div class=" m-3 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center my-3">
						<h2 class="my-2">국내 도서</h2>
					</div>
					
					<div class="bg-info">
						<span class="lookup-div d-none">
							<h5>${year } 년 ${month } 월 ${week } 일 조회</h5>
						</span>
					</div>
					<!-- table -->
					<div class=" m-4 d-flex justify-content-center align-item-center" id="existingTable">
						<table class="table text-center main-table m-2">
							
							<!-- 1열 -->
							<tr>
							<c:forEach var="bestseller" items="${bookBestsellerList }" begin="0" end="4">
								<c:set var="i" value="${i + 1 }"/>
								<td class="border">
									<div class="list-number">${i }</div>
									<hr>
									<div><img src="${bestseller.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
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
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(bestseller.author) > 20 }">
											${fn:substring(bestseller.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${bestseller.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>
							</tr>
							
							<!-- 2열 -->
							<tr>
							<c:forEach var="bestseller" items="${bookBestsellerList }" begin="5">
								<c:set var="i" value="${i + 1 }"/>
								<td class="border">
									<div class="list-number">${i }</div>
									<hr>
									<div><img src="${bestseller.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
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
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(bestseller.author) > 20 }">
											${fn:substring(bestseller.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${bestseller.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>
							</tr>
						
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
					
					<!-- table -->
					<div class=" m-4 d-flex justify-content-center align-item-center" id="existingTable">
						<table class="table text-center main-table m-2">
							
							<!-- 1열 -->
							<tr>
							<c:forEach var="bestseller" items="${foreignBestsellerList }" begin="0" end="4">
								<c:set var="i" value="${i + 1 }"/>
								<td class="border">
									<div class="list-number">${i }</div>
									<hr>
									<div><img src="${bestseller.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
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
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(bestseller.author) > 20 }">
											${fn:substring(bestseller.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${bestseller.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>
							</tr>
							
							<!-- 2열 -->
							<tr>
							<c:forEach var="bestseller" items="${foreignBestsellerList }" begin="5">
								<c:set var="i" value="${i + 1 }"/>
								<td class="border">
									<div class="list-number">${i }</div>
									<hr>
									<div><img src="${bestseller.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
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
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(bestseller.author) > 20 }">
											${fn:substring(bestseller.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${bestseller.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>
							</tr>
						
						</table>
						
					</div> <!-- table -->
				</div>
			</div> <!-- 해외 도서 -->
			
			
		</div> <!-- body -->
	</div> <!-- wrap -->
	
	<script>
	
		$(document).ready(function() {
		
			// 베스트셀러 조회
			$(".bestsellerDate select").on("change", function() {
				
				let year = $("#bestsellerYear").val();
				let month = $("#bestsellerMonth").val();
				let week = $("#bestsellerWeek").val();
				
				location.href="/store/nav/main/bestseller/view?year=" + year 
				+ "&month=" + month + "&week=" + week;
				
			});
			
		});
		
	</script>
</body>
</html>