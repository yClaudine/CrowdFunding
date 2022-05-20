<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <script src="resources/js/jquery-3.6.0.js"></script>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
    html>body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    *{
    	list-style-type:none;
    }
    .login>li>input{
    	margin : 5px;
    	width:303px;
    	height:40px;
    	padding-left:10px;
    	font-size: 13px;
    	border-radius:5px;
    	border : 0.8px solid #868e96;
    	color : #868e96;
    	
    }
     .login>li>input:focus{
     	outline:none; 
     	border :1.5px solid #00c4c4;
     }
  
	.btn-outline-success {
	  
	}
	#loginbtn{
		width: 303px;
		height:40px;
		margin:5px;
		border-radius : 5px;
		color: #00c4c4;
	  	border-color: #00c4c4;
	}
	#loginbtn:hover{
		color: #fff;
	  	background-color: #00c4c4;
	}
    .signUp:hover{
    	text-decoration:underline;
    	color:#00c4c4;
    }
    .modal-footer{
    	font-size:9px;
    }
    .loginSc{
    	margin-left:10px;
    }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="resources/css/bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" href="resources/css/header7.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>
	
    <div class="header">
        <div class="logo"><a href=""><img src="resources/image/파이널로고2.png"></a></div>
        
        <div><a href=""><h6>펀딩</h6></a></div>
        <div><a href=""><h6>스토어</h6></a></div>
        <div><a href=""><h6>공지사항</h6></a></div>
        
        <div class="log">
           
            <div>
                <div class="searchFund">
                    <form action="/searchFund" method="post">
                        <button type="submit"><span class="material-symbols-outlined searchI">
                        search
                        </span></button>
                        <input type="text" name="fundName"  placeholder="어떤 펀딩을 찾고 계신가요? ">
                    </form>
                </div>
        	<c:choose> 
        			
                <c:when test="${sessionScope.m.categoryNo==0 }">
                		<div><a href="" class="access">관리자페이지</a></div>
                		<div><a href="" class="access">프로필</a></div>
                		<a href=""><div class="openReq">프로젝트 오픈신청</div></a>
                </c:when>
                <c:when test="${sessionScope.m.categoryNo==1 }">
                		<div><a href="" class="access">프로필</a></div>
                		<a href=""><div class="openReq">프로젝트 오픈신청</div></a>
                </c:when>
                	
               	<c:when test="${empty memberScope.m.memberId }">
              
                	<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalToggleLabel">로그인</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        <form action="login.do" method="post">
								<ul class="login">
									<li><input type="text" name="memberId" placeholder="이메일 아이디">
										<span id="idChk"></span>
									</li>
									
									<li><input type="password" name="memberPw" placeholder="비밀번호">
										<span id="pwChk"></span>									
									</li>
									
									
									<li><button class="btn btn-outline-success" id="loginbtn">로그인</button></li>								
								</ul>
							</form>	
					      </div>
					      
					      <div class="modal-footer">
					      	아직 계정이 없나요?
					        <a href="/signUpFrm.do" class="signUp">회원가입</a>
					        
					      </div>
					      
					    </div>
					  </div>
					</div>
					<a  class="loginSc" data-bs-toggle="modal" href="#exampleModalToggle" role="button">로그인</a>
                	<div><a href="signUpFrm.do" class="access">회원가입</a></div>
                	<a href=""><div class="openReq">프로젝트 오픈신청</div></a>
              	</c:when>
            </c:choose>
            </div>
            
        </div>
        
        
    </div>
    	
    <script>
        $(function(){
            const scInput = $("[name=fundName]");
            scInput.on("focus",function(){
                $(this).css("border","2.0px solid #00b2b2");
            });
            scInput.on("focusout",function(){
                $(this).css("border","1.8px solid #868e96");
            });
          const memberId = $("[name=memberId]");
          const memberPw = $("[name=memberPw]"); 
          const btn= $("#loginbtn");
          btn.on("click",function(e){
        	  if(memberId.val()=="" || memberPw.val()==""){
        	  	e.preventDefault();
        	  }
          });
          memberId.on("focusout",function(){
        	 if($(this).val()==""){
        		 const idChk = $("#idChk");
        		 idChk.text("아이디를 입력해주세요");
        		 idChk.css({
        			"color" : "red",
        			"font-size": "10px"
        		 });
        	 }else{
        		 const idChk = $("#idChk");
        		 idChk.empty();
        	 }
          });
        	 memberPw.on("focusout",function(){
            	 if($(this).val()==""){
            		 const pwChk = $("#pwChk");
            		 pwChk.text("비밀번호를 입력해주세요");
            		 pwChk.css({
            			"color" : "red",
            			"font-size": "10px"
            		 });
            	 }else{
            		 const pwChk = $("#pwChk");
            		 pwChk.empty();
            	 }
          });
          
        });
            
            
       
        	
        
    </script>
</body>
</html>