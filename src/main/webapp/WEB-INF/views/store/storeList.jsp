<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--구글폰트-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>스토어 전체보기</title>
<style>
	.content-wrap{
		width: 90%;
		margin: 0 auto;
		margin-top: 50px;
		display: flex;
	}
	.category-title{
		width: 100%;
	}
	.content-category{
		align-self: center;
		display: flex;
		padding: 20px;
		width: 100%;
		text-align: center;
	}
	.content-categorylist{
		align-self: center;
		padding-left: 100px;
		padding-right: 100px;
		text-align: center;
	}
	.store-content{
		align-self: center;
		font-size: 12px;
		margin: 0;
		padding-top: 0px;
	}
	.content-list{
    	display: inline-flex;
    	width: 100%;
		text-align: center;
	}
	.allcontent-wrap{
		width: 90%;
		margin: 0 auto;
		text-align: center;
	}
</style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp" %><br>
	<div class="content-wrap">
		<div class="category-title">
			<h5>상품 카테고리</h5>
			<div class="content-category">
				<div class="content-categorylist">
					<a href="/home.do"><span class="material-symbols-outlined" style="font-size:45px; color:black;  border-radius: 10px; background-color: #e7f9f9; padding: 7px;">home</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">가전</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/beauty.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">hand_gesture</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">뷰티</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/pet.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">pets</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">반려동물</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/travel.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">airplane_ticket</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">여행</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/food.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">dinner_dining</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">푸드</span>
	                </div>
				</div>
			</div>
		</div>
	</div>
	<div class="content-wrap">
			<div class="content-list">
				<span class="material-symbols-outlined">favorite</span><b>BEST 상품</b>
			</div>
	
	
	
	</div>
	<div class="content-wrap">
		<div class="content-list">
			<span class="material-symbols-outlined">exit_to_app</span><b>스토어 전체 상품 구경하기</b>
		</div>
	</div>
	<div class="allcontent-wrap">
		<div class="content-list">
	    	<tbody>
	        	<c:forEach items="${list }" var="s" varStatus="i">
	        		<div class="allcontent-wrap">${(reqPage-1) *8 + i.count}</div>
	            	<div class="allcontent-wrap">${s.storeImg1 }
	                	<div class="allcontent-list">
	                	<a href="/storeView.do?storeNo=${s.storeNo }">${s.storeTitle }</a>
	                	</div>
	                </div>
	            </c:forEach>
		   </tbody>
		</div>
		<div class="content-list">
			<div class="pageNavi">${pageNavi }</div> 
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>