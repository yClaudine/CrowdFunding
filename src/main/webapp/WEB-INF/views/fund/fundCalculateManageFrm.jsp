<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
</head>
<body>
	<%@include file="/WEB-INF/views/fund/fundHeaderManage.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/fund/fundNavManage.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				$(".nav-sub>li:nth-child(3)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩관리 > <b>정산정보 수정</b></span>
			<h2>제목</h2>
			<h6>간단 설명</h6>
		</div>
	</div>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>