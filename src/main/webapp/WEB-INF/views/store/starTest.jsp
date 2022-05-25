<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	.score>span{
		font-size: 15px;
	}
	.star-box>span{
		color : #ccc;
	}
	.starCommentBox{
		margin : 30px; 
		
	}
	.starCommentBox>form>ul{
		display:flex; 
		
	}
	.starCommentBox>form>ul>li:first-child{
		width:10%;
		display:flex;
		justify-content: center; 
		align-items:center;
		
	}
	.starCommentBox>form>ul>li:first-child>span{
		font-size:35px;
		color : #00b2b2;
	}
	.starCommentBox>form>ul>li:nth-child(2){
		width:20%;
		height: 60px; 
	}
	.starCommentBox>form>ul>li:nth-child(3){
		width:55%; 
		height: 60px;
		margin-right: 15px;
	}
	.starCommentBox>form>ul>li:nth-child(3)>textarea.input-form{
		width:100%;
		min-height:60px;
		marin-right: 10px;
	}
	.starCommentBox>form>ul>li:last-child{
		width:20%;
		
	}
	.starCommentBox>form>ul>li:last-child>button{
		height:60px;
		line-height:0px;
		background-color: #00b2b2;
		color: white;
	}
	.star-Box{
		display: flex;
	}
	.star-box{
		padding-right: 10px;
		font-size: 10px;
	}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="starCommentBox"> 
    	<form action="/starWrite.do" method="post">
			<ul>
		    	<li><span class="material-symbols-outlined">account_circle</span></li>
			    <li class="score"><span>${s.storeProduct }상품의 평점</span><br>
			    <div class="star-Box">
			    	<div class="star-box">
			        	<span class="material-symbols-outlined">star</span>
			            <span class="material-symbols-outlined">star</span>
			            <span class="material-symbols-outlined">star</span>
			            <span class="material-symbols-outlined">star</span>
			            <span class="material-symbols-outlined">star</span>
			        </div>
			            <span class="num">0</span>
			            <input type="hidden" name="score" value="0">&nbsp;점	
			    </div>                           
			    </li>
			    <li>
			    	<input type="hidden" name="memberId" value="${s.memberId }">
			        <input type="hidden" name="storeNo" value="${s.storeNo }">
			        <textarea class="input-form" name="starcomment"> </textarea>
			    </li>
			    <li>
			        <button type="submit" class="btn">등록</button>
			    </li>
		    </ul>
	   </form>
	   
	</div>
	
<script>
$(function(){	 
   var s =0;
    const stars=$(".star-box").children();
        stars.on("mouseover",function(){
            stars.css("color","#ccc");
            const index=stars.index(this);
            for(let i=0; i<=index; i++){
                stars.eq(i).css("color","#00c4c4");
            }
            const num=$(".num").eq(0).text(index+1);
            num.next().attr("value",index+1);
            
            stars.on("click",function(){
                s=1;
                for(let e=0; e<=index; e++){
                    stars.eq(s).css("color","#00c4c4");
                }
            });
            stars.on("mouseout",function(){
                if(s!=1){
                      
                    stars.css("color","#ccc");
                    const num=$(".num").eq(0).text(0); 
                    num.next().attr("value",0);
                }
            });
            s=0;   
        });     
       

});	    
</script>
</body>
</html>