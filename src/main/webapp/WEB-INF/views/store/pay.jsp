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
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<h5>결제완료</h5>
	<ul>
		<li>결제자 : ${m.memberName }</li>
		<li>배송지 : ${s.storeDelivery }</li>
		<li>결제 상품 : ${s.storeProduct }</li>
		<li>구매 상품 개수 : ${number }</li>
		<li>결제 금액 : ${totalprice }</li>
		<li><a href="/">홈으로</a></li>
	</ul>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>