<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>상품몰</title>
 	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="../../resources/css/jhw-css.css" rel="stylesheet" type="text/css"></link>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<header>
		<%@include file="../common/header.jsp" %>
	</header>
	<main>
		<div class="jumbotron">
			<c:if test="${param.success eq 'joinMembership' }">
				<div class="col-6 offset-3">
					<div class="alert alert-danger">
						<h1>회원가입 완료!!</h1>
						<p>로그인 후 마켓컬리를 이용해보세요!</p>
					</div>
				</div>
			</c:if>
			<c:if test="${param.success eq 'withdrawalMembership' }">
				<div class="col-6 offset-3">
					<div class="alert alert-danger">
						<h1>회원탈퇴 완료.</h1>
						<p>그동안 감사했습니다.</p>
					</div>
				</div>
			</c:if>
			<c:if test="${param.success eq 'updateMembership' }">
				<div class="col-6 offset-3">
					<div class="alert alert-danger">
						<h1>회원수정 완료.</h1>
					</div>
				</div>
			</c:if>
		</div>
	</main>
</div>
</body>
</html>