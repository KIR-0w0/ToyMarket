<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>Toy Market</title>
 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
	<link href="../../resources/css/jhw-css.css?after" rel="stylesheet" type="text/css"></link>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"></link>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">

	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	
	<style>
	.slick-prev:before,
	.slick-next:before {
    	background: purple;
	}
	</style>
</head>
<body id="jhw">
	<div class="container" >
		<div id="header">
			<%@ include file="../common/header.jsp"%>
		</div>

		<div id="main">
			<%@ include file="../common/body.jsp" %>
		</div>

		<div id="footer">
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>	
	<script type="text/javascript">
		function loginCheckAlert(){
			var el = document.getElementById("btn-basket");
			var text="로그인이 필요한 서비스입니다.";
			alert(text);
		}
		
		 $(function(){
	            $('#slider-div1').slick({
	                slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
	                infinite : true,     //무한 반복 옵션     
	                slidesToShow : 4,        // 한 화면에 보여질 컨텐츠 개수
	                slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
	                speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	                arrows : true,         // 옆으로 이동하는 화살표 표시 여부
	                dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
	                autoplay : true,            // 자동 스크롤 사용 여부
	                autoplaySpeed : 10000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	                pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
	                vertical : false,        // 세로 방향 슬라이드 옵션
	                prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정 
	                nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
	                dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
	                draggable : true,     //드래그 가능 여부 
	                
	                responsive: [ // 반응형 웹 구현 옵션
	                    {  
	                        breakpoint: 960, //화면 사이즈 960px
	                        settings: {
	                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                            slidesToShow:3 
	                        } 
	                    },
	                    { 
	                        breakpoint: 768, //화면 사이즈 768px
	                        settings: {    
	                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                            slidesToShow:2 
	                        } 
	                    }
	                ]
	 
	            });
	            $('#slider-div2').slick({
	                slide: 'div',        //슬라이드 되어야 할 태그 ex) div, li 
	                infinite : true,     //무한 반복 옵션     
	                slidesToShow : 4,        // 한 화면에 보여질 컨텐츠 개수
	                slidesToScroll : 1,        //스크롤 한번에 움직일 컨텐츠 개수
	                speed : 100,     // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	                arrows : true,         // 옆으로 이동하는 화살표 표시 여부
	                dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
	                autoplay : true,            // 자동 스크롤 사용 여부
	                autoplaySpeed : 10000,         // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	                pauseOnHover : true,        // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
	                vertical : false,        // 세로 방향 슬라이드 옵션
	                prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        // 이전 화살표 모양 설정
	                nextArrow : "<button type='button' class='slick-next'>Next</button>",        // 다음 화살표 모양 설정
	                dotsClass : "slick-dots",     //아래 나오는 페이지네이션(점) css class 지정
	                draggable : true,     //드래그 가능 여부 
	                
	                responsive: [ // 반응형 웹 구현 옵션
	                    {  
	                        breakpoint: 960, //화면 사이즈 960px
	                        settings: {
	                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                            slidesToShow:3 
	                        } 
	                    },
	                    { 
	                        breakpoint: 768, //화면 사이즈 768px
	                        settings: {    
	                            //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                            slidesToShow:2 
	                        } 
	                    }
	                ]
	 
	            });
	          })
	</script>
	
</body>
</html>