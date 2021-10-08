<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8"%>
<header>
	<div class="row" style="background-color: purple">
		<div class="col-12 text-end usermenu">
		<ul class="navbar-nav">
			<c:choose>
				<c:when test="${empty LOGINED_USER_INFO }">
					 <li class="nav-item">
	                       <a href="/user/loginSelect" class="btn" style="color: white; font-weight: bold">로그인</a>
	                       <a href="/user/register" class="btn" style="color: white; font-weight: bold">회원가입</a>
	                 </li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
	                        <a href="나의주문내역 링크" class="btn" style="color: white; font-weight: bold">나의 주문내역</a>
	                        <a href="나의장바구니 링크" class="btn" style="color: white; font-weight: bold">나의 장바구니</a>
	                       	<a href="/user/detail" class="btn" style="color: white; font-weight: bold">회원정보 수정</a>
							<a href="#mypage" class="btn" style="color: white; font-weight: bold">
							<c:out value="${LOGINED_USER_INFO.name } 님 "/>
							</a>
	                       	<a href="/user/logout" class="btn" style="color: white; font-weight: bold">로그아웃</a>
	                </li>
				</c:otherwise>
			</c:choose>
		</ul>
		</div>
	</div>
	
	<!-- 홈 -->
	<div class="row" style="background-color: light">	
		<div class="col-12">
			<h1>
				<a href="/home"><img src="/resources/images/kurlyLogo2.png"
					width="100" class="logo img-rounded img-fluid" alt="rr"></a>
			</h1>
		</div>
	</div>


	<!-- 메뉴 -->
	<nav class="navbar navbar-expand-md navbar-light bg-light mb-4">
			<div class="col-6">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarCollapse">
					<ul class="navbar-nav me-auto mb-2 mb-md-0">
						<li class="nav-item dropdown">
							<a class="mt-2 mx-4 nav-link dropdown-toggle" href="#" 
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"><i class="fas fa-bars">카테고리</i></a>
							
							<ul class="dropdown-menu" aria=labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="/search?searchCategory=5">육류</a></li>
								<li><a class="dropdown-item" href="/search?searchCategory=6">어류</a></li>
							</ul>
						</li>
							
						<li class="nav-item"><a class="mt-2 mx-4 nav-link" href="/product/list?sort=신상품순">신상품</a></li>
						<li class="nav-item"><a class="mt-2 mx-4 nav-link" href="/product/list?sort=인기상품순">베스트</a></li>
						<li class="nav-item"><a class="mt-2 mx-4 nav-link" href="/product/list?sort=혜택순">알뜰쇼핑</a></li>
					</ul>
				</div>
			</div>
			<div class="col-2"></div>
			
			<!-- 검색창-->
			<form action ="/search" method="get">
			<div class="input-group">
				<input type="text" class="form-control mt-3" name="searchWord">
				<div class="input-group-append">
				<button type="submit" class="form-control mt-3">검색</button>
				</div>
			</div>
			</form>
			
			<!-- 장바구니 이미지 -->
			<div class="col-1 mx-4">
				<div class="col-1 mt-2">
					<c:choose>
						<c:when test="${empty LOGINED_USER_INFO }">
								<button class="btn btn-outline-secondary" style="border: 0px" type="button" id ="btn-basket">
									<img src="/resources/images/basket.png" class="img-rounded" alt="장바구니img" onclick="loginCheckAlert()">
								</button>
						</c:when>
						<c:otherwise>
							<a href="/cart/list">								
								<button class="btn btn-outline-secondary" style="border: 0px" type="button" id ="btn-basket">
									<img src="/resources/images/basket.png" class="img-rounded" alt="장바구니img">
								</button>
							</a>
						</c:otherwise>     
					</c:choose>
				</div>
			</div>
	</nav>
</header>


