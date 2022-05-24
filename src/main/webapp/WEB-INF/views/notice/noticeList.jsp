<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
.content-wrap {
	overflow: hidden;
	width: 1200px;
	margin: 0 auto;
}

.main-content {
	float: left;
	width: 100%;
	padding: 80px;
	padding-top: 85px;
}

.main-content .btn {
	font-size: 20px;
	margin: 5px;
	width: 100px;
	height: 40px;
	line-height: 20px;
	padding: 0;
}

.main-content .btn-primary {
	color: whitesmoke;
	background-color: #02c9c9;
	border: 1px solid #02c9c9;
	display: block;
}

.main-content .btn-primary:hover {
	background-color: #00b2b2;
	border: 1px solid white;
}

.coupon-table {
	width: 100%;
	margin-top: 30px;
	margin-bottom: 30px;
}

.main-top {
	width: 100%;
}

.top-title {
	text-align: center;
	padding: 30px;
	font-weight: bolder;
	font-size: 50px;
}

.top-search {
	width: 640px;
	margin: 0 auto;
}

.top-search ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	height: 80px;
	line-height: 80px;
}

.top-search li {
	float: left;
	margin: 10px;
	line-height: 40px;
}

.top-search li>* {
	height: 40px;
	font-size: 13px;
}

.search-btn {
	width: 60px;
	line-height: 35px;
	border-radius: 5px;
	border: 1px solid #bfbfbf;
}

.search-btn:hover {
	cursor: pointer;
}

input[name='keyword'] {
	width: 300px;
}

.main-content .table {
	margin-top: 50px;
}

.main-content .table tr>th:nth-child(2) {
	width: 20%;
}

.main-content .table th {
	font-weight: normal;
	height:115px;
	line-height:37px
}

.main-content .table th>* {
	padding: 3px;
}

.main-content .table tr:hover {
	background-color: transparent;
}

.notice-type {
	color: #868e96;
	font-size: 13px;
}
.noticeTitle{
	text-decoration:none;
	color: #212529;
}
.noticeTitle:hover{
	color: #212529;
}

.important {
	color: #02c9c9;
	font-weight: bolder;
	font-size: 13px;
}

.notice-date {
	color: #60656a;
	font-size: 13px;
}

.img {
	width: 140px;
	height: 140px;
	margin: 0;
}
.img>img{
	width: 140px;
	height: 140px;
}

.tab-wrap {
	width: 100%;
	margin: 0 auto;
}

.tabs {
	width: 300px;
	padding: 0;
	list-style-type: none;
	overflow: hidden;
	margin: 0 auto;
}

.tabs>li {
	float: left;
	width: 80px;
	margin-right: 5px;
	margin-left: 5px;
	height: 30px;
	line-height: 30px;
	text-align: center;
}

.tabs>li:hover {
	font-size: 1.1em;
	cursor: pointer;
}
.tabs a{
	text-decoration:none;
	color: #212529;
}
.tabcontent {
	width: 70%;
	margin: 0 auto;
	padding: 30px 0px;
}

.content-wrap {
	width: 100%;
	border-top: 1.5px solid #bfbfbf;
}
.pagination{
	justify-content:center;
	margin: 0 auto;
}
.pagination>.page-item>a {
	color: #00b2b2;
}

.pagination>.page-item.active>a {
	background-color: #00b2b2;
	border: 1px solid #00b2b2;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp"%>

	<div class="content-wrap">
        <div class="main-content">
        
            <div class="main-top">
                <div class="top-title">공지사항</div>
                <!--  
        		<form action="#" method="post">
                <div class="top-search">
                    <ul>
                    	<li>
                            <select name="noticeType" >
                            	<option value="allNotice">전체</option>
                                <option value="info">공지</option>
                                <option value="event">이벤트</option>
                            </select>
                        </li>
                        <li>
                            <select name="searchType" >
                            	<option value="all">제목+내용</option>
                                <option value="title">제목</option>
                                <option value="content">내용</option>
                            </select>
                        </li>
                        <li>
                            <input type="text" name="keyword">
                        </li>
                        <li>
                            <input type="submit" class="search-btn" value="검색"></input>
                        </li>
                    </ul>
               		</div>
                 </form>
       			-->
            </div>
      
            <div class="main-middle"> 
            	<!-- 로그인되어있고, 관리자일 경우 글쓰기 가능하도록 -->
            	<c:if test="${not empty sessionScope.m} && ${sessionScope.m.categoryNo eq 0}">
            		<button type="button" class="btn btn-primary write">글쓰기</button>
                	<input type="hidden" class="writer" value="${sessionScope.m.memberId }">
            	</c:if>
                <div class="tab-wrap">
                    <ul class="tabs">
                        <li >
                            <a class="all" href="/notice.do?reqPage=1&type=all">전체</a>
                        </li>
                        <li >
                            <a class="info" href="/notice.do?reqPage=1&type=info">공지</a>
                        </li>
                        <li >
	                        <a class="event" href="/notice.do?reqPage=1&type=event">이벤트</a>
                        </li>
                    </ul>
                    <div class="content-wrap">
                        <div class="tabcontent" id="all">
                       
                            <table class="table ">
                                <tbody>
                                	<c:forEach var="n" items="${list }">
                                		<tr>
                                			<th scope="col">
                                            <span class="notice-type">
                                            	<c:choose>
                                            		<c:when test="${n.noticeType eq 0}">
                                            			공지
                                            		</c:when>
                                            		<c:otherwise>
                                            			EVENT
                                            		</c:otherwise>
                                            	</c:choose>
                                            </span>
                                            <span class="important">
                                            	<c:if test="${n.important eq 1}">
                                            		중요
                                            	</c:if>
                                            </span>
                                            <div><a class="noticeTitle" href="/noticeView.do?noticeNo=${n.noticeNo }">${n.noticeTitle}</a></div>
                                            <div class="notice-date">
                                            	<c:choose>
                                            		<c:when test="${empty n.dateStart}">
                                            		${n.regDate }
                                            		</c:when>
                                            		<c:otherwise>
                                            		${n.dateStart } ~ ${n.dateEnd }
                                            		</c:otherwise>
                                            	</c:choose>
                                            </div>
                                        </th>
                                        <th scope="col">
                                            <div class="img">
                                            <c:if test="${not empty n.noticeFilepath }">
                                            	<img src="/resources/image/notice/main/${n.noticeFilepath}">
                                            </c:if>
                                            </div>
                                        </th>
                                		
                                		</tr>
                                	</c:forEach>
                                </tbody>
                            </table>
                            ${pageNavi }
                        </div>
                    </div>
                </div>    
            </div>
       
        </div>
    </div>
	<script>
	$(".write").on("click",function(){
		const writer = $(".writer").val();
		location.href="/insertNoticeFrm.do?noticeWriter="+writer;
	});
	</script>
</body>
</html>