<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<style>
@import
url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	list-style-type: none;
}
.footer-content{
	width: 100%;
	margin: 0 auto;
	margin-top: 100px;
	background-color: #e2e4e6;
	padding: 20px 20px 0px;
}
.ask-funfun{
	margin-left:10px;
	height: 60px;
	width: 100px;
	background-color: black;
	color: #fff;
	font-size: 12px;
	border-radius: 15px;
}
.footer-wrap{
	display: flex;	
}
.footer-left{
	display: flex;
	width: 10%;
}
.middle-funInfo{
	display: flex;
}
.footer-middle{
	margin-left: 20px;
	width: 60%;
	font-size: 12px;
}
.call{
	margin-right: 40px;
	min-width: 430px;
}
.info{
	min-width: 220px;
}
.footer-right{
	width: 30%;
	font-size: 12px;
	float: right;
	font-weight: bold;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/header7.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>
	<div class="footer-content">
		<div class="footer-wrap">
			<div class="footer-left">
				<button class="ask-funfun" type="button">FUNFUNFUN</button>
			</div>
			<div class="footer-middle">
				<div class="middle-funInfo">
					<div class="call">
						<p style="font-size: 14px;"><b>☎펀딩/스토어 고객센터☎</b></p>
						<p><b>1234-5678</b></p>
						<p>상담 가능 시간 : 평일 오전 9시 ~ 오후 6시(주말, 공휴일 제외)</p>
					</div>
					<div class="info">
						<p><b>이메일 (24시간 접수 가능)</b></p>
						<p>- 펀딩 : info@funfunfun.kr</p>
						<p>- 스토어 : help.store@funfunfun.kr</p>
					</div>
				</div>
				<div class="warning">
					<p style="min-width: 663px;">일부 상품의 경우 FUNFUNFUN은 통신판매중개자이며 통신판매 당사자가 아닙니다.</p>
					<p style="min-width: 663px;">해당되는 상품의 경우 상품, 상품정보, 거래에 관한 의무 책임은 판매자에게 있으므로, 각 상품 페이지에서 구체적인 내용을 확인하시기 바랍니다.</p>
				</div>
			</div>
			<div class="footer-right">
				<p style="min-width: 230px;">FUNFUNFUN | 펀딩3만리 | 사업자등록번호 123-12-012345</p>
				<p style="min-width: 230px;">서울특별시 영등포구 선유동2로 57 이레빌딩 (구관) 19F, 20F</p>
				<p style="min-width: 230px;">™FUNFUNFUN ㏇,Ltd</p>
			</div>
		</div>
	</div>
</body>
</html>