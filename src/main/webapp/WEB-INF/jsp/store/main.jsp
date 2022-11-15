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
<body>
	
	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class=" container d-flex flex-column justify-content-center">
			<div class="my-4"></div>
			
			<!-- 검색 -->
			<div class="d-flex justify-content-center mt-5 mb-3">
				<div class="d-flex justify-content-center align-items-center m-3 w-50">
				
					<div class="input-group">
						<input type="text" class="form-control w-50 w-btn-outline w-btn-color-outline-non" placeholder="제목 또는 저자명" id="searchInput">
						<div class="input-group-append">
							<span class="btn w-btn-outline w-btn-color-outline-non" id="searchBtn"><i class="bi bi-search"></i></span>
						</div>
					</div> 
					
				</div>
			</div> <!-- 검색 -->
			
			
			<!-- 베스트 셀러 -->
			<div class="my-3">
				<div class=" m-3 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center my-3">
						<h2 class="my-2">베스트 셀러</h2>
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
					<div class="outer-form-text w-25 text-center mb-5">
						<h2 class="main-font-text my-2">카테고리</h2>
					</div>
					
					<div class="mt-4 pt-4">
						<h2>국내 도서</h2>
					</div>
					<div class=" m-5">
						<table class="table main-category-table">
							<tr>
							<c:forEach var="category" items="${categoryList }" begin="0" end="5">
							<c:if test="${category.mall eq 'book' }">
								<td><a href="/store/category/view?mainCid=book&cid=${category.cid }" class="main-category-text">${category.name }</a></td>
							</c:if>
							</c:forEach>
							</tr>
							<tr>
							<c:forEach var="category" items="${categoryList }" begin="6" end="11">
							<c:if test="${category.mall eq 'book' }">
								<td><a href="/store/category/view?mainCid=book&cid=${category.cid }" class="main-category-text">${category.name }</a></td>
							</c:if>
							</c:forEach>
							</tr>
						</table>
					</div>
					
					<div class="mt-4">
						<h2>외국 도서</h2>
					</div>
					<div class=" m-5">
						<table class="table main-category-table">
							<tr>
							<c:forEach var="category" items="${categoryList }" begin="12" end="17">
							<c:if test="${category.mall eq 'foreign' }">
								<td><a href="/store/category/view?mainCid=foreign&cid=${category.cid }" class="main-category-text">${category.name }</a></td>
							</c:if>
							</c:forEach>
							</tr>
							<tr>
							<c:forEach var="category" items="${categoryList }" begin="18" end="23">
							<c:if test="${category.mall eq 'foreign' }">
								<td><a href="/store/category/view?mainCid=foreign&cid=${category.cid }" class="main-category-text">${category.name }</a></td>
							</c:if>
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
		
			
			// 검색
			
			$("#searchBtn").on("click", function() {
				
				let query = $("#searchInput").val();
				
				location.href = "/store/search/view?query=" + query;
			});
			
			$("#searchInput").keyup(function(e) {
				
				if (e.keyCode == '13') {
					$("#searchBtn").trigger("click");
				}
			})
			
			
		});
		
		if (document.readyState == 'reload') {
			location.href = "/store/main/view";
		}
		
	</script>
</body>
</html>