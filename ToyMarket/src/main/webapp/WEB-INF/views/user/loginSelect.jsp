<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>Bootstrap 4 Example</title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  	
  	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('462d788e255fdcdb4d15f3147b2698f0');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
</head>
<body>
<main>        
<form name="myForm">
<input type="hidden" id="user-id" name="id" />
<input type="hidden" id="user-name" name="name" />
<input type="hidden" id="is-kakao" name="iskakao" value="yes" />
<input type="hidden" id="is-admin" name="isadmin" value="no" />

<div class="container">
	<%@include file="../common/header.jsp" %>
	<div class="modal-dialog">
		<div class="modal-content">
			 <div class="modal-header">
				<h1 class="text-center">마켓컬리 로그인</h1>
             </div>
               <div class="modal-body">
	                <div class="form-group" >
	                	<a href="/user/login" class="btn btn-block btn-lg btn btn-secondary btn_login" style="background-color: purple; display: block" >마켓컬리 로그인</a>
	                    <a href="/admin" class="btn btn-block btn-lg btn btn-primary btn_login" style="margin-bottom:5px; display: block" >관리자모드로그인</a>
	                  	<a id="kakao-login-btn" class="btn btn-block btn-lg btn btn-warning btn_login" style="margin-bottom:5px; display: block" >카카오로그인</a>
	                </div>
            	</div>
         </div>
     </div>
</div>
 	 <script type="text/javascript">
  function gopagePost() { 
	  document.myForm.action="/user/login"; 
	  document.myForm.method="post"; 
	  
	  document.myForm.submit();
  }
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {	// authObj 인증에서 토큰을 받기위한 요청
        Kakao.API.request({
          url: '/v2/user/me',		// 사용자 정보를 가져옴(토큰을 받음) 24시간동안 탭끄기전까지
          success: function(res) {
            //alert(JSON.stringify(res))	 
           	document.getElementById("user-id").value = res.id;
           	document.getElementById("user-name").value = res.properties.nickname;
           	gopagePost();
          },
          fail: function(error) {
            alert('정보를 가져오지 못하였습니다.: ' + JSON.stringify(error))
          },
        })
      },
      fail: function(err) {
        alert('인증에 실패하였습니다.: ' + JSON.stringify(err))
      },
    })
 	 </script>
  </form>
</main>
</body>
</html>