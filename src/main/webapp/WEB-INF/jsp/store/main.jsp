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
<title>메인 페이지</title>

<!-- bootstrap jQuery -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/static/css/style.css" type="text/css" >

<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- sweetalert -->
	<link rel="stylesheet" type="text/css" media="screen" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	
</head>
<body onload="reload();">
	
	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class=" container d-flex flex-column justify-content-center">
			<div class="my-4"></div>
			
			<!-- 검색 -->
			<div class="d-flex justify-content-center mt-5 mb-3">
				<div class="d-flex justify-content-center align-items-center m-3 w-50">
				
					<div class="input-group">
						<div class="input-group-prepend">
							<button class="btn w-btn-outline w-btn-color-outline-non" id="searchBtn"><i class="bi bi-search"></i></button>
						</div>
						<input type="text" class="form-control w-btn-outline w-btn-color-outline-non" id="searchInput">
					</div> 
					
				</div>
			</div> <!-- 검색 -->
			
			<!-- 베스트 셀러 -->
			<div class="my-3">
				<div class=" m-3 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center my-3">
						<h2 class="my-2">베스트 셀러</h2>
					</div>
					
					<!-- 조회할 주간 -->
					<div class="w-100 d-flex justify-content-end">
						<div class="d-flex w-25 bestsellerDate">
							<select id="bestsellerYear" class="bestsellerDate form-control col-6 mx-2">
							</select>
							<select id="bestsellerMonth" class="bestsellerDate form-control col-3 mx-2">
							</select>
							<select id="bestsellerWeek" class="bestsellerDate form-control col-3 mx-2">
								<option value="" disabled="disabled">주차</option>
								<option value="1" selected>1</option>
								<c:forEach var="i" begin="2" end="5">
									<option value="${i }">${i }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<!-- table -->
					<div class=" m-4 d-flex justify-content-center align-item-center" id="existingTable">
						<table class="table text-center main-table m-2">
							
							<!-- 1열 -->
							<tr>
							<c:forEach var="bestseller" items="${bestsellerList }" begin="0" end="4">
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
							<c:forEach var="bestseller" items="${bestsellerList }" begin="5">
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
			</div> <!-- 베스트 셀러 -->
			
			
			<!-- 카테고리 -->
			<div class="my-3">
				<div class="mx-3 my-5 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center">
						<h2 class="main-font-text my-2">카테고리</h2>
					</div>
					
					<div class=" m-5">
						<table class="table main-category-table">
							<tr>
							<c:forEach var="category" items="${categoryList }" begin="0" end="5">
								<td><a href="/store/category/view?cid=${category.cid }" class="main-category-text">${category.name }</a></td>
							</c:forEach>
							</tr>
							<tr>
							<c:forEach var="category" items="${categoryList }" begin="6" end="11">
								<td><a href="/store/category/view?cid=${category.cid }" class="main-category-text">${category.name }</a></td>
							</c:forEach>
							</tr>
						</table>
					</div>
				</div>
			</div> <!-- 카테고리 -->
			
			
			<!-- 블로그 베스트 -->
			<div class="my-3">
				<div class="mx-3 my-5 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center">
						<h2 class="main-font-text my-2">블로그 베스트</h2>
					</div>
					
					<div class=" m-5">
						<table class="table text-center main-table">
							<tr>
							<c:forEach var="blogBest" items="${blogBestList }" begin="0" end="4">
							<c:set var="j" value="${j + 1 }"/>
								<td class="border">
									<div class="list-number">${j }</div>
									<hr>
									<div><img src="${blogBest.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
										<a href="/store/book/detail/view?isbn=${blogBest.isbn }">
										<c:choose>
											<c:when test="${fn:length(blogBest.title) > 25 }">
												${fn:substring(blogBest.title, 0, 25) } ...
											</c:when>
											<c:otherwise>
												${blogBest.title }
											</c:otherwise>
										</c:choose>
										</a>
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(blogBest.author) > 20 }">
											${fn:substring(blogBest.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${blogBest.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>
							</tr>
								
							<tr>
							<c:forEach var="blogBest" items="${blogBestList }" begin="5">
							<c:set var="j" value="${j + 1 }"/>
								<td class="border">
									<div class="list-number">${j }</div>
									<hr>
									<div><img src="${blogBest.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
										<a href="/store/book/detail/view?isbn=${blogBest.isbn }">
										<c:choose>
											<c:when test="${fn:length(blogBest.title) > 25 }">
												${fn:substring(blogBest.title, 0, 25) } ...
											</c:when>
											<c:otherwise>
												${blogBest.title }
											</c:otherwise>
										</c:choose>
										</a>
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(blogBest.author) > 20 }">
											${fn:substring(blogBest.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${blogBest.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>	
							</tr>
							
						</table>
						
					</div>
				</div>
			</div> <!-- 블로그 베스트 -->
		
			<!-- 신간 전체 리스트 -->
			<div class="">
				<div class="mx-3 my-5 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center">
						<h2 class="main-font-text my-2">신간 전체</h2>
					</div>
					
					<div class=" m-5">
						<table class="table text-center main-table">
							<tr>
							<c:forEach var="itemNew" items="${itemNewAllList }" begin="0" end="4">
							<c:set var="k" value="${k + 1 }"/>
								<td class="border">
									<div class="list-number">${k }</div>
									<hr>
									<div><img src="${itemNew.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
										<a href="/store/book/detail/view?isbn=${itemNew.isbn }">
										<c:choose>
											<c:when test="${fn:length(itemNew.title) > 25 }">
												${fn:substring(itemNew.title, 0, 25) } ...
											</c:when>
											<c:otherwise>
												${itemNew.title }
											</c:otherwise>
										</c:choose>
										</a>
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(itemNew.author) > 20 }">
											${fn:substring(itemNew.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${itemNew.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>
							</tr>
							
							<tr>
							<c:forEach var="itemNew" items="${itemNewAllList }" begin="5">
							<c:set var="k" value="${k + 1 }"/>
								<td class="border">
									<div class="list-number">${k }</div>
									<hr>
									<div><img src="${itemNew.cover }" class="bestseller-cover"></div>
									<hr>
									<div class="bestseller-title">
										<a href="/store/book/detail/view?isbn=${itemNew.isbn }">
										<c:choose>
											<c:when test="${fn:length(itemNew.title) > 25 }">
												${fn:substring(itemNew.title, 0, 25) } ...
											</c:when>
											<c:otherwise>
												${itemNew.title }
											</c:otherwise>
										</c:choose>
										</a>
										<!-- author -->
										<div class="text-secondary bestseller-author">
											<c:choose>
											<c:when test="${fn:length(itemNew.author) > 20 }">
											${fn:substring(itemNew.author, 0, 20) } ...
											</c:when>
											<c:otherwise>
												${itemNew.author }
											</c:otherwise>
											</c:choose>
										</div>
									</div>
								</td>
							</c:forEach>
							</tr>
							
						</table>
					</div>
				</div>
			</div> <!-- 신간 전체 리스트 -->
			
		</div>
		
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
				
				location.href="/store/main/view?year=" + year 
						+ "&month=" + month + "&week=" + week;
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
		
		// 새로고침 이벤트
		
		function reload() {
			window.onbeforeunload = function(e) {
				location.href="/store/main/view";
			}
		}
		
	</script>
</body>
</html>