<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/myprofile.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
   
    
    
   
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
        #active{
        	background-color : orangered;
        }
        .date{
        	height:20px;
        	overflow:hidden;
        }
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
    <div class="content">
        <div class="mypageHead">
            <div class="imgBox">
            	<c:if test="${m.gender==0 }">
                	<img src="resources/image/member/pb.png" alt="">
                </c:if>
                <c:if test="${m.gender==1 }">
                	<img src="resources/image/member/pw.png" alt="">
                </c:if>
            </div>
            <div class="myIntro">
                <span class="myName"><span class="memberName">${m.memberName}</span>님의 블로그</span>
                <span class="memComment">
                	<c:choose>
                		<c:when test="${m.memComment=='자기소개를 입력해주세요' }">
                			 재무설계사 친절한 상담 
                		</c:when>
                		<c:otherwise>
                			${m.memComment}
                		</c:otherwise>
                	</c:choose>
                </span> 
            </div>
            <div class="myfollower">
                <div class="followerCount"></div>
                <div>팔로워</div>
            </div>
            <div class="myfollowing">
                <div class="followingCount"></div>
                <div>팔로잉</div>
            </div>
            <div class="mylevel">
                <span class="material-symbols-outlined" id="bug">
                    bug_report
                    </span>
                  
                <span>level 0 noobie</span>
            </div>
            <div class="mylevel">
                <span class="material-symbols-outlined" id="ani">
                    cruelty_free
                    </span>
                  
                <span>level 1 친한 친구</span>
            </div>
            <div class="mylevel">
                <span class="material-icons" id="trophy">
                    emoji_events
                    </span>
                  
                <span>level 2 지식인</span>
            </div>
            
        </div>
        <div class="commentInput">
            <div class="commentBox">
                <div class="box">
                    <span class="material-symbols-outlined" id="account">
                        account_circle
                        </span>
                    <div class="memberId">${sessionScope.m.memberId }</div>
                </div>
                <textarea type="text" name="memComment" id="comment" cols="40" rows="2" placeholder="최대 100자까지 입력 가능합니다."></textarea>
                <button class="btn btn-info btns input">입력</button>
            </div>
        </div>
    </div>
    <div class="comment-box">
	    <div class="comments">
	        <div class="box">
	            <span class="material-symbols-outlined" id="account">
	                account_circle
	                </span>
	            <div class="userId">user02</div>
	        </div>
	        <div class="info">
	            <span class="contentInfo">안녕이상하지만 그렇게 이상하지 않은 나름대로 괜찮은</span>
	            <div>
	                <span class="date">22-06-09</span>
	                <input type="hidden" name="blogNo" value="20">
	                <span class="updateM db" onclick="updateM(this);">수정</span>
	                <span class="delete db">삭제</span>
	            </div>
	        </div> 
	        <textarea class="memComment update" name="memComment" id="update" cols="40" rows="2" placeholder="최대 100자까지 입력 가능합니다."></textarea>
	        
	        <button class="btn btn-info btns updateB">수정</button>
	    </div>
    </div>
    
    <div class="pagination">
        
    </div>
    <input type="hidden" name="memberNo" value="${m.memberNo }">
    <input type="hidden" name="memberId" value="${m.memberId }">
    <script>
    	let visitor = $(".memberId").text();
	    let memberId = $("[name=memberId]").val();
		let memberNo = $("[name=memberNo]").val();
		let level; 
		
        $(function(){
        	console.log("visitor :"+ visitor);
        	console.log("memberId :"+memberId);
        	
        	//팔로잉 수 
        	$.ajax({
        		url : "myFollowing.do",
        		data : {memberId:memberId},
        		success:function(data){
        			$(".followingCount").text("");
        			$(".followingCount").text(data.length);
        		}
        	});
        	//팔로워 수 
        	$.ajax({
        		url : "myFollower.do",
        		data:{memberId:memberId},
        		success:function(data){
        		
        			$(".followerCount").text("");
        			$(".followerCount").text(data.length);
        		}
        		
        	});
        	
            	
        	 myBlogList(1);
                
            $(".update").hide();
            $(".updateB").hide();
            
           
        });//시작했을 때 펑션 완료 
      //입력버튼을 눌렀을 때 myblog데이터에 들어갈 수 있도록 , memberId(블로그 주인 ), visitor
      $(".input").on("click",function(){
    	  //insert값 집어넣기 
    	 const memComment =$("#comment").val();
    	 console.log(memComment,visitor,memberId);
    	 $.ajax({
    		 url : "insertMyblog.do",
    		 data : {memberId:memberId,visitor:visitor,memComment:memComment},
    		 type : "post",
    		 success : function(data){
    			 console.log(data);
    			 if(data>10 && data<30){
    				 level=1
    				 const mylevel = $(".mylevel");

    	                for(let i=0 ; i<mylevel.length; i++){
    	                    mylevel.eq(i).hide();
    	                    mylevel.eq(level).show();
    	                }
    			 }else if(data>30){
    				 level=2
    				 const mylevel = $(".mylevel");

    	                for(let i=0 ; i<mylevel.length; i++){
    	                    mylevel.eq(i).hide();
    	                    mylevel.eq(level).show();
    	                }
    			 }
    			 $("#comment").val("");
    		 	myBlogList(1);
    		 }//insert가 끝나면 다시 text를 원상복귀 
    		 
    		 
    	 });
      });
       //insert완료
       
      //글 리스트 불러오기 
      function myBlogList(req){
    	   //visitor와 memberId req가 있어야함 
    	   
       	$.ajax({
       		url : "selectMyblog.do",
       		data :{memberId:memberId,req:req},
       		type : "post",
       		success : function(myblog){
       		 	$(".pagination").empty();     	
       			$(".comment-box").empty();
       			const data = myblog.count;
       		 	const mylevel = $(".mylevel");
       			console.log(myblog);
       		 if(data>10 && data<50){
				 level=1
				
			 }else if(data>50){
				 level=2 
			 }else{
				 level=0
			 } 
	       		for(let i=0 ; i<mylevel.length; i++){
	                mylevel.eq(i).hide();
	                mylevel.eq(level).show();
	            }//맨 처음 적용 레벨 적용 완료	
	            
	            
	          //적용하기 
	          for(let i=0; i<myblog.list.length; i++){
	        	  //박스 만들기 
	        	  const div = $("<div>");
	        	  div.addClass("comments");
	        	  //프로필을 담을 박스와 프로필 만들기 
	        	  const div1 = $("<div class='box'>");
	        	  const spanP = $("<span class='material-symbols-outlined' id='account'>");
	        	  spanP.text("account_circle");
	        	  const div2 = $("<div class='userId'>");
	        	  div2.text(myblog.list[i].visitor);
	        	div1.append(spanP);
	        	div1.append(div2);
	        	div.append(div1);
	        	//내부 컨텐츠 박스만들기 
	        	const div3 = $("<div class='info'>");
	        	//내부 컨텐츠 박스에 내용 넣기 
	        	const spanC = $("<div class='contentInfo'>");
	        	spanC.text(myblog.list[i].memComment);
	          	div3.append(spanC);
	        	//디테일한 내용을 넣을 박스 만들기 (수정 삭제, 날짜)
	        	//날짜 
	        	const div4 =$("<div>");
	        	if(visitor!=myblog.list[i].visitor){
	        		//방문자와 작성자가 같지 않다면 날짜만 
	        		const spanD = $("<div class='date'>");
	        		spanD.text(myblog.list[i].coDate);
	        		div4.append(spanD);
	        	}else{
	        		//같다면 날짜정보와 다른정보도 넣어주기 
	        		const spanD = $("<div class='date'>");
	        		spanD.text(myblog.list[i].coDate);
	        		div4.append(spanD);
	        		//글 번호 
	        		const input = $("<input type='hidden' name='blogNo' value='"+myblog.list[i].blogNo+"'>");
	        		div4.append(input)
	        		//수정버튼 
	        		const spanU = $("<span class='updateM db' onclick='updateM(this);'>수정</span>");
	        		div4.append(spanU);
	        		//삭제 버튼 
	        		const spanDe = $("<span class='delete db'>삭제</span>");
	        		div4.append(spanDe);
	        	}//종료 
	        	div3.append(div4);
	        	div.append(div3);
	        	//텍스트에리아 만들기
	        	const textarea = $("<textarea class='memComment update' name='memComment' id='update' cols='40' rows='2' placeholder='최대 100자까지 입력 가능합니다.'>");
	        	div.append(textarea);
	        	//수정 버튼 만들기 
	        	const button = $("<button class='btn btn-info btns updateB'>수정</button>");
	        	div.append(button);
	        	$(".comment-box").append(div);
	        	}//for문 종료
	        	
	        	 $(".update").hide();
	             $(".updateB").hide();
	             $(".pagination").empty();
	             $(".pagination").append(myblog.pagenation);
	             
       		}//success 종료 
       		
           
       	});//ajax종료 
    		   
    	   
       }//블로그리스트 종료 
        
        
        function updateM(obj){
            $(obj).parent().parent().hide();
            $(obj).parent().parent().next().show();
            $(obj).parent().parent().next().next().show();
            $(obj).parent().parent().next().text($(obj).parent().prev().text());

        }
       
        $(document).on("click",".updateB",function(){
        	
            const blogNo = $(this).prev().prev().find("[name=blogNo]").val();
            const memComment = $(this).prev().val();
            const date = $(this).prev().prev().find("date");
            console.log(memComment);
            console.log(blogNo);
            $.ajax({
            	url :"updateMyblog.do",
            	data : {blogNo:blogNo,memComment:memComment},
            	type : "post",
            	success : function(data){
            		console.log(data);
            		if(data>0){
            			console.log("수정 완료");
            			myBlogList(1);
            			 $(this).hide();
            	          $(this).prev().hide();
            	         const info = $(this).prev().prev().show();
            		}
            	}
            });
           
        });
        $(document).on("click",".delete",function(){
        	const blogNo = $(this).prev().prev().val();
        	$.ajax({
            	url :"deleteMyblog.do",
            	data : {blogNo:blogNo},
            	type : "post",
            	success : function(data){
            		if(data>0){
            			console.log("삭제완료");
            			myBlogList(1);
            		}
            	}
            });
        });


    </script>
</body>
</html>