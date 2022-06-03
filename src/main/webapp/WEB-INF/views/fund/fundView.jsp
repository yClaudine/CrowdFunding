<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--jquery-->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <!--구글폰트-->
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
    html>body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    </style>
    <!--부트스트랩-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/header7.css"> 
    <!--구글 아이콘-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.banner{
    height: 200px;
}
.banner-img{
    height: 200px;
    width: 100%;
    position: absolute;
    background-color: gray;
    -webkit-filter: brightness(80%);

}
.banner-img>img{
    height: 200px;
    width: 100%;
    -webkit-filter: blur(5px);
    object-fit:cover;

}

.title-category{
    position: relative;
    height: 28px;
    line-height: 28px;
    text-align: center;
    color: #5cdede;
    font-weight: 500;
    padding-top: 50px;
    padding-bottom: 30px;
}
.title{
    position: relative;
    padding-right: 30px;
    padding-left: 30px;
    text-align: center;
    color: #fff;
    font-size: 30px;
    font-weight: 500;
}
.funding-navi{
    height: 60px;
    display: flex;
    width: 390px;
    margin: 0 auto;
}
.funding-navi>a{
    text-decoration: none;
    padding: 20px;
    font-weight: 500;
    color: #60656a;
}
.funding-navi>a:hover{
    color: #00b2b2;
}
.funding-navi>a:nth-child(1){
    border-bottom: 3px solid #00c4c4;
}
.funding-navi>a:nth-child(1){
    color: #00b2b2;
}

.space-bar{
    width: 100%;
    border-top: 2px solid #b9b9b9;
}

.detail-container{
    display: flex;
    padding-top: 40px;
    margin: 0 auto;
    width: 1000px;
    height: 1000px;
}
.detail-view{
    width: 630px;
    height: 1000px;
}
.space{
    width: 60px;
    height: 1000px;
}
.detail-reward{
    width: 310px;
    height: 1000px;
}
.main-img{
    width: 630px;
    height: 400px;
}
.main-img>img{
    width: 100%;
    height: 400px;
}
.detail-content{
    color: #495057;
    font-weight: 600;
    padding: 20px;
}
.detail-funding{
    margin-top: 30px;
    background-color: #e7f9f9;
    border-radius: 8px;
    padding: 16px;
}
.detail-info{
    color: #00b2b2;
    font-weight: 600;
    font-size: 13px;
    line-height: 20px;
    margin-bottom: 6px;
}

