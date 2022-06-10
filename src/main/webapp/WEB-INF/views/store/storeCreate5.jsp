<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/store/storeHeader.jsp" %>
	<div class="creStore-wrap">
		<div class="crestore-nav">
			<%@include file="/WEB-INF/views/store/storeNav.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				//$(".nav-sub>li:nth-child(1)").addClass("select");
			</script>
		</div>
		<div class="content-right">
			<h2>반품/교환 정책에 대해 작성해 주세요.</h2>
			<h6>FUNFUNFUN을 통해 간단하고 쉽게 스토어를 만들어서 상품을 등록해 보세요.</h6>
			
			
		
		</div>
	</div>
</body>
</html>