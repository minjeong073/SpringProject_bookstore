<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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