.detail-guide{
    margin-top: 10px;
    background-color: #ece4d8;
    border-radius: 8px;
    padding: 16px;
    position: relative;
}
.detail-fix{
    color: #60656a;
    font-size: 12px;
    line-height: 18px;
    font-weight: 500;
}
.detail-fix2{
    font-weight: 700;
}
.guide-modal{
    position: absolute;
    right: 24px;
    bottom: 23px;
    line-height: 18px;
    font-size: 12px;
    font-weight: 400;
    text-decoration: underline;
    color: #495057;
}
.guide-modal:hover{
    color: #00b2b2;
    cursor: pointer;
}
.story{
    margin-top: 50px;
    margin-bottom: 20px;
    font-weight: 700;
    font-size: 20px;
}
.detail-img{
    width: 630px;
    height: 400px;
}
.detail-img>img{
    width: 100%;
    height: 400px;
    margin-bottom: 5px;
}
.remaining-day{
    font-size: 30px;
    line-height: 36px;
    font-weight: 600;
    color: #4a4a4a;
}
.rate-bar{
    width: 100%;
    margin-bottom: 20px;
    border-top: 4px solid #00b2b2;
}
.project-status span{
    font-size: 15px;
    color: #4a4a4a;
    line-height: 50px;
}
.project-status span strong{
    font-size: 24px;
}
.funding-linkwrap{
    width: 100%;
    text-align: center;
    text-decoration: none;
}
.funding-link{
    margin-top: 10px;
    font-size: 22px;
    color: #ffffff;
    border-radius: 5px;
    line-height: 55px;
    height: 55px;
    background-color: #00c4c4;
    width: 100%;
    
}
.funding-link:hover{
    transition: 0.5s;
    background-color: #00b2b2;
    color: #dadce0;
}
.btn-box{
    display: flex;
}
.like-btn,.report-btn{
    display: flex;
    background-color: #ffffff;
    border: 1px solid #dadce0;
    color: #4a4a4a;
    height: 45px;
    border-radius: 0;
    justify-content: center;
}
.like-btn:hover,.report-btn:hover{
    transition: 0.5s;
    background-color: #dbdbdb;
    border: 1px solid white;
}
.like-btn{  
    width: 105px;
}
.like-btn .material-icons, .report-btn .material-icons{
    font-size: 20px;
}
.report-btn{
    width: 200px;
    float: right;
    margin-left: 5px;
}
.like-btn span, .report-btn span{
    line-height: 45px;
}
.like-btn>.btn-value, .report-btn>.btn-value{
    font-size: 16px;
}
.like-btn .material-icons{
    color: #00c4c4;
}
.seller-info{
    margin-top: 30px;
    margin-bottom: 5px;
    font-weight: 500;
    font-size: 14px;
    color: #495057;
}
.seller-wrap{
    background-color: #ffffff;
    border: 1px solid #dadce0;
    color: #4a4a4a;
    border-radius: 15px;
}
.seller-detail{
    display: flex;
    justify-content: left;
    padding-left: 25px;
}
.seller-profile{
    width: 50px;
    font-size: 40px;
    padding-top: 15px;
}
.seller-name{
    padding-top: 25px;
    font-weight: 600;
}
.seller-intro{
    padding-left:75px;
    padding-right: 30px;
    font-size: 14px;
}
.seller-dm{
    margin: 0 auto;
    margin-top: 5px;
    margin-bottom: 10px;
    padding: 3px 0;
    width: 200px;
    border-radius: 20px;
    display: flex;
    background-color: #ffffff;
    justify-content: center;
    border: 1px solid #dadce0;
    color: #60656a;
}
.seller-dm:hover{
    background-color: #dadce0;
    border: 1px solid #ffffff;
    transition: 0.5s;
}
.reward-info{
    margin-top: 30px;
    margin-bottom: 5px;
    font-weight: 500;
    font-size: 14px;
    color: #495057;
}

.reward-linkwrap{
    text-decoration: none;
}
.reward-wrap:hover{
    background-color: #d4f8f8;
    transition: 0.5s;
}

.reward-wrap{
    background-color: #ffffff;
    border: 1px solid #dadce0;
    color: #4a4a4a;
    padding: 20px 20px;
    margin-bottom: 10px;
}
.reward-price{
    font-weight: 600;
    margin-bottom: 10px;
}
.reward-name{
    font-weight: 600;
    color: #60656a;
    font-size: 15px;
    margin-bottom: 10px;
}
.reward-intro{
    font-size: 13px;
    color: #969696;
    font-weight: 500;
    margin-bottom: 20px;
}
.reward-fix{
    font-size: 13px;
    color: #969696;
    font-weight: 500;
}
.reward-active{
    font-size: 13px;
    color: #60656a;
    font-weight: 500;
    margin-bottom: 10px;
}
.reward-count{
    padding-top: 20px;
    display: flex;
    color: #00c4c4;
    font-size: 13px;
    font-weight: 600;
}
.reward-remaining{
    margin-left: 10px;
    background-color: #d4f8f8;
}






