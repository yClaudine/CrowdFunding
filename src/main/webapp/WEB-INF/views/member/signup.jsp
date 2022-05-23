<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/signup.css">
<title>회원가입</title>
<script src="resources/js/jquery-3.6.0.js"></script>
</head>
<style>
	#email{
		display:inline-block;
	}
	#btn{
		border-radius : 5px;
	}
	input{
		padding-left:5px;	
	}
	
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content">
            <ul class="signup">
                <li class="main">
                    <h4>회원가입</h4>
                    <span>가입은 간단하게 활동은 fun하게 !</span>
                </li>
            <form action="signUp.do" method="post">
                <li>
                    <div class="ti">이름</div>
                    <input type="text" name="memberName" placeholder="이름 입력">
                </li>
                <li>
                    <div class="ti">아이디</div>
                    <input type="text" name="memberId" placeholder="아이디 입력">
                    <div></div>
                    <div></div>
                </li>
                <li>
                    <div class="ti">이메일</div>
                    <input type="text" name="memEmail" id="email" placeholder="이메일 계정">
                    <button id="btn" type="button" class="btn btn-outline-success emch" >인증하기</button>
                     <div></div>
                </li>

                <li>
                    <div class="ti">비밀번호</div>
                    <div id="pw"><input type="password" class="pw"name="memberPw" placeholder="비밀번호"></div>
                    <div></div>
                    <div id="pw"><input type="password" class="pwRe" name="memberPwRe" placeholder="비밀번호 확인"></div>
                    <div></div>
                    <input type="hidden" name="categoryNo" value="1">
                </li>
				<li>
					<div class="phone">핸드폰번호</div>
					<div><input type="text" name="memPhone"></div>
					<div></div>
				</li>
                <li>
                    <div class="ti gen">성별</div>
                    <select name="gender" id="gender" class="form-select">
                        <option value="0">남성</option>
                        <option value="1">여성</option>
                    </select>
                    <input type="hidden" name="memComment" value="자기소개를 입력해주세요">
                </li>
                <li>
                    <h6>전체동의</h6>
                    <pre class="font"><input type="checkBox" id="checkBox">  펀딩스토어 회원 서비스(필수),투자서비스(선택),
