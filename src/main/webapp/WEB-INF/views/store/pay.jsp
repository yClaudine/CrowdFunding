<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 결제 성공</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
.info{
	margin-top: 15px;
	margin-bottom: 15px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<br>
	<br>
	<h5 style="padding-left: 20px;">결제완료</h5>
	<hr>
	<ul style="text-align: center; width:90%;">
		<li style="text-align: center; width:100%;"><h2 style="margin-top: 150px; text-align: center; height: 100px; background-color: #00c4c4; padding-top: 30px;">${m.memberName } 님의 "${s.storeProduct }" 구매가 완료 되었습니다.</h2></li>
		<li class="info">주문자 : ${m.memberId }</li>
		<li class="info">받는 분 : ${sd.deliveryName }</li>
		<li class="info">받는 이 연락처 : ${sd.deliveryPhone }</li>
		<li class="info">배송메세지 : ${sd.deliveryMsg }</li>
		<li style="font-size: 20px; text-align: center; margin-top: 50px;"><a href="/" style="text-decoration: none;">홈으로</a></li>
	</ul>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>