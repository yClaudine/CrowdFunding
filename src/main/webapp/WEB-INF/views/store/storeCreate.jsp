<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUNFUNFUN Store신청하기</title>
<style>
	.content-wrap{
		width: 1300px;
		margin: 0 auto;
		margin-top: 10px;
		display: flex;
	}
	.content-left{
		padding-left: 30px;
		padding-top: 100px;
		width: 550px;
		height: 100vh;
		background-color: #e7f9f9;

	}
	.content-right{
		padding-top: 50px;
		width: 700px;
		background-image: url(/resources/image/store/back2.png);
		padding-left: 20px;
	}
	.content-right>p{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 35px;
		font-weight: bold;
	}
	.sellername{
		padding-left: 100px;
	}
	.content-left>form>.form-control{
		width: 90%;
	}
	.content-left>form>.btn{
		width: 90%;
		margin-top: 30px;
		border-radius: 0px;
	}
	#stCategory{
		color: #212529;
		border-color: #00c4c4;
	}
	#stCategory:not(:last-child){
		margin-right: 30px;
	}
	#stCategory{
		margin-top: 30px;
		margin-left: 15px;
		font-weight: bold;
		font-size: 15px;
	}
	#stCategory:hover{
	color: white;
	background-color: #00c4c4;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap">
		<!-- &nbsp; 1칸 띄어쓰기 &ensp; 2칸 띄어쓰기 &emsp; 3칸띄어쓰기 -->
		<div class="content-left">
				<h1>
					FUN<br>
					&ensp;FUN<br>
					&ensp;&ensp;FUN<br>
					<br>
					&emsp;&emsp;&emsp;FUN(뻔)하지 않은<br>
					&emsp;&emsp;&emsp;나의 스토어<br>
					<br>
					&emsp;&emsp;&emsp;&emsp;&emsp;FUN STORE
				</h1>	
		</div>
		<div class="content-right">
			<p class=sellername>
				${sessionScope.m.memberName} SELLER 님,<br>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;반갑습니다.<br>
			</p>
			<p>
				상품을 등록하시는군요!<br>
				어떤 상품을 등록하실 건가요?
			</p>
			<p style="font-size:15px; font-weight:normal;">추후 변경 가능합니다.
			<form action="/storeCreate.do" method="post">
				<input type="hidden" name="memberId" value="test1">
				<input type="submit" class="btn btn-outline-primary" id="stCategory" value="리빙" name="stCategory">
				<input type="submit" class="btn btn-outline-primary" id="stCategory" value="뷰티" name="stCategory">
				<input type="submit" class="btn btn-outline-primary" id="stCategory" value="반려동물" name="stCategory">
				<input type="submit" class="btn btn-outline-primary" id="stCategory" value="여행" name="stCategory">
				<input type="submit" class="btn btn-outline-primary" id="stCategory" value="푸드" name="stCategory">
			</form>
		</div>
	</div>
	
</body>
</html>