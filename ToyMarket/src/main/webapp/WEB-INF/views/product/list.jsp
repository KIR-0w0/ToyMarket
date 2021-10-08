<%@page import="com.toymarket.vo.Products"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>토이마켓 : 내일의 장보기, 토이마켓</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
		<link href="../../resources/css/jhw-css.css" rel="stylesheet" type="text/css"></link>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
		<link href="../../resources/css/jhw-css.css" rel="stylesheet" type="text/css"></link>
		<style type="text/css">
			#divSize{
				width: 1050px !important;
    			margin: 0 auto !important;
			}
			
			#cardA:link {
				color: black;
				text-decoration: none;
			}
			
			#cardA:visited {
				color: black;
				text-decoration: none;
			}
			
			#cardA:hover {
				color: black;
				text-decoration: none;
			}
			
			.page-item.active .page-link {
				color: #fff !important;
				background-color: #5f0080 !important;
    			border-color: #5f0080 !important;
			}
			
			.page-link {
				color: #5f0080 !important;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<%@ include file="../common/header.jsp"%>
		</div>
		<div id="divSize">
			<div class="row mb-2">
				<div class="col-12">
					<div class="d-flex justify-content-between">
						<div>전체보기</div>
						<div>
							<select class="form-select-sm" style="border-style: none;" aria-label="Default select example" id="sort" onchange="refreshList()">
								<option value="신상품순" ${param.sort eq '신상품순' ? 'selected' : '' }>신상품순</option>
								<option value="인기상품순" ${param.sort eq '인기상품순' ? 'selected' : '' }>인기상품순</option>
								<option value="혜택순" ${param.sort eq '혜택순' ? 'selected' : '' }>혜택순</option>
								<option value="낮은가격순" ${param.sort eq '낮은가격순' ? 'selected' : '' }>낮은가격순</option>
								<option value="높은가격순" ${param.sort eq '높은가격순' ? 'selected' : '' }>높은가격순</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 px-4">
					<div>
						<div class="row row-cols-1 row-cols-md-3">
							<c:choose>
								<c:when test="${empty products}">
									<div class="d-flex justify-content-center">
										<p class="fs-3">상품 리스트가 없습니다.</p>
									</div>
								</c:when>
								<c:otherwise>
									<c:forEach var="product" items="${products}">
										<div class="py-5" id="productList">
											<a href="detail?productNo=${product.no}" id="cardA">
												<div class="card h-100" id="card">
													<img src="${product.image}" class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">[${product.brand}] ${product.name}</h5>
															<span style="text-decoration-line: line-through; color: gray">
																<fmt:formatNumber value="${product.price}"/>원
															</span> 
															<strong><span style="color: purple; font-size: 20px">
																<fmt:formatNumber type="number" maxFractionDigits="0" value="${product.price-(product.price * product.discountRate)}"/>원
															</span></strong>
															<span style="color: red">
																(<fmt:formatNumber type="percent" value="${product.discountRate }" />)
															</span>
														<p class="card-text light"><font size="2" color="#A9A9A9">${product.subTitle}</font></p>
													</div>
												</div>
											</a>
										</div>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						<c:if test="${pagination.totalRows gt 0 }">
							<div class="row mb-2">
								<div class="col-12">
									<ul class="pagination justify-content-center">
										<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
											<a class="page-link" href="list?page=${pagination.pageNo - 1 }">이전</a>
										</li>
										<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
											<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
												<a class="page-link" href="list?page=${num }">${num }</a>
											</li>
										</c:forEach>
										<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
											<a class="page-link" href="list?page=${pagination.pageNo + 1 }">다음</a>
										</li>
									</ul>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
			function refreshList() {
				var sortValue = document.getElementById("sort").value;
				location.href = "list?sort=" + sortValue;
			}
		</script>
	</body>
</html>