.popup-wrap{
    background-color:rgba(0,0,0,.3); 
    justify-content:center; 
    align-items:center;     
    position:fixed;         
    top:0;
    left:0;
    right:0;
    bottom:0;               
    display:none; 
    padding:15px; 
}
.popup{
    width:100%;               
    max-width:400px;          
    border-radius:10px;       
    overflow:hidden;          
    background-color:#00b2b2;
    box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3); 
}
.popup-head{
    width:100%;
    height:50px;  
    align-items:center;
    justify-content:center;
    padding-right: 20px;
    font-size: 30px;
}
.popup-head>.pop-btn{
justify-content: right;
}
.popup-body{                
    width:100%;
    background-color:#ffffff; 
}
.body-content{              
    width:100%;
    padding:30px;             
}
.body-titlebox{             
    text-align:center;        
    width:100%;
    height:50px;
    margin-bottom:10px;       
}
.body-titlebox span{
    font-size: 20px;
    font-weight: 500;
}
.body-contentbox{ 
    margin-top: 20px;
    border-top: 3px solid #00b2b2;          
    word-break:break-word;    
    overflow-y:auto;          
    min-height:100px;         
    max-height:400px;         
}
.body-contentbox span{
    margin-top: 20px;
    font-size: 14px;
}
.popup-foot{                      
    width:100%;
    height:50px;
}
.pop-btn{ 
    display:inline-flex;          
    width:100%;                      
    height:100%;                    
    justify-content:center;         
    align-items:center;             
    float:left;                     
    color:#ffffff;                 
    cursor:pointer;                 
}
.pop-btn.confirm{                 
    border-right:1px solid #3b5fbf; 
}
/*신고하기*/
.report-foot{                      
    width:100%;
    height:50px;
}
.reprort-titlebox{             
    text-align:center;        
    width:100%;
    height:30px;
}
.report-titlebox span{
    font-size: 20px;
    font-weight: 500;
}
.report-modal{ 
    display:inline-flex;          
    width:50%;                      
    height:100%;                    
    justify-content:center;         
    align-items:center;             
    float:left;                     
    color:#ffffff;                 
    cursor:pointer;                 
}
.report-contentbox{ 
    border-top: 3px solid #00b2b2;          
    word-break:break-word;    
    overflow-y:auto;          
    min-height:100px;         
    max-height:400px;         
}
.body-contentbox span{
    margin-top: 20px;
    font-size: 14px;
}


