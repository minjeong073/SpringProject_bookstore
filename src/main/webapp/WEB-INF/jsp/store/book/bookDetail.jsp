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
		<div class=" container d-flex flex-column justify-content-center mb-5 p-3">
		
			<!-- 책 정보 -->
			<div class=" d-flex justify-content-center align-items-center m-4">
				<div class=" d-flex justify-content-center">
					<div class="mr-5">
						<img src="${bookDetail.cover }" alt="book" class="book-cover">
					</div>
					
					<div class=" w-75 my-3">
						<div class="">
							<div><h2>${bookDetail.title }</h2></div>
							<div class="d-flex">
								<div class=" author-div"><h4>저자 : </h4></div> 
								<div class=""><h4>${bookDetail.author }</h4></div>
							</div>
							<div><h4>출판사 : ${bookDetail.publisher }</h4></div>
							<div><h4>평점 : ${subInfo.ratingInfo.ratingScore }</h4></div>
						</div>
						
						<div class="">
							<div class="my-2"><h4>금액 : ${bookDetail.priceSales }</h4></div>	
							<div class="d-flex my-2">
								<h4>수량 : </h4>
								<div class="w-25 pl-2 pr-4"><input type="text" class="form-control"></div>
								<div class="mx-1"><button class="btn">-</button></div>
								<div class="mx-1"><button class="btn">+</button></div>
							</div>
							<div class="d-flex">
								<button class="btn mx-3 w-btn-outline w-btn-color-outline">장바구니 담기</button>
								<button class="btn w-btn-outline w-btn-color-outline">구매하기</button>
							</div>
						</div>
					</div>
				</div>
				
			</div>
			
			<hr>
			
			<!-- 책 소개 -->
			<div class="">
				<div class="d-flex justify-content-center">
					<div class="w-25 text-center outer-form-text my-2"><h3>책 소개</h3></div>
				</div>
				<div class="d-flex">
					<div class="w-25"></div>
					<div class=" w-100 h-50 py-3 ">
						<h5>출간일 : ${bookDetail.pubDate }</h5>
						<h5>카테고리 : ${bookDetail.categoryName }</h5>
						<hr>
						<h5 class="book-description">${bookDetail.description }</h5>					
					</div>
					<div class="w-25"></div>
				</div>
			</div>
			
			<hr>
			
			<!-- 책 리뷰 -->
			<div class="bg-white">
				
				<div class="d-flex justify-content-center">
					<div class="w-25 text-center outer-form-text my-2"><h3>책 리뷰</h3></div>
				</div>
				
				<div class="bg-info">
					
					<div class="bg-success d-flex justify-content-center py-3"><!-- 별점 -->
						<div class="bg-danger mx-1"> <!-- 별점 평균 -->
							<i class="bi bi-star-fill bi-star-fill-avg"></i>
							<div class="text-center">${subInfo.ratingInfo.ratingScore } / 10.0</div>
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