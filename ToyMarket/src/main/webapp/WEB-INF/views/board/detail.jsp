<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<header class="my-3">
		<c:set var="menu" value="문의게시판" />
		<%@include file="../common/header.jsp" %>
	</header>
	<main class="mb-3">
		<div class="row mb-2">
			<div class="col-12">
				<div class="border bg-light px-3 py-2">
					<strong>게시글 보기</strong>
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${param.fail eq 'invalid' }">
				<div class="row">
					<div class="col-12">
						<div class="alert alert-warning">
							<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 일치하지 않습니다.
						</div>
					</div>
				</div>
			</c:when>
			<c:when test="${param.fail eq 'deny' }">
				<div class="row">
					<div class="col-12">
						<div class="alert alert-warning">
							<strong>서비스 거부</strong> [${param.job }]은 로그인 후 이용가능한 서비스입니다.
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>
		<div class="row">
			<div class="col-12">
				<table class="table table-bordered">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tr>
						<th>글번호</th>
						<td>${board.no }</td>
						<th>등록일</th>
						<td><fmt:formatDate value="${board.createdDate }" pattern="yyyy년 M월 d일 EEEE a h시 m분 s초" /></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>${board.viewCount }</td>
						<th>최종수정일</th>
						<td><fmt:formatDate value="${board.updatedDate }" pattern="yyyy년 M월 d일 EEEE a h시 m분 s초" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><c:out value="${board.title }"/></td>
						<th>작성자ID</th>
						<td>${board.userId }</td>
					</tr>
					<tr style="height: 200px !important;">
						<th>내용</th>
						<td colspan="3" ><c:out value="${board.content }"/></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row mb-2">
			<div class="col-6">
				<a href="boardmodify?no=${board.no }&page=${param.page }" class="btn btn-outline-warning">수정</a>
				<a href="boarddelete?no=${board.no }&page=${param.page }" class="btn btn-outline-danger">삭제</a>
			</div>
			<div class="col-6 text-right">
				<a href="boardlist?page=${param.page }" class="btn btn-outline-primary">목록</a>
			</div>
		</div>
	</main>
</div>
</body>
</html>