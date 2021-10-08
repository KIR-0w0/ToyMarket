<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
<link href="../../resources/css/jhw-css.css" rel="stylesheet" type="text/css"></link>
<title>마켓컬리</title>
</head>
<body>
<div class="container">
	<header>
		<%@include file="../common/header.jsp" %>
	</header>
	<main>
		<div class="row mb-3"> 
			<div class="col-12">
				<h3 class="border p-3 bg-light">마켓컬리 회원탈퇴</h3>
			</div>
		</div>
			<div class="row">
				<c:if test="${param.fail eq 'pwdDiscordance' }">
					<div class="col-6 offset-3">
						<div class="alert alert-danger">
							<strong>비밀번호가 일치하지 않습니다.</strong> 
						</div>
					</div>
				</c:if>
			</div>
		<div class="col-6 offset-3">
			<form id="register-form" action="withdrawal" method="post" class="border p-3 bg-light">
				<div class="form-group">
					<label>비밀번호 확인</label>
					<input type="password" class="form-control" id="user-pwd" name="password" />
				</div>
				<div class="text-right">
					<a href="/home" class="btn btn-secondary">취소</a>
					<button type="button" class="btn btn-primary" onclick="checkForm()">탈퇴</button>
				</div>
			</form>
		</div>
	</main>	
</div>
<script type="text/javascript">
	function checkForm() {
		
		// 비밀번호 관련
		var passwordEl = document.getElementById("user-pwd");
		if (!passwordEl.value.trim()) { 
			alert("비밀번호를 적어주세요.");
			passwordEl.focus();
			return;
		}
		document.getElementById("register-form").submit();		
	}
</script>
</body>
</html>