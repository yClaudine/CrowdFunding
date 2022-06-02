<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매자 신청처리</title>
    <link rel="stylesheet" href="resources/css/onload.css">
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
    </style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="content">   
        <h5>판매자 신청처리</h5>
        <ul class="onload">
            <li id="one">
                <span class="material-symbols-outlined" id="logo"> rotate_right </span>
                <span>승인중</span>
            </li>
            <li id="two">
                
            </li>
            <li id="three" >
                <span class="material-symbols-outlined" id="logo">sentiment_satisfied</span>
                <span>승인완료</span>
            </li>
            <li id="two">

            </li>
            <li id="four">
                <span class="material-symbols-outlined" id="logo">sentiment_dissatisfied</span>
                <span>미승인</span>
            </li>
            
            
        </ul>
        <div class="firstB" >
        	<input type="hidden" id="memberId" value="${sessionScope.m.memberId}">
            <h5>예비 판매자님의 요청을 처리중입니다</h5>
        </div>
        <div class="secondB">
            <h5>~판매자님 환영합니다 신청이 완료되었습니다</h5>
            <a href="myPageFrm.do"><button class="btn-primary" id="btn-sm">나의 프로필</button></a>
        </div>
        <div class="threeB" style="display:none;">
            <h5>~님의 수정이 비허가 처리되었습니다</h5>
            <span class="reason">처리사유</span>
            <span>타인의 사업자 등록번호 도용 및 불법 판매 신고내역 접수</span>
            <a href="updateSellerFrm.do"><button class="btn-primary" id="btn">판매자 등록 수정 및 재신청</button></a>
        </div>
    </div>
    
    <script>
        $(function(){
             const memberId = $("#memberId").val();
        	$.ajax({
        		url: "/selectSeller.do",
        		data:{memberId:memberId},
        		type:"get",
        		success:function(data){
        			console.log(data)
        			if(data.authSeller==0){
        				
        				$("#one").css("background-color","rgb(190, 190, 190)");
                        $("#three").css("background-color","rgb(190, 190, 190)");
                        $("#four").css("background-color","rgb(190, 190, 190)");
                        $(".firstB").show();
                        $(".secondB").hide();
                        $(".threeB").hide();
                        $("#one").css("background-color","#00b2b2");			
        			}else if(data.authSeller==1){
        				$("#one").css("background-color","rgb(190, 190, 190)");
                        $("#three").css("background-color","rgb(190, 190, 190)");
                        $("#four").css("background-color","rgb(190, 190, 190)");
                        $(".firstB").hide();
                        $(".secondB").show();
                        $(".threeB").hide();
                        $("#three").css("background-color","#00b2b2");
        			}else if(data.authSller==2){
        				$("#one").css("background-color","rgb(190, 190, 190)");
                        $("#three").css("background-color","rgb(190, 190, 190)");
                        $("#four").css("background-color","rgb(190, 190, 190)");
                        $(".firstB").hide();
                        $(".secondB").hide();
                        $(".threeB").show();
                        $("#four").css("background-color","#00b2b2");
        			}
        		},
        		error:function(){
        			console.log("에러처리");
        		}
        		
        	});
        		
        
        });
    </script>
</body>
</html>
