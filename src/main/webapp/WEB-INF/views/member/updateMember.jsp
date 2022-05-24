<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>pwChange</title>
    
    <link rel="stylesheet" href="resources/css/updateMember.css">
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
        #email{
        	
        	
        	display:inline-block;
        }
    </style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="content">   
        <h5> <span class="material-symbols-outlined" id="setting">settings</span> 설정</h5>
        <form action="memberUpdate.do">
        <ul class="memberUpdate">
            <div>기본정보 설정</div>
            <li class="wrapper">
                <input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
                <input type="text" name="memberName" id="prePw" placeholder="이름을 입력하세요">
            </li>
            
            <li class="wrapper">
                <input type="text" name="memEmail" id="email" placeholder="이메일">
                <button type="button"class="btn btn-outline-success" id="emailChange">인증하기</button>
                <div></div>
                <input type="text" name="memPhone" id="phone" placeholder="핸드폰 번호">
                <div></div>
            </li>
            
                <button type="submit" class="btn btn-outline-success" id="memberChange">정보 번경</button>
                <div style="padding:5px;"></div>
            
            
        </ul>
        </form>
        <script>
            $(function(){
            	const email = $("#email");
            	regemail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				const btn = $("#emailChange");
				const checkArr = [false,false];
				btn.on("click",function(){
					if(!regemail.test(email.val())){
						
						email.addClass("form-control is-invalid");
        				email.next().next().text("이메일은 8자 이상 소문자 대문자 기호 포함입니다.");
        				email.next().next().css({
        					"color":"red",
        					"font-size":"8px"
        				});
        				checkArr[0]=false;
					}else{
						email.next().next().text("사용가능한 이메일 입니다.");
        				email.next().next().css({
        					"color":"green",
        					"font-size":"8px"
        				});
        				email.removeClass("form-control is-invalid");
        				email.addClass("form-control is-valid");
        				checkArr[0]=true;
					}
				});
            	
                
                const memPhone = $("[name=memPhone]");
            		memPhone.on("change",function(){
            			console.log(memPhone.val());
            			regData = /-/;
            			if(!regData.test(memPhone.val())){
							checkArr[1]=false;
            				memPhone.addClass("form-control is-invalid");
  							
  							memPhone.next().text("-을 사용해서 숫자만 입력해주세요");
  							memPhone.next().css({
  								"color" : "red",
  								"font-size" : "8px"
  							});
            				
            						
            			}else{
            				
            				memPhone.next().text("");
            				memPhone.removeClass("form-control is-invalid");
            				memPhone.addClass("form-control is-valid");
            				checkArr[1]=true;
            			}
            			
            		});
                    $("button[type=submit]").on("click",function(e){
            			if(checkArr[0]&&checkArr[1]){
            				
            			}else{
            				e.preventDefault();
                    
            				
            				$(".fail").remove();
            				$(".memberUpdate").append("<div class='fail' style='color:red;font-size:8px;padding:0px;'>* 조건을 전부 작성하지 않아 정보 변경에 실패했습니다.</div>");
            				
            				
            			}
            			
            		});

            });
        </script>
    </div>