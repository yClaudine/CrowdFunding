<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰수정</title>
</head>
<style>
.content-wrap {
	overflow: hidden;
	width: 1200px;
	margin: 0 auto;
	border-top: 1px solid #bfbfbf;
}

.left-content {
	float: left;
	width: 15%;
}

.main-content {
	float: left;
	width: 75%;
	padding: 80px;
	padding-top: 85px;
}

.left-content>.title {
	text-align: center;
	font-size: 30px;
	padding: 20px;
}

.manager-menu {
	list-style-type: none;
	margin: 0;
	padding: 0;
	border: 1px solid lightgray;
}

.manager-menu>li {
	text-align: center;
	height: 50px;
	line-height: 50px;
	font-size: 15px;
	color: gray;
	
}

.manager-menu>li>a {
	display: block;
	text-decoration: none;
	color: #212529;
	background-color: #f2f4f6;
	text-align: center;
	height: 50px;
	line-height: 50px;
	font-size: 15px;
}

.manager-menu>li>a:hover {
	color: #e7f9f9;
	cursor: pointer;
	background-color: #00b2b2;
}

.manager-menu .active-menu {
	color: #00b2b2;
	font-weight: bold;
}

.main-content .btn {
	font-size: 20px;
	margin: 5px;
	height: 50px;
	line-height: 25px;
}

.main-content .btn-outline-primary {
	color: #00b2b2;
	border: 1px solid #00b2b2;
	display: block;
	margin: 5px auto;
	width: 99%;
}

.main-content .btn-outline-primary:hover {
	background-color: #00b2b2;
	border: 1px solid #d1e2e2;;
	color: white;
}

.main-content .btn-primary {
	color: whitesmoke;
	background-color: #02c9c9;
	border: 1px solid #02c9c9;
	display: block;
	border-radius: 5px;
	margin:0;
	margin-bottom:5px;
}

.main-content .btn-primary:hover {
	color: whitesmoke;
	background-color: #02c9c9;
	border: 1px solid #02c9c9;
	display: block;
	cursor: default;
}

.coupon-table {
	width: 100%;
	margin-bottom: 30px;
	font-size: 13px;
}
.coupon-table tr{
	border-bottom: 2px solid #f2f4f6;
	height: 100px;
}
.coupon-table th {
	width: 20%;
	text-align: center;
	background-color: #e7f9f9;
	border-bottom: 2px solid white;
	padding: 20px;
	font-size: 13px;
}

.coupon-table td {
	text-align: left;
	padding: 15px;
}

.coupon-table tr>td:first-of-type {
	width: 30px;
}

.coupon-table select {
	width: 180px;
}

