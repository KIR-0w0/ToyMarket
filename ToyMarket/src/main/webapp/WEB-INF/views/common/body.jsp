<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<main>
	<!-- 이벤트 페이지 링크 (링크 안걸어놓음)-->
	<div id="eventCarousel">
		<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner bodyContentFrame" style="background: purple; margin-top: 50px;">
				<div class="carousel-item active" style="object-fit:cover;">
					<img src="/resources/images/carouselImg1.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/resources/images/carouselImg2.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="/resources/images/carouselImg3.png" class="d-block w-100" alt="...">
				</div>
			</div>
		</div>
	</div>

	 <!--  slick 영역 확인용 -->
	<div class="tit text-center" style="padding-top: 50px">
		<h2 class="tit"><strong> 할인/특가 ></strong></h2>
	</div>
    <div style="padding: 0 120px 50px; width:1296px; background-color: light;"><!-- 색상 light로 바꿀 예정 -->
          <div id="slider-div1"  >
			<c:forEach var="discountedProduct" items="${discountedProducts }" begin="1" end="16">
				<div class="col-xs-6 col-md-3 " style="float: left; padding-left: auto;">
					<a href="/product/detail?productNo=${discountedProduct.no }" class="thumbnail "> 
						<img src="${discountedProduct.image }" style=" height:283px; width: 222px" alt="...">
					</a>
					<div style="margin-left:26px;">
						<a href="/product/detail?productNo=${discountedProduct.no }" style="text-decoration:none;display: block; color: black; size: 6px ">${discountedProduct.name}  ${discountedProduct.weight }</a>
						<span style="text-decoration-line: line-through; color: gray">
							<fmt:formatNumber maxFractionDigits="0" value="${discountedProduct.price}"/>원
						</span> 
						<strong><span style="color: purple; font-size: 20px">
							<fmt:formatNumber maxFractionDigits="0" value="${discountedProduct.price-discountedProduct.price*discountedProduct.discountRate}"/>원
						</span></strong>
						<span style="color: red">
							(<fmt:formatNumber maxFractionDigits="0" type="percent" value="${discountedProduct.discountRate }" />)
						</span>
					</div>
				</div>	
			</c:forEach>
          </div>
    </div>
	
	<div class="tit text-center" style="padding-top: 50px">
		<h2 class="tit"><strong> MD추천상품 ></strong></h2>
	</div>
	<div
		style="padding: 0 120px 50px; width: 1296px; background-color: light;">
		<!-- 색상 light로 바꿀 예정 -->
		<div id="slider-div2">
			<c:forEach var="randomProduct" items="${randomProducts }" begin="1"	end="12">
				<div class="col-xs-6 col-md-3 "
					style="float: left; padding-left: auto;">
					<a href="/product/detail?productNo=${randomProduct.no }"
						class="thumbnail "> <img src="${randomProduct.image }"
						style="height: 283px; width: 222px" alt="...">
					</a>
					
					<div style="margin-left:26px;">
						<a href="/product/detail?productNo=${randomProduct.no }"
							style="text-decoration: none; display: block; color: black; size: 6px">${randomProduct.name} ${randomProduct.weight }
						</a> 
						<span style="text-decoration-line: line-through; color: gray"> <fmt:formatNumber
							maxFractionDigits="0" value="${randomProduct.price}" />원
						</span> 
						<strong><span style="color: purple; font-size: 20px">
								<fmt:formatNumber maxFractionDigits="0"	value="${randomProduct.price-discountedProduct.price*randomProduct.discountRate}" />원
						</span></strong> 
						<span style="color: red"> (<fmt:formatNumber maxFractionDigits="0" type="percent" value="${randomProduct.discountRate }" />)
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>