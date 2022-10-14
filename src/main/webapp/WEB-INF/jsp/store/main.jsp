<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
	
</head>
<body>
	
	<div class="wrap ">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
		
		<!-- body -->
		<div class="bg-info container d-flex flex-column justify-content-center">
			
			<!-- 검색 -->
			<div class="d-flex justify-content-center">
				<div class="d-flex justify-content-center align-items-center m-3">
				
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="btn w-btn-outline w-btn-color-outline-non "><i class="bi bi-search"></i></span>
						</div>
						<input type="text" class="form-control w-btn-color-outline-non">
					</div> 
					
				</div>
			</div> <!-- 검색 -->
			
			
			<!-- 베스트 셀러 -->
			<div class="bg-warning">
				<div class="m-3">
				
					<h3 class="text-center mt-3">베스트 셀러</h3>	
					
					<div class="bg-primary m-5">
						<table class="table text-center">
						<!-- 1열 -->
							<tr>
								<td class="bg-danger">
									<div>표지1</div>
									<div>제목1</div>
								</td>
								
								<td>
									<div>표지2</div>
									<div>제목2</div>
								</td>
								
								<td>
									<div>표지3</div>
									<div>제목3</div>
								</td>
								
								<td>
									<div>표지4</div>
									<div>제목4</div>
								</td>
								
								<td>
									<div>표지5</div>
									<div>제목5</div>
								</td>
							</tr>
						<!-- 2열 -->
							<tr>
								<td class="bg-danger">
									<div>표지1</div>
									<div>제목1</div>
								</td>
								
								<td>
									<div>표지2</div>
									<div>제목2</div>
								</td>
								
								<td>
									<div>표지3</div>
									<div>제목3</div>
								</td>
								
								<td>
									<div>표지4</div>
									<div>제목4</div>
								</td>
								
								<td class="bg-danger">
									<div>표지5</div>
									<div>제목5</div>
								</td>
							</tr>
						
						</table>
						
					</div>
				</div>
			</div> <!-- 베스트 셀러 -->
			
			
			<!-- 카테고리 -->
			<div class="bg-success">
				<div class="m-3">
					<h3 class="text-center mt-3">카테고리</h3>
					
					<div class="bg-primary m-5">
						<table class="table text-center">
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
							</tr>
							<tr>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
							</tr>
						</table>
					</div>
				</div>
			</div> <!-- 카테고리 -->
			
			
			<!-- 별점 순위 -->
			<div class="bg-primary">
				<div class="m-3">
					<h3 class="text-center mt-3">별점 순위</h3>
					
					<div class="bg-warning m-5">
						<table class="table text-center">
							<tr>
								<td class="bg-danger">
									<div>표지1</div>
									<div>제목1</div>
								</td>
								
								<td>
									<div>표지2</div>
									<div>제목2</div>
								</td>
								
								<td>
									<div>표지3</div>
									<div>제목3</div>
								</td>
								
								<td>
									<div>표지4</div>
									<div>제목4</div>
								</td>
								
								<td>
									<div>표지5</div>
									<div>제목5</div>
								</td>
							</tr>
							<tr>
								<td class="bg-danger">
									<div>표지1</div>
									<div>제목1</div>
								</td>
								
								<td>
									<div>표지2</div>
									<div>제목2</div>
								</td>
								
								<td>
									<div>표지3</div>
									<div>제목3</div>
								</td>
								
								<td>
									<div>표지4</div>
									<div>제목4</div>
								</td>
								
								<td>
									<div>표지5</div>
									<div>제목5</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div> <!-- 별점 순위 -->
		
		</div>
		
	</div>
</body>
</html>