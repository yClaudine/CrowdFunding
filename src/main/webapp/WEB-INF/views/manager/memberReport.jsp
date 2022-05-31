<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 신고 상세</title>
<style>
.content-wrap{
    overflow: hidden;
    width: 1200px;
    border-top: 1px solid #bfbfbf;
    font-family: ns-medium;
    border-top: 1px solid #bfbfbf;
    margin: 0 auto;
}
.left-content{
    float: left;
    width: 15%;
}
.main-content{
    float: left;
    width: 85%;
    padding: 80px;
    padding-top: 85px;
    font-size: 13px;
}
.left-content>.title{
    text-align: center;
    font-size: 30px;
    padding: 20px;
}
.manager-menu{
     list-style-type: none;
     margin: 0;
     padding: 0;
     border: 1px solid lightgray;
 }
 .manager-menu>li{
     text-align: center;
     height: 50px;
     line-height: 50px;
     font-size: 15px;
     color: gray;
     
 }
 .manager-menu>li>a{
     display: block;
     text-decoration: none;
     color: #212529;
     background-color:#f2f4f6;
     text-align: center;
     height: 50px;
     line-height: 50px;
     font-size: 15px;
 }
 .manager-menu>li>a:hover{
     color: #e7f9f9;
     cursor: pointer;
     background-color: #00b2b2;
 }
 .manager-menu .active-menu{
     color: #00b2b2;
     font-weight: bold;
 }
.content-wrap .btn{
    font-size: 13px;
    margin: 5px;
}

.content-wrap .btn-primary{
    color: whitesmoke ;
    background-color: #02c9c9;
    border: 1px solid #02c9c9;
    margin: 0;
    margin-top: 10px;
    width: 110px;
    height: 35px;
    line-height: 13px;
    font-size: 15px;
    border-radius: 5px;
}
.content-wrap .btn-primary:hover{
    background-color: #00b2b2;
    border: 1px solid white;
    border: 1px solid #00b2b2;
}
.sub-menu{
    width: 430px;
    margin: auto;
    margin-bottom: 50px;
}
.sub-menu>*{
    width: 200px;
    font-size: 20px;
}
.sub-menu a{
	text-decoration:none;
	color: whitesmoke ;
}
.tables>*{
    text-align: center;
}
.main-content .table td:last-child{
	width: 200px;
}
.main-content .table td{
    line-height: 30px;
    height: 30px;
}
#reportManage{
	background-color: #e7f9f9;
	border:none;
	border: 1px solid  #e7f9f9;
}
#reportManage>*{
	color: #60656a;
}
#sellerManage{
	color:#00b2b2;
    border: 2px solid #00b2b2;
    font-weight: bold;
    margin:0;
    margin-bottom: 5px;
}
#sellerManage:hover{
	cursor: default;
}
select{
	border: 1px solid #bfbfbf;
}
.nodata{
	text-align: center;
	height: 200px;
	line-height: 200px;
	font-size: 20px;
}
.table{
	
}
.table a{
	color: black;
	text-decoration: none;
}
.table td{
	vertical-align: middle;
}
#reportManage>a{
	display:block;
	width: 100%;
	height: 100%;
}
.box{
	margin-bottom: 100px;
	margin-top: 30px;
	padding: 30px;
	border: 1px solid #bfbfbf;
	
	border-radius: 5px;
	min-height: 300px;
}
.review-tbl tr>*:last-child{
	width: 60%;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	 <div class="content-wrap">
        <div class="left-content">
            <div class="title">회원관리</div>
            <div class="menu-wrap">
                <ul class="manager-menu">
                    <li>관리자페이지</li>
                    <li><a href="/fundManage.do?reqPage=1&keyword=&type=all" >펀딩관리</a></li>
                    <li><a href="/storeManage.do?reqPage=1&keyword=&type=all"  >스토어관리</a></li>
                    <li><a href="/memberManage.do?reqPage=1&keyword=&type=all" class="active-menu">회원관리</a></li>
                    <li><a href="/couponManage.do?reqPage=1&keyword=&type=3">쿠폰관리</a></li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <div class="sub-menu">
                <button type="button" class="btn" id="sellerManage">회원 신고 관리</button>
                <button type="button" class="btn" id="reportManage"><a href="/sellerManage.do?keyword=&type=3">판매자 승인 관리</a></button>
            </div>
            <div class="mini-title"><h4>신고 리뷰</h4></div>
	        <button type="button" class="btn btn-primary">리뷰삭제</button>
            <div class="box review">
           		<div class="tables">
	            	<table class="table table-hover review-tbl">
	                    <thead>
	                        <tr>
	                        	<th></th>
	                            <th>날짜</th>
	                            <th>스토어번호</th>
	                            <th>리뷰내용</th>
	                        </tr>
	                    </thead>
	                    <tbody class="tbody">
	                    	<c:if  test="${not empty starList }">
	                    		<c:forEach items="${starList }" var="s">
		                    		<tr>
		                    			<td>
		                    				<input type="radio" name="radio">
		                    				<input type="hidden" name="starNo" value="${s.starNo }">
		                    			</td>
		                    			<td> ${s.starDate }</td>
		                    			<td>${s.storeNo }</td>
			                           	<td>${s.starContent }</td>
		                        	</tr>
		                    	</c:forEach>
	                    	</c:if>
	                    </tbody>
	                </table> 
          	 		</div>
            </div>
            <div class="mini-title"><h4>경고 관리</h4></div>
            <button type="button" class="btn btn-primary">쪽지 보내기</button>
            <div class="box report">
            	<c:choose>
	            	<c:when test="1=2">
	            		 <div class="nodata"><h6>조회 결과가 없습니다.</h6></div>
	            	</c:when>
	            	<c:otherwise>
	            		<div class="tables">
			            	<table class="table table-hover report-tbl">
			                    <thead>
			                        <tr>
			                            <th>보낸날짜</th>
			                            <th>받은사람</th>
			                            <th>읽음여부</th>
			                            <th>내용</th>
			                        </tr>
			                    </thead>
			                    <tbody class="tbody">
			                    	
			                    </tbody>
			                </table> 
	           	 		</div>
	            	</c:otherwise>
           	 	</c:choose>
            
           </div>
           
        </div>
    </div>
  
	
</body>
</html>