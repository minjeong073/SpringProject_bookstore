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
<title>
	<c:choose>
		<c:when test="${mainCid eq 'book' and empty cid }">
			국내도서
		</c:when>
		<c:when test="${mainCid eq 'foreign' and empty cid }">
			외국도서
		</c:when>
		<c:otherwise>
			<c:forEach var="category" items="${categoryList }">
				<c:if test="${category.cid eq cid }">
					${category.name }
				</c:if>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</title>

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
		<div class=" d-flex justify-content-center">
		
			<!-- category nav -->
			<div class=" category-nav-div p-5 mt-5">
				<nav>
					<c:forEach var="category" items="${categoryList }">
						<c:if test="${category.mall eq mainCid }">
						<ul class="nav nav-fill">
							<li class="my-2"><a href="/store/category/view?mainCid=${mainCid }&cid=${category.cid }" target="_blank">${category.name }</a></li>
						</ul>
						</c:if>
					</c:forEach>
				</nav>
			</div> 
			<!-- category-nav -->
			
			<div class="my-4 main-book-list-div" data-cid=${cid }>
			
				<div class="my-4 text-center category-name-div">
					<c:forEach var="category" items="${categoryList }">
						<c:if test="${category.cid eq cid }">
							<h2>${category.name } 카테고리</h2>
						</c:if>
					</c:forEach>
				</div>
				
				<!-- 베스트 셀러 순 -->
				<div class="my-4" id="bestsellerListDiv">
					<div class="m-3 d-flex flex-column align-items-center">
						<div class="outer-form-text w-25 text-center my-3">
							<h2 class="my-2"><a href="/store/nav/main/bestseller/view">베스트 셀러</a></h2>
						</div>
						
						<div class=" m-4 d-flex justify-content-center align-item-center">
							<table class="table text-center main-table m-2">
							
								<!-- 1열 -->
								<tr>
								<c:forEach var="bestseller" items="${bestsellerList }" begin="0" end="4">
									<td class="border">
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
									<td class="border">
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
						</div>
					</div>
				</div> <!-- 베스트 셀러 -->
			
				<!-- 주목할 만한 신간 -->
				<div class="" id="newSpecialListDiv">
					<div class=" m-3 d-flex flex-column align-items-center">
						<div class="outer-form-text w-25 text-center my-3">
							<h2 class="my-2">주목할 만한 신간</h2>
						</div>
						
						<div class=" m-4 d-flex justify-content-center align-item-center">
							<table class="table text-center main-table m-2">
							
								<!-- 1열 -->
								<tr>
								<c:forEach var="item" items="${newSpecialList}" begin="0" end="4">
									<td class="border">
										<div><img src="${item.cover }" class="bestseller-cover"></div>
										<hr>
										<div class="bestseller-title">
											<a href="/store/book/detail/view?isbn=${item.isbn }">
											<c:choose>
												<c:when test="${fn:length(item.title) > 25 }">
													${fn:substring(item.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${item.title }
												</c:otherwise>
											</c:choose>
											</a>
											<!-- author -->
											<div class="text-secondary bestseller-author">
												<c:choose>
												<c:when test="${fn:length(item.author) > 20 }">
												${fn:substring(item.author, 0, 20) } ...
												</c:when>
												<c:otherwise>
													${item.author }
												</c:otherwise>
												</c:choose>
											</div>
										</div>
									</td>
								</c:forEach>
								</tr>
								
								<!-- 2열 -->
								<tr>
								<c:forEach var="item" items="${newSpecialList }" begin="5">
									<td class="border">
										<div><img src="${item.cover }" class="bestseller-cover"></div>
										<hr>
										<div class="bestseller-title">
											<a href="/store/book/detail/view?isbn=${item.isbn }">
											<c:choose>
												<c:when test="${fn:length(item.title) > 25 }">
													${fn:substring(item.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${item.title }
												</c:otherwise>
											</c:choose>
											</a>
											<!-- author -->
											<div class="text-secondary bestseller-author">
												<c:choose>
												<c:when test="${fn:length(item.author) > 20 }">
												${fn:substring(item.author, 0, 20) } ...
												</c:when>
												<c:otherwise>
													${item.author }
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
				</div> <!-- 주목할 만한 신간 -->
				
				<!-- 편집자 추천 리스트 -->
				<div class="my-3" id="editorChoiceListDiv">
					<div class=" m-3 d-flex flex-column align-items-center">
						<div class="outer-form-text w-25 text-center my-3">
							<h2 class="my-2">편집자 추천 리스트</h2>
						</div>
						
						<div class=" m-4 d-flex justify-content-center align-item-center">
							<table class="table text-center main-table m-2">
								<!-- 1열 -->
								<tr>
								<c:forEach var="item" items="${editorChoiceList}" begin="0" end="4">
									<td class="border">
										<div><img src="${item.cover }" class="bestseller-cover"></div>
										<hr>
										<div class="bestseller-title">
											<a href="/store/book/detail/view?isbn=${item.isbn }">
											<c:choose>
												<c:when test="${fn:length(item.title) > 25 }">
													${fn:substring(item.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${item.title }
												</c:otherwise>
											</c:choose>
											</a>
											<!-- author -->
											<div class="text-secondary bestseller-author">
												<c:choose>
												<c:when test="${fn:length(item.author) > 20 }">
												${fn:substring(item.author, 0, 20) } ...
												</c:when>
												<c:otherwise>
													${item.author }
												</c:otherwise>
												</c:choose>
											</div>
										</div>
									</td>
								</c:forEach>
								</tr>
								
								<!-- 2열 -->
								<tr>
								<c:forEach var="item" items="${editorChoiceList }" begin="5">
									<td class="border">
										<div><img src="${item.cover }" class="bestseller-cover"></div>
										<hr>
										<div class="bestseller-title">
											<a href="/store/book/detail/view?isbn=${item.isbn }">
											<c:choose>
												<c:when test="${fn:length(item.title) > 25 }">
													${fn:substring(item.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${item.title }
												</c:otherwise>
											</c:choose>
											</a>
											<!-- author -->
											<div class="text-secondary bestseller-author">
												<c:choose>
												<c:when test="${fn:length(item.author) > 20 }">
												${fn:substring(item.author, 0, 20) } ...
												</c:when>
												<c:otherwise>
													${item.author }
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
				</div> <!-- 편집자 추천 리스트 -->
				
				<!-- 신간 전체 리스트 -->
				<div class="my-3" id="newAllListDiv">
					<div class=" m-3 d-flex flex-column align-items-center">
						<div class="outer-form-text w-25 text-center my-3">
							<h2 class="my-2">신간 전체 리스트</h2>
						</div>
						
						<div class=" m-4 d-flex justify-content-center align-item-center">
							<table class="table text-center main-table m-2">
								<!-- 1열 -->
								<tr>
								<c:forEach var="item" items="${newAllList}" begin="0" end="4">
									<td class="border">
										<div><img src="${item.cover }" class="bestseller-cover"></div>
										<hr>
										<div class="bestseller-title">
											<a href="/store/book/detail/view?isbn=${item.isbn }">
											<c:choose>
												<c:when test="${fn:length(item.title) > 25 }">
													${fn:substring(item.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${item.title }
												</c:otherwise>
											</c:choose>
											</a>
											<!-- author -->
											<div class="text-secondary bestseller-author">
												<c:choose>
												<c:when test="${fn:length(item.author) > 20 }">
												${fn:substring(item.author, 0, 20) } ...
												</c:when>
												<c:otherwise>
													${item.author }
												</c:otherwise>
												</c:choose>
											</div>
										</div>
									</td>
								</c:forEach>
								</tr>
								
								<!-- 2열 -->
								<tr>
								<c:forEach var="item" items="${newAllList }" begin="5">
									<td class="border">
										<div><img src="${item.cover }" class="bestseller-cover"></div>
										<hr>
										<div class="bestseller-title">
											<a href="/store/book/detail/view?isbn=${item.isbn }">
											<c:choose>
												<c:when test="${fn:length(item.title) > 25 }">
													${fn:substring(item.title, 0, 25) } ...
												</c:when>
												<c:otherwise>
													${item.title }
												</c:otherwise>
											</c:choose>
											</a>
											<!-- author -->
											<div class="text-secondary bestseller-author">
												<c:choose>
												<c:when test="${fn:length(item.author) > 20 }">
												${fn:substring(item.author, 0, 20) } ...
												</c:when>
												<c:otherwise>
													${item.author }
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
			
			<div class="category-nav-div "></div>
			
		</div><!-- body -->
		
	</div><!-- wrap -->

	<script>
	
		$(document).ready(function() {
		
			var categoryCid = $(".main-book-list-div").data("cid");
			
			if (categoryCid == "") {
				$("#editorChoiceListDiv").addClass("d-none");
				$("#newAllListDiv").addClass("d-none");
			}
			
		});
		
	</script>
</body>
</html>