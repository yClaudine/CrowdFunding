<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
</head>
<body>
	<%@include file="/WEB-INF/views/fund/fundHeader.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/fund/fundNav.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				$(".nav-sub>li:nth-child(2)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩준비 > <b>기본 정보</b></span>
			<h2>기본 정보</h2>
			<h6>프로젝트를 대표할 주요 기본 정보를 입력하세요.</h6>
		</div>
	</div>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>