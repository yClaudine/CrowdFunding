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
    border-top: 1px solid #bfbfbf;
    
}
.content-top *{
	font-family: ns-medium;
}
.maintitle {
	text-align: center;
	padding: 30px;
	font-weight: bolder;
	font-size: 35px;
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
    overflow:hidden;
}
.content-main{
 	min-height: 500px;
}
.content-main>*:not(.noticeContent){
    justify-content:center;
    text-align: center;
    margin-top: 50px;
    margin-bottom: 50px;
}
.noticeContent{
	margin: 50px;
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
.couponDetail>p:nth-of-type(3){
	font-size: 20px;
	color: #00b2b2;
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
	font-size: 15px;
    width: 90px;
    height: 35px;
    background-color: #00c4c4;
    border: 1px solid #d1e2e2;
    color:white;
    font-weight: 300;
    float: right;
    margin: 5px;
    border-radius: 5px;
    border-radius: 10px;
}
.buttons:hover{
    background-color: #ffffff;
    border: 1px solid #00b2b2;
    color:#00b2b2;
    cursor: pointer;
    font-weight: 500;
}
.top-date>img{
	width: 50px;
	height: 50px;
}
.top-date>*{
	float:left;
}
.top-date p{
	margin: 0;
}
.top-date>div{
	height: 50px;
	padding-top: 5px;
	padding-left: 5px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>
<div class="content-wrap">
	<div class="maintitle">공지사항</div>
	<input type="hidden" class="noticeNo" value="${notice.noticeNo }">
	<c:if test="${not empty sessionScope.m && sessionScope.m.categoryNo eq 0}">
	<div class="manager-btn ">
        <button class="delete buttons">삭제하기</button>
        <button class="modify buttons">수정하기</button>
    </div>
	</c:if>
	
    <div class="main-content">
        <div class="content-top">
            <div class="top-title">${notice.noticeTitle }</div>
            <div class="top-date">
            	<img  src="/resources/image/파이널로고1.png">
            	<c:choose>
            		<c:when test="${not empty notice.dateStart }">
            			<div>
            				<p>FunFunFun</p>
            				<p>${notice.dateStart } ~ ${notice.dateEnd }</p>
            			</div>
            		</c:when>
            		<c:otherwise>
            		<div>
            			<p>FunFunFun</p>
            			<p>${notice.regDate }</p>
            		</div>
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>
        <div class="content-main">
            <div class="noticeContent">${notice.noticeContent }</div>
            	
            <c:if test="${not empty coupon }">
            <input type="hidden" class="couponNo" value="${coupon.couponNo }">
            <input type="hidden" class="validEnd" value="${coupon.validEnd }">
            <div class="couponZone">
                <div class="couponDetail">
                    <div class="img"><img src="/resources/image/파이널로고2.png"></div>
                    <p>쿠폰과 함께 FunFunFun에서</p>
                    <p>구석구석 즐겁게 쇼핑하세요!</p> 
                    <p>${coupon.couponName}</p>
                    <div class="download"><button class="btns downloadBtn">쿠폰 다운로드</button></div>
                    <div class="coupon-info">
                        <p>적용대상 | 
                        	<c:choose>
                        		<c:when test="${coupon.mainTarget eq 'all'}">
                        			<c:choose>
                        				<c:when test="${coupon.subTarget eq 'all'}">모든</c:when>
		                        		<c:when test="${coupon.subTarget eq 'beauty'}">뷰티</c:when>
		                        		<c:when test="${coupon.subTarget eq 'pet'}">애완용품</c:when>
		                        		<c:when test="${coupon.subTarget eq 'living'}">리빙</c:when>
		                        		<c:when test="${coupon.subTarget eq 'travel'}">여행</c:when>
		                        		<c:when test="${coupon.subTarget eq 'food'}">푸드</c:when>
		                        	</c:choose>
                        		</c:when>
                        		<c:when test="${coupon.mainTarget eq 'fund'}">
                        			<c:choose>
		                        		<c:when test="${coupon.subTarget eq 'all'}">펀딩</c:when>
		                        		<c:when test="${coupon.subTarget eq 'beauty'}">펀딩 뷰티</c:when>
		                        		<c:when test="${coupon.subTarget eq 'pet'}">펀딩 애완용품</c:when>
		                        		<c:when test="${coupon.subTarget eq 'living'}">펀딩 리빙</c:when>
		                        		<c:when test="${coupon.subTarget eq 'travel'}">펀딩 여행</c:when>
		                        		<c:when test="${coupon.subTarget eq 'food'}">펀딩 푸드</c:when>
		                        	</c:choose>
                        		</c:when>
                        		<c:otherwise>
                        			<c:choose>
		                        		<c:when test="${coupon.subTarget eq 'all'}">스토어</c:when>
		                        		<c:when test="${coupon.subTarget eq 'beauty'}">스토어 뷰티</c:when>
		                        		<c:when test="${coupon.subTarget eq 'pet'}">스토어 애완용품</c:when>
		                        		<c:when test="${coupon.subTarget eq 'living'}">스토어 리빙</c:when>
		                        		<c:when test="${coupon.subTarget eq 'travel'}">스토어 여행</c:when>
		                        		<c:when test="${coupon.subTarget eq 'food'}">스토어 푸드</c:when>
		                        	</c:choose>
                        		</c:otherwise>
                        	</c:choose>
                        
                        아이템 구매 회원 누구나</p>
                        <p>사용안내 | 마이페이지>쿠폰에서 사용기한 및 사용조건을 확인해주세요.</p>
                    </div>
	               
            	</div>
            	 <div class="goShopping">
	                    <button class="btns shoppingBtn"> 쇼핑하기 > </button>
	             </div>
	             <input type="hidden" class="mainTarget" value="${coupon.mainTarget }">
	             <input type="hidden" class="subTarget" value="${coupon.subTarget }">
        	</div>
            </c:if>
            
    	</div>
	</div>
	<c:choose>
	<c:when test="${not empty sessionScope.m && sessionScope.m.categoryNo ne 0}">
		<input type="hidden" class="memberNo" value="${sessionScope.m.memberNo }">
	</c:when>
	<c:otherwise>
		<input type="hidden" class="memberNo" value="0">
	</c:otherwise>
	</c:choose>
	
</div>
<script>
$(".shoppingBtn").on("click",function(){
	const mainTarget = $(".mainTarget").val();
	if(mainTarget == "fund"){
		location.href="/fund.do";
	}else if(mainTarget == "store"){
		location.href="/Store.do";
	}else{
		location.href="/";
	}
});

//오늘날짜가져오기
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


//쿠폰다운로드버튼
$(".downloadBtn").on("click",function(){
	const memberNo = $(".memberNo").val();
	const couponNo = $(".couponNo").val();
	const noticeNo = $(".noticeNo").val();
	const validEnd = $(".validEnd").val();
	const today = formatDate();
	if(validEnd<today){
		alert("만료된 쿠폰입니다.")
	}else{
		if(memberNo == 0){
			alert("회원 로그인이 필요합니다.");
		}else{
			location.href="/insertMemberCoupon.do?memberNo="+memberNo+"&couponNo="+couponNo+"&noticeNo="+noticeNo+"&validEnd="+validEnd;
		}
	}
});


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