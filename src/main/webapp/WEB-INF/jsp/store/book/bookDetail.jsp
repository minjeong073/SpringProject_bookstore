<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 정보</title>

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
		<div class="bg-info container d-flex flex-column justify-content-center mb-5 p-3">
		
			<!-- 책 정보 -->
			<div class="bg-primary d-flex justify-content-center m-4">
				<div class="bg-danger">
					<img src="" alt="book">
				</div>
				
				<div class="bg-secondary">
					<div class="bg-warning">
						<div>title</div>
						<div>author</div>
						<div>score</div>
					</div>
					
					<div class="bg-success">
						<div>price</div>	
						<div>count</div>
						<div class="d-flex">
							<button class="btn">cart</button>
							<button class="btn">buy</button>
						</div>
					</div>
				</div>
			</div>
			
			<hr>
			
			<!-- 책 소개 -->
			<div class="bg-warning">
				<div class="d-flex justify-content-center">
					<div class="bg-secondary w-25 text-center"><h3>책 소개</h3></div>
				</div>
				
				<div class="bg-success w-100 h-50">
					소개
				</div>
				
			</div>
			
			<!-- 책 리뷰 -->
			<div class="bg-white">
				
				<div class="d-flex justify-content-center">
					<div class="bg-secondary w-25 text-center"><h3>책 리뷰</h3></div>
				</div>
				
				<div class="bg-info">
					
					<div class="bg-success d-flex justify-content-center py-3"><!-- 별점 -->
						<div class="bg-danger mx-1"> <!-- 별점 평균 -->
							<i class="bi bi-star-fill bi-star-fill-avg"></i>
							<div class="text-center">8.5 / 10.0</div>
						</div>
						
						<div class="bg-primary mx-1"> <!-- 별점 차트 -->
							<!-- 5 -->
							<div class="d-flex">
								<div class="d-flex">
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
								</div>
								<div class="text-center bg-warning mx-1"> ## 명</div>
							</div>
							<!-- 4 -->
							<div class="d-flex">
								<div class="d-flex">
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
								</div>
								<div class="text-center bg-warning mx-1"> ## 명</div>
							</div>
							<!-- 3 -->
							<div class="d-flex">
								<div class="d-flex">
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
								</div>
								<div class="text-center bg-warning mx-1"> ## 명</div>
							</div>
							<!-- 2 -->
							<div class="d-flex">
								<div class="d-flex">
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
								</div>
								<div class="text-center bg-warning mx-1"> ## 명</div>
							</div>
							<!-- 1 -->
							<div class="d-flex">
								<div class="d-flex">
									<i class="bi bi-star-fill bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
									<i class="bi bi-star bi-star-fill-list"></i>
								</div>
								<div class="text-center bg-warning mx-1"> ## 명</div>
							</div>
						</div><!-- 별점 차트 -->
						
					</div><!-- 별점 -->
					
					<div class="d-flex justify-content-center"> <!-- 리뷰 쓰기 -->
						<div class="bg-warning review-div border py-4 mx-3 my-2">
							<div class="d-flex justify-content-around mb-2">
								<div class="d-flex"> <!-- 별점 -->
									<div class="d-flex">
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
										<i class="bi bi-star bi-star-fill-list"></i>
									</div>
									<div class="mx-2"><input type="text" class="form-control"></div>
								</div>
								<div><button class="btn">리뷰 쓰기</button></div>
							</div>
							
							<div class="d-flex justify-content-center">
								<textarea rows="5" placeholder="review" class="form-control review-textarea"></textarea>
							</div>
						</div>
					</div>
					
					<hr>
					
					<div> <!-- 리뷰 리스트 -->
						<div>
						review 1
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>

</body>
</html>