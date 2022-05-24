<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/signout.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    
    
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="content">   
        <h5> <span class="material-symbols-outlined" id="setting">settings</span> 설정</h5>
        <ul class="signout">
            <li class="wrapper">
                <span class="title">회원탈퇴</span>
                <span>어떤점이 불편하셨나요 ?</span>
                <span>Fun를 이용하면서 불편했던 점을 말씀해주시면 서비스 개선에참고하겠습니다</span>
            </li>
            <li class="wrap" >
                <select class="form-select" id="sel">
                    <option value="1">고객서비스 불만</option>
                    <option value="2">잠못자고 프로젝트해서 불만</option>
                    <option value="3">손원진한테 불만</option>
                    <option value="4">기타</option>
                </select>
            </li>
            <form action="signout.do" method="post">
            <li class="wrapper">
                <input type="hidden" name="memberId" value="${sessionScope.m.memberId}">
                <input type="password" name="memberPw" id="memberPw" placeholder="비밀번호 입력">
                <div></div>
            </li>
            
                <button class="btn btn-outline-success" id="signoutB">회원탈퇴</button>
            
            <div></div>
            </form>
        </ul>
    </div>
    <script>
        
        $(function(){
            const password = $("[type=password]");
            const btn = $("#signoutB");
            const memberId = $("[name=memberId]").val();
            
            let checkArr = false;
			           
            password.on("change",function(){
            	const memberPw = password.val();
            	console.log(memberPw); 
            	$.ajax({
            		data: {memberId:memberId,memberPw:memberPw},
            		type: "post",
            		url :"/findPw.do",
            		success:function(data){
            			
            			if(data=="null"){
            				checkArr=false;
            				 password.next().text("비밀번호가 맞지 않습니다.");
                             password.removeClass();
                             password.addClass("form-control is-invalid");
                             password.next().css({
                                 "color" :"red",
                                 "font-size" : "8px"
                             });
            			}else{
            				password.removeClass();
                            password.addClass("form-control is-valid");
                            password.next().empty();
                            checkArr= true; 
            			}
            		}
            	});
                
               	
            
            
       		 });
            btn.on("click",function(e){
            	
                if(checkArr){

                }else{
                    e.preventDefault();
                    $(this).next().text("조건이 충족되지 않았습니다.");
                    $(this).next().css({
                        "color" :"red",
                        "font-size" : "8px",
                        "margin-top" : "10px"
                    });
                    
                }
            });

        });
    </script>
</body>
</html>