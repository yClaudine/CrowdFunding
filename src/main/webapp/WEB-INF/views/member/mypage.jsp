<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/mypage1.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <script src="resources/js/mypage1.js"></script>
    
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<style>
		#miss{
			margin:0px;
		}
		#mypg{
	    color: #FFC4DD;
	    font-size: 60px;
	    background-color:#e7f9f9 ;
	    border-radius: 30px;
	    display: block;
	    width:60px;
	    height:60px;
	    margin:30px auto;
	    
		}
		.Bupdate{
			font-size :15px;
			width:100px;
			text-align:center;
		}
		#h5{
		    font-size: 20px;
		    padding-left: 80px;
		    color: #212529;
		    font-weight:400;
		}
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>    
	<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
    <div class="content">
        <div class="wrapper">
            <div class="one"></div>
            <div class="three">
                <div class="profile">
                	<c:if test="${sessionScope.m.gender==0 }">	
                    <span class="material-symbols-outlined" id="myp">
                        account_circle_full
                        </span>
                    </c:if>
                    <c:if test="${sessionScope.m.gender==1 }">	
                    <span class="material-symbols-outlined" id="mypg">
                        account_circle_full
                        </span>
                    </c:if>
                    <a href="" class="Bupdate">-<span>${sessionScope.m.memberName}</span>님</a>
                        
                    <div class="int">서포터 * 개인화면</div>
                </div>
                <div class="logout">
                	<c:if test="${sessionScope.m.categoryNo==1 }">
                    	<a href="sellerReqFrm.do" class="aout"><button class="btn btn-outline-success" id="outBtn">판매자 신청</button></a>
                    </c:if>
                    <c:if test="${sessionScope.m.categoryNo==2 }">
                    	<a href="logout.do" class="aout"><button class="btn btn-outline-success" id="outBtn">로그아웃</button></a>
                    </c:if>
                </div>
                <div class="logout onload">
                	<a href="onLoadFrm.do" class="aout"><button class="btn btn-outline-success" id="outBtn">신청 현황</button></a>
                </div>
                <div class="setting">
                    <a href="setting.do" class="mUS"><span class="material-symbols-outlined" id="sett">
                        settings
                        
                    </span><sup>설정</sup></a>
                    
                </div>
                
            </div>
            <div class="four">
                <ul class="count">
                    <li class="fundCount">
                        <span>0</span>
                        <a href="mypageFund.do">펀딩</a>
                    </li>
                    <li class="buyCount">
                        <span>0</span>
                        <a href="mypageBuy.do">구매</a>
                    </li>
                </ul>
                <div class="myCoupon">
                    <div>
                        <a href="mymassage">
                            <span class="material-symbols-outlined" id="symbols">
                                mail
                                </span>
                            <sup id="text1">메시지</sup>
                            <sup id="text2">></sup>
                        </a>
                        <a href="mycoupon.do" class="cou" >
                            <span class="material-symbols-outlined symbols" id="symbols">
                                redeem
                                </span>
                            <sup id="text1">쿠폰</sup>
                            <sup id="text2">></sup>
                        </a>
                    </div>
                </div>
                <span id="h5">Community</span>
                <div class="myCommunity">
                    
                    <div class="comm">
                        <a href="myfollower.do">
                            <span class="material-symbols-outlined" id="symbols">
                                group
                                </span>
                            <sup id="text3">나의 팔로워</sup>
                            <sup id="text2">></sup>
                        </a>
                        <a href="myfollowing.do" class="cou" >
                            <span class="material-symbols-outlined" id="symbols">
                                group_add
                                </span>
                            <sup id="text3">나의 팔로잉</sup>
                            <sup id="text2">></sup>
                        </a>
                    </div>
                </div>
                <span id="h5">Activity</span>
                <div class="mycomment">
                    <div class="comm">
                        <a href="mycomment.do">
                            <span class="material-symbols-outlined" id="symbols">
                                mark_chat_unread
                                </span>
                            <sup id="text3">나의 댓글</sup>
                            <sup id="text2">></sup>
                        </a>
                        
                    </div>
                </div>
            </div>
            
            <div class="five">
                <div class="mypage">
                    <span >서포터</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                        </span>
                    
                </div>
            </div>
            <c:if test="${sessionScope.m.categoryNo==2}">
            <div class="six">
                <div class="sellerpage">
                    <span>메이커</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                        </span>
                </div>

            </div>
            </c:if>
        </div>
        <div class="wrapper1">
            <div class="one"></div>
            <div class="three">
                <div class="profile2">
                    <span class="material-symbols-outlined" id="myp">
                        account_circle_full
                        </span>
                    <a href="" class="Bupdate1">-<span>와디즈 메이커</span>님</a>
                    <a href="" class="Bupdate1">-<span>프로필 편집하기</span> ></a>
                    <div class="int">판매자 * 서포터</div>
                    
                </div>
                <div class="logout">
                    <a href="logout.do" class="aout"><button class="btn btn-outline-success" id="outBtn">로그아웃</button></a>
                </div>
                <div class="setting">
                    <a href="mypageUpdate.do" class="mUS"><span class="material-symbols-outlined" id="sett">
                        settings
                        
                    </span><sup>설정</sup></a>
                </div>
            </div>
            <div class="four">
                <div class="fc">
                    <div class="funding">
                            <h6>펀딩</h6>
                    </div>
                    <div class="store">
                            <h6>스토어</h6>
                    </div>
                </div>
                <div class="fund">
                    <div>만든펀딩</div>
                    <ul class="Info">
                        <li>
                            <a href=""><div class="imgbox"><img src="/img/00.png" alt=""></div></a>
                            <div class="fundtitle">제목</div>
                            <div class="exp">설명</div>
                        </li>
                        <li>
                            <a href=""><div class="imgbox"><img src="/img/00.png" alt=""></div></a>
                            <div class="fundtitle">황재를 위한 안마배개</div>
                            <div class="exp">이벤트로 굉장히 파격적인 세일중 지금 아니면 어떤때 기회가 올지모름</div>
                        </li>
                    </ul>
                    <ul class="pagination pagination-sm">
                        <li class="page-item disabled">
                          <a class="page-link" href="#">«</a>
                        </li>
                        <li class="page-item active">
                          <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">»</a>
                        </li>
                      </ul>
                    <a href="fundingOpen.do" class="fundopen"><button class="btn btn-primary btnf">펀딩 오픈 신청하기</button></a>
                    <div class="mycomment1">
                        <div class="comm">
                            <a href="mycomment.do">
                                <span class="material-symbols-outlined" id="symbols">
                                    mark_chat_unread
                                    </span>
                                <sup id="text3">나의 댓글</sup>
                                <sup id="text2">></sup>
                            </a>
                            
                        </div>
                    </div>
                </div>
                <div class="storeCt">
                    <div>판매물품</div>
                    <ul class="Info">
                        
                        <li>
                            <a href=""><div class="imgbox"><img src="/img/00.png" alt=""></div></a>
                            <div class="fundtitle">제목</div>
                            <div class="exp">설명</div>
                        </li>
                        <li>
                            <a href=""><div class="imgbox"><img src="/img/00.png" alt=""></div></a>
                            <div class="fundtitle">스토어 물품</div>
                            <div class="exp">지금 것 맛보지 못한 특별한 닭가슴살</div>
                        </li>
                    </ul>
                    <ul class="pagination pagination-sm">
                        <li class="page-item disabled">
                          <a class="page-link" href="#">«</a>
                        </li>
                        <li class="page-item active">
                          <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">5</a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" href="#">»</a>
                        </li>
                      </ul>
                    <a href="storeProject.do" class="fundopen"><button class="btn btn-primary btnf">스토어 프로젝트 시작하기</button></a>
                </div>
            </div>
            <div class="notthingF">
                <div class="msgI">
                    <span class="material-symbols-outlined" class="idea">
                        light
                        </span>
                    <span>메이커님의 아이디어로 세상을 밝게 비춰보세요!</span>
                </div>
                
                <a href="storeProject.do" class="fundopen"><button class="btn btn-primary btnf">스토어 프로젝트 시작하기</button></a>
            </div>
            <div class="five">
                <div class="mypage mypage1">
                    <span >서포터</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                        </span>
                    
                </div>
            </div>
            <div class="six">
                <div class="sellerpage sellerpage1">
                    <span>메이커</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                    </span>
                </div>
        </div>
        </div>
    </div>
    <script>
    	$(function(){
    		const onload =$(".onload");
    		const memberId = $("[name=memberId]").val();
    		$.ajax({
    			url : "/selectSeller.do",
    			data : {memberId:memberId},
    			type : "get",
    			success: function(s){
    				if(s!=null&&s.authSeller==0||s.authSeller==1){
    					console.log(s.authMessage);
    					onload.show();
    				}else{
    					onload.hide();
    					
    						
    					
    					
    				}
    			},
    			error: function(){
    				contsole.log("프로그램 데이터 에러");
    			}
    		});
    	});
    
    </script>
</body>
</html>