스타트업찾기 서비스(선택),
이벤트 혜택알림 동의(선택)</pre>
                    
                    
                </li>

                <li><button type="submit" id="btn" class="btn btn-outline-success signupb">회원가입</button></li>
            </ul>
        </form>

        </div>
        <script>
            $(function(){
            		const checkArr = [false,false,false,false,false]
            		
            		
					const id = $("[name=memberId]");
            			
            		    id.on("change",function(){
            		    	const memberId = $(this).val(); 	
            		    	$.ajax({
                    			url: "/findId.do",
                    			type : "get",
                    			data :{memberId:memberId},
                    			success: function(data){
                    				if(data!=null){
                    					id.addClass("form-control is-invalid");
                    					id.next().text("이미사용중인 아이디입니다.");
                    					id.next().css({
                    		            	"color":"red",
                    		            	"font-size" : "8px"
                    		            });
                    					checkArr[0] = false;
                    				}else{
                    					id.removeClass("form-control is-invalid");
                    					id.addClass("form-control is-valid");
                    					id.next().text("사용가능한 아이디입니다.");
                    					id.next().css({
                    		            	"color":"green",
                    		            	"font-size" : "8px"
                    		            });
                    					checkArr[0]=true;
                    				}
                    			},
                    			error : function(){
                    				console.log("서버 요청 실패");
                    			}
                    		});
            		        const idReg=/^[a-z0-9]{4,12}$/;
            		        if(!idReg.test($(this).val())){
            		        	
            		            id.next().next().text("아이디는 영어 소문자/숫자로 4~12글자입니다");
            		            id.next().next().css({
            		            	"color":"red",
            		            	"font-size" : "8px"
            		            });
            		            checkArr[1]=false;
            		    
            		        }else{
            		            id.next().next().text("");
            		            
            		            checkArr[1]=true;
            		        }
            		    });
            		const pw = $(".pw");
            		pw.on("change",function(){
        		        
        		        const pwReg=/^[a-zA-Z0-9!-*]{8,30}$/;
        		        if(!pwReg.test(pw.val())){
        		        	console.log(pw.val());
        		        	pw.addClass("form-control is-invalid");
        		            pw.parent().next().text("비밀번호는 영어 소문자/숫자/기호로 8글자 이상입니다");
        		            pw.parent().next().css({
        		            	"color":"red",
        		            	"font-size" : "8px"
        		            });
        		            checkArr[2]=false;
        		    
        		        }else{
        		        	pw.removeClass("form-control is-invalid");
        		        	pw.addClass("form-control is-valid");
        		            pw.parent().next().text("");
        		            
        		            checkArr[2]=true;
        		        }
        		    });
            		const pwRe = $(".pwRe");
            		pwRe.on("change",function(){
            			if(pwRe.val()!=pw.val()){
            				console.log($(this).val());
            				pwRe.addClass("form-control is-invalid");
            				pwRe.parent().next().text("비밀번호가 일치하지 않습니다");
            				pwRe.parent().next().css({
            					"color" : "red",
            					"font-size" : "8px"
            				});
            				checkArr[3]=false;
            			}else{
            				pwRe.removeClass("form-control is-invalid");
            				pwRe.addClass("form-control is-valid");
            				pwRe.parent().next().text("비밀번호가 일치합니다");
            				pwRe.parent().next().css({
            					"color" : "green",
            					"font-size" : "8px"
            				});
            				checkArr[3]=true;
            			}
            		});
            		const memPhone = $("[name=memPhone]");
            		memPhone.on("change",function(){
            			console.log(memPhone.val());
            			regData = /-/;
            			if(!regData.test(memPhone.val())){

            				memPhone.addClass("form-control is-invalid");
  							
  							memPhone.parent().next().text("-을 사용해서 입력해주세요");
  							memPhone.parent().next().css({
  								"color" : "red",
  								"font-size" : "8px"
  							});
            				
            						
            			}else{
            				memPhone.parent().next().text("");
            				memPhone.removeClass("form-control is-invalid");
            				memPhone.addClass("form-control is-valid");
            			}
            			
            		});
            		const btn = $("#btn");
            		btn.on("click",function(){
            			const memEmail = $("#btn").prev();
            			
            			const regEmail =/^[a-zA-Z0-9@.*]{8,30}$/; 
            			if(!regEmail.test(memEmail.val())){
            				memEmail.addClass("form-control is-invalid");
            				memEmail.next().next().text("이메일은 8자 이상 소문자 대문자 기호 포함입니다.");
            				memEmail.next().next().css({
            					"color":"red",
            					"font-size":"8px"
            				});
            				checkArr[4]=false;
            			}else{
            				memEmail.next().next().text("사용가능한 이메일 입니다.");
            				memEmail.next().next().css({
            					"color":"green",
            					"font-size":"8px"
            				});
            				memEmail.removeClass("form-control is-invalid");
            				memEmail.addClass("form-control is-valid");
            				checkArr[4]=true;
            				
            			}
            			
            		});
            		$("button[type=submit]").on("click",function(e){
            			if(checkArr[0]&&checkArr[1]&&checkArr[2]&&checkArr[3]&&checkArr[4]){
            				
            			}else{
            				e.preventDefault();
            				const ul = $(".signup");
            				
            				const fail = $(".fail");
            				fail.empty();
            				
            				
            				ul.append("<div class='fail' style='color:red;font-size:8px; margin-top:10px;'>조건을 전부 작성하지 않아 회원가입에 실패했습니다.</div>");
            				
            				
            			}
            			
            		});
            		
            		
					
            })
        </script>
</body>
</html>