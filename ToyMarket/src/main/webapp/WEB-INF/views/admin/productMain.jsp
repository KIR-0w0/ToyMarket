<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>상품관리</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<style type="text/css">
  		#shopLink {
  			color : blue;
  			font-size: 14px;
  		}
  		#loginInfo {
  			color: black;
  			font-size: 14px;
  		}
  		#sessionInfo {
  			color: black;
  			font-size: 14px;
  		}
  		
  		#headerBorder {
  			border-bottom: 3px solid #5F0080 !important;
  		}
  		#bodyBorder{
  			border-bottom: 2px solid #5F0080 !important;
  		}
  		#categoryTable{
  		 color: black;
  		 
  		}
  		#linkNone{
  		 a:link { color: black; text-decoration: none;}
 		}
		.page-item.active .page-link {
          color: #fff;
          background-color: #5F0080;
          border-color: #5F0080;
          font-weight: bold;
       }
       .page-link {
          color: #5F0080;
          font-weight: bold;
       }
		
  	</style>
</head>
<body>
<div class="container">
<%@ include file="../common/adminHeader.jsp" %>
	<main>
		<div class="row">
			<div class="col-3">
				<table class="table table-light table-hover border">
					<thead>
						<tr>
							<th>카테고리</th>
						</tr>
					</thead>
					<tbody id="linkNone">
					<c:choose>
						<c:when test="${empty category }">등록된 카테고리가 존재하지 않습니다.</c:when>
						<c:otherwise>
							<tr onclick="getProducts(0,1)"  class="${param.category eq  '0'? 'table-active' : '' }"> 
							<td>전체상품목록</td>
							</tr>
							<c:forEach var="category" items="${category }" varStatus="loop">
								<tr onclick="getProducts('${category.no}',1);" class="${param.category eq category.no ? 'table-active' : '' }">
								<td> ${category.name }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
			<div class="col-9">
				<table class="table table-light table-hover table-text text-center align-middle" >
					<thead>
						<tr>
								<th>상품번호</th>
								<th>상품이미지</th>
								<th>상품명</th>
								<th>제조사</th>
								<th>판매상태</th>
								<th>재고량</th>
							<th>
							<select onchange="sortProduct()" id="combo-sort">
								<option value="상품번호" ${param.sort eq '상품번호' ? 'selected' : '' }>상품번호순</option>
								<option value="상품명" ${param.sort eq '상품명' ? 'selected' : '' }>상품명순</option>
								<option value="제조사" ${param.sort eq '제조사' ? 'selected' : '' }>제조사별</option>
								<option value="최근등록상품순" ${param.sort eq '최근등록상품순' ? 'selected' : '' }>최근등록상품순</option>
							</select>
							정렬
							</th>
						</tr>
					</thead>
					<tbody class="align-middle">
					<c:choose>
						<c:when test="${empty products }">
							<tr>
								<td colspan="9" class="text-center">등록된 상품이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
						<c:forEach var="products" items="${products }" varStatus="loop">
						<!-- 상품primary키 값으로 상품 디테일 페이지(업데이트)로 보내주기 -->
						<tr>
							<td>${products.no }</td>
							<td><img alt="상품이미지" src="${products.image }" style="width : 150px; height : 70px; object-fit: scale-down;"></td>
							<td><a href="javascript:goToDetail(${products.no })">${products.name }</a></td>
							<td>${products.brand }</td>
							<td>${products.status }</td>
							<td>${products.stock }</td>
							<td>
							<a class="btn btn-outline-danger"  onclick="removeCheck(${products.no})">삭제</a>
							</td>
						</tr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			</div>
		</div>
		<c:if test="${pagination.totalRows gt 0 }">
		<div class="row mb-2">
			<div class="col-12">
				<ul class="pagination justify-content-center">
					<li class="page-item ${pagination.pageNo le 1 ? 'disabled' : ''}">
						<a class="page-link" href="javascript:goToPage(${pagination.pageNo - 1 })">이전</a>
					</li>
					<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
							<a class="page-link" href="javascript:goToPage(${num })">${num }</a>
						</li>
					</c:forEach>
					<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
						<a class="page-link" href="javascript:goToPage(${pagination.pageNo + 1 })">다음</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="row mb-2 ">
			<div class="col-12">
				<form id="form-search" class="form-inline d-flex justify-content-center" method="get" action="list">
					<input type="hidden" name="no" value="" />
					<input type="hidden" name="sort" value="${param.sort }">
					<input type="hidden" name="category" value="${param.category }"/> 
					<input type="hidden" name="page" value="${pagination.pageNo }">
					<select class="form-control mr-2" name="opt">
						<option value="name" ${param.opt eq 'name' ? 'selected' : '' }> 상품명</option>
						<option value="brand" ${param.opt eq 'brand' ? 'selected' : '' }> 제조사</option>
					</select>
					<input type="text" class="form-control mr-2" name="keyword" value="${param.keyword }">
					<button type="button" class="btn btn-outline-primary" onclick="submitForm()">검색</button>
				</form>
			</div>
		</div>
	</c:if>
	</main>
</div>

<script type="text/javascript">
	function submitForm() {
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			alert("검색어를 입력하세요");
			document.querySelector("input[name='keyword']").focus();
			return;
		}
		document.querySelector("input[name='page']").value = 1;
		document.querySelector("#form-search").submit();
	}
	function getProducts(cat, pageNo) {
		var text = document.querySelector("input[name='keyword']").value
		if(!text) {
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		document.querySelector("input[name='no']").disabled = true;
		var sort = document.getElementById("combo-sort").value;
		document.querySelector("input[name='sort']").value = sort;
		document.querySelector("input[name='category']").value = cat;
		document.querySelector("input[name='page']").value = pageNo;
		document.querySelector("#form-search").setAttribute("action", "list");
		document.querySelector("#form-search").submit();
	}
	function goToPage(pageNo) {
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		document.querySelector("input[name='no']").disabled = true;
		
		var sort = document.getElementById("combo-sort").value;
		document.querySelector("input[name='sort']").value = sort;
		document.querySelector("input[name='page']").value = pageNo;
		document.querySelector("#form-search").setAttribute("action", "list");
		document.querySelector("#form-search").submit();
	}
	function sortProduct(){
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		document.querySelector("input[name='no']").disabled = true;
		
		var sort = document.getElementById("combo-sort").value;
		document.querySelector("input[name='sort']").value = sort;
		document.querySelector("#form-search").setAttribute("action", "list");
		document.querySelector("#form-search").submit();
	}
	function goToDetail(productNo) {
		var text = document.querySelector("input[name='keyword']").value;
		if (!text) {
			document.querySelector("select[name='opt']").disabled = true;
			document.querySelector("input[name='keyword']").disabled = true;
		}
		document.querySelector("input[name='category']").disabled = true;
		document.querySelector("input[name='sort']").disabled = true;
		document.querySelector("input[name='page']").disabled = true;
		
		
		document.querySelector("input[name='no']").value = productNo;
		document.querySelector("#form-search").setAttribute("action", "detail");
		document.querySelector("#form-search").submit();
	}
	function removeCheck(no) {
		// 상품삭제시 경고창 
		var result = confirm("상품을 삭제 하시겠습니까?");
		if (result) {
			location.href = '/admin/product/delete?deleteNo=' + no
		}
	}
</script>
</body>
</html>