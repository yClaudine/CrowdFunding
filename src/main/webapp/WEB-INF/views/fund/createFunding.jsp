<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.content-wrap{
		width: 1100px;
		margin: 0 auto;
		margin-top: 50px;
		display: flex;
	}
	.content-left{
		width: 450px;
		padding-right: 50px;
	}
	.content-right{
		width: 550px;
	}
	.content-right>img{
		width: 100%;
	}
	.content-left>h2{
		padding-top: 35px;
	}
	.content-left>p{
		padding-top: 25px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.content-left>form{
		padding-top: 30px;
	}
	.content-left>form>.form-control{
		width: 90%;
	}
	.content-left>form>.btn{
		width: 90%;
		margin-top: 30px;
		border-radius: 0px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap">
		<div class="content-left">
			<h2>
				비즈니스의<br>
				새로운 가능성을<br>
				발견하는 곳, 펀펀펀
			</h2>
			<p>
				매출과 고객, 꾸준한 성장의 기회까지.<br>
				메이커님의 성공적인 비즈니스의 여정을<br>
				펀펀펀이 함께합니다.<br>
			</p>
			<form action="/fundReadyFrm.do" method="post">
				<input type="text" class="form-control" name="tfName" placeholder="펀딩 제목 입력">
				<input type="hidden" name="memberId" value="user1">
				<input type="submit" value="펀딩 생성하기" class="btn btn-outline-info">
			</form>
		</div>
		<div class="content-right">
			<img src="resources/image/fund/fundCre.png">
		</div>
	</div>
	
	
</body>
</html>