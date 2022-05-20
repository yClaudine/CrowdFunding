<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
.content{
	min-width:1300px;
	height:600px;
	margin-top:20px;
	padding:10px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>

</head>
<body>
	<%@include file="WEB-INF/views/common/header.jsp" %>

 	<div class="content">
 		<c:choose>
 			<c:when test="${not empty sessionScope.m.memberId }">
					<a href="logout.do">로그아웃</a>
 			</c:when>
 			<c:otherwise>
 				
 							
 			</c:otherwise>

 		</c:choose>
 		
 	</div>

 

 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>