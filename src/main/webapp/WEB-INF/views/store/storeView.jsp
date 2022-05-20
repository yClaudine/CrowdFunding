<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 상세보기</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %><br>
	<div class="content-wrap"><!-- img1 사진 -->
		<div class="content-img">
			${s.storeImg1 }
		</div>
		<div class="content-detail">
		
		</div>
	</div>
	<div class="content-wrap"><!-- 스토리/만족도/반품,교환 내용 들어갈 자리 -->
		<div class="content-detail">
			
		</div>
	</div>
</body>
</html>