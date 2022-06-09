<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/follow2.css">
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
        .followMember{
        	margin: 80px auto;
        }
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>  
	 <div class="content">
        <div class="title">
            my follower
        </div>
        <div class="subtitle">
            <span>follower <span class="myfollower"></span>명</span>
        </div>
        <div class="search">
        <input type="text" name="memberId" placeholder="search">
        </div>
        <div class="foC">
            <div class="f1">People</div>
            <div class="f2">follower</div>
        </div>
        <div class="allMember">
        	<div class="followWrap">
	            <div class="followMember">
	            	
	            </div>
	         </div>   
            <div class="pagination">
                <div class="btn-group me-2 page" role="group" aria-label="First group">
                    <button type="button" class="btn btn-info btns bgm">더보기</button>
                   
                </div>
            </div>
        </div>
		<div class="myFollower">
			<div class="followWrap1">
				
			</div>
		</div>
    </div>

	
	<input type="hidden" name="member" value="${sessionScope.m.memberId }">
    <script>
    	
        $(function(){
        	
        	
            $(".f1").click();
            $(".followWrap1").empty();
        	$(".followWrap").empty();
          	
        });
        //모든 폴로우를 조회했을 때 
        $(".f1").on("click",function(){
        	$(".myFollower").hide();
        	$(".followWrap").empty();
                $(".followWrap").show();
                $(".f2").css({
                    "border-bottom" :"none"    
                });
                $(this).css({
                    "border-bottom" :"2px solid #00c4c4"
                });
                $(".subtitle").hide();
                $(".search").show();
                $(".allMember").show();
            	  allMember(1);
            });
        
        //모든 멤버를 조회했을 때 
        function allMember(req){
        	
        	  $.ajax({
              	url : "/selectAllMS.do",
              	data: {req:req},
              	success : function(list){
              		console.log(list);
              		const div0 =$("<div>");
          			div0.addClass("followMember");
              		for(let i=0; i<list.list.length; i++){
              			//나의 프로필 부터 만들기
              			
              			//myProfile먼저 
              			const div = $("<div>");
              			div.addClass("myProfile");
              			div0.append(div);
              			//사진 만들기 (프로필로 이동할 수 있도록); 
              			const a =$("<a href='myProfile.do?memberId="+list.list[i].memberId+"' class='imgwrap'>");
              			if(list.list[i].gender==0){
              				const img =$("<img src='resources/image/member/pb.png' class='myP'>");
              				a.append(img);
              			}else{
              				const img =$("<img src='resources/image/member/pw.png' class='myP'>");
              				a.append(img);
              			}
              			div.append(a);
              			//프로필 박스 
              			const div1 = $("<div>");
              			div1.addClass("profileBox");
              			//프로파일 박스 내부 인트로 
              			const div2 =$("<div>");
              			div2.addClass("intro");
              			//이름
              			const div3=$("<div>");
              			div3.text(list.list[i].memberName);
              			//자기소개
              			const div4=$("<div>");
              			if(list.list[i].memComment==="자기소개를 입력해주세요"){
              				div4.text("재무설계사, 친절한 설명");
              			}else{
              				div4.text(list.list[i].memComment);
              			}
              			div2.append(div3);
              			div2.append(div4);
              			div1.append(div2);
              			//멤버 아이디 넣는 디브 
              			divInfo = $("<div>");
              			divInfo.text(list.list[i].memberId);
              			
              			div1.append(divInfo);
              			divInfo.css({
              				"display" :"none"
              			}); 
              				
              			const targetId= list.list[i].memberId; 
              			const followerId = $("[name=member]").val();
						              			
              			$.ajax({
              					url :"findFollow.do",
              					data: {targetId:targetId,followerId:followerId},
	              				success : function(data){
	              					console.log(data);
		              					if(data>0){
	              							a.attr("href","myProfile.do?memberId="+list.list[i].memberId+"");
	              							a.removeAttr("onclick");
	              							//버튼 넣어주기 
	              							const div5=$("<div class='introBo'>");
	              	              			const button =$("<button class='btn btn-info btns' onclick='removeFollow(this);'>");
	              	              			button.text("언팔로우");
	              	              			div5.append(button);
	              	              			div1.append(div5);
	              	              			//myprofile에  전부 넣어주기
	              						}else{
	              							
	              							a.attr("href","#");
	              							a.attr("onclick","disabled()");
	              							const div5=$("<div class='introBo'>");
	              	              			const button =$("<buttons class='btn btn-info btns' onclick='follow(this);'>");
	              	              			button.text("팔로우");
	              	              			div5.append(button);
	              	              			div1.append(div5);
	              						}
	              					}	
              					});
              				
              			div.append(div1);
              			
              			//followmember에 넣기 
              			$(".followWrap").append(div0);
              			
              		}//for문 종료 
              			$(".pagination").empty();
              			$(".pagination").append(list.pagenation);
              	}//success종료 
              });//ajax종료 
            
        }//모든맴버 조회완료
        
     
        //나의 폴로우를 조회했을때
        $("[name=memberId]").on("keyup",function(){
        	
        	const memberName = $(this).val();
        	$.ajax({
        		url : "/memberName.do",
        		type :"get",
        		data :{memberName:memberName},
        		success : function(member){
        			$(".followWrap").empty();
                	$(".pagination").empty();
        			console.log(member);	
        			const div0 =$("<div>");
          			div0.addClass("followMember");
          			
              		for(let i=0; i<member.length; i++){
              			//나의 프로필 부터 만들기
              			
              			//myProfile먼저 
              			const div = $("<div>");
              			div.addClass("myProfile");
              			div0.append(div);
              			//사진 만들기 (프로필로 이동할 수 있도록); 
              			const a =$("<a href='myProfile.do?memberId="+member[i].memberId+"' class='imgwrap'>");
              			if(member[i].gender==0){
              				const img =$("<img src='resources/image/member/pb.png' class='myP'>");
              				a.append(img);
              			}else{
              				const img =$("<img src='resources/image/member/pw.png' class='myP'>");
              				a.append(img);
              			}
              			div.append(a);
              			//프로필 박스 
              			const div1 = $("<div>");
              			div1.addClass("profileBox");
              			//프로파일 박스 내부 인트로 
              			const div2 =$("<div>");
              			div2.addClass("intro");
              			//이름
              			const div3=$("<div>");
              			div3.text(member[i].memberName);
              			//자기소개
              			
              			const div4=$("<div>");
              			if(member[i].memComment==="자기소개를 입력해주세요"){
              				div4.text("재무설계사, 친절한 설명");
              			}else{
              				div4.text(member[i].memComment);
              			}
              			div2.append(div3);
              			div2.append(div4);
              			div1.append(div2);
              			divInfo = $("<div>");
              			divInfo.text(member[i].memberId);
              			
              			div1.append(divInfo);
              			divInfo.css({
              				"display" :"none"
              			}); 
              			//버튼 넣어주기
              			const targetId= member[i].memberId; 
              			const followerId = $("[name=member]").val();
              			
              			$.ajax({
              					url :"findFollow.do",
              					data: {targetId:targetId,followerId:followerId},
	              				success : function(data){
	              						if(data>0){
	              							a.attr("href","myProfile.do?memberId="+member[i].memberId+"");
	              							a.removeAttr("onclick");
	              							//버튼 넣어주기 
	              							const div5=$("<div class='introBo'>");
	              	              			const button =$("<button class='btn btn-info btns' onclick='removeFollow(this);'>");
	              	              			button.text("언팔로우");
	              	              			div5.append(button);
	              	              			div1.append(div5);
	              	              			//myprofile에  전부 넣어주기
	              						}else{
	              							
	              							a.attr("href","#");
	              							a.attr("onclick","disabled()");
	              							const div5=$("<div class='introBo'>");
	              	              			const button =$("<buttons class='btn btn-info btns' onclick='follow(this);'>");
	              	              			button.text("팔로우");
	              	              			div5.append(button);
	              	              			div1.append(div5);
	              						}
	              					}	
              					});
              				
              			//myprofile에  전부 넣어주기 
              			div.append(div1);
              			
              			//followmember에 넣기 
              			
              			$(".followWrap").append(div0);
              			
              		}//for문 종료 
              		
        		}//success종료
        	});//aajax종료 
        });
        function disabled(){
        	alert("팔로우를 진행해야 프로필 조회가 가능합니다.");
        }
        function follow(obj){
        	const targetId = $(obj).parent().prev().text();
        	const a=$(obj).parent().parent().prev();
        	const followerId = $("[name=member]").val();
        	console.log(followerId);
        	
        	//팔로우하기 , tartgetId
        	$.ajax({
        		url : "insertFollow.do",
        		data : {followerId:followerId,targetId:targetId},
        		success : function(result){
        			
        			if(result>0){
        				a.attr("href","myProfile.do?memberId="+targetId+"");
        				a.removeAttr("onclick");
						$(obj).text("");
						$(obj).text("언팔로우");
						$(obj).removeAttr("onclick");
						$(obj).attr("onclick","removeFollow(this)");
        			}
        		}
        	})	
        
        	
        }//팔로우 완료 
        //언팔로우 하기 
        function removeFollow(obj){
        	followerId = $("[name=member]").val();
        	targetId = $(obj).parent().prev().text();
        	const a=$(obj).parent().parent().prev();
        	$.ajax({
        		url : "deleteFollow.do",
        		data : {followerId:followerId,targetId:targetId},
        		success : function(result){
        			
        			if(result>0){
        				
        				a.attr("onclick","disabled()");
        				a.attr("href","#");
        				
        				
						$(obj).text("");
						$(obj).text("팔로우");
						$(obj).removeAttr("onclick");
						$(obj).attr("onclick","follow(this)");
        			}
        		}
        	});
        }
      
        
        $(".f2").on("click",function(){
        		 $(".allMember").hide();
                $(".subtitle").show();
                $(".search").hide();
                $(".f1").css({
                    "border-bottom" :"none"    
                });
                $(this).css({
                    "border-bottom" :"2px solid #00c4c4"
                });
                myFollower();
            });
        
        function myFollower(){
        	$(".myFollower").show();
        	$(".followWrap1").empty();
        	const memberId= $("[name=member]").val();
       
        	$.ajax({
        		url : "myFollower.do",
        		data : {memberId:memberId},
        		success : function(member){
        			
        			const div0 =$("<div>");
          			div0.addClass("followMember");
          			$(".myfollower").empty();
          			$(".myfollower").text(member.length);
          			$(".myfollower").css({
          				"color" : "#A760FF",
	    				"font-weight" : "bold"
          			});
              		for(let i=0; i<member.length; i++){
              			
              			//나의 프로필 부터 만들기
              			
              			//myProfile먼저 
              			const div = $("<div>");
              			div.addClass("myProfile");
              			div0.append(div);
              			//사진 만들기 (프로필로 이동할 수 있도록); 
              			const a =$("<a href='myProfile.do?memberId="+member[i].memberId+"' class='imgwrap'>");
              			if(member[i].gender==0){
              				const img =$("<img src='resources/image/member/pb.png' class='myP'>");
              				a.append(img);
              			}else{
              				const img =$("<img src='resources/image/member/pw.png' class='myP'>");
              				a.append(img);
              			}
              			div.append(a);
              			//프로필 박스 
              			const div1 = $("<div>");
              			div1.addClass("profileBox");
              			//프로파일 박스 내부 인트로 
              			const div2 =$("<div>");
              			div2.addClass("intro");
              			//이름
              			const div3=$("<div>");
              			div3.text(member[i].memberName);
              			//자기소개
              			const div4=$("<div>");
              			if(member[i].memComment==="자기소개를 입력해주세요"){
              				div4.text("재무설계사, 친절한 설명");
              			}else{
              				div4.text(member[i].memComment);
              			}
              			div2.append(div3);
              			div2.append(div4);
              			div1.append(div2);
              			divInfo = $("<div>");
              			divInfo.text(member[i].memberId);
              			
              			div1.append(divInfo);
              			divInfo.css({
              				"display" :"none"
              			}); 
              			//버튼 넣어주기
              			const followerId=  $("[name=member]").val(); 
              			const targetId =member[i].memberId;
              			
              			$.ajax({
              					url :"findFollow.do",
              					data: {targetId:targetId,followerId:followerId},
	              				success : function(data){
		              					if(data>0){
	              							a.attr("href","myProfile.do?memberId="+member[i].memberId+"");
	              							a.removeAttr("onclick");
	              							//버튼 넣어주기 
	              							const div5=$("<div class='introBo'>");
	              	              			const button =$("<button class='btn btn-info btns' onclick='removeFollow(this);'>");
	              	              			button.text("언팔로우");
	              	              			div5.append(button);
	              	              			div1.append(div5);
	              	              			//myprofile에  전부 넣어주기
	              						}else{
	              							
	              							a.attr("href","#");
	              							a.attr("onclick","disabled()");
	              							const div5=$("<div class='introBo'>");
	              	              			const button =$("<buttons class='btn btn-info btns' onclick='follow(this);'>");
	              	              			button.text("팔로우");
	              	              			div5.append(button);
	              	              			div1.append(div5);
	              						}
	              					}	
              					});
              				
              			//myprofile에  전부 넣어주기 
              			div.append(div1);
              			
              			//followmember에 넣기 
              			$(".followWrap1").append(div0);
              			
              			
              		}//for문 종료 
        			
        		}
        	});
        	
        }
        //나의 폴로워 불로오기
    </script>
	
</body>
</html>