<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
 	 <title>Bootstrap 4 Example</title>
 	 <meta charset="utf-8">
 	 <meta name="viewport" content="width=device-width, initial-scale=1">
 	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
 	 
 	 <style type="text/css">
 	 	#formBorder{
 	 		border-bottom: 3px solid #000 !important;
 	 	}
 	 	#formBorder2{
 	 		border-top: 1px solid #000 !important;
 	 	}
 	 	
 	 	#button{
    		border: 2px solid #dc3545; 
    		font-weight: bolder; 
    		color: #dc3545;
    	}
    	#button2{
    		border: 2px solid #5F0080; 
    		font-weight: bolder; 
    		color: #5F0080;
    	}
 	 	
 	 	
 	 	h4{
    		 font-weight: bolder;
    	}
 	 </style>
</head>
<body>
<div class="container">
<%@include file="../common/adminHeader.jsp" %>
	<main>
		<div class="row">			<!-- 상세정보 -->
			<div class="col-12">
				<div class="p-3" id="formBorder">
					<h4>상세정보</h4>
					<span>-</span>
					<span style="font-weight: bolder; font-size: 18px; color: #5F0080;">${customer.name } 님</span>
					<span>정보입니다-</span>
					<c:if test="${customer.status eq 'Y' }">
						<span style="color: #dc3545;">(탈퇴처리된 회원입니다.)</span>
					</c:if>
				</div>
			</div>
		</div>
		<div class="row mb-3">			<!-- 상세정보 테이블 -->
			<div class="col-12">
				<table class="table table-bordered">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tr>
						<th class="table-active">이름 / 아이디</th>
						<td>${customer.name } / ${customer.id }</td>
						<th class="table-active">고객번호</th>
						<td>${customer.no }</td>
					</tr>
					<tr>
						<th class="table-active">생년원일</th>
						<td>${customer.birth }</td>
						<th class="table-active">성별</th>
						<td>${customer.gender }</td>
					</tr>
					<tr>
						<th class="table-active">연락처</th>
						<td>${customer.phone }</td>
						<th class="table-active">이메일</th>
						<td>${customer.email }</td>
					</tr>
					<tr>
						<th class="table-active">주소1</th>
						<td>${customer.address1 }</td>
						<th class="table-active">주소2</th>
						<td>${customer.address2 }</td>
					</tr>
					<tr>
						<th class="table-active">등록일</th>
						<td><fmt:formatDate value="${customer.createdDate }" pattern="yyyy년 M월 d일"/></td>
						<th class="table-active">삭제일</th>
						<td><fmt:formatDate value="${customer.deletedDate }" pattern="yyyy년 M월 d일"/></td>
					</tr>
					<tr>
						<th class="table-active">포인트</th>
						<td colspan="3">${customer.point }</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row mb-3">			<!-- 삭제, 목록 버튼 -->
			<div class="col-6">		<!-- 삭제 버튼-->
				<c:choose>
					<c:when test="${customer.status eq 'N' }">
						<c:url var="deleteURL" value="admincustomerdetaildelete">
							<c:param name="no">${param.no }</c:param>				<!-- no값 넣기 -->
							<c:param name="page">${param.page }</c:param>			<!-- page값 넣기 -->
							<c:if test="${not empty param.name }">					<!-- name값 넣기(값이 있을 경우) -->
								<c:param name="name">${param.name }</c:param>
							</c:if>
							<c:if test="${not empty param.fage }">					<!-- fage값 넣기(값이 있을 경우) -->
								<c:param name="fage">${param.fage }</c:param>
							</c:if>
							<c:if test="${not empty param.sage }">					<!-- sage값 넣기(값이 있을 경우) -->
								<c:param name="sage">${param.sage }</c:param>
							</c:if>
							<c:if test="${not empty param.id }">					<!-- id값 넣기(값이 있을 경우) -->
								<c:param name="id">${param.id }</c:param>
							</c:if>
							<c:if test="${not empty param.gender }">				<!-- gender값 넣기(값이 있을 경우) -->
								<c:param name="gender">${param.gender }</c:param>
							</c:if>
						</c:url>
						<input type="hidden" name="deleteURL" value="${deleteURL }">
						<a class="btn" id="button" onclick="buttonForm()">삭제</a>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="updateURL" value="admincustomerupdate?no=${customer.no }&page=${param.page }">
						<a class="btn" id="button" onclick="buttonForm2()">복구</a>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-6">		<!-- 목록 버튼-->
				<c:choose>
					<c:when test="${customer.status eq 'N' }">
						<c:url var="infoURL" value="admincustomerinfo">
							<c:param name="page">${param.page }</c:param>			<!-- page값 넣기 -->
							<c:if test="${not empty param.name }">					<!-- name값 넣기(값이 있을 경우) -->
								<c:param name="name">${param.name }</c:param>
							</c:if>
							<c:if test="${not empty param.fage }">					<!-- fage값 넣기(값이 있을 경우) -->
								<c:param name="fage">${param.fage }</c:param>
							</c:if>
							<c:if test="${not empty param.sage }">					<!-- sage값 넣기(값이 있을 경우) -->
								<c:param name="sage">${param.sage }</c:param>
							</c:if>
							<c:if test="${not empty param.id }">					<!-- id값 넣기(값이 있을 경우) -->
								<c:param name="id">${param.id }</c:param>
							</c:if>
							<c:if test="${not empty param.gender }">				<!-- gender값 넣기(값이 있을 경우) -->
								<c:param name="gender">${param.gender }</c:param>
							</c:if>
						</c:url>
						<a href="${infoURL }" class="btn float-end" id="button2">목록</a>
					</c:when>
					<c:otherwise>
						<a href="admincustomerdelete?page=${param.page }" class="btn float-end" id="button2">목록</a>
					</c:otherwise>
				</c:choose>
			
			
			
			
			
			</div>
		</div>
		<div class="row">			<!-- 주문내역 -->
			<div class="col-12">
				<div class="p-4" id="formBorder">
					<h4>주문내역</h4>
				</div>
			</div>
		</div>
		<div class="row">			<!-- 주문내역 테이블 -->
			<div class="col-12" style="text-align:center">
				<table class="table">
					<colgroup>
						<col width="15%">
						<col width="20%">
						<col width="25%">
						<col width="10%">
						<col width="20%">
						<col width="*%">
					</colgroup>
					<thead>
						<tr>		<!-- 색 bgcolor="#F8EFFB" -->
							<th>주문번호</th>
							<th>주문날짜</th>
							<th>상품명</th>
							<th>수량</th>
							<th>결재금액</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty customerOrders }">
								<tr>
									<td class="text-center" colspan="7">주문내역이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="customerOrder" items="${customerOrders }">
									<tr>
										<td>${customerOrder.orderNo }</td>
										<td><fmt:formatDate value="${customerOrder.createdDate }" pattern="yyyy년 M월 d일"/></td>
										<td>${customerOrder.name }</td>
										<td>${customerOrder.totalAmount }</td>
										<td><fmt:formatNumber value="${customerOrder.totalPrice }" pattern="##,###" />원</td>
										<td>${customerOrder.status }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</main>
</div>
<script type="text/javascript">
	function buttonForm() {
		var confirm = window.confirm("해당 사용자를 삭제하시겠습니까?");
		var deleteURL = document.querySelector("input[name='deleteURL']").value;
		if(confirm == true){
			alert("삭제가 완료되었습니다.")
			location.href=deleteURL
		}
		else {
			return;
		}
	}
	function buttonForm2() {
		var confirm = window.confirm("해당 사용자를 복구하시겠습니까?");
		var updateURL = document.querySelector("input[name='updateURL']").value;
		if(confirm == true){
			alert("복구가 완료되었습니다.")
			location.href=updateURL;
		}
		else {
			return;
		}
	}
</script>
</body>
</html>