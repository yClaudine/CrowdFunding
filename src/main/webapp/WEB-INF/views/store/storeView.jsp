<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${s.storeProduct }</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>

<style>
	.menu-color{
		min-width: 250px;
	}
	.content-wrap{
		display: flex;
		width: 90%;
		margin: 0 auto;
		min-width: 900px;
		padding-top: 50px;
	}
	.img-box{
		width: 50%;
		border: 1px solid black;
		padding: 20px 20px;
		margin-left: 50px;
	}
	.content-detail{
		margin: 20px auto;
	}
	.store-price{
		float: right;
	}
	.store-select{
		border: 1px solid black;
		padding: 5px 5px 5px;
	}
	.pm{
		display: flex;
		float: right;
	}
	.price-ko{
		float: left;
		font-weight: bold;
	}
	.price-no{
		float: right;
	}
	.priceno{
		float: right;
	}
	#buy-button{
		border: none;
		font-weight: bold;
	}
	#story-btn,#buyer-btn,#change-btn{
		border: none;
		background-color: #e7f9f9;
	}
	.tab-wrap{
	    width: 90%;
	    margin: 0 auto;
	    min-width: 900px;
	}
	.tabs{
	    margin: 0;
	    padding: 0;
	    list-style-type: none;
	    overflow: hidden;
	}
	.tabs>li{
	    float: left;
	    width: 100px;
	    text-align: center;
	    height: 30px;
	    line-height: 30ps;
	}
	.tabs>li:hover{
	    font-size: 1.1em;
	    cursor: pointer;
	}
	.tabcontent{
	    width: 95%;
	    margin: 0 auto;
	    padding: 30px 0px;
	    display: none;
	}
	.story{
		width: 70%;
	}
	.story-content1>span{
		height: 30px;
	}
	.story-content1>span:nth-child(2) {
		float: right;	
	}
	.menu{
    	width: 85%;
	}
	.menu ul{
	    margin: 0;
	    padding: 0;
	    list-style-type: none;
	}
	.main-menu>li{
	    background-color: #e7f9f9;
	}
	.menu a{
	    font-size: 16px;
	    display: block;
	    height: 40px;
	    line-height: 40px;
	    text-decoration: none;
	    color: #000000;
	    padding-left: 20px;
	    position: relative;
	    font-weight: bold;
	    border-bottom: 3px solid #00c4c4;
	}
	.main-menu>li>a:hover{
	    background-color: #00b2b2;
	    color: black;
	}
	
	.sub-menu{
	    display: none;
	}
	.more{
	    position: absolute;
	    font-size: 20px;
	    right: 20px;
	    transition-duration: 0.5s;
	}
	/*모양 돌아가게 되는거*/
	.menu-active{
	    transform: rotate(180deg);
	}
	.story-content1-2{
		line-height: 40px;
		text-align: justify;
		padding: 10px 30px;
		background-color: #ddd;
	}
	.star-wrap1{
		display: flex;
		width: 100%;
		margin: 0 auto;
	}
	.star{
		padding-left: 50px;
	}
	.story-content1-3{
		line-height: 40px;
		text-align: justify;
		padding: 8px 30px;
		background-color: #ddd;
	}
	.star-wrap2{
    overflow: hidden;
	}
	.star-wrap2>span{
	    font-size: 30px;
	    float: left;
	    color: lightgray;
	}
	.star-wrap2{
	    position: relative;
	}
	.star-on{
	    position: absolute;
	    left: 0;
	    width: 0;
	    overflow: hidden;
	}
	.star-on>div{
	    width: 150px;
	    overflow: hidden;
	}
	.star-on span{
	    font-size: 30px;
	    float: left;
	    color: black;
	}
	.score>span{
		font-size: 15px;
	}
	.star-box>span{
		color : #ccc;
	}
	.starCommentBox{
		margin : 30px; 
		
	}
	.starCommentBox>form>ul{
		display:flex; 
		min-width: 960px;
	}
	.starCommentBox>form>ul>li:first-child{
		width:10%;
		display:flex;
		justify-content: center; 
		align-items:center;
		
	}
	.starCommentBox>form>ul>li:first-child>span{
		font-size:35px;
		color : #00b2b2;
	}
	.starCommentBox>form>ul>li:nth-child(2){
		width:20%;
		height: 60px; 
	}
	.starCommentBox>form>ul>li:nth-child(3){
		width:55%; 
		height: 60px;
		margin-right: 15px;
	}
	.starCommentBox>form>ul>li:nth-child(3)>textarea.input-form{
		width:100%;
		min-height:60px;
		marin-right: 10px;
	}
	.starCommentBox>form>ul>li:last-child{
		width:8%;
		
	}
	.starCommentBox>form>ul>li:last-child>button{
		height:60px;
		line-height:0px;
		background-color: #00b2b2;
		color: white;
	}
	.star-Box{
		display: flex;
	}
	.star-box{
		padding-right: 10px;
		font-size: 10px;
	}	
	.who{
		text-align: center;	
		width: 10%;
	}
	.star-Box2{
		text-align: center;	
		font-size: 12px;
	}
	#star{
		font-size: 15px;
	}
	.starcomment-wrap{
		width: 20%;
		font-size: 15px;
	}
	.starcomment-wrap>.star-Box2>.material-symbols-outlined{
		font-size: 15px;
	}
	.comment-wrap{
		display: flex;
		width: 83%;
		padding-bottom: 30px;
	}
	.content-list{
		display: flex;
		margin: 30px;
		min-width: 960px;
		width: 90%;  
		text-align: center;
		flex-wrap: wrap;
	}
	.starcontent{
		width: 80%;
		min-width: 610px;
		background-color: #e7f9f9;
		padding: 10px 15px 10px;
		text-align: left;
		margin-left: 10px;
	}
	.star-box2{
		min-width: 131px;
	}
	#report-button{
		margin-left: 10px;
		width: 40px;
		height: 30px;
		font-size: 12px;
		border-radius: 10px;
		border: none;
		
	}
	#report-button:hover{
		background-color: #e6354c;
	}
	.storeAllPrice{
		padding-top:10px;
	}
	.starstar{
		display: flex;
		margin: 0 auto;
	}
	.avg{
		display: flex;
	}
	#avgin{
		padding-left: 15px;
		font-size: 15px;
	}
	.wrap{
		display: flex;
	}
	.priceno1{
		padding-left: 150px;
	}
	.storeAllPrice{
		padding-top: 20px;
	}
	.star-box>span:hover{
		cursor: pointer;
	}
	.reportCount{
		margin-top : 30px;
		background-color: #dee2e6;
		font-size: 13px;
		border: none;
	}
	.reportCount:hover{
		background-color: #f3a5a5;
	}
	.commentUpdate{
		font-size: 13px;
		text-decoration: none;
		color: #00b2b2;
		float: right;
		padding-right: 5px;
	}
	.form{
	 display: flex;
	}
	.p{
		font-size: 13px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap">
		<div class="img-box">${s.storeImg1 }</div>
			<div class="content-detail">
				<div class="wrap">
				<div class="store-category" id="category">${s.storeCategory }</div><div class="priceno1" id="priceno">${s.storeTitle }</div></div>
				<div class="store-select">
					<div class="store-name">${s.storeProduct }<div class="priceno">${s.storePrice } 원</div></div><br>
					<div class="pm">
						<input type='button' onclick='count("minus")' value='-' style="width: 25px;"/>						
						&nbsp;&nbsp;<div id='result'>1</div>&nbsp;&nbsp;
						<input type='button' onclick='count("plus")' value='+' style="width: 25px;"/>
					</div><br><br>
					<div class="store-delivery">
						<div class="price-ko">배송비</div><div class="priceno">${s.storeDelivery } 원</div></div><br></div>
					<div class="storeAllPrice">
					<div class="price-ko">총 결제금액</div><div class="priceno" id="allprice">${s.storeDelivery+s.storePrice} </div></div>
					<c:choose>
						<c:when test="${!empty sessionScope.m }">
							<button type="submit" id="buy-button" style="width: 300px; height:40px; background-color: #00c4c4;">구매하기</button>
						</c:when>
						<c:otherwise>
							<br><br><a href="/" style="padding-left:10px; text-decoration: none; color: #00b2b2;"> 로그인 후 구매가 가능합니다.(click!)</a>
						</c:otherwise>
					</c:choose>
		</div>
	</div><br><br>
    <div class="tab-wrap">
        <ul class="tabs">
            <li>스토리</li>
            <li>만족도</li>
            <li>반품/교환</li>
        </ul>
        <div class="content-wrap2">
            <div class="tabcontent" id="story">
                <h3 class="menu-color">배송안내</h3>
                <hr>
                <div class="story">
	                <div class="story-content1">
	                	<span>발송기간</span><span>구매 후 1일 내 발송(주말, 공휴일 제외)</span>
	                </div><br>
	                <div class="story-content1">
	                	<span>배송비</span><span>${s.storeDelivery }&nbsp;&nbsp;원</span>
	                </div><br>
	                <div class="story-content1">
	                	<span style="color: #868e96;">배송 안내사항</span><br>
	                	<span>코로나로 인한 택배 배송(간선하차) 불가로 일부 지역은 배송이 제한될 수 있습니다.<br> 자세한 내용은 공지사항을 참고 부탁드립니다.</span><br><br>
	                	<span style="color: #868e96;">구매 전 반드시 확인하세요!</span><span><br>아래 스토리 내용은 이전 펀딩 진행 시 작성된 내용입니다.<br>상품 금액은 스토리 상이 아닌 상품 선택해서 확인해 주세요.</span><br>
	                </div>
                </div><br>
        		
		        <div class="menu">
		        	<ul class="main-menu">
			            <li>
			                <a class="menu-color">상품 정보 제공 고시</a>
			                <ul class="sub-menu">
			                    <li>
			                        <div class="story-content1-2">
				                	<span style="font-size: 15px;padding-left: 60px;">상품명</span><span style="font-size: 15px;float:right;padding-right: 60px;">${s.storeProduct }&nbsp;</span><br>
				                	<span style="font-size: 15px;padding-left: 60px;">상품 카테고리</span><span style="font-size: 15px;float:right;padding-right: 60px;">${s.storeCategory }&nbsp;</span><br>
				                	<span style="font-size: 15px;padding-left: 60px;">상품 가격</span><span style="font-size: 15px;float:right;padding-right: 60px;">${s.storePrice }&nbsp;원&nbsp;</span><br>
				                	<span style="font-size: 15px;padding-left: 60px;">제조국</span><span style="font-size: 15px;float:right;padding-right: 60px;">중국&nbsp;</span><br>
				                	<span style="font-size: 15px;padding-left: 60px;">품질 보증 기준</span><span style="font-size: 15px;float:right;padding-right: 60px;">관련 법 소비자 분쟁 해결 기준에 따름&nbsp;</span><br>
				                	</div>
			                    </li>
			                </ul>
			            </li>	
			            <li>
			                <a class="menu-color">메이커 정보</a>
			                <ul class="sub-menu">
			                    <li>
			                        <div class="story-content1-2">
				                	<span style="font-size: 15px;padding-left: 60px;">스토어 번호</span><span style="font-size: 15px;float:right;padding-right: 60px;">${s.storeNo }&nbsp;</span><br>
				                	<span style="font-size: 15px;padding-left: 60px;">스토어명</span><span style="font-size: 15px;float:right;padding-right: 60px;">${s.storeTitle }&nbsp;</span><br>
				                	<span style="font-size: 15px;padding-left: 60px;">스토어 판매자</span><span style="font-size: 15px;float:right;padding-right: 60px;">${s.memberId }&nbsp;</span><br>
				                	</div>
			                    </li>
			                </ul>
			            </li>
			            <li>
			                <a class="menu-color">서비스 유의사항</a>
			                <ul class="sub-menu">
			                    <li>
			                        <div class="story-content1-2">
				                	<span style="font-size: 15px;padding-left: 10px;">- 전자상거래 등에서의 소비자보호에 관한 법률에 의한 반품규정이 판매자가 지정한 반품 조건보다 우선합니다.</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 미성년자가 물품을 구매하는 경우, 법정대리인이 동의하지 않으면 미성년자 본인 또는 법정대리인이 구매를 취소할 수 있습니다.</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 전기용품 및 생활용품 안전관리법 및 어린이제품 안전 특별법 규정에 의한 안전관리대상 품목인 전기용품, 생활용품, 어린이제품을 판매 또는 구매하실 경우에는 해당 제품이 안전인증, 안전확인, 공급자적합성확인, 안전기준준수 적용 제품인지 확인하시기 바랍니다.</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 와디즈의 결제시스템을 이용하지 않고 판매자와 직접 거래하실 경우 상품을 받지 못하거나 구매한 상품과 상이한 상품을 받는 등 피해가 발생할 수 있으니 유의하시기 바랍니다.</span>
				                	</div>
			                    </li>
			                </ul>
			            </li>
		       	 	</ul>
	    		</div>
	    		<form action="/reportCount.do" method="post">
	    			<fieldset>
			    		<input type="hidden" name="storeNo" value="${s.storeNo }">
			    		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
			    		<p class="p">프로젝트 및 게시글에 부적절한 내용이 있나요? <input class="reportCount" type="submit" value="신고하기"></p>
		    		</fieldset>
	    		</form>
            </div>
            <div class="tabcontent" id="star">
            	<div class="starstar">
                <h5 class="menu-color">"${s.storeProduct }" 구매자 만족도 </h5>
                <div class="avg">
                <c:forEach begin='1' end='5' varStatus="j">
					<c:choose>
						<c:when test="${starAvg ge j.count}">
					    	<span class="material-symbols-outlined" style="color:#00b2b2;">star</span>
					    </c:when>
					    <c:otherwise>
					    	<span class="material-symbols-outlined">star</span>
					    </c:otherwise>
					          				
					</c:choose>                        					
                </c:forEach><div id="avgin">${starAvg } 점 / 5.0 점</div> 
                </div>
                </div>
                <hr>
                <c:if test="${not empty sessionScope.m && storepayNo!=0}">
				<div class="starCommentBox"> 
					<form action="/insertStar.do" method="post">
						<ul>
							<li><span class="material-symbols-outlined">account_circle</span></li>
							<li class="score"><span>${s.storeProduct }&nbsp;의 평점</span><br>
								<div class="star-Box">
								   <div class="star-box">
								        <span class="material-symbols-outlined">star</span>
								        <span class="material-symbols-outlined">star</span>
								        <span class="material-symbols-outlined">star</span>
								        <span class="material-symbols-outlined">star</span>
								        <span class="material-symbols-outlined">star</span>
								   </div>
								   <span class="num"></span>
								   <input type="hidden" name="starScore" value="0"> 점
								</div>                           
							</li>
							<li>
			    				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
								<input type="hidden" name="storeNo" value="${s.storeNo }">
								<input type="hidden" name="storeProduct" value="${s.storeProduct }">
						        <input type="hidden" name="storepayNo" value="${storepayNo }">
								<textarea class="input-form" name="starContent"></textarea>
							</li>
							<li>
								<button type="submit" class="btn">등록</button>
							</li>
						</ul>
					</form>
				</div>
				</c:if>
			    <div class="content-list">
			        <c:forEach items="${list }" var="ss" varStatus="i">
			        	<div class="who">
				        	<div class="allcomment-wrap"><span class="material-symbols-outlined">account_circle</span></div>
						    <div class="membername">${ss.memberId }</div>
					    </div>
			        	<div class="comment-wrap">
			        		<form action="/reportCountMember.do" class="form">
				            <div class="starcomment-wrap">
				            <div class="star-Box2">
					            	<div class="star-box2">
					            		<c:forEach begin='1' end='5' varStatus="j">
					            			<c:choose>
					            				<c:when test="${ss.starScore ge j.count}">
					            					<span class="material-symbols-outlined" style="color:#00b2b2;">star</span>
					            				</c:when>
					            				<c:otherwise>
					            					<span class="material-symbols-outlined">star</span>
					            				</c:otherwise>
					            				
					            			</c:choose>                        					
                        				</c:forEach>
							        	
							        </div>
						            <div class="starScore2">${ss.starScore }&nbsp;점	</div>
					            </div>
				            </div>
				            <div class="starcontent">
					            <div class="commentupdate">
					            	<p>${ss.starContent }</p>
						            <textarea name="starContent" style="display:none; min-width: 100%;">${ss.starContent }</textarea>
						            <c:if test="${sessionScope.m.memberId eq ss.memberId }">
						            <div class="modify">
								    	<a class="commentUpdate"  onclick="deleteComment(this,'${ss.starNo }','${s.storeNo }')">삭제</a>
								        <a class="commentUpdate" onclick="modifyComment(this,'${ss.starNo }','${s.storeNo }')">수정</a>
					           		 </div>
					           		 </c:if>
				           		 </div>
			           	 	</div>
			           	 	<input type="hidden" name="memberNo" value="${m.memberNo }">
			           	 	<input type="hidden" name="storeNo" value="${s.storeNo }">
			           	 	<input type="hidden" name="starNo" value="${ss.starNo }">
			            	<button id="report-button">신고</button>
			            </form>
			            </div>
			        </c:forEach>
			       
				</div>
				
	
            </div>
            <div class="tabcontent" id="change">
                <h3 class="menu-color">반품/교환</h3>
                <hr>
                <div class="menu" style="width: 90%;">
		        	<ul class="main-menu">
			            <li>
			                <a class="menu-color">반품 보내실 주소</a>
			                <ul class="sub-menu">
			                    <li>
			                        <div class="story-content1-3">
				                	<span style="font-size: 15px;padding-left: 30px;">서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F</span><br>
				                	</div>
			                    </li>
			                </ul>
			            </li>	
			            <li>
			                <a class="menu-color">교환 / 환불 정책</a>
			                <ul class="sub-menu">
			                    <li>
			                        <div class="story-content1-3">
				                	<span style="font-size: 15px;padding-left: 10px;">- 서포터 단순 변심에 의한 교환/반품은 상품 수령 후 7일 이내에 신청할 수 있습니다.(반품 배송비 서포터 부담)</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 상품의 내용이 표시∙광고 내용과 다르거나 계약내용과 다르게 이행된 경우에는 해당 상품 등을 수령한 날부터 3개월 이내,</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">      그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 교환/반품을 신청할 수 있습니다.(반품 배송비 메이커 부담)</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 다음의 경우에는 교환/반품을 신청할 수 없습니다.<br>
				                		<span style="font-size: 15px;padding-left: 10px;">- 서포터의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우(다만, 상품 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외함)</span><br>
				                		<span style="font-size: 15px;padding-left: 10px;">- 서포터의 사용 또는 일부 소비로 인하여 상품 등의 가치가 현저히 감소한 경우</span><br>
				                		<span style="font-size: 15px;padding-left: 10px;">- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</span><br>
				                		<span style="font-size: 15px;padding-left: 10px;">- 주문에 따라 개별적으로 생산되는 상품 등 그에 대하여 청약철회 등을 인정할 경우 메이커에게 회복할 수 없는 중대한 피해가 예상되는 경우로서, 사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 서포터의 서면(전자문서를 포함)에 의한 동의를 받은 경우</span><br>
				                		<span style="font-size: 15px;padding-left: 10px;">- 용역 또는 “문화산업진흥 기본법” 제2조 제5호의 디지털콘텐츠의 제공이 개시된 경우(다만, 가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우에는 제공이 개시되지 아니한 부분에 대하여는 제외함)</span><br>
				                		<span style="font-size: 15px;padding-left: 10px;">- 복제 가능한 상품 등의 포장을 훼손한 경우</span><br>
										<span style="font-size: 15px;padding-left: 10px;">- 그 밖에 관련 법령에 따른 반품 제한 사유에 해당되는 경우</span><br>
				                	</span>
				                	</div>
			                    </li>
			                </ul>
			            </li>
			            <li>
			                <a class="menu-color">AS 및 안내사항</a>
			                <ul class="sub-menu">
			                    <li>
			                        <div class="story-content1-3">
				                	<span style="font-size: 15px;padding-left: 10px; font-weight: bold;">1. 보증기간 : 리워드 수령일부터 1년</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 무상보증 기간은 리워드 수령일부터 산정 됨으로, 포장 내 보증서를 잘 작성 및 보관하시기 바랍니다. 무상보증 기간은 수령일부터 3개월이 경과한 날부터 보증기간이 계산 됩니다. 무료서비스 제품 보증기간 이내에 발생한 성능, 기능상의 고장 문제는 무료로 서비를 받으실 수 있습니다.</span><br>
				                	<span style="font-size: 15px;padding-left: 10px; font-weight: bold;">2. A/S 규정</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 수령 후 초기 하자가 아닌, 사용중 발생한 하자에 대해서는 당사 A/S 규정에 따름.</span><br>
				                	<span style="font-size: 15px;padding-left: 10px; font-weight: bold;">3. A/S 불가한 경우</span><br>
				                	<span style="font-size: 15px;padding-left: 10px;">- 보증기간 이내일지라도, 사용자 고의 또는 과실로 인하여 수리 및 재생이 불가능한 경우<br>
					                	<span style="font-size: 15px;padding-left: 10px;">(1) 서포터 과실로 고장난 경우</span><br>
					                	<span style="font-size: 15px;padding-left: 30px;">서포터의 사용상의 부주의(침수,파손,손상 등 ) 로 고장이 발생한 경우, 지성 서비스 센터 기사가 아닌 다른사람이 수리하여 고장이 발생 한 경우, 사용설명서의 :주의사항: 을 지키지 않아 고장이 난 경우</span><br>
					                	<span style="font-size: 15px;padding-left: 10px;">(2) 리워드 하자가 아닌 경우</span><br>
					                	<span style="font-size: 15px;padding-left: 30px;">하자가 아닌 경우로 사전 고지된 사항에 대하여 A/S 요청을 하는 경우.</span><br>
					                	<span style="font-size: 15px;padding-left: 10px;">(3) 증빙이 되지 않는 경우</span><br>
					                	<span style="font-size: 15px;padding-left: 30px;">FunFunFun 플렛폼 탈퇴, 아이디 분실등 FunFunFun 펀딩에 대한 증빙이 안되는 경우</span><br>
					                	<span style="font-size: 15px;padding-left: 10px;">(4) 그 밖의 경우</span><br>
					                	<span style="font-size: 15px;padding-left: 30px;">천재지변( 화재,염해, 수해, 낙뢰) 에 의한 고장이 발생한 경우</span><br><br>
				                	</span>
				                	<span style="font-size: 15px;padding-left: 10px; font-weight: bold;">A/S 접수 방법 : 아래 접수처를 통해 구체적인 하자 내용과 함계 접수해주시면, 정확한 소명 후 처리 됩니다.</span><br>
				                	<span style="font-size: 15px;padding-left: 10px; font-weight: bold;">A/S 접수처 : help.store@funfunfun.kr / 1234-5678 </span><br>
				                	</div>
			                    </li>
			                </ul>
			            </li>
		       	 	</ul>
	    		</div>
            </div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	//구매 개수 +,-
	function count(type)  {
		  // 결과를 표시할 element 구매수량
		  const resultElement = document.getElementById('result');
		// 결과를 표시할 element 총가격
		  const allPrice = document.getElementById('allprice');
		  // 현재 화면에 표시된 값 구매수량
		  let number = resultElement.innerText;
		  // 더하기/빼기누를때
		  if(type == 'plus') {
			  if(number>=1&&number<${s.storeCount }){
				  number = parseInt(number) + 1;
			  }else{
				  confirm("1개 이상 ${s.storeCount }개 이하로 선택해주세요.");
				  return;
			  }
		  }else if(type == 'minus')  {
			  if(number>1){
				  number = parseInt(number) - 1;
			  }else{
				  return;
			  }
			  
		  }
		  //총 가격=상품가격*구매수량+배송비
		  let priceno = ${s.storePrice }*number+${s.storeDelivery };
		  
		  // 결과 출력
		  document.getElementById('allprice').value = priceno;
		  allPrice.innerText = priceno;
		  resultElement.innerText = number;
		}
	$(".reportCount").on("click",function(){
		alert("신고가 완료되었습니다.");
	});
	$("#report-button").on("click",function(){
		alert("신고가 완료되었습니다.");
	});
	//number
	$("#buy-button").on("click",function(){
		const resultElement = document.getElementById('result');
		let number = resultElement.innerText;
		//총금액을 넘겨주기
		const totalPrice = document.getElementById('allprice');
		let totalprice = totalPrice.innerText;
		//카테고리 넘겨주기
		const category = document.getElementById('category');
		let storeCategory = category.innerText;
		if(confirm("구매창으로 넘어가시겠습니까?")){
			
			location.href="/storePayment.do?storeNo=${s.storeNo}&number="+number+"&totalprice="+totalprice+"&storeCategory="+storeCategory;
		}
	});

	
	
	
	$(function(){
	    const tabs = $(".tabs>li");
	    tabs.on("click",function(){
	        tabs.css("color","#00000").css("background-color","#e7f9f9");
	        $(this).css("color","#00000").css("background-color","#00c4c4");
	        const content = $(".tabcontent");
	        content.hide();
	        //this로 선택된 탭 지칭
	        const index = tabs.index(this);
	        content.eq(index).show();
	    });
	    //화면이 완성되면 첫번째꺼 클릭해라!
	    tabs.first().next().click();
		var score=$("[name=star-score]");
        
        score.each(function(index,item){
			
			const starScore2=$(item).val()*30;
        	$(item).prev().animate({"width":starScore2+"px"},3000);
		});
        
        const content = $(".tapContent");
        
       tabs.eq(0).click();
	});
	//내용 더보기
	$(".sub-menu").prev().append("<span class='more'>↓</span>");
    //"↓가 존재하는 li"에 click 걸기
    $(".more").parent().parent().on("click",function(e){
        $(this).children().last().slideToggle();
        //first까지가 밑 코드의 this
        $(this).children().first().children(".more").toggleClass("menu-active");
        // eventdoubling을 막아줘야한다
        e.stopPropagation();
    });
    //만족도
    /*
    $(function(){
    	$("#btn").on("click",function(){
        //별점 채우기
        const score = $(this).prev().val();
        const starScore = score*30;
        //$(".star-on").css("width",starScore+"px");
        //2초에 걸쳐서 움직여라
        $(".star-on").animate({"width":starScore+"px"},2000);
    	});
    	
    });*/
    
    $(function(){
    	      
    	   var s =0;
    	    const stars=$(".star-box").children();
    	        stars.on("click",function(){
    	            stars.css("color","#ccc");
    	            const index=stars.index(this);
    	            for(let i=0; i<=index; i++){
    	                stars.eq(i).css("color","#00c4c4");
    	            }
    	            const num=$(".num").eq(0).text(index+1);
    	            num.next().attr("value",index+1);
    	            $("[name=starScore]").val(index+1);
    	        }); 

    	});
    function modifyComment(obj,starNo,storeNo){
		$(obj).prev().prev().show();	//textarea를 화면에 보여줌
		$(obj).prev().prev().prev().hide();	//기존 댓글은 화면에서 숨김
		//수정 -> 수정완료
		$(obj).text("수정완료");
		$(obj).attr("onclick","modifyComplete(this,'"+starNo+"','"+storeNo+"')");
		//삭제 -> 수정취소
		$(obj).prev().text("수정취소");
		$(obj).prev().attr("onclick","modifyCancel(this,'"+starNo+"','"+storeNo+"')");
	}
    function modifyCancel(obj,starNo,storeNo){
		$(obj).prev().hide();	//textarea를 숨김
		$(obj).prev().prev().show();//기존 댓글 보여줌
		//수정완료 -> 삭제
		$(obj).text("삭제");
		$(obj).prev().attr("onclick","deleteComment(this,'"+starNo+"','"+storeNo+"')");
		//수정취소-> 수정
		$(obj).next().text("수정");
		$(obj).attr("onclick","modifyComment(this,'"+starNo+"','"+storeNo+"')");
	}
    function modifyComplete(obj,starNo,storeNo){
		//form태그 생성
		const form = $("<form action='/storeCommentUpdate.do' method='post'></form>");
		//form태그 자식으로 input태그 추가(starNo)
		form.append($("<input type='text' name='starNo' value='"+starNo+"'>"));	
		//form태그 자식으로 input태그 추가(storeNo)
		form.append($("<input type='text' name='storeNo' value='"+storeNo+"'>"));
		//form태그 자식으로 수정한 댓글 내용이 들어있는 textarea를 추가
		form.append($(obj).prev().prev());
		//생성된 form태그를 html본문으로 삽입
		$("body").append(form);
		//form태그 submit
		form.submit();
	}
	function deleteComment(obj,starNo,storeNo){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="/deleteComment.do?starNo="+starNo+"&storeNo="+storeNo;
		}
	}
	</script>
</body>
</html>