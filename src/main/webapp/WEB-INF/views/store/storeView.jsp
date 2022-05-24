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
	<h1>게시글 상세보기</h1>
	<hr>
	<table border="1">
		<tr>
			<th>번호</th><th>제목</th>
		</tr>
		<tr>
			<td>${s.storeNo }</td>
			<td>${s.storeTitle }</td>
		</tr>
		<tr>
		<th>작성자</th><th>작성일</th>
		</tr>
		<tr>
			<td>${s.memberId }</td>
			<td>${s.storeProduct }</td>
		</tr>
		<tr>
			<th colspan="2">내용</th>
		</tr>
		<tr>
			<td colspan="2">${s.storeProductcontent }</td>
		</tr>
	</table>
	<div class="content-wrap"><!-- img1 사진 -->
		<div class="content-img">
			<tbody>
	        	<c:forEach items="${list }" var="s" varStatus="i">
	        		<div class="content-wrap">
		            	<div class="allcontent-wrap">${s.storeImg1 }
		                	<div class="allcontent-list">
		                	<a href="/storeView.do?storeNo=${s.storeNo }">${s.storeTitle }</a>
		                	</div>
		                </div>
	                </div>
	            </c:forEach>
		   </tbody>
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