<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>상품몰</title>
 	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="../../resources/css/jhw-css.css" rel="stylesheet" type="text/css"></link>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	
</head>
<body>
<div class="container">
	<header>
		<%@include file="../common/header.jsp" %>
	</header>
	<main>
		<div class="row mb-3"> 
			<div class="col-12">
				<h3 class="border p-3 bg-light">마켓컬리 로그인</h3>
			</div>
		</div>
			<div class="row">
			<c:if test="${param.fail eq 'invalid' }">
				<div class="col-6 offset-3">
					<div class="alert alert-danger">
						<strong>아이디 혹은 비밀번호가 일치하지 않습니다.</strong> 
					</div>
				</div>
			</c:if>
			<c:if test="${param.fail eq 'drop' }">
				<div class="col-6 offset-3">
					<div class="alert alert-danger">
						<strong>이미 탈퇴처리된 사용자입니다.</strong> 
					</div>
				</div>
			</c:if>
			<div class="col-6 offset-3">
				<form method="post" action="/user/login" class="border p-3 bg-light">
					<div class="form-group">
						<label>아이디</label>
						<input type="hidden" id="is-admin" name="isadmin" value="no" />
						<input type="hidden" id="is-kakao" name="iskakao" value="no"/>
						<input type="text" class="form-control" id="user-id" name="id" />
					</div>
					<div class="form-group">
						<label>비밀번호</label>
						<input type="password" class="form-control" id="user-password" name="password" />
					</div>
					<div class="text-right">
						<a href="/user/register" class="btn btn-outline-primary">회원가입</a>
						<button type="submit" class="btn btn-primary">로그인</button>
					</div>
				</form>
			</div>
		</div>
	</main>
</div>
</body>
</html>