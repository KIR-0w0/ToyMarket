<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Bootstrap 5 Example</title>
 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
		<link href="../../jhw-css.css" rel="stylesheet" type="text/css"></link>
</head>
<body>
<div id="header">
			<%@ include file="../common/header.jsp"%>
			<!-- search페이지 내 검색 BOX -->
			<div class="text-center" style="height: 100px">
				<div style="margin: 100px auto 50px"></div>
			</div>
		</div>
<div id="body">
<div style="margin-left:35%; max-width:470px">
<div align="left" style="text-align:left">
<img src="" alt="" style="-ms-interpolation-mode:bicubic; clear:both; display:block; max-width:100%; outline:none; text-decoration:none; width:107px" width="107" loading="lazy">
</div>
<div style="background-color:#FFF; border:1px solid #d3c1e4; color:#a834af; width: 400px; font-size:0.875em; margin:20px 0; word-break:keep-all" bgcolor="#FFFFFF">
<div style="padding:30px">
<h1 style="text-align: center;">결제완료 확인서</h1>
<p align="center" style="margin:0; color:#4d4d4d; font-family:Helvetica, Arial, sans-serif; font-weight:normal; line-height:1.3; padding:0; text-align:center; font-size:1em; margin-bottom:20px">총 ${itemCount }건 </p>
<p align="center" style="margin:0; color:#4d4d4d; font-family:Helvetica, Arial, sans-serif; font-weight:normal; line-height:1.3; padding:0; text-align:center; font-size:1em; margin-bottom:20px">${userName }님의 주문이 완료되었습니다.</p>
<p align="center" style="margin:0; color:#4d4d4d; font-family:Helvetica, Arial, sans-serif; font-weight:normal; line-height:1.3; padding:0; text-align:center; font-size:1em; margin-bottom:20px">메일로 주문확인서 발송되었습니다.</p>
</div>
</div>
</div>
</div>
</body>
</html>