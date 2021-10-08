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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="container">
	<header>
		<%@include file="../common/header.jsp" %>
	</header>
	<main>
		<div class="row mb-3"> 
			<div class="col-12">
				<h3 class="border p-3 bg-light">마켓컬리 회원가입</h3>
			</div>
		</div>
			<c:if test="${param.fail eq 'idOverlap' }">
				<div class="col-12">
					<div class="alert alert-danger">
						<strong>이미 사용중인 아이디입니다.</strong> 
					</div>
				</div>
			</c:if>
			<c:if test="${param.fail eq 'emailOverlap' }">
				<div class="col-12">
					<div class="alert alert-danger">
						<strong>이미 사용중인 이메일입니다.</strong> 
					</div>
				</div>
			</c:if>
			<c:if test="${param.fail eq 'phoneOverlap' }">
				<div class="col-12">
					<div class="alert alert-danger">
						<strong>이미 사용중인 전화번호입니다.</strong> 
					</div>
				</div>
			</c:if>
		<div class="row">
			<div class="col-12">
				<form id="register-form" action="register" method="post" class="border p-3 bg-light">
					
					<div class="form-group">
					<!-- 카카오로 타고 들어왔을때 블럭 처리 -->
					<c:choose>
						<c:when test="${param.iskakao eq 'yes' }">
						<input type="hidden" id="is-kakao" name="iskakao" value="yes" />
							<label>아이디*</label>
							<input type="text" class="form-control" id="user-id" name="id" value="${param.id}" readonly />
						</c:when>
		   				<c:otherwise>
		   					<label>아이디*</label>
		   					<input type="text" class="form-control" id="user-id" name="id" />
		   				</c:otherwise>
		   			</c:choose>
					</div>
					<div class="form-group pb-2">
					<!-- 카카오로 타고 들어왔을때 블럭 처리 -->
					<c:choose>
						<c:when test="${param.iskakao eq 'yes' }">
							<label>이름*</label>
							<input type="text" class="form-control" id="user-name" name="name" value="${param.name}" readonly />
						</c:when>	
						<c:otherwise>
							<label>이름*</label>
							<input type="text" class="form-control" id="user-name" name="name" />
						</c:otherwise>
					</c:choose>
					</div>
					<div class="form-group pb-2">
						<label>이메일*</label>
						<input type="email" class="form-control" id="user-email" name="email" />
					</div>
					<div class="form-group pb-2">
						<label>비밀번호*</label>
						<input type="password" class="form-control" id="user-pwd" name="password" />
					</div>
					<div class="form-group pb-2">
						<label>비밀번호 확인*</label>
						<input type="password" class="form-control" id="user-pwd-confirm" name="passwordConfirm" />
					</div>
					<div class="form-group pb-2">
						<label>전화번호*</label>
						<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" 
								class="form-control" id="user-phone" name="phone" />
					</div>
					<div class="form-group pb-2">
						<label>주소입력*</label><br>
						<input type="text" id="user_postcode" name="postalCode" placeholder="우편번호" readonly />
						<input type="button" onclick="user_execDaumPostcode()" value="우편번호 찾기" />
						<input type="text" class="form-control" id="user_address" name="address1" placeholder="주소" readonly >
						<input type="text" class="form-control" id="user_detailAddress" name="address2" placeholder="상세주소를 입력해주세요">
					</div>
					<label>성별</label>
					<div class="form-group form-check pb-2">
						<input type="radio" class="form-check-input" id="user-gender" name="gender" value="male" >
						<label class="form-check-label" onclick="getGender(event))">남성</label>
					</div>
					<div class="form-group form-check pb-2">
						<input type="radio" class="form-check-input" id="user-gender" name="gender" value="female" >
						<label class="form-check-label" onclick="getGender(event)">여성</label>
					</div>
					<div class="form-group pb-2">
						<label>생년월일</label>
					<input type="date" class="input" id="user-birth" name="birth">
					</div>
					<div class="form-group form-check">
						<input type="checkbox" class="form-check-input" id="check-me">
						<label class="form-check-label">개인정보 제공 동의</label>
					</div>
					<div class="text-right">
						<a href="../index.jsp" class="btn btn-secondary">취소</a>
						<button type="button" class="btn btn-primary" onclick="checkForm()">등록</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	</div>
	
	<script type="text/javascript">
		function checkForm() {
			// 입력필드의 유효성 체크하기
			var userIdEl= document.getElementById("user-id");	
			if (!userIdEl.value.trim()) { 
				alert("아이디는 필수입력값입니다.");
				userIdEl.focus();
				return;
			}
			if (userIdEl.value.trim().length < 4) {
				alert("아이디는 4글자 이상으로 입력해야 합니다.");
				userIdEl.focus();
				return;
			}
			if (!/^[a-zA-Z0-9]+$/.test(userIdEl.value.trim())) {
				alert("아이디는 영어대소문자,숫자만 허용됩니다.");
				userIdEl.focus();
				return;
			}
			var userEmailEl= document.getElementById("user-name");	
			if (!userEmailEl.value.trim()) { 
				alert("이름은 필수입력값입니다.");
				userEmailEl.focus();
				return;
			}
			
			var userEmailEl= document.getElementById("user-email");	
			if (!userEmailEl.value.trim()) { 
				alert("이메일은 필수입력값입니다.");
				userEmailEl.focus();
				return;
			}
			var passwordEl = document.getElementById("user-pwd");
			var passwordConfirmEl = document.getElementById("user-pwd-confirm");
			if (passwordEl.value != passwordConfirmEl.value) {
				alert("비밀번호가 서로 일치하지 않습니다.");
				passwordConfirmEl.value = "";
				passwordConfirmEl.focus();
				return;
			}
			var phoneEl = document.getElementById("user-phone");
			if (!phoneEl.value.trim()){
				alert("휴대폰번호를 적어주세요.");
				phoneEl.value = "";
				phoneEl.focus();
				return;
			}
			if (phoneEl.value.trim().length > 12) {
				alert("전화번호는 12개 숫자 미만으로 입력해야 합니다.");
				phoneEl.focus();
				return;
			}
			var userPostcodeEl= document.getElementById("user_postcode");	
			if (!userEmailEl.value.trim()) { 
				alert("주소입력은 필수입력값입니다.");
				userEmailEl.focus();
				return;
			}
			var checkMe = document.querySelector("#check-me").checked;
			if (!checkMe) {
				alert("개인정보 동의여부는 반드시 체크해야 합니다.");
				return;
			}
			document.getElementById("register-form").submit();		
		}
		
		// 주소 입력필드
		 function user_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_postcode').value = data.zonecode;
                document.getElementById("user_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_detailAddress").focus();
            }
        }).open();
    }
	</script>
</body>
</html>