.report{                 
    border-right:2px solid #fefefe; 
}
.disabled {
    opacity: 0.6;
    cursor: not-allowed;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="banner bgBlur">
        <div class="banner-img">
            <img src="resources/image/fund/food.jpg">
        </div>
        <h6 class="title-category">${f.fundCategory }</h6>
        <div class="title">${f.fundName }</div>
    </div>
    <div class="funding-navi">
        <a href="/fundView.do?fundNo=${f.fundNo }"><span class="1">스토리</span></a>
        <a href="/fundViewReturnInfo.do?fundNo=${f.fundNo }"><span class="2">반환 ∙ 정책</span></a>
        <a href="/fundViewNotice.do?fundNo=${f.fundNo }"><span class="3">새소식</span></a>
        <a href="/fundViewSupporter.do?fundNo=${f.fundNo }"><span class="4">서포터</span></a>
    </div>
    <div class="space-bar"></div>
    <div class="detail-container">
        <!--왼쪽 콘텐츠-->
        <div class="detail-view">
            <span class="main-img">
                <img src="resources/image/fund/travel.jpg">
            </span>
            <div class="detail-content">
                ${f.fundIntro }
            </div>
            <div class="detail-funding">
                <div class="detail-info">
                    <span>목표 금액</span>
                    <span>${f.fundAmount }원</span><br>
                    <span>펀딩 기간</span>
                    <span>${f.fundStart } ~ ${f.fundEnd }</span><br>
                </div>
                <span class="detail-fix">100%이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제는 순차적으로 취소됩니다.</span>
            </div>
            <div class="detail-guide">
                <span class="detail-fix">메이커의 새로운 제품, 서비스 제작을 지원하는</span><br>
                <span class="detail-fix2">크라우드펀딩 제대로 알고 펀딩하자</span>
                <span href="#" class="guide-modal" id="modal-open">자세히 알아보기</span>            
            </div>
            <div class="story">프로젝트 스토리</div>
            <span class="detail-img">
                <img src="resources/image/fund/computer.jpg">
            </span>
            <span class="detail-img">
                <img src="resources/image/fund/computer.jpg">
            </span>
        </div><!--왼쪽 콘텐츠 끝-->
        <div class="space"></div>
        <!--오른쪽 콘텐츠-->
        <div class="detail-reward">
            <!--프로젝트 상태-->
            <div class="project-status">
                <div class="remaining-day">${f.dateGap}일 남음</div><br>
                <div class="rate-bar"></div>
                <span class="achievement-rate">
                    <strong>1993</strong> % 달성
                </span><br>
                <span class="total-amount">
                    <strong>1,999,333</strong> 원 펀딩
                </span><br>
                <span class="total-supporter">
                    <strong>499</strong> 명의 서포터
                </span><br>
                <a href="/payFunding.do?fundNo=${f.fundNo }" class="funding-linkwrap">
                    <div class="funding-link">펀딩하기</div>
                </a>
                <br>
                <div class="btn-box">
                    <button class="like-btn">
                        <span class="material-icons likes">favorite_border</span>
                        <!-- <span class="material-icons likes">favorite</span>  -->
                        <span class="btn-value">${fl.total}</sp>
                    </button>
                    <button class="report-btn" type="submit">
                        <span class="material-icons">report</span>                
                        <span class="btn-value" id="report-open">프로젝트 신고하기</span>
                    </button>
                </div>
            </div>
            
            <!--메이커 정보-->
            <div class="seller-info">메이커 정보</div>
            <div class="seller-wrap">
                <div class="seller-detail">
                    <span class="material-symbols-outlined seller-profile">
                        badge</span>
                    <span class="seller-name">
                       	${s.owner }
                    </span>
                </div>
                <div class="seller-intro">
                   		${s.enIntro } 
                </div> 
                <button class="seller-dm">
                    <span class="material-symbols-outlined">
                        contact_support</span>
                    <span class="dm">문의하기</span>
                </button>               
            </div>
            <!--리워드 정보-->
            <div class="reward-info">리워드 정보</div>
         
            <!--리워드 1개 생성-->
         <c:forEach items="${list }" var="r" varStatus="i">
            <a href="#" class="reward-linkwrap">
                <div class="reward-wrap">
                    <div class="reward-price">${r.rewardPrice}원 펀딩</div>
                    <div class="reward-name">${r.rewardName}</div>
                    <div class="reward-intro">${r.rewardIntro}</div>
                    <div class="reward-intro option">*옵션*<br>${r.rewardOption}</div>
                    <div class="reward-fix">배송비</div>
                    <div class="reward-deliveryfee reward-active">${r.rewardDeliveryfee}원</div>
                    <div class="reward-fix">리워드 발송 시작일</div>
                    <div class="reward-send reward-active">${r.rewardSend}</div>
                    <div class="reward-count">
                        <span class="reward-fixcount">제한수량 ${r.rewardCount}개</span>
                        <span class="reward-remaining">현재 (데이터)개 남음!</span>
                    </div>
                    <div class="reward-status reward-active">총 (데이터)개 펀딩완료</div>
                </div>
            </a><!--리워드 1개 생성-->
          </c:forEach>
        </div><!--오른쪽 콘텐츠 끝-->
    </div>



    
  <!--자세히 알아보기 모달-->
        <div class="container"> 
        <div class="popup-wrap" id="popup"> 
            <div class="popup">	
                <div class="popup-head">	
                    <span class="head-title"></span>
                    <!-- <span class="material-symbols-outlined pop-btn close" id="close">close</span>  -->                        
                </div>
                <div class="popup-body">	
                    <div class="body-content">
                        <div class="body-titlebox">
                            <span>크라우드펀딩<br>제대로 알고 펀딩하자</span>
                        </div>
                        <div class="body-contentbox">
                            <span> FUNFUNFUN 펀딩은 리워드를 단순히 구매하는 쇼핑이 아닌 <strong>메이커의 새로운 제품・서비스 제작 과정을 지원</strong>하는 것입니다.<br>
                                따라서, <strong>펀딩은 전자상거래법상 통신판매에 해당하지 않으므로 단순 변심으로 인한 환불 등 관련 규정이 적용되지 않습니다.</strong>
                                단, 펀딩 종료 전까지 언제든지 펀딩을 취소할 수 있습니다.
                            </span>
                        </div>
                    </div>
                </div>
                <div class="popup-foot">
                <span class="pop-btn confirm" id="confirm">확인</span>
                </div>
            </div>
        </div>
    </div><!--모달-->
    
    <!--신고하기 모달-->
    <div class="container"> 
        <div class="popup-wrap" id="report-modal"> 
            <div class="popup">	
                <div class="popup-head">	
                    <span class="head-title"></span>
                    <!--<span class="material-symbols-outlined pop-btn close" id="close">close</span>-->
                </div>
                <div class="popup-body">	
                    <div class="body-content">
                        <div class="report-titlebox">
                            <span>이 펀딩 프로젝트에 문제가 있나요?</span>
                        </div>
                        <div class="report-contentbox">
                            <br><span>신고가 접수된 이후에는 원활한 진행을 위해 취소할 수 없습니다. </span><br><span>신중하게 신고해주세요.</span>
                        </div>
                    </div>
                </div>
                <div class="report-foot">
                <span class="report-modal report" id="report">신고하기</span>
                <span class="report-modal confirm" id="exit">닫기</span>

                </div>
            </div>
        </div>
    </div><!--모달--> 
    <input type="hidden" class="fundNo" value="${f.fundNo }">
    <input type="hidden" class="login" value="${not empty sessionScope.m}">
    <input type="hidden" class="memberId" value="${sessionScope.m.memberId }">
    <!-- <input type="hidden" class="likeCheck" value=""> -->

<script>
//펀딩 설명 모달
$(function(){
    $("#confirm").click(function(){
        modalClose();
        //컨펌 이벤트 처리
    });
    $("#modal-open").click(function(){        
    	$("#popup").css('display','flex').hide().fadeIn();
    });
    $("#close").click(function(){
        modalClose();
    });
    function modalClose(){
        $("#popup").fadeOut();
    }
});

//프로젝트 신고하기 모달
$(function(){
    $("#confirm").click(function(){
        modalClose();
        //컨펌 이벤트 처리
    });
    $("#report-open").click(function(){        
        $("#report-modal").css('display','flex').hide().fadeIn();
    });
    $("#exit").click(function(){
        modalClose();
    });
    function modalClose(){
        $("#report-modal").fadeOut();
    }
});
//신고하기 확인여부
$(function(){
	const login = $(".login").val();
	const fundNo = $(".fundNo").val();
	$("#report").click(function(){
		if(login){
			let result = confirm("정말 신고하시겠습니까?");
			if(result==true){
				location.href="/reportFund.do?fundNo="+fundNo;
				//$("#report").attr('disabled', true);
			}else{
				$("#report-modal").fadeOut();
			}				
		}else{
			alert("로그인을 진행해주세요.")
		}
		});
	});

//좋아요 
$(".like-btn").click(function(){
	const login = $(".login").val();
	let fundNo = $(".fundNo").val();
	let memberId = $(".memberId").val();
	//let likeCheck = $().val();
	if(login){
		$.ajax({
			url : "/fundCheck.do",
			success : function(data){
				
			}
		})
	}

});
</script>
                
</body>
</html>