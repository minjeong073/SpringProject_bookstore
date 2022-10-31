<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- jstl core library -->    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl fmt library -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결제 페이지</title>

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
		<div class=" container d-flex flex-column justify-content-center">
			<div class="my-4"></div>
			
			<div class="my-3">
				<div class="mx-3 my-5 d-flex flex-column align-items-center">
					<div class="outer-form-text w-25 text-center mb-5">
						<h2 class="main-font-text my-2">주문 결제</h2>
					</div>
					
					<!-- 책 정보 -->
					<div class="border d-flex w-75 my-4 px-5 bookDetail-div" data-isbn=${isbn }>
						<div class=" m-4 p-2"><img src="${bookDetail.cover }" width="160px"></div>
						<div class="book-detail-text mt-5 ml-3">
							<div><h2>${bookDetail.title }</h2></div>
							<div>${bookDetail.author } ${bookDetail.publisher }</div>
							<div id="priceSales" data-price="${bookDetail.priceSales }"><fmt:formatNumber value="${bookDetail.priceSales }" pattern="#,### 원"/></div>
							<div class="mt-2" id="count" data-count="${count }">수량 : ${count }</div>
						</div>
					</div>
					
					<!-- 주문자 정보 -->
					<div class="border my-4 w-75">
						<div class="m-4"><h3>주문자 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th class=" w-25">주문자명</th>
									<td><input type="text" class="form-control w-50" placeholder="주문자 이름" id="nonMemberName"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" class="form-control w-50" placeholder="전화번호" id="nonMemberPhoneNumber"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td class="d-flex">
									<input type="text" class="form-control w-50" placeholder="이메일" id="emailId">
									<span class="m-2">@</span>
									<input type="text" class="form-control mr-1 w-50" id="emailDomain">
									<select class="form-select form-control w-50" id="selectEmailDomain">
										<option value="">--선택--</option>
										<option value="aroundbook.com">aroundbook.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option>직접입력</option>
									</select>
									<input type="text" id="nonMemberEmail" class="d-none">
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" class="form-control w-50" placeholder="비밀번호" id="nonMemberPassword"></td>
								</tr>
								<tr>
									<th>비밀번호 확인</th>
									<td><input type="password" class="form-control w-50" placeholder="비밀번호 확인" id="passwordConfirm"></td>
								</tr>
								<tr>
									<th></th>
									<td>
										<span class="small text-warning d-none" id="wrongPwText">비밀번호가 일치하지 않습니다</span>
										<span class="small text-primary d-none" id="correctPwText">비밀번호가 일치합니다</span>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<!-- 배송 정보 -->
					<div class="border my-4 w-75">
						<div class="m-4"><h3>배송 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
								<tr>
									<th class=" w-25">이름</th>
									<td><input type="text" class="form-control w-50" placeholder="이름" id="shippingName"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" class="form-control w-50" placeholder="전화번호" id="shippingPhoneNumber"></td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td class="d-flex"><input type="text" class="form-control w-25 mr-2" placeholder="우편번호" id="shippingAddress1"> <button class="btn btn-sm w-btn-outline w-btn-color-outline" onclick="address_DaumPostcode()">우편번호 찾기</button></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" class="form-control w-50" placeholder="주소" id="shippingAddress2"></td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><input type="text" class="form-control w-50" placeholder="상세주소" id="shippingAddress3"></td>
								</tr>
								
							</table>
						</div>
					</div>
					
					<!-- 결제 정보 -->
					<div class="border my-4 w-75">
						<div class="m-4"><h3>결제 정보</h3></div>
						
						<div class="d-flex justify-content-center">
							<table class="table m-3 w-75 text-center">
							<c:set var="totalPrice" value="${bookDetail.priceSales * count }"/>
								<tr>
									<th>총 주문상품 금액</th>
									<td id="totalPrice"><fmt:formatNumber value="${totalPrice }" pattern="#,### 원" /></td>
								<tr>
								<tr>
									<th>배송비</th>
									<td id="deliveryCost">
										
										<c:choose>
											<c:when test="${totalPrice lt 30000 }">
												3,000 원
											</c:when>
											<c:otherwise>
												0 원
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</table>
						</div>
					</div>			
					
					<div class="my-4">					
						<button class="btn btn-lg w-btn-outline w-btn-color-outline mx-3" id="buyBtn">구매하기</button>
						<a href="#" class="btn btn-lg w-btn-outline w-btn-color-outline mx-3">장바구니 가기</a>
					</div>		
				</div>
			</div>
			
		</div> <!-- body -->
	</div> <!-- wrap -->
	
	<script>
		
		$(document).ready(function() {
			
			// 비밀번호 확인
			
			$("#passwordConfirm").on("input", function() {
				
				let password = $("#nonMemberPassword").val();
				let passwordConfirm = $("#passwordConfirm").val();
				
				if (password != passwordConfirm) {
					$("#correctPwText").addClass("d-none");
					$("#wrongPwText").removeClass("d-none");
				} else {
					$("#correctPwText").removeClass("d-none");
					$("#wrongPwText").addClass("d-none");
				}
				
			});
			
			// 이메일 도메인 입력
			
			var email_regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			$("#selectEmailDomain").change(function() {
				
				if ($(this).val() == "직접입력") {
					$("#emailDomain").val("");
					$("#emailDomain").focus();
				} else {
					$("#emailDomain").val($(this).val());
				}
				
			});
			
			// 구매하기
			
			$("#buyBtn").on("click", function() {
				
				let isbn = $(".bookDetail-div").data("isbn");
				let count = $("#count").data("count");
				let price = $("#priceSales").data("price");
				
				// 주문자 정보
				
				let nonMemberName = $("#nonMemberName").val();
				let nonMemberPhoneNumber = $("#nonMemberPhoneNumber").val();
				let emailId = $("#emailId").val();
				let emailDomain = $("#emailDomain").val();
				let nonMemberEmail = emailId + "@" + emailDomain;
				let nonMemberPassword = $("#nonMemberPassword").val();
				let passwordConfirm = $("#passwordConfirm").val();
				
				// 배송 정보
				let shippingName = $("#shippingName").val();
				let shippingPhoneNumber = $("#shippingPhoneNumber").val();
				let shippingAddress1 = $("#shippingAddress1").val();
				let shippingAddress2 = $("#shippingAddress2").val();
				let shippingAddress3 = $("#shippingAddress3").val();
				
				// validation
				
				if (nonMemberName == "") {
					alert("주문자 이름을 입력하세요");
					return ;
				}
				
				if (nonMemberPhoneNumber == "") {
					alert("주문자 전화번호를 입력하세요");
					return ;
				}
				
				if (emailId == "") {
					alert("이메일을 입력하세요");
					return ;
				}
				
				if (emailDomain == "") {
					alert("도메인을 입력하세요");
					return ;
				}
				
				if (!email_regEx.test(nonMemberEmail)) {
					alert("이메일을 형식에 맞게 입력하세요");
					return ;
				}
				
				if (nonMemberPassword == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if (passwordConfirm == "") {
					alert("비밀번호 확인을 입력하세요");
					return ;
				}
				
				if (!$("#wrongPwText").hasClass("d-none")) {
					alert("비밀번호가 일치하지 않습니다");
					return ;
				}
				
				
				if (shippingName == "") {
					alert("받는사람 이름을 입력하세요");
					$("#shippingName").focus();
					return ;
				}
				
				if (shippingPhoneNumber == "") {
					alert("받는사람 전화번호를 입력하세요");
					return ;
				}
				
				if (shippingAddress1 == "") {
					alert("우편번호를 입력하세요");
					return ;
				}
				
				if (shippingAddress2 == "") {
					alert("주소를 입력하세요");
					return ;
				}
				
				if (shippingAddress3 == "") {
					alert("상세 주소를 입력하세요");
					return ;
				}
				
				
				// 객체 저장
				
				let bookDetail = [];
				
				bookDetail.push(isbn);
				bookDetail.push(count);
				bookDetail.push(price);
				
				let nonMemberList = [];
				
				nonMemberList.push(nonMemberName);
				nonMemberList.push(nonMemberPhoneNumber);
				nonMemberList.push(nonMemberEmail);
				nonMemberList.push(nonMemberPassword);
				
				let shippingList = [];
				
				$("input[id^='shipping']").each(function() {
					shippingList.push($(this).val());
				});
				
				// location.href = "/store/order/result/view?bookDetail=" + bookDetail + "&nonMemberList=" + nonMemberList + "&shippingList=" + shippingList; 
				
				$.ajax({
					type:"post"
					, url:"/store/order"
					, data:{"bookDetail":bookDetail, "nonMemberList":nonMemberList, "shippingList":shippingList}
					, traditional:true
					, success:function(data) {
						if (data.result == "success") {
							location.href = "/store/order/result/view";
						} else {
							alert("구매하기 실패");
						}
					}
					, error:function() {
						alert("구매하기 에러");
					}
				});
				
			});	
		});
		
	</script>
	
	<!-- 도로명주소 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
		function address_DaumPostcode() {
			
			new daum.Postcode({
		        oncomplete: function(data) {
					
		        	var address = "";
		        	var extraAddress = "";
		        	
		        	// 주소 타입
		        	if (data.userSelectedType === 'R') {
		        		address = data.roadAddress;
		        	} else {
		        		address = data.jibunAddress;
		        	}
		        	
		        	$("#shippingAddress1").val(data.zonecode);
		        	$("#shippingAddress2").val(address);
		        	$("#shippingAddress3").focus();
		        }
		    }).open();
		}
	</script>
	
</body>
</html>