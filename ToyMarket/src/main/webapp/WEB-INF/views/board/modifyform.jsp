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
					<strong>게시글 수정하기</strong>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form class="border bg-light px-3 py-2" method="post" action="boardmodify">
					<input type="hidden" name="no" value="${board.no }">
					<input type="hidden" name="page" value="${param.page }">
					<div class="form-group">
						<label>제목</label>
						<input type="text" class="form-control" name="title" value="${board.title }">
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea rows="5" class="form-control" name="content">${board.content }</textarea>
					</div>
					<div class="text-right">
						<a href="boarddetail?no=${board.no }&page=${param.page }" class="btn btn-secondary">취소</a>
                  <button type="submit" class="btn btn-primary">수정</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	</div>
</body>
</html>