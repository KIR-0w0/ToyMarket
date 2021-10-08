<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>심플 게시판</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div class="container">
	<header class="my-3">
		<c:set var="menu" value="문의게시판" />
		<%@include file="../common/header.jsp" %>
	</header>
	<main class="mb-3">
		<div class="row mb-2">
			<div class="col-12">
				<div class="border bg-light px-3 py-2">
					<strong>게시글 목록</strong>
					<a href="/boardregister" class="btn btn-primary btn-sm float-right">문의하기</a>
				</div>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-12">
				<table class="table table-striped table-sm">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="15%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty boards }">
								<tr>
									<td class="text-center" colspan="5">검색결과가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="board" items="${boards }">
									<tr>
										<td>${board.no }</td>
										<td><a href="boarddetail?no=${board.no }&page=${pagination.pageNo}">${board.title }</a></td>
										<td>${board.userNm }</td>
										<td>${board.viewCount }</td>
										<td><fmt:formatDate value="${board.createdDate }" pattern="yyyy-MM-dd"/></td>
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
							<a class="page-link" href="boardlist?page=${pagination.pageNo - 1 }">이전</a>
						</li>
						<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
							<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
								<a class="page-link" href="boardlist?page=${num }">${num }</a>
							</li>
						</c:forEach>
						<li class="page-item ${pagination.pageNo ge pagination.totalPages ? 'disabled' : ''}">
							<a class="page-link" href="boardlist?page=${pagination.pageNo + 1 }">다음</a>
						</li>
					</ul>
				</div>
			</div>
		</c:if>
	</main>
</div>
</div>
</body>
</html>