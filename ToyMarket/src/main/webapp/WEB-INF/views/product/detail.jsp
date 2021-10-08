<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>토이마켓 : 내일의 장보기, 토이마켓</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
		<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
		<!-- ajax 날짜 포맷 관련 cdn -->
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
		<link href="../../resources/css/jhw-css.css" rel="stylesheet" type="text/css"></link>
		<style type="text/css">
			#divSize {
				width: 1050px !important;
    			margin: 0 auto !important;
    			padding-top: 25px;
			}
			
			.form-check-input:checked {
				background-color: #198754 !important;
				border-color: #198754 !important;
			}
			
			.page-item.active .page-link {
				color: #fff !important;
				background-color: #5f0080 !important;
    			border-color: #5f0080 !important;
			}
			
			.page-link {
				color: #5f0080 !important;
			}
			
			#basket .btn-outline-success {
				color: #5f0080 !important;
				border-color: #5f0080 !important;
			}
			
			#basket .btn-outline-success:hover {
				color: #fff !important;
				border-color: #5f0080 !important;
				background-color: #5f0080 !important;
			}
			
			#basket .btn-outline-success:active {
				border: none;
			}
			
			#prchsQntty .btn-outline-success {
				color: #5f0080 !important;
				border-color: #5f0080 !important;
			}
			
			#prchsQntty .btn-outline-success:hover {
				color: #fff !important;
				border-color: #5f0080 !important;
				background-color: #5f0080 !important;
			}
			
			#prchsQntty .btn-outline-success:active {
				border-color: #5f0080 !important;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<%@ include file="../common/header.jsp"%>
		</div>
		<div id="divSize">
			<div class="row">
				<div class="col-12">
					<div id="cart-put" class="d-flex justify-content-between">
						<div class="col-5">
							<img alt="상품 대표이미지" src="<c:out value="${product.image}"/>" class="img-thumbnail">
						</div>
						<div class="col-7 ps-5">
							<div class="pt-2 pb-3" id="productName">
								<p class="fs-3"><strong>[<c:out value="${product.brand}"/>] <c:out value="${product.name}"/></strong></p>
								<p class="fs-6"><c:out value="${product.subTitle}"/></p>
							</div>
							<div class="pb-4">
								<strong><span style="color: black; font-size: 20px" class="fs-3">
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price-(product.price * product.discountRate)}"/>원
								</span></strong>
								<span style="color: red;" class="fs-3">
									<fmt:formatNumber type="percent" value="${product.discountRate }" />
								</span>
								<br>
								<span style="text-decoration-line: line-through; color: gray" class="fs-5">
									<fmt:formatNumber value="${product.price}"/>원
								</span> 
							</div>
							<div class="row mb-4 border-top border-bottom" id="productInfo">
								<div class="col-4">
									<p class="py-3">판매단위</p>
									<p class="py-3">중량/용량</p>
									<p class="py-3">배송구분</p>
									<p class="py-3">포장타입</p>
									<p class="py-3">구매수량</p>
								</div>
								<div class="col-8">
									<p class="py-3"><c:out value="${product.sellUnit}"/></p>
									<p class="py-3"><c:out value="${product.weight}"/></p>
									<p class="py-3"><c:out value="${product.morningDeliveryMessage}"/></p>
									<p class="py-3">냉장/종이포장</p>
									<div class="py-3 input-group" id="prchsQntty">
										<input type="hidden" id="productPrice" value="<c:out value="${product.price}"/>">
										<input type="hidden" id="productDiscountPrice" value="<c:out value="${product.price-(product.price * product.discountRate)}"/>">
										<button type="button" class="btn btn-outline-success btn-sm fa fa-minus"  id="decrease"></button>
 										<button type="button" class="btn btn-outline btn-sm" id="number" disabled>1</button>
										<button type="button" class="btn btn-outline-success btn-sm fa fa-plus"  id="increase" ></button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-between pb-5">
						<div class="col-5"></div>
						<div class="col-7">
							<div class="d-flex flex-row-reverse bd-highlight">
								<div class="p-2 bd-highlight">
									<font size="2">총 상품금액 : </font>
									<input type="button" class="btn btn-outline fs-3" id="productSum" readonly>원
								</div>
							</div>
							<div class="d-grid gap-2 ps-5" id="basket">
								<button class="btn btn-outline-success btn-lg" type="button" onClick="goBasket();">장바구니</button>
							</div>
						</div>
					</div>
					<div id="product-view">
						<nav class="navbar sticky-top navbar-light bg-light">
							<div class="container-fluid">
								<a class="navbar-brand" href="#product-detail">상세설명</a>
								<a class="navbar-brand" href="#product-review">상품후기</a>
								<a class="navbar-brand" href="#product-inquiry">상품문의</a>
							</div>
						</nav>
						<div id="product-detail">
						<br/>
						<br/>
						<br/>
						<br/>
						<div id="product-description">
							<img src="//img-cf.kurly.com/shop/data/goodsview/20200428/gv20000093154_1.jpg" class="pb-4">
							
							<p class="text-center fs-4">간편하고 맛있게 먹는 단백질</p>
							<p class="text-center fs-3">[프레드]</p>
							<p class="text-center fs-2">프로틴 케이크</p>
							<hr>
							<p class="fs-6">
								식단 조절 중에도 입안 가득 보드랍게 감싸는 빵 한 조각의 기쁨을 놓칠 순 없죠. 컬리는 밀가루에 대한 부담과 걱정이 없는 프로틴 케이크를 준비했어요. 밀가루 대신 발아현미와 단백질 파우더로 만든 파운드케이크입니다. 풍부한 식이섬유와 낮은 칼로리를 자랑하는 프락토올리고당이 설탕의 자리를 대신했고, 버터는 일절 넣지 않았어요. 재료뿐만 아니라 탄수화물, 단백질, 지방의 균형까지 꼼꼼하게 계산해 설계했기에 더욱 믿음이 가는 제품이지요. 운동 전후에 간식으로 드셔도 좋고, 우유나 요거트를 곁들이면 한 끼 식사로도 부족함 없어요. 총 8가지 맛을 준비했으니 취향에 맞게 골라보세요.
							</p>
							<br/>
							<br/>
							<p class="text-center fs-1">Kurly's Check Point</p>
							<img src="/resources/images/test1.PNG">
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<img src="/resources/images/test2.PNG">
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<img src="/resources/images/test3.PNG">
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<br/>
							<img src="/resources/images/test8.PNG">
							<br/>
							<br/>
							<img src="/resources/images/test9.PNG">
							<br/>
							<br/>
							<br/>
							<img src="/resources/images/test10.PNG">
							<br/>
							<br/>
							<img src="/resources/images/test11.PNG">


						</div>
								
						</div>
						<div id="product-review">
							<br/>
							<br/>
							<br/>
							<br/>
							<div class="d-flex justify-content-between pb-4">
								<div>
									<p class="fs-5">PRODUCT REVIEW</p>
									<font size="2">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</font><br/>
									<font size="2">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</font>
								</div>
								<div class="d-flex align-items-end">
									<select class="form-select form-select-sm" id="sort" aria-label=".form-select-sm example" onchange="refreshReviewList()">
										<option value="최근등록순" ${param.sort eq '최근등록순' ? 'selected' : '' }>최근등록순</option>
										<option value="조회많은순" ${param.sort eq '조회많은순' ? 'selected' : '' }>조회많은순</option>
									</select>
								</div>
							</div>
							<div id="review-table">
								<table class="table table-hover border-top" id="review-table">
									<colgroup>
										<col width="10%">
										<col width="60%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th class="text-center py-3">번호</th>
											<th class="text-center py-3">제목</th>
											<th class="text-center py-3">작성자</th>
											<th class="text-center py-3">작성일</th>
											<th class="text-center py-3">조회</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
								<div class="d-flex justify-content-between">
									<div></div>
									<div id="review-pagenation"></div>
									<c:choose>
										<c:when test="${not empty LOGINED_USER_INFO and checkOrderItemNo != null}">
											<div>	
												<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#modalReview">후기 쓰기</button>
												<!-- Modal -->
												<div class="modal fade" id="modalReview" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
													<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
														<div class="modal-content">
															<form method="post" id="reviewInsert">
																<input type="hidden" name="customerNo" id="customerNo" value="<c:out value='${customer.no}'/>"/>
																<input type="hidden" name="productNo" id="productNo" value="<c:out value='${product.no}'/>"/>
																<div class="modal-header boder-bottom">
																	<h5 class="modal-title fs-3" id="staticBackdropLabel">상품 리뷰하기</h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body boder-bottom">
																	<table class="table table-borderless">
																		<colgroup>
																			<col width="20%">
																			<col width="80%">
																		</colgroup>
																		<tr>
																			<td class="h-100">
																				<img alt="상품 대표이미지" src="<c:out value="${product.image}"/>" class="img-thumbnail" style="width:100px; height:100px;">
																			</td>
																			<td class="d-flex align-items-center">
																				<div class="h-100">
																					<p class="fs-5"><strong>[<c:out value="${product.brand}"/>] <c:out value="${product.name}"/></strong></p>
																					<p class="fs-6"><c:out value="${product.subTitle}"/></p>
																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td class="py-2">
																				<p class="fs-5">제목</p>
																			</td>
																			<td class="py-2">
																				<input type="text" class="form-control" name="title" id="ReviewTitle" placeholder="제목을 입력해주세요"/>
																			</td>
																		</tr>
																		<tr>
																			<td class="py-2">
																				<p class="fs-5">내용</p>
																			</td>
																			<td class="py-2">
																				<textarea class="form-control" name="content" id="ReviewContent" style="height: 300px;" placeholder=""></textarea>
																			</td>
																		</tr>
																	</table>
																</div>
																<div class="modal-footer d-flex justify-content-center">
															    	<button type="button" class="btn btn-outline-secondary btn-lg" data-bs-dismiss="modal">취소</button>
															    	<button type="button" id="insertReview" class="btn btn-outline-success btn-lg">등록</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div></div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							
						</div>
						<div id="product-inquiry">
							<br/>
							<br/>
							<br/>
							<br/>
							<div class="d-flex justify-content-between pb-4">
								<div>
									<p class="fs-5">PRODUCT Q&A</p>
									<font size="2">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</font><br/>
									<font size="2">배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</font>
								</div>
							</div>
							<div>
								<table class="table table-hover border-top" id="inquiry-table">
									<colgroup>
										<col width="55%">
										<col width="15%">
										<col width="15%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th class="text-center py-3">제목</th>
											<th class="text-center py-3">작성자</th>
											<th class="text-center py-3">작성일</th>
											<th class="text-center py-3">답변상태</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
								<div class="d-flex justify-content-between">
									<div></div>
									<div id="inquiry-pagenation"></div>
									<c:choose>
										<c:when test="${empty customer}">
											<div>
												
											</div>
										</c:when>
										
										<c:otherwise>
											<div>
												<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#modalInquiry">문의하기</button>
												<!-- Modal -->
												<div class="modal fade" id="modalInquiry" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
													<div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
														<div class="modal-content p-4">
															<form method="post" id="inquiryInsert">
																<input type="hidden" name="customerNo" id="customerNo" value="<c:out value='${customer.no}'/>"/>
																<input type="hidden" name="productNo" id="productNo" value="<c:out value='${product.no}'/>"/>
																<div class="modal-header border-bottom">
																	<h5 class="modal-title fs-3" id="staticBackdropLabel">상품 문의하기</h5>
																	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																</div>
																<div class="modal-body border-bottom">
																	<table class="table table-borderless">
																		<colgroup>
																			<col width="20%">
																			<col width="80%">
																		</colgroup>
																		<tr>
																			<td class="h-100">
																				<img alt="상품 대표이미지" src="<c:out value="${product.image}"/>" class="img-thumbnail" style="width:100px; height:100px;">
																			</td>
																			<td class="d-flex align-items-center">
																				<div class="h-100">
																					<p class="fs-5"><strong>[<c:out value="${product.brand}"/>] <c:out value="${product.name}"/></strong></p>
																					<p class="fs-6"><c:out value="${product.subTitle}"/></p>
																				</div>
																			</td>
																		</tr>
																		<tr>
																			<td class="py-2">
																				<p class="fs-5">제목</p>
																			</td>
																			<td class="py-2">
																				<input type="text" class="form-control" name="title" id="InquiryTitle" placeholder="제목을 입력해주세요"/>
																			</td>
																		</tr>
																		<tr>
																			<td class="py-2">
																				<p class="fs-5">내용</p>
																			</td>
																			<td class="py-2">
																				<textarea class="form-control" name="content" id="InquiryContent" style="height: 300px;" placeholder=""></textarea>
																			</td>
																		</tr>
																		<tr>
																			<td class="py-2"></td>
																			<td class="py-2">
																				<div>
																				  <input class="form-check-input" type="checkbox" name="secretYN" id="secretYN" aria-label="..."> 비밀글로 문의하기
																				</div>
																			</td>
																		</tr>
																	</table>
																</div>
																<div class="modal-footer d-flex justify-content-center">
																  <button type="button" class="btn btn-outline-secondary btn-lg" data-bs-dismiss="modal">취소</button>
																  <button type="button" id="insertInquiry" class="btn btn-outline-success btn-lg">등록</button>
																</div>
															</form>
														</div>
													</div>
												</div>
												<!-- Modal end -->
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			/* 구매수량 증감식 시작 */
			var number = document.getElementById("number"); // 수량
			var increase = document.getElementById("increase"); // 증가버튼
			var decrease = document.getElementById("decrease"); // 감소버튼
			var productPrice = document.getElementById("productPrice"); // 상품가격
			var productDiscountPrice = document.getElementById("productDiscountPrice"); // 상품할인가격
			var productSum = document.getElementById("productSum"); // 합계
			
			if (productDiscountPrice == null) {
				productSum.value = new Number(productPrice.value).toLocaleString();
			} else {
				productSum.value = new Number(productDiscountPrice.value).toLocaleString();
			}
			
			// 증가버튼을 클릭했을 때
			increase.onclick = () => {
				var current =  parseInt(number.innerText, 10);
				number.innerText = current + 1;
				
				if (productDiscountPrice == null) {
					productSum.value = new Number(number.innerText * productPrice.value).toLocaleString();
				} else {
					productSum.value = new Number(number.innerText * productDiscountPrice.value).toLocaleString();
				}
			};
			
			
			// 감소버튼을 클릭했을 때
			decrease.onclick = () => {
				var current = parseInt(number.innerText, 10);
				
				if (current <= 0) {
					number.innerText = 1;
					current = 1;
				}
				number.innerText = current - 1;
				
				
				if (productDiscountPrice == null) {
					productSum.value = new Number(number.innerText * productPrice.value).toLocaleString();
				} else {
					productSum.value = new Number(number.innerText * productDiscountPrice.value).toLocaleString();
				}
			};
			/* 구매수량 증감식 끝 */
			
			/* 장바구니 보내기 시작*/
			function goBasket() {
				var productNo = ${product.no};
				var amount = document.getElementById("number").innerText;
				var buyPrice = document.getElementById("productPrice").value;
				
				location.href = "/cart/add?productNo=" + productNo + "&amount=" + amount + "&buyPrice=" + buyPrice;
			}
			
			/* 장바구니 보내기 끝 */
			
			/* 가운데 이름 마스킹처리 시작 */
			var maskingName = function(strName) {
				if (strName.length > 2) {
					var originName = strName.split('');
					originName.forEach(function(name, i) {
						if (i === 0 || i === originName.length - 1) return;
						originName[i] = '*'; 
					});
					var joinName = originName.join();
					return joinName.replace(/,/g,'');
				} else {
					var pattern = /.$/; // 정규식
					return strName.replace(pattern, '*');
				}
			}
			/* 가운데 이름 마스킹처리 끝 */
			
			/* 리뷰게시판 sort 시작 */
			function refreshReviewList() {
				getReviewList(1)
			}
			/* 리뷰게시판 sort 끝 */
			
			/* 리뷰게시판 ajax 시작 */
			getReviewList(1);
			
			function getReviewList(pageNo1) {				
				var sort = document.getElementById("sort").value;
				var tbodyEl = document.querySelector("#review-table tbody");
				tbodyEl.innerHTML = "";
				var divEl = document.querySelector("#review-pagenation");
				divEl.innerHTML = "";
				
				// XMLHttpRequest 객체 생성
				var xhr = new XMLHttpRequest();
				
				// XMLHttpRequest객체에서 onreadyStateChange 이벤트 발생시 실행할 콜백함수 등록
				xhr.onreadystatechange = function() {
					// 서버로부터 성공적인 응답을 받았을 때만 응답데이터를 처리하는 수행문이 실행되게 함
					if (xhr.readyState == 4 && xhr.status == 200) {
						// 서버가 보낸 응답데이터(JSON표기법으로 작성된 텍스트데이터) 획득하기
						var jsonTextData = xhr.responseText;
						// JSON표기법으로 작성된 텍스트를 자바스크립트의 배열로 변환하기
						// (응답데이터가 json 배열 표기법으로 작성되어 있기 때문에 자바스크립트의 배열로 변환됨)
						var data = JSON.parse(jsonTextData);
						var reviewList = data.reviewList;
						var reviewPagination = data.reviewPagination;
						
						// 배열의 처음부터 끝까지 반복하면서 사원정보로 <tr/>, <td/> 태그를 생성하기
						var rows = "";
						if (reviewList == "") {
							rows += "<tr>";
							rows += "<td colspan='5' class='text-center py-3'>";
							rows += "작성된 리뷰가 없습니다.";
							rows += "</td>";
							rows += "</tr>";
						} else {
							for (var i = 0; i < reviewList.length; i++) {
								var review = reviewList[i];
								
								rows += "<tr onclick='reviewToggleDisplay("+review.no+")'>";
								rows += "<td class='text-center py-3'>" + review.RN + "</td>";
								rows += "<td class='py-3'>" + review.title + "</td>";
								rows += "<td class='text-center py-3'>" + maskingName(review.customerName) + "</td>";
								rows += "<td class='text-center py-3'>" + moment(review.createdDate).format('YYYY-MM-DD') + "</td>";
								rows += "<td class='text-center py-3'> <span id='review-count-"+ review.no +"'>" + review.views + "</span></td>";
								rows += "</tr>";
								 
								rows += "<tr id='detail-row-"+ review.no +"' style='display:none; background-color:#fafafa;'>";
								rows += "<td></td>"
								rows += "<td colspan='4'>";
								rows += review.content;
								rows += "</td>";
								rows += "</tr>";
							}
						}
						
						// <tbody> 엘리먼트에 <tr>, <td>태그로 구성된 HTML 컨텐츠를 추가하기
						tbodyEl.innerHTML = rows;
						
						var rows2 = "";
						if (reviewPagination.totalRows > 0) {
							rows2 += "<div class='row mb-2'>";
							rows2 += "<div class='col-12'>";
							rows2 += "<ul class='pagination justify-content-center'>"; 
							rows2 += "<li class='page-item " + (reviewPagination.pageNo <= 1 ? 'disabled' : '' ) +"'>";
							rows2 += "<a class='page-link' href='javascript:getReviewList("+(reviewPagination.pageNo - 1)+")'>이전</a>";
							rows2 += "</li>"; 
							for (var num = reviewPagination.beginPage; num<=reviewPagination.endPage; num++) {
								rows2 += "<li class='page-item "+ (reviewPagination.pageNo == num ? 'active' : '')+"'>";
								rows2 += "<a class='page-link' href='javascript:getReviewList("+num+")'>"+ num +"</a>";
								rows2 += "</li>";
							}
							
							rows2 += "<li class='page-item " + (reviewPagination.pageNo >= reviewPagination.totalPages ? 'disabled' : '') +  "'>";
							rows2 += "<a class='page-link' href='javascript:getReviewList("+(reviewPagination.pageNo + 1)+")'>다음</a>";
							rows2 += "</li>"; 
							rows2 += "</ul>"; 
							rows2 += "</div>"; 
							rows2 += "</div>"; 
						}
						divEl.innerHTML = rows2;
					}
				}
				
				// XMLHttpRequest 객체 초기화
				xhr.open("GET", "review/list?productNo=${product.no}&page=" + pageNo1 + "&sort=" + sort);
				// 서버로 HTTP요청 보내기
				xhr.send();
			}
			
			function reviewToggleDisplay(no) {
				var view = document.getElementById('review-count-'+ no).innerText;
				// XMLHttpRequest 객체 생성
				var xhr = new XMLHttpRequest();
				
				// XMLHttpRequest객체에서 onreadyStateChange 이벤트 발생시 실행할 콜백함수 등록
				xhr.onload = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(xhr.responseText);
					} else {
						console.error(xhr.responseText);
					}
				};
				xhr.open('POST', 'review/update');
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send("view=" + view + "&no=" + no);
				
				var detail = document.getElementById("detail-row-" + no);
				
				if (detail.style.display == 'none') {
					detail.style.display = '';
				} else {
					detail.style.display = 'none';
				}
			}
			/* 리뷰게시판 ajax 끝*/
			
			/* Ajax 리뷰등록 시작 */
			$('#insertReview').click(function() {
				var productNo = document.getElementById('productNo').value;
				var customerNo = document.getElementById('customerNo').value;
				var ReviewTitle = document.getElementById('ReviewTitle').value;
				var ReviewContent = document.getElementById('ReviewContent').value;
				
				// XMLHttpRequest 객체 생성
				var xhr = new XMLHttpRequest();
				
				// XMLHttpRequest객체에서 onreadyStateChange 이벤트 발생시 실행할 콜백함수 등록
				xhr.onload = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(xhr.responseText);
					} else {
						console.error(xhr.responseText);
					}
				};
				xhr.open('POST', 'review/insert');
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send("productNo=" + productNo + "&customerNo=" + customerNo + "&title=" + ReviewTitle + "&content=" + ReviewContent);
				
				getReviewList(1);
				$('#modalReview').modal("hide");
			});
			/* Ajax 리뷰등록 끝 */
			
			/* 문의게시판 ajax 시작 */
			var customerName = '${customer.name}';
			getInquiryList(1);
			
			
			function getInquiryList(pageNo2) {
				
				// 조회된 문의정보가 추가될 tbody 엘리먼트 획득하기
				var tbodyEl = document.querySelector("#inquiry-table tbody");
				tbodyEl.innerHTML = "";
				var divEl = document.querySelector("#inquiry-pagenation");
				divEl.innerHTML = "";
				
				// XMLHttpRequest 객체 생성
				var xhr = new XMLHttpRequest();
				
				// XMLHttpRequest객체에서 onreadyStateChange 이벤트 발생시 실행할 콜백함수 등록
				xhr.onreadystatechange = function() {
					// 서버로부터 성공적인 응답을 받았을 때만 응답데이터를 처리하는 수행문이 실행되게 함
					if (xhr.readyState == 4 && xhr.status == 200) {
						// 서버가 보낸 응답데이터(JSON표기법으로 작성된 텍스트데이터) 획득하기
						var jsonTextData = xhr.responseText;
						// JSON표기법으로 작성된 텍스트를 자바스크립트의 배열로 변환하기
						// (응답데이터가 json 배열 표기법으로 작성되어 있기 때문에 자바스크립트의 배열로 변환됨)
						var data = JSON.parse(jsonTextData);
						var inquiryList = data.inquiryList;
						var pagination = data.pagination;
						
						// 배열의 처음부터 끝까지 반복하면서 사원정보로 <tr/>, <td/> 태그를 생성하기
						var rows = "";
						if (inquiryList == "") {
							rows += "<tr>";
							rows += "<td colspan='4' class='text-center py-3'>";
							rows += "작성된 문의가 없습니다.";
							rows += "</td>";
							rows += "</tr>";
						} else {
							for (var i = 0; i < inquiryList.length; i++) {
								var inq = inquiryList[i];
								
								if ('N' === inq.secretYN) {
									rows += "<tr onclick='inquiryToggleDisplay("+inq.no+")'>";
									rows += "<td class='py-3'>" + inq.title + "</td>";
								} else if ('Y' === inq.secretYN && customerName === inq.customerName) {
									rows += "<tr onclick='inquiryToggleDisplay("+inq.no+")'>";
									rows += "<td class='py-3'>" + inq.title + "</td>";
								} else {
									rows += "<tr>";
									rows += "<td class='py-3' style='color:#A9A9A9'>비밀글입니다.<i class='fas fa-lock'></i></td>";
								}
								rows += "<td class='text-center py-3'>" + maskingName(inq.customerName) + "</td>";
								rows += "<td class='text-center py-3'>" + moment(inq.createdDate).format('YYYY-MM-DD') + "</td>";
								rows += "<td class='text-center py-3'>" + inq.status + "</td>";
								rows += "</tr>";
								 
								rows += "<tr id='inquiryDetail-row-"+ inq.no +"' style='display:none; background-color:#fafafa;'>";
								rows += "<td colspan='4'>";
								rows += inq.content;
								rows += "</td>";
								rows += "</tr>";
							}
						}
						
						// <tbody> 엘리먼트에 <tr>, <td>태그로 구성된 HTML 컨텐츠를 추가하기
						tbodyEl.innerHTML = rows;
						
						var rows2 = "";
						if (pagination.totalRows > 0) {
							rows2 += "<div class='row mb-2'>";
							rows2 += "<div class='col-12'>";
							rows2 += "<ul class='pagination justify-content-center'>"; 
							rows2 += "<li class='page-item " + (pagination.pageNo <= 1 ? 'disabled' : '' ) +"'>";
							rows2 += "<a class='page-link' href='javascript:getInquiryList("+(pagination.pageNo - 1)+")'>이전</a>";
							rows2 += "</li>"; 
							for (var num=pagination.beginPage; num<=pagination.endPage; num++) {
								rows2 += "<li class='page-item "+ (pagination.pageNo == num ? 'active' : '')+"'>";
								rows2 += "<a class='page-link' href='javascript:getInquiryList("+num+")'>"+ num +"</a>";
								rows2 += "</li>";
							}
							
							rows2 += "<li class='page-item " + (pagination.pageNo >= pagination.totalPages ? 'disabled' : '') +  "'>";
							rows2 += "<a class='page-link' href='javascript:getInquiryList("+(pagination.pageNo + 1)+")'>다음</a>";
							rows2 += "</li>"; 
							rows2 += "</ul>"; 
							rows2 += "</div>"; 
							rows2 += "</div>"; 
						}
						divEl.innerHTML = rows2;
					}
				}
				
				// XMLHttpRequest 객체 초기화
				xhr.open("GET", "inquiry/list?productNo=${product.no}&page=" + pageNo2);
				// 서버로 HTTP요청 보내기
				xhr.send();
			}
			
			function inquiryToggleDisplay(no) {
				var detail = document.getElementById("inquiryDetail-row-" + no);
				
				if (detail.style.display == 'none') {
					detail.style.display = '';
				} else {
					detail.style.display = 'none';
				}
			}
			/* Ajax 문의리스트 끝 */
			
			/* Ajax 문의등록 시작 */
			$('#insertInquiry').click(function() {
				var productNo = document.getElementById('productNo').value;
				var customerNo = document.getElementById('customerNo').value;
				var InquiryTitle = document.getElementById('InquiryTitle').value;
				var InquiryContent = document.getElementById('InquiryContent').value;
				var secretYN = document.querySelector("input[name=secretYN]").checked;

				if (true == secretYN) {
					secretYN = 'Y';
				} else {
					secretYN = 'N';					
				}
				
				// XMLHttpRequest 객체 생성
				var xhr = new XMLHttpRequest();
				
				// XMLHttpRequest객체에서 onreadyStateChange 이벤트 발생시 실행할 콜백함수 등록
				xhr.onload = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						console.log(xhr.responseText);
					} else {
						console.error(xhr.responseText);
					}
				};
				xhr.open('POST', 'inquiry/insert');
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
				xhr.send("productNo=" + productNo + "&customerNo=" + customerNo + "&title=" + InquiryTitle + "&content=" + InquiryContent + "&secretYN=" + secretYN);
				
				getInquiryList(1);
				$('#modalInquiry').modal("hide");
			});
			/* Ajax 문의등록 끝 */
		</script>
	</body>
</html>