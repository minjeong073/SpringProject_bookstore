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
<title>국내 도서</title>

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
		<div class="bg-info container d-flex flex-column justify-content-center">
			
			<!-- 베스트 셀러 순 -->
			<div>
				<div class="m-3 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center">
						<h2 class="main-font-text my-2"><b>베스트 셀러</b></h2>
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
									</div>
								</td>
							</c:forEach>
							</tr>
						
						</table>
						
					</div>
				</div>
			</div> <!-- 베스트 셀러 -->
		
			<!-- 신간 순 -->
			<div>
			</div> <!-- 신간 -->
			
			
		</div><!-- body -->
	</div><!-- wrap -->

</body>
</html>