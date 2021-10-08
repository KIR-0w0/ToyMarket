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
 	 		border-bottom: 2px solid #000 !important;
 	 	}
 	 	#button2{ 
    		border: 2px solid #5F0080; 
    		color: #5F0080;
    		font-weight: bold;
    	}
 	 	h4{
    		 font-weight: bolder;
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
<%@include file="../common/adminHeader.jsp" %>
	<main>
		<div class="row">			<!-- 삭제관리 -->
			<div class="col-12">
				<div class="p-3" id="formBorder">
					<h4>삭제관리</h4>
					<span>-탈퇴처리된 회원목록입니다.-</span>
				</div>
			</div>
		</div>
		<div class="row">			<!-- 테이블 -->
			<div class="col-12" style="text-align:center">
				<table class="table" id="formBorder2">
					<colgroup>
						<col width="8%">
						<col width="19%">
						<col width="19%">
						<col width="11%">
						<col width="15%">
						<col width="16%">
						<col width="7%">
						<col width="*%">
					</colgroup>
					<thead>
						<tr>
							<th>회원번호</th>
							<th>가입일시</th>
							<th>탈퇴일시</th>
							<th>이름</th>
							<th>아이디</th>
							<th>이메일</th>
							<th>보기</th>
							<th>복구</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty customers }">
								<tr>
									<td colspan="8">검색결과가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="customer" items="${customers }">
									<tr style="border-bottom: 1px solid #D8D8D8 !important;">
										<td>${customer.no }</td>
										<td><fmt:formatDate value="${customer.createdDate }" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatDate value="${customer.deletedDate }" pattern="yyyy-MM-dd"/></td>
										<td>${customer.name }</td>
										<td>${customer.id }</td>
										<td>${customer.email }</td>
										<td><a class="btn btn-sm" id="button2" href="admincustomerdetail?no=${customer.no }&page=${pagination.pageNo}"> ></a></td>	<!-- 상세보기 -->
										<td><a class="btn btn-sm" id="button2" href="admincustomerupdate?no=${customer.no }&page=${pagination.pageNo}" onclick="return buttonForm()"> +</a></td>	<!-- 복구 -->
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
							<a class="page-link" href="admincustomerdelete?page=${pagination.pageNo - 1 }"> 이전</a>
						</li>
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
								<a class="page-link" href="admincustomerdelete?page=${num }">${num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : '' }">
							<a class="page-link" href="admincustomerdelete?page=${pagination.pageNo + 1 }"> 다음</a>
						</li>
					</ul>
				</div>
			</div>
		</c:if>
	</main>
</div>
<script type="text/javascript">
	function buttonForm() {
		return confirm("해당 사용자를 복구하시겠습니까?")
	}
</script>
</body>
</html>