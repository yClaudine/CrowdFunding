<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>
      
    
    <style>
    .content-wrap{
        overflow: hidden;
        width: 1200px;
        margin: 0 auto;
    }
    .left-content{
        float: left;
        width: 15%;
    }
    .main-content{
        float: left;
        width: 85%;
        padding: 80px;
        padding-top: 85px;
    }
    .left-content>.title{
        text-align: center;
        font-size: 30px;
        padding: 20px;
    }
    .manager-menu{
        list-style-type: none;
        margin: 0;
        padding: 0;
        border: 1px solid lightgray;
    }
    .manager-menu>li{
        text-align: center;
        height: 50px;
        line-height: 50px;
        font-size: 15px;
        color: gray;
        font-weight: bolder;
    }
    .manager-menu>li>a{
        display: block;
        text-decoration: none;
        color: #212529;
        background-color:#f2f4f6;
        text-align: center;
        height: 50px;
        line-height: 50px;
        font-size: 15px;
    }
    .manager-menu>li>a:hover{
        color: #e7f9f9;
        cursor: pointer;
        background-color: #00b2b2;
    }
    .manager-menu .active-menu{
        color: #00b2b2;
        font-weight: bold;
    }
    .main-content>.btn{
        font-size: 15px;
        margin: 5px;
    }
    .main-content>.btn-outline-primary, .coupon-modal .close-btn{
        color:#00b2b2;
        border: 1.5px solid #00b2b2;
    }
   .main-content>.btn-outline-primary:hover, .coupon-modal .close-btn:hover{
        background-color: #00b2b2;
        border: 1px solid #d1e2e2;;
        color:white;
        cursor: pointer;
    }
    .main-content>.btn-primary{
        color: whitesmoke ;
        background-color: #02c9c9;
        border: 1px solid #02c9c9;
    }
    .main-content>.btn-primary:hover{
        background-color: #00b2b2;
        border: 1px solid white;
        border: 1px solid #00b2b2;
    }
    .table{
        margin-top: 50px;
    }
    .table>*{
        text-align: center;
    }
    .table>tbody>tr:hover{
        background-color: #e7f9f9;
    }
    input[name="radio"]:hover{
        cursor: pointer;
    }
    .coupon-modal{
    	display:none;
    	width: 100%;
    	height: 100%;
    	position: absolute;
    	top:0px;
    	left: 0px;
    	background-color: rgba(0,0,0,0.3);
    	align-items: center;
    }
    .modal-div{
    	margin: 0 auto;
    	margin-top : 150px;
    	background-color: #ffffff;
    	width: 500px;
    	height: auto;
    	padding: 30px;
    	border-radius : 5px;
    }
    .modal-title{
    	width: 300px;
    	margin: 0 auto;
    	color: #02c9c9 ;
        font-size: 20px;
        text-align: center;
    }
    .coupon-table{
    	margin: 10px auto;
    }
    .coupon-table tr{
    	border-bottom : 1px solid gray;
    }
    .coupon-table th{
    	border: 1px solid gray;
    	text-align: center;
    	background-color: #e7f9f9;
    	padding: 8px;
    	font-size: 13px;
    }
    .coupon-table td{
    	padding: 8px;
    	text-align: center;
    }
    .close-btn{
 		text-align: center;
    	width: 50px;
    	margin: 0 auto;
    }
    .couponName{
    	text-decoration:none;
    	color: #212529;
    }
    .couponName:hover{
    	cursor:pointer;
    }
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap">
		<div class="left-content">
	        <div class="title">쿠폰관리</div>
	        <div class="menu-wrap">
	            <ul class="manager-menu">
	                <li>관리자페이지</li>
	                <li><a href="#">펀딩관리</a></li>
	                <li><a href="#">스토어관리</a></li>
	                <li><a href="#">회원관리</a></li>
	                <li><a href="/couponManage.do" class="active-menu">쿠폰관리</a></li>
	            </ul>
	        </div>
	    	</div>
    	<div class="main-content">
	        <button type="button" class="btn btn-outline-primary insert">쿠폰등록</button>
	        <button type="button" class="btn btn-primary modify">수정하기</button>
	        <button type="button" class="btn btn-primary delete">삭제하기</button>
	            <table class="table table-hover">
	                <thead>
	                    <tr>
	                        <th scope="col"></th>
	                        <th scope="col">쿠폰번호</th>
	                        <th scope="col">쿠폰명</th>
	                        <th scope="col">유효기간</th>
	                        <th scope="col">상태</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${list }" var="cp">
	                	<tr>
	                        <th scope="col"><input type="radio" name="radio" value="${cp.couponNo }"></th>
	                        <td>${cp.couponNo }</td>
	                        <td>
	                        	<a class="couponName" target="#coupon-detail">${cp.couponName }</a>
	                        	<!-- 모달 위한 값 숨겨놓기 -->
	                        	<input type="hidden" value="${cp.validStart } ~ ${cp.validEnd }">
	                        	<input type="hidden" value="${cp.discount}">
	                        	<input type="hidden" value="${cp.couponType}">
	                        	<input type="hidden" value="${cp.mainTarget}">
	                        	<input type="hidden" value="${cp.subTarget}">
	                        	<input type="hidden" value="${cp.minPrice }">
	                        </td>
	                        <td>${cp.validStart } ~ ${cp.validEnd }</td>
	                        <c:choose>
	                        	<c:when test="${cp.couponStatus eq 0}">
	                        		<td>준비중</td>
	                       		</c:when>
	                       		<c:when test="${cp.couponStatus eq 1}">
	                        		<td>진행중</td>
	                       		</c:when>
	                       		<c:otherwise>
	                       			<td>만료</td>
	                       		</c:otherwise>
	                       	</c:choose>	
	                    </tr>
	                	</c:forEach>
	                </tbody>
	           </table>
    	</div>
	</div>
	
    <!-- 모달 -->
         	<div id="coupon-detail" class="coupon-modal"  >
         	<div class="modal-div">
         		<div class="modal-title"> 쿠폰상세보기</div>
	           	<table border="1" class="coupon-table">
	           		<tr>
						<th>쿠폰명</th>
						<td id="couponName"></td>
					</tr>
					<tr>
						<th>유효기간</th>
						<td id="validDate"></td>
					</tr>
					<tr>
						<th>할인액</th>
						<td id="discount"></td>
					</tr>
					<tr>
						<th>쿠폰적용카테고리(메인)</th>
						<td id="mainTarget"></td>
					</tr>
					<tr>
						<th>쿠폰적용카테고리(서브)</th>
						<td id="subTarget"></td>
					</tr>
					<tr>
						<th>최소구매금액</th>
						<td id="minPrice"></td>
					</tr>
	           	</table>
	           	<div class="close-btn btn-outline-primary">닫기</div>
         	</div>
         		
          </div>