.coupon-table p {
	margin: 0;
}
input, select{
	border: 0.5px solid gray;
	padding: 3px;
}
</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content-wrap">
		<div class="left-content">
			<div class="title">쿠폰관리</div>
			<div class="menu-wrap">
				<ul class="manager-menu">
					<li>관리자페이지</li>
					 <li><a href="/fundManage.do?reqPage=1&keyword=&type=all" >펀딩관리</a></li>
                    <li><a href="/storeManage.do?reqPage=1&keyword=&type=all"  >스토어관리</a></li>
                    <li><a href="/memberManage.do?reqPage=1&keyword=&type=all" >회원관리</a></li>
                    <li><a href="/couponManage.do?reqPage=1&keyword=&type=3" class="active-menu">쿠폰관리</a></li>
				</ul>
			</div>
		</div>
		<div class="main-content">
			<div class="btn btn-primary">쿠폰수정</div>
			<form action="/updateCoupon.do" method="post">
				<input type="hidden" name="couponNo" value="${coupon.couponNo }">
				<table class="coupon-table">
					<tr>
						<th>쿠폰명</th>
						<td colspan="3"><input type="text" name="couponName" value="${coupon.couponName }" style="width: 100%;"></td>
					</tr>
					<tr>
						<th>유효기간</th>
						
						<c:choose>
							<c:when test="${empty coupon.validStart }">
								<!-- 유효기간 미지정 일 때-->
								<td>
									<input type="radio" name="validDate" value="none" id="empty" checked> 
									<label for="empty">미지정</label> 
									<input type="radio" name="validDate" value="fixed" id="full"> 
									<label for="full">지정</label>
								</td>
								<td colspan="2" class="couponDate">
									<input type="date" name="validStart" id="start" readonly> ~ 
									<input type="date" name="validEnd" id="end" readonly>
								</td>
							</c:when>
							<c:otherwise>
								<!-- 유효기간 지정 일 때 -->
								<td>
									<input type="radio" name="validDate" value="none" id="empty"> 
									<label for="empty">미지정</label> 
									<input type="radio" name="validDate" value="fixed" id="full" checked> 
									<label for="full">지정</label>
								</td>
								<td colspan="2" class="couponDate">
									<input type="date" name="validStart" id="start" value="${coupon.validStart }" > ~ 
									<input type="date" name="validEnd" id="end" value="${coupon.validEnd }">
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>할인액</th>
						
						<c:choose>
							<c:when test="${coupon.couponType eq 0}">
								<td><input type="text" name="discount" value=0 readonly></td>
								<td>
									<select name="couponType">
										<option value=0 selected>배송비무료</option>
										<option value=1 >%</option>
										<option value=2>원</option>
									</select>
								</td>
								<td></td>
							</c:when>
							<c:when test="${coupon.couponType  eq 1}">
								<td><input type="text" name="discount" value="${coupon.discount }"></td>
								<td>
									<select name="couponType">
										<option value=0>배송비무료</option>
										<option value=1 selected>%</option>
										<option value=2>원</option>
									</select>
								</td>
								<td></td>
							</c:when>
							<c:otherwise>
								<td><input type="text" name="discount" value="${coupon.discount }"></td>
								<td>
									<select name="couponType">
										<option value=0>배송비무료</option>
										<option value=1>%</option>
										<option value=2 selected>원</option>
									</select>
								</td>
								<td></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<c:choose>
								<c:when test="${coupon.mainTarget eq 'fund'}">
									<select name="mainTarget">
										<option value="all">전체</option>
										<option value="fund" selected>펀딩</option>
										<option value="store">스토어</option>
									</select>
								</c:when>
								<c:when test="${coupon.mainTarget eq 'store'}">
									<select name="mainTarget">
										<option value="all">전체</option>
										<option value="fund">펀딩</option>
										<option value="store" selected>스토어</option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="mainTarget">
										<option value="all" selected>전체</option>
										<option value="fund">펀딩</option>
										<option value="store">스토어</option>
									</select>
								</c:otherwise>
							</c:choose>
						</td>
						<td colspan="2">
							<c:choose>
								<c:when test="${coupon.subTarget eq 'living'}">
									<select name="subTarget">
										<option value="all">전체</option>
										<option value="living" selected>리빙</option>
										<option value="beauty">뷰티</option>
										<option value="pet">반려동물</option>
										<option value="travel">여행</option>
										<option value="food">푸드</option>
									</select>
								</c:when>
								<c:when test="${coupon.subTarget eq 'beauty'}">
									<select name="subTarget">
										<option value="all">전체</option>
										<option value="living">리빙</option>
										<option value="beauty" selected>뷰티</option>
										<option value="pet">반려동물</option>
										<option value="travel">여행</option>
										<option value="food">푸드</option>
									</select>
								</c:when>
								<c:when test="${coupon.subTarget eq 'pet'}">
									<select name="subTarget">
										<option value="all">전체</option>
										<option value="living">리빙</option>
										<option value="beauty">뷰티</option>
										<option value="pet" selected>반려동물</option>
										<option value="travel">여행</option>
										<option value="food">푸드</option>
									</select>
								</c:when>
								<c:when test="${coupon.subTarget eq 'travel'}">
									<select name="subTarget">
										<option value="all">전체</option>
										<option value="living">리빙</option>
										<option value="beauty">뷰티</option>
										<option value="pet">반려동물</option>
										<option value="travel" selected>여행</option>
										<option value="food">푸드</option>
									</select>
								</c:when>
								<c:when test="${coupon.subTarget eq 'food'}">
									<select name="subTarget">
										<option value="all">전체</option>
										<option value="living">리빙</option>
										<option value="beauty">뷰티</option>
										<option value="pet">반려동물</option>
										<option value="travel">여행</option>
										<option value="food" selected>푸드</option>
									</select>
								</c:when>
								<c:otherwise>
									<select name="subTarget">
										<option value="all" selected>전체</option>
										<option value="living">리빙</option>
										<option value="beauty">뷰티</option>
										<option value="pet">반려동물</option>
										<option value="travel">여행</option>
										<option value="food">푸드</option>
									</select>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>최소 구매금액</th>
						<c:choose>
							<c:when test="${coupon.minPrice eq 0}">
								<td>
									<input type="radio" name="price" value="none" id="none" checked>
									<label for="none">미지정</label> 
									<input type="radio" name="price" value="fixed" id="fixed"> 
									<label for="fixed">지정</label>
								</td>
								<td><input type="text" name="minPrice" value="0" readonly>원</td>
								<td></td>
							</c:when>
							<c:otherwise>
								<td>
									<input type="radio" name="price" value="none" id="none">
									<label for="none">미지정</label> 
									<input type="radio" name="price" value="fixed" id="fixed" checked> 
									<label for="fixed">지정</label>
								</td>
								<td><input type="text" name="minPrice" value="${coupon.minPrice}">원</td>
								<td></td>
							</c:otherwise>
						</c:choose>
						
					</tr>
				</table>
				<input type="submit" value="수정하기" class="btn btn-outline-primary">
			</form>

		</div>
	</div>

