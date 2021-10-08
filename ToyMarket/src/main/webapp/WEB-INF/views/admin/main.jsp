<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>관리자페이지</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<style type="text/css">
  		#shopLink {
  			color : blue;
  			font-size: 14px;
  		}
  		#loginInfo {
  			color: black;
  			font-size: 14px;
  		}
  		#sessionInfo {
  			color: black;
  			font-size: 14px;
  		}
  		
  		#headerBorder {
  			border-bottom: 3px solid #5F0080 !important;
  		}
  		#bodyBorder{
  			border-bottom: 2px solid #5F0080 !important;
  		}
  		
  		
  		#h4Border{
  			border-bottom: 3px solid #5F0080 !important;
  		}
  		h2{
    		 font-weight: bolder;
    	}
    	
    	#form-text{
    		border: 3px solid #000 !important;
    		border-radius: 20px;
    		background-color: #F2F2F2;
    	}
    	#form-text1{
    		border: 3px solid #000 !important;
    		border-radius: 20px;
    		background-color: #5F0080; 
    		color: white;
    	}
    	#form-text2{
    		border: 3px solid #000 !important;
    		border-radius: 20px;
    		background-color: #dc3545; 
    		color: white;
    	}
    	#text1{
    		font-size: 26px;
    		text-align: center;
    		font-weight: bolder;
    	}
  		#text2{
  			font-size: 20px;
  			text-align: right;
  		}
  		#tableBorder{
  			border-bottom: 2px solid #000 !important;
  			text-align:center;
  		}
  		
  		#link{ 
    		color: white;
  		}
  	</style>
</head>
	<c:choose>
		<c:when test="${empty LOGINED_USER_INFO }">
			<div class="col-6 offset-3">
				<div class="alert alert-danger">
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
				<h1>관리자 로그인 필요!!</h1>
				<p>로그인 후 이용가능합니다.</p>
				<input type="hidden" id="is-admin" name="isadmin" value="yes"/>
					<div class="form-group">
						<label>아이디</label>
						<input type="text" class="form-control" id="user-id" name="id" />
						<input type="hidden" id="is-kakao" name="iskakao" value="no"/>
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
			</div>
		</c:when>	
	<c:otherwise>
<body>
	<div class="container">
	<%@ include file="../common/adminHeader.jsp" %>
		<main>
			<div class="row">
				<div class="col-12">
					<div class="p-3" id="h4Border">
						<h2>상품 분석</h2>
					</div>
				</div>
			</div>
			<div class="row mt-3 ">
				<div class="d-flex justify-content-center">
					<div id="piechart" style="width: 600px; height: 300px;"></div>
				</div>		
			</div>
			
			<div class="row">
				<div class="col-12">
					<div class="p-3" id="h4Border">
						<h2>고객 분석</h2>
					</div>
				</div>
			</div>
			
			<!-- 테이블 -->
			<div class="row">
				<div class="col-1">
				</div>
				<div class="col-4">
					<div class="p-3 mt-4">
						<div class="rounded-bottom" id="form-text">
							<div class="pt-2 me-5" id="text1">
								신규회원
							</div>
							<div class="me-5 mb-2" id="text2">
								<a style="font-size: 30px; color: #A901DB;">${nTotalTows }</a>
								<span> 명</span>
							</div>
						</div>
						<table class="table" id="tableBorder">
							<colgroup>
								<col width="40%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<thead>
								<tr>
									<th>가입일시</th>
									<th>아이디</th>
									<th>이름</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
							<c:when test="${empty nCustomers }">
								<tr>
									<td colspan="8">최근가입한 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="nCustomer" items="${nCustomers }">
									<tr style="border-bottom: 1px solid #D8D8D8 !important;">
										<td><fmt:formatDate value="${nCustomer.createdDate }" pattern="yyyy-MM-dd"/></td>
										<td>${nCustomer.id }</td>
										<td>${nCustomer.name }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
							</tbody>
						</table>
						<div class="rounded-top" id="form-text1">
							<div class="p-2" id="text1">
								<a class="" href="admincustomerinfo" id="link">회원정보</a>
							</div>
							
						</div>
					</div>
				</div>
				<div class="col-2">
				</div>
				<div class="col-4">
					<div class="p-3 mt-4">
						<div class="rounded-bottom" id="form-text">
							<div class="pt-2 me-5" id="text1">
								탈퇴회원
							</div>
							<div class="me-5 mb-2" id="text2">
								<a style="font-size: 30px; color: #dc3545;">${yTotalRows }</a>
								<span> 명</span>
							</div>
						</div>
						<table class="table" id="tableBorder">
							<colgroup>
								<col width="40%">
								<col width="30%">
								<col width="30%">
							</colgroup>
							<thead>
								<tr>
									<th>탈퇴일시</th>
									<th>아이디</th>
									<th>이름</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
							<c:when test="${empty yCustomers }">
								<tr>
									<td colspan="8">최근탈퇴한 회원이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="yCustomer" items="${yCustomers }">
									<tr style="border-bottom: 1px solid #D8D8D8 !important;">
										<td><fmt:formatDate value="${yCustomer.deletedDate }" pattern="yyyy-MM-dd"/></td>
										<td>${yCustomer.id }</td>
										<td>${yCustomer.name }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
							</tbody>
						</table>
						<div class="rounded-top" id="form-text2">
							<div class="p-2" id="text1">
								<a class="" href="admincustomerdelete" id="link">삭제관리</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-1">
				</div>
			</div>
		</main>
	</div>
</body>
</c:otherwise>
</c:choose>	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['category', '판매개수'],
          ['채소',     11],
          ['수산물',      2],
          ['고기류',  2],
          ['인스턴트', 2],
          ['베이커리',    7]
        ]);

        var options = {
          title: '카테고리별 주문사항'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      
           
    </script>
</html>