<script>
//모달클릭
$(".couponName").on("click",function(){
	const couponName = $(this).text();
	const validDate = $(this).next().val();
	let discount = Number($(this).next().next().val()).toLocaleString('ko-KR');
	if(discount == 0){
		discount = "";
	}
	let couponType = $(this).next().next().next().val();
	if(couponType == 0){
		couponType = "무료배송";
	}else if(couponType ==1){
		couponType="%";
	}else{
		couponType="원"
	}
	const mainTarget = $(this).next().next().next().next().val();
	const subTarget = $(this).next().next().next().next().next().val();
	const minPrice = Number($(this).next().next().next().next().next().next().val());
	$("#couponName").text(couponName);
	$("#validDate").text(validDate);
	$("#discount").text(discount+couponType);
	$("#mainTarget").text(mainTarget);
	$("#subTarget").text(subTarget);
	$("#minPrice").text(minPrice.toLocaleString('ko-KR'));
	$(".coupon-modal").show();

});

//모달닫기
$(".close-btn").on("click",function(){
	$(".coupon-modal").hide();
});


//쿠폰등록
$(".insert").on("click",function(){
	location.href="/insertCouponFrm.do";
});


//삭제버튼
$(".delete").on("click",function(){
    //쿠폰코드 가져오기
    const check = $("input[name='radio']:checked").val();
    if(check == null){
        alert("삭제할 쿠폰을 선택해주세요");
    }else{
    	if($("input[name='radio']:checked").parent().next().next().next().next().text() == "준비중"){
    		location.href="/deleteCoupon.do?couponNo="+check;
    	}else{
    		alert("게시 완료된 쿠폰은 삭제할 수 없습니다.");
    	}
    }
});
//수정버튼
$(".modify").on("click",function(){
    const check = $("input[name='radio']:checked").val();
    if(check == null){
        alert("수정할 쿠폰을 선택해주세요");
    }else{
    	if($("input[name='radio']:checked").parent().next().next().next().next().text() == "준비중"){
            location.href="/updateCouponFrm.do?couponNo="+check;
    	}else{
    		alert("게시 완료된 쿠폰은 수정할 수 없습니다.");
    	}
    }
});

</script>
</body>
</html>