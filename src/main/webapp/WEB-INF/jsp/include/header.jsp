<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<!-- 헤더 -->
		<div class="main-header d-flex justify-content-center">
			
			<div>
				<!-- logo, user nav -->
				
				<header class=" d-flex justify-content-between">
				
					<div class="header-logo mx-3 ">
						<a href="/store/main/view"><img src="/static/img/aroundbookLOGO.png" width="150px"></a>
					</div>
					<div class="header-user-nav mx-3 ">
						<nav>
						<c:choose>
							<c:when test="${not empty userId }">
								<!-- 로그인 상태 -->
								<ul class="nav nav-fill d-flex justify-content-center">
									<li class="nav-item">${userLoginId }</li>
									<li class="nav-item"><a href="/user/signout">로그아웃</a></li>
									<%-- TODO : 마이페이지 --%><li class="nav-item"><a href="/user/mypage/view?id=${userId }">마이페이지</a></li>
									<%-- TODO : 장바구니 --%><li class="nav-item"><a href="/user/cart/view?id=${userId }">장바구니</a></li>
								</ul>
							</c:when>
							
							<c:otherwise>
								<!-- 비로그인 상태 -->
								<ul class="nav nav-fill d-flex justify-content-center">
									<li class="nav-item"><a href="/user/signin/view">로그인</a></li>
									<li class="nav-item"><a href="/user/signup/view">회원가입</a></li>
									<%-- TODO : 장바구니 (비회원) --%><li class="nav-item"><a href="/user/cart/view?">장바구니</a></li>
								</ul>
							</c:otherwise>
							
						</c:choose>
						</nav>
					</div>
				</header>
				
				<!-- main nav -->
				
				<div class="header-main-nav pb-3 pt-2">
					<nav>
						<ul class="nav nav-fill d-flex justify-content-center">
							<li class="nav-item"><a href="#">국내도서</a></li>
							<li class="nav-item"><a href="#">해외도서</a></li>
							<li class="nav-item"><a href="#">베스트셀러</a></li>
							<li class="nav-item"><a href="#">카테고리</a></li>
						</ul>
					</nav>
				</div>
			
			</div>
		</div>