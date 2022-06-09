<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
</head>
<style>
	.content-wrap1{
		width: 1250px;
		margin: 0 auto;
		margin-top: 25px;
		border: none;
		display: flex;
		justify-content: space-between; 
	}
	.product-wrap{
		width: 600px;
		height: 750px;
	}
	.fund{
		background-image: url( "/resources/image/createFund1.jpg" );
	}
	.store{
		background-image: url( "/resources/image/createFund2.jpg" );
	}
	.image{
		width: 550px;
		height: 750px;
		background-size: 550px 750px;
		background-position: center center;
		background-repeat: no-repeat;
	}
	.image:hover{
		background-size: 600px 800px;
		transition: 0.3s;
	}
	.image{
		color: #fff;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	.image>h1{
		padding-bottom: 25px;
	}
	.image>p{
		font-size: 20px;
	}
	.image>button{
		margin-top: 25px;
		font-size: 20px;
		font-weight: 600;
		border-radius: 0px;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap1">
		<div class="product-wrap">
			<div class="image fund">
				<h1>펀딩</h1>
				<p>매출과 고객, 꾸준한 성장의 기회까지.</p>
				<p>메이커님의 성공적인 비즈니스의 여정을</p>
				<p>펀펀펀이 함께합니다.</p>
				<button class="btn btn-info" onclick="location.href='/createFunding.do'">펀드 생성하러 가기</button>
			</div>
		</div>
		<div class="product-wrap">
			<div class="image store">
				<h1>스토어</h1>
				<p>FUNFUNFUN과 함께라면</p>
				<p>스토어 신청도 간편하게!</p>
				<p>지금 당장 스토어 신청을 해보세요!</p>
				<button class="btn btn-info" onclick="location.href='/storeStart.do'">스토어 생성하러 가기</button>
			</div>
		</div>
	</div>
	<script>
		
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>