<script>

//쿠폰 유효기간 시작일 제한
function formatDate(){
  const d = new Date();
  month = ""+(d.getMonth()+1);
  day = ""+d.getDate();
  year = d.getFullYear();
  if(month.length<2){
      month = "0"+month;
  }
  if(day.length<2){
      day = "0"+day;
  }
  return [year, month, day].join('-');
}



//유효기간 지정시 -> 달력활성화 및 시작일, 끝나는날 제한
$("input[name='validDate']").on("change",function(){
    const check = $("input[name='validDate']:checked").val();
    const validStart = $("#start");
    const validEnd = $("#end");
    if(check == "fixed"){
        $($(".couponDate").children()).attr("readonly",false);
        validStart.on("click",function(){
            validStart.attr("min",formatDate());
            if(validEnd.val() != ''){
                validStart.attr("max",validEnd.val());
            }else{
                validStart.removeAttr("max");
            }
        });
        validEnd.on("click",function(){
            if(validStart.val() != ''){
                validEnd.attr("min",validStart.val());
            }else{
                validEnd.attr("min",formatDate());
            }
        });
    }else{
        validStart.val("");
        validEnd.val("");
        $($(".couponDate").children()).attr("readonly",true);
    }

});


//배송비무료 지정시
$("select[name='couponType']").on("change",function(){
  const couponType = $("select[name='couponType']").val();
  const discount = $("input[name='discount']");
  if(couponType == 0){
      discount.val(0);
      discount.attr("readonly",true);
  }else{
      discount.attr("readonly",false)
  }
});

//최소구매금액 지정시
$("input[name='price']").on("change",function(){
  const price= $(this).val();
  const minPrice = $("input[name='minPrice']");
  if(price == "fixed"){
      minPrice.attr("readonly",false);
  }else{
      minPrice.val(0);
      minPrice.attr("readonly",true);
  }
});

//숫자 유효성검사
const discount = $("input[name='discount']");
discount.on("change",function(){
  const dcReg = /^[0-9]+$/;
  if(!dcReg.test(discount.val())){
      discount.parent().next().next().text("숫자만 입력해주세요").css("color","red").css("font-size","13px");
  }else{
      discount.parent().next().next().text("");
  }
});
const minPrice = $("input[name='minPrice']");
minPrice.on("change",function(){
  const dcReg =  /^[0-9]+$/;
  if(!dcReg.test(minPrice.val())){
      minPrice.parent().next().text("숫자만 입력해주세요").css("color","red").css("font-size","13px");
  }else{
      minPrice.parent().next().text("");
  }
});

//제출하기 검사 
$("input[type='submit']").on("click",function(e){
 
  const checkArr = [false, false, false, false];

  const couponName = $("input[name='couponName']").val();
  if(couponName != ""){
      checkArr[0] = true;
  }

  const validDate = $("input[name='validDate']:checked").val();
  if(validDate == "none"){
      checkArr[1] = true;
  }else if(validDate == "fixed"){
      const validStart = $("#start").val();
      const validEnd = $("#end").val();
      if(validStart == "" || validEnd == ""){
          checkArr[1] = false;
      }else{
          checkArr[1] = true;
      }
  }

  const couponType = $("select[name='couponType']").val();
  if(couponType==1 || couponType==2){
      if($("input[name='discount']").val() > 0){
          checkArr[2] = true;
      }else{
          checkArr[2] = false;
      }
  }else if(couponType == 0){
      checkArr[2] = true;
  }

  const price = $("input[name='price']:checked").val();
  if(price == "none"){
      checkArr[3] = true;
  }
  if(price == "fixed"){
      if($("input[name='minPrice']").val() >0){
          checkArr[3] = true;
      }else{
          checkArr[3] = false;
      }
  }
  

  if(!(checkArr[0]&&checkArr[1]&&checkArr[2]&&checkArr[3])){
      e.preventDefault();
      alert("입력값을 확인해주세요");
  }


});
</script>

</body>
</html>