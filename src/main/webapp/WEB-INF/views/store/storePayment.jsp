<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 및 결제</title>
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
	<div class="payAll-wrap">
		<div class="payinfo-wrap">
			<h5>주문 및 결제</h5>
			<div class="payinfo-box">
				<h5>주문 정보</h5>
				<div class="payinfo-box">
					<span>주문자명</span><span>${s.memberId }</span>${s.storetitle }
					<span>이메일 주소</span>${m.memEmail }
				</div>
				
			</div>
		</div>
	
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>