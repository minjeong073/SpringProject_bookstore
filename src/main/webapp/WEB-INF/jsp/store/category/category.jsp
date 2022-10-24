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
		<c:when test="${CID eq 'book' }">
			국내도서
		</c:when>
		<c:when test="${CID eq 'foreign' }">
			외국도서
		</c:when>
	</c:choose>
</title>

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
		<div class="container d-flex flex-column justify-content-center">
		
			<!-- category nav -->
			<div>
				<nav>
					<ul>
						<li><a></a></li>
					</ul>
				</nav>	
			</div> <!-- category-nav -->
			
			
			<div>
			
				<div class="my-5"></div>
				
				<!-- 베스트 셀러 순 -->
				<div>
					<div class="m-3 d-flex flex-column align-items-center">
						<div class="outer-form-text w-25 text-center my-3">
							<h2 class="my-2">베스트 셀러</h2>
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
												<c:when test="${fn:length(bestseller.title) > 30 }">
													${fn:substring(bestseller.title, 0, 30) } ...
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
												<c:when test="${fn:length(bestseller.title) > 30 }">
													${fn:substring(bestseller.title, 0, 30) } ...
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
			
				<hr>
				
				<!-- 신간 순 -->
				<div>
					<div class=" m-3 d-flex flex-column align-items-center">
						<div class="outer-form-text w-25 text-center my-3">
							<h2 class=" my-2">주목할 만한 신간</h2>
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
												<c:when test="${fn:length(item.title) > 30 }">
													${fn:substring(item.title, 0, 30) } ...
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
												<c:when test="${fn:length(item.title) > 30 }">
													${fn:substring(item.title, 0, 30) } ...
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
				</div> <!-- 신간 -->
				
			</div>
			
		</div><!-- body -->
	</div><!-- wrap -->

</body>
</html>