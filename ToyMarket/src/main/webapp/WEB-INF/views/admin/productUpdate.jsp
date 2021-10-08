<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  	<title>상품수정</title>
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
  		
  		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
    	-webkit-appearance: none;
    	margin: 0;
			}
  		
  	</style>
</head>
<body>
    <div class="container">
    <%@ include file="../common/adminHeader.jsp" %>
        <main>
            <div class="container">
            <c:choose>
				<c:when test="${param.fail eq 'blank' }">
					<div class="row">
						<div class="col-12">
							<div class="alert alert-warning">
								<strong>필수입력사항을 입력해주세요</strong> 
								필수입력사항 : 카테고리, 상품명, 제조사명, 상품가격, 판매단위, 중량/용량, 상품설명
							</div>
						</div>
					</div>
				</c:when>
			</c:choose>
                <form method="post" action="/admin/product/update" enctype="multipart/form-data" >
                    <div class="row">
                        <span class="border-bottom border-2 border-dark"><h1>상품수정</h1></span>
                        <div class="col-6">
                            <div class="mb-3 mt-3">
                                <label for="formFile" class="form-label "><h3>상품 이미지</h3></label>
                                <input class="form-control" type="file" accept="img/*" id="uplodeImg" onchange="setThumbnail(event)" name="image">
                                
                                <div id="image_container" ><img alt="" src="${product.image }"></div>
                            </div>
                        </div>
                        <div class="col-1 mt-5">
                           	<h6 class="mt-4">카테고리: </h6>
                            <h6 style="margin-top: 35px;">상품명: </h6>
                            <h6 style="margin-top: 35px;">제조사: </h6>
                            <h6 style="margin-top: 35px;">상품가격: </h6>
                            <h6 style="margin-top: 35px;">할인율: </h6>
                            <h6 style="margin-top: 35px;">할인여부: </h6>
                            <h6 style="margin-top: 35px;">샛별배송: </h6>
                            <h6 style="margin-top: 35px;">재고량: </h6>
                            <h6 style="margin-top: 35px;">판매단위: </h6>
                            <h6 style="margin-top: 35px;">중량/용량: </h6>
                            <h6 style="margin-top: 35px;">판매상태: </h6>                                                                  
                        </div>
                        <div class="col-5">
                            <h3 class="mb-3 mt-3">상품 정보 수정</h3>
                            <input type="text" hidden="" value="${product.no }" name="updateNo">                        
                            <select class="form-select mb-3" aria-label="Default select example" name="categoryNo" style="width: 300px;">
                                <option disabled>카테고리</option>
                                <c:forEach var="category" items="${category }" varStatus="loop">
                                	<option value="${category.no}"${category.no eq product.categoryNo ? 'selected' : '' }>${category.name }</option>
                            	</c:forEach>
                            </select>
                            <div class="mb-3">
                                <input type="text" class="form-control"  value="${product.name }" name="name">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="floatingInput" value="${product.brand }" name="brand">
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" id="floatingInput" value="${product.price}" min="0" name="price">
                                
                            </div>
                            <div class="mb-3">
                                <input type="number" class="form-control" id="floatingInput" value="${product.discountRate *100}" min="0" max="100" name="discountRate">
                                
                            </div>
                            <select class="form-select mb-3" aria-label="Default select example" style="width: 300px;" name="discountYN">
                                <option  disabled>할인여부</option>
                                <c:if test="${product.discountYN = Y }">
                                <option value="Y" selected>Y</option>
                                <option value="N" >N</option>
                                </c:if>
                                <option value="Y" >Y</option>
                                <option value="N" selected>N</option>
                            </select>
                            <select class="form-select mb-3" aria-label="Default select example" style="width: 300px;" name="morningDeliveryYN">
                                <option selected disabled>샛별배송여부</option>
                                <c:if test="${product.morningDeliveryYN eq 'Y' }">
                                <option value="Y" selected>Y</option>
                                <option value="N" >N</option>
                                </c:if>
                                <option value="Y" >Y</option>
                                <option value="N" selected>N</option>
                            </select>
                            <div class="mb-3">
                                <input type="number" class="form-control" id="floatingInput" value="${product.stock }" min="0" name="stock">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="floatingInput" value="${product.sellUnit }" name="sellUnit">
                            </div>
                            <div class="mb-3">
                                <input type="text" class="form-control" id="floatingInput" value="${product.weight }" name="weight">
                            </div>
                            <select class="form-select mb-3" aria-label="Default select example" style="width: 300px;" name="status">
                                <option selected disabled>판매상태</option>
                                <c:if test="${product.status eq '판매' }">
                                <option value="판매" selected>판매</option>                              
                                <option value="판매중지">판매중지</option>
                                </c:if>                               
                                <option value="판매">판매</option>                              
                                <option value="판매중지" selected>판매중지</option>
                            </select>
                        </div>                                                                                  
                    </div>                    
                    <div class="row">
                        <div class="col-12">                        
                            <div class="mb-3">
                                <textarea class="form-control" style="height: 300px;" name="description">${product.description }</textarea>
                            </div>
                            <div class="">
                                <textarea class="form-control" style="height: 100px;" name="subTitle">${product.subTitle }</textarea>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button type="submit" class="btn btn-primary">등록</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>            
        </main>
    </div>
<script> 
	function setThumbnail(event) { 
	document.querySelector("div#image_container").innerHTML = "";

	var reader = new FileReader(); 
	
	var img = document.createElement("img"); 
	img.setAttribute("class", "img-thumbnail")

	reader.onload = function(event){ 		
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img); 
	}; 
		
	reader.readAsDataURL(event.target.files[0]); }
</script>
</body>
</html>

