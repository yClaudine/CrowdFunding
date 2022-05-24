<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
 <style>


.content-wrap{
    width: 1200px;
    margin: 0 auto;        
}
.maintitle {
	text-align: center;
	padding: 30px;
	font-weight: bolder;
	font-size: 50px;
}
.main-content{
    margin: 70px;
     margin-top: 0;
    padding: 10px;
    border: 1px solid #bfbfbf;
    border-radius: 5px;
}
.content-top{
    border-bottom: 1px solid #868e96;
    padding: 10px;
}
.top-date{
    color: #868e96;
    font-size: 13px;
}
.content-main>*{
    justify-content:center;
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
}

.couponZone *{
    font-family: ns-medium;
}
.couponZone>*{
    margin-bottom: 25px;
}
.coupon-info>*{
    color:#868e96;
    font-size: 15px;
    margin: 30px;
}
.couponDetail{
	margin: 50px;
	margin-left: 130px;
	margin-right: 130px;
	padding: 30px;
	border: 1px solid #00b2b2;
	background-color: #e7f9f9;

}
.couponDetail>p{
 margin: 30px;
}
.btns{
    width: 300px;
    height: 50px;
}
.downloadBtn{
    background-color:#ffffff;
    color: #00c4c4;
    border: 2px solid #00c4c4;
    font-weight: 500;
}
.downloadBtn:hover{
    cursor: pointer;
    background-color: #00c4c4;
    color: #e7f9f9;
}
.goShopping{
	padding-bottom: 30px;
}
.shoppingBtn{
    background-color: #A29584;
    color: #f2f4f6;
    border: none;
    font-weight: 500;
}
.shoppingBtn:hover{
    cursor: pointer;
    font-size: 1.1em;
}
.img{
	padding:30px;
}
.img>img{
	width:70px;
	height:70px;
}
.manager-btn{
    overflow: hidden;
    margin: 70px;
    margin-bottom: 10px;
    margin-top: 10px;
    padding: 10px;
}
.buttons{
    width: 100px;
    height: 40px;
    color:#ffffff;
    background-color: #00c4c4;
    border:none;
    font-weight: 300;
    float: right;
    margin: 5px;
    border-radius: 5px;
}
.buttons:hover{
    cursor: pointer;
    font-size: 1.1em;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="content-wrap">
	<div class="maintitle">공지사항</div>
	<c:if test="${not empty sessionScope.m} && ${sessionScope.m.categoryNo eq 0}">
		<div class="manager-btn ">
			<input type="hidden" class="noticeNo" value="${notice.noticeNo }">
	        <button class="delete buttons">삭제하기</button>
	        <button class="modify buttons">수정하기</button>
	    </div>
	</c:if>
    <div class="main-content">
        <div class="content-top">
            <div class="top-title">${notice.noticeTitle }</div>
            <div class="top-date">
            	<c:choose>
            		<c:when test="${not empty notice.dateStart }">
            			${notice.dateStart } ~ ${notice.dateEnd }
            		</c:when>
            		<c:otherwise>${notice.regDate }</c:otherwise>
            	</c:choose>
            </div>
        </div>
        <div class="content-main">
            <div class="noticeContent">${notice.noticeContent }</div>
            	
            <c:if test="${not empty coupon }">
            <div class="couponZone">
                <div class="couponDetail">
                    <div class="img"><img src="/resources/image/파이널로고2.png"></div>
                    <p>쿠폰과 함께 FunfunFun에서</p>
                    <p>구석구석 즐겁게 쇼핑하세요!</p> 
                    <div class="download"><button class="btns downloadBtn">쿠폰 다운로드</button></div>
                    <div class="coupon-info">
                        <p>적용대상 | 
                        	<c:choose>
                        		<c:when test="${coupon.mainTarget eq 'all'}">모든
                        			<c:choose>
		                        		<c:when test="${coupon.subTarget eq 'beauty'}">뷰티</c:when>
		                        		<c:when test="${coupon.subTarget eq 'pet'}">애완용품</c:when>
		                        		<c:when test="${coupon.subTarget eq 'living'}">리빙</c:when>
		                        		<c:when test="${coupon.subTarget eq 'travel'}">여행</c:when>
		                        		<c:when test="${coupon.subTarget eq 'food'}">푸드</c:when>
		                        	</c:choose>
                        		</c:when>
                        		<c:when test="${coupon.mainTarget eq 'fund'}">펀딩
                        			<c:choose>
		                        		<c:when test="${coupon.subTarget eq 'all'}">모든</c:when>
		                        		<c:when test="${coupon.subTarget eq 'beauty'}">뷰티</c:when>
		                        		<c:when test="${coupon.subTarget eq 'pet'}">애완용품</c:when>
		                        		<c:when test="${coupon.subTarget eq 'living'}">리빙</c:when>
		                        		<c:when test="${coupon.subTarget eq 'travel'}">여행</c:when>
		                        		<c:when test="${coupon.subTarget eq 'food'}">푸드</c:when>
		                        	</c:choose>
                        		</c:when>
                        		<c:otherwise>스토어
                        			<c:choose>
		                        		<c:when test="${coupon.subTarget eq 'all'}">모든</c:when>
		                        		<c:when test="${coupon.subTarget eq 'beauty'}">뷰티</c:when>
		                        		<c:when test="${coupon.subTarget eq 'pet'}">애완용품</c:when>
		                        		<c:when test="${coupon.subTarget eq 'living'}">리빙</c:when>
		                        		<c:when test="${coupon.subTarget eq 'travel'}">여행</c:when>
		                        		<c:when test="${coupon.subTarget eq 'food'}">푸드</c:when>
		                        	</c:choose>
                        		</c:otherwise>
                        	</c:choose>
                        	
                        
                        
                        
                        아이템 구매 회원 누구나</p>
                        <p>유효기간 | 마이페이지>쿠폰>나의 쿠폰에서 사용기한을 확인해주세요.</p>
                    </div>
	               
            	</div>
            	 <div class="goShopping">
	                    <button class="btns shoppingBtn"> 쇼핑하기 > </button>
	                </div>
        	</div>
            </c:if>
            
    	</div>
	</div>
</div>
<script>
//삭제버튼
$(".delete").on("click",function(){
	 const noticeNo = $(".noticeNo").val();
	if(confirm("삭제 하시겠습니까?")){
		location.href="/deleteNotice.do?noticeNo="+noticeNo;
	}
});
//수정버튼
$(".modify").on("click",function(){
	const noticeNo = $(".noticeNo").val();
	location.href="/updateNoticeFrm.do?noticeNo="+noticeNo;
});


</script>


</body>
</html>