<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Kakao JavaScript SDK</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <link href="../../resources/css/jhw-css.css" rel="stylesheet" type="text/css"></link>
    <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('462d788e255fdcdb4d15f3147b2698f0');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
</head>
<body>

<form name="myForm">
<input type="hidden" id="user-id" name="id" />
<input type="hidden" id="user-name" name="name" />
  <a id="kakao-login-btn"></a>

  <script type="text/javascript">
  function gopagePost() { 
	  document.myForm.action="/user/register"; 
	  document.myForm.method="post"; 
	  
	  document.myForm.submit();
  }
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {	// authObj 인증에서 토큰을 받기위한 요청
        Kakao.API.request({
          url: '/v2/user/me',		// 사용자 정보를 가져옴(토큰을 받음) 24시간동안 탭끄기전까지
          success: function(res) {
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
</body>
</html>
<!-- success: function(res) 예시 -->
<!-- {"id":1770313652,"connected_at":"2021-06-16T14:16:54Z", -->
<!-- "properties":{"nickname":"이태원프리덤","profile_image": -->
<!-- "http://k.kakaocdn.net/dn/LIxUv/btq6BabFzgi/JyAEOnrStXwVEiXYH9ces0/img_640x640.jpg", -->
<!-- "thumbnail_image":"http://k.kakaocdn.net/dn/LIxUv/btq6BabFzgi/JyAEOnrStXwVEiXYH9ces0/img_110x110.jpg"}, -->
<!-- "kakao_account":{"profile_needs_agreement":false,"profile":{"nickname":"이태원프리덤","thumbnail_image_url": -->
<!-- "http://k.kakaocdn.net/dn/LIxUv/btq6BabFzgi/JyAEOnrStXwVEiXYH9ces0/img_110x110.jpg","profile_image_url": -->
<!-- "http://k.kakaocdn.net/dn/LIxUv/btq6BabFzgi/JyAEOnrStXwVEiXYH9ces0/img_640x640.jpg","is_default_image":false}}} -->



