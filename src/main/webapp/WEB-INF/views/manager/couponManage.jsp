<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    .btn{
        font-size: 15px;
        margin: 5px;
    }
    .btn-outline-primary{
        color:#00b2b2;
        border: 1.5px solid #00b2b2;
    }
    .btn-outline-primary:hover{
        background-color: #00b2b2;
        border: 1px solid #d1e2e2;;
        color:white;
    }
    .btn-primary{
        color: whitesmoke ;
        background-color: #02c9c9;
        border: 1px solid #02c9c9;
    }
    .btn-primary:hover{
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
    </style>
</head>
<body>
	<div class="content-wrap">
		<div class="left-content">
	        <div class="title">쿠폰관리</div>
	        <div class="menu-wrap">
	            <ul class="manager-menu">
	                <li>관리자페이지</li>
	                <li><a href="#">펀딩관리</a></li>
	                <li><a href="#">스토어관리</a></li>
	                <li><a href="#">회원관리</a></li>
	                <li><a href="#" class="active-menu">쿠폰관리</a></li>
	            </ul>
	        </div>
	    	</div>
    	<div class="main-content">
	        <button type="button" class="btn btn-outline-primary">쿠폰등록</button>
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
	                        <td>${cp.couponName }</td>
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
    

<script>
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
    		console.log(check+"삭제");
            //삭제 로직 구현
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