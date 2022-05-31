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
.fund-title{
    font-size: 22px;
    background-color: #A29584;
    color: #f2f4f6;
    height: 70px;
    line-height: 70px;
    text-align: center;
}
.content-wrap{
    width: 860px;
    margin: 0 auto;
    padding: 0 0 100px;
}
.pay-step{
    height: 150px;
    align-items: center;
    display: flex;
    justify-content: center;
}
.pay-step div{
    width: 90px;
    height: 90px;
    line-height: 90px;
    display: block;
    margin: 0 30px;
    text-align: center;
    border-radius: 45px;
    border:2.2px dotted #60656a;
    color: #60656a;
    font-weight: 500;
}
.pay-step .active{
    background-color: #00c4c4;
    border: none;
    color: #f2f4f6;
}
.pay-option{
    margin-top: 20px;
    margin-bottom: 10px;
}
.pay-option span:nth-child(1){
    font-size: 16px;
    font-weight: 600;
    margin-right: 10px;
}
.pay-option>.reward-span{
    font-size: 13px;
    font-weight:450;
    color: #60656a;
}

.one-reward{
    background-color: #f9f9f9;
    border-radius: 5px;
    padding: 20px 20px;
    margin-bottom: 10px;
}

.checked-active{
    display: flex;
    color: #4a4a4a;
}
.checkbox-wrap{
    margin-left: 20px;
    margin-right: 40px;
    margin-top: 20px
}
.checkbox-wrap>input{
    font-size: 20px;;
    width: 20px;
    height: 20px;
}
.reward-wrap{
    width: 730px;
}
.reward-price{
    font-weight: 600;
    margin-bottom: 10px;
}
.reward-name{
    font-weight: 600;
    color: #343434;
    font-size: 15px;
    margin-bottom: 10px;
}
.reward-remaining{
    font-size: 13px;
    margin-left: 10px;
    color: #00c4c4;
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
    display: block;
    padding-top: 20px;
    padding-left: 80px;
    font-weight: 600;
}
.amount-btn{
    color: #00c4c4;
    font-size: 15px;
    background-color: #e3fbfb;
}
.amount-btn:hover{
    cursor: pointer;
}
.amount-input{
    border-radius: 2px;
    height: 30px;
    width: 80px;
    border: 1px solid #00c4c4;
    text-align: center;
}

.option-info{
    display: flex;
    margin-top: 40px;
}
.right-info{
    margin-left: 70px;

}
.right-info span:nth-child(1){
    font-size: 14px;
    font-weight:500;
    color: #424242;
}

.donation-input{
    margin-top: 10px;
    border-radius: 2px;
    height: 40px;
    width: 150px;
    border: 1px solid #00c4c4;
    text-align: right;
    padding-right: 10px;
}

.right-span{
    font-size: 14px;
    font-weight:400;
    color: #4b4c4d;
}
.public-info>.right-info{
    margin-left: 100px;
}
.public-checkwrap{
    margin-top: 20px;
}
.public-checkwrap span{
    font-size: 16px;
    margin-right: 20px;
}
.public-checkwrap input{
    width: 20px;
}
.reward-confirm{
    border-top: 2px solid #8f8f8f;
    padding-top: 10px;
    margin-top: 60px;
    text-align: center;
    color: #343434;
    font-weight: 500;
}
.funding-name span{
    color: #00c4c4;
    text-decoration: underline;
}

input {
    accent-color: #029a9a;
}


/*다음단계 모달*/
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
    background-color: #ffffff;
    color: #010f0f;
    padding-top: 20px;
    font-size: 18px;
    width:100%;
    height:50px;  
    line-height: 50px;

}
.popup-body{                
    width:100%;
    background-color:#ffffff; 
}
.body-content{              
    width:100%;
    padding:30px;             
}
.body-contentbox{           
    word-break:break-word;    
    overflow-y:auto;          
    min-height:100px;         
    max-height:300px;         
}
.body-contentbox input{
    width: 15px;
    height: 15px;
}
.modal-flex{
    display: flex;
}
.modal-flex span{
    margin-left: 10px;
}
.check-detail{
    float: left;
    margin-left: 26px;
}


.popup-foot{                      
    width:100%;
    height:50px;
}
.pop-btn{ 
    display:inline-flex;         text-align: center;
    width: 100%;
    height:100%;                
    justify-content:center;      
    align-items:center;          
    color:#ffffff;              
    cursor:pointer;               
}
.pop-btn:hover{
    background-color: #0097a7;
    transition-duration: 0.5s;
}


.funding-link{
    margin: 30px auto 10px;
    font-size: 18px;
    font-weight: 400;
    color: #ffffff;
    border-radius: 2px;
    line-height: 50px;
    height: 50px;
    background-color: #00c4c4;
    width: 150px;
    
}
.funding-link:hover{
    transition: 0.5s;
    background-color: #00b2b2;
    color: #dadce0;
    cursor: pointer;
}

/*아코디언 메뉴*/
.accordion {
    margin-top: 20px;
    max-width: 300px;
    background: linear-gradient(to bottom right, #FFF, #f7f7f7);
    background: #0097a7;
    margin: 20px auto 0;
    border-radius: 3px;
    box-shadow: 0 10px 15px -20px rgba(0, 0, 0, 0.3), 0 30px 45px -30px rgba(0, 0, 0, 0.3), 0 80px 55px -30px rgba(0, 0, 0, 0.1);
}
.heading {
    color: #FFF;
    font-size:14px;
    border-bottom: 1px solid #e7e7e7;
	letter-spacing: 0.8px;
    padding: 10px;
    cursor: pointer;  
}
.heading:nth-last-child(2){
    border-bottom:0; 
}
.heading:hover {
    background: #00838f;
    border-radius: 0;
}
.heading:first-child:hover {
    border-radius: 3px 3px 0 0;
}
.heading:nth-last-child(2):hover{
    border-radius:0 0 3px 3px;
}
.heading::before {
    content: '';
    vertical-align: middle;
    display: inline-block;
    border-top: 7px solid #f5f5f5;
    border-left: 7px solid transparent;
    border-right: 7px solid transparent;
    float: right;
    transform: rotate(0);
    transition: all 0.5s;
    margin-top: 5px;
}
.active.heading::before {
    transform: rotate(-180deg);
}
.not-active.heading::before {
    transform: rotate(0deg);
}
.contents {
	display: none;
	background: #FFFAFA;
	padding: 15px;
    color: #7f8fa4;
    font-size: 13px;
    line-height: 1.5;
}
#close{
    margin-top: 10px;
    font-weight: 600;
}
#close:hover{
    cursor: pointer;
}
#confirm{
    border: none;
    background-color: #00b2b2;
}
#confirm:hover{
    background-color: #0097a7;
    color: #ffffff;
}

</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="fund-title">
        [16000명의 선택] 초경량 카본 자동 단우산이 돌아왔어요(앵콜)
    </div>
    <div class="content-wrap">
        <div class="pay-step">
            <div class="active">리워드 선택</div>
            <div class="">결제</div>
            <div>결제 확인</div>
        </div>
        <div class="reward-info pay-option">
            <span>리워드 선택</span>
            <span class="reward-span">펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</span>
        </div>

        <!--리워드, 후원금-->
        <form name="purchaseForm" id="purchaseForm" method="post">
            <input type="hidden" name="" value="">
            <!--리워드 리스트-->
            <div class="reward-select">
                <!--리워드 1개 생성-->
           		<c:forEach items="${list }" var="r" varStatus="i">
                <div class="one-reward active">
                    <label id="checked-reward">
                    <div class="checked-active">
                        <div class="checkbox-wrap">
                            <input type="checkbox" name="reward-checked" id="checked-reward" value="">
                        </div>
                        <div class="reward-wrap">
                            <input type="hidden" id="amountReward" value="전체수량">
                            <input type="hidden" id="remainCnt"value="남은수량">
                            <input type="hidden" id="limitCnt" value="제한수량">
                            <div class="reward-price">${r.rewardPrice}원 펀딩</div>
                            <span class="reward-name">${r.rewardName}</span>
                            <span class="reward-remaining">(675개 남음)</span>
                            <div class="reward-intro">${r.rewardIntro}</div>
                            <div class="reward-intro option">*옵션*<br>
                            ${r.rewardOption}
                            </div>
                            <span class="reward-fix">배송비</span>
                            <span class="reward-deliveryfee reward-active">${r.rewardDeliveryfee}원</span>
                            <span class="reward-fix">| 리워드 발송 시작일</span>
                            <span class="reward-send reward-active">${r.rewardSend}</span>
                        </div><!--reward-wrap-->
                
                    </div>
                    </label>
                        <div class="reward-count">
                            <div class="select-amount reward-active">수량</div>
                            <button class="material-icons amount-btn" id="down" onclick="down(this);">remove</button>
                            <input class="amount-input" readonly></input>
                            <button class="material-icons amount-btn" id="up" >add</button> 
                            <input type="hidden" class="rewardPrice" value="${r.rewardPrice}" >
                            <input type="hidden" class="rewardNo" value="${r.rewardNo}" >
                            <input type="text" class="reward-total">                           
                        </div>
                                                
                    </div><!--리워드박스-->
                </c:forEach>
                </div><!--리워드 1개 생성-->
            	
<!--수정-->
            <!--후원금(선택)-->
            <div class="donation-info pay-option option-info">
                <div class="left-info">
                    <span>후원금 더하기(선택)</span>
                </div>
                <div class="right-info">
                    <span>후원금을 더하여 펀딩할 수 있습니다. 추가 후원금을 입력하시겠습니까?</span><br>
                    <input class="donation-input" name="" placeholder="0"></input>
                    <span class="right-span">원을 추가로 후원합니다.</span>
                </div>
            </div>
        </form>
        <!--공개여부 선택-->
        <div class="public-info pay-option option-info">
            <div class="left-info">
                <span>공개여부(선택)</span>
            </div>
            <div class="right-info">
                <span>서포터 목록에 서포터 이름과 펀딩 금액이 공개됩니다. 조용히 펀딩하고 싶으시다면, 비공개로 선택해주세요.</span><br>
                <div class="public-checkwrap">
                    <label id="name-public">
                        <input type="checkbox" id="name-public">
                        <span>이름 비공개</span>
                    </label>
                    <label id="fund-public">
                        <input type="checkbox" id="fund-public">
                        <span>펀딩액 비공개</span>
                    </label>
                </div>     
            </div>
        </div>
        <div class="reward-confirm">
            <div class="funding-name">
                [1.3억/마지막앵콜]블랙헤드 반드시 녹습니다! BHA함유 핑크효소클렌저에
                <span class="total">59,024</span>원을 펀딩합니다.
            </div>
            <div class="funding-link" id="modal-open">다음단계로 ></div>



            <!--다음단계 모달-->
            <div class="container"> 
                <div class="popup-wrap" id="popup"> 
                    <div class="popup">	
                        <div class="popup-head">	
                            <span class="head-title">참여하기 전에 다시 확인해보세요</span>
                        </div>
                        <div class="popup-body">	
                            <div class="body-content">
                                <div class="body-contentbox">
                                    <div class="modal-flex">
                                        <div>
                                            <label id="modal-label">
                                            <input type="checkbox" id="modal-label" class="confirm-check">
                                            <span>펀딩 종료 날짜를 확인하세요.</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="modal-flex">
                                        <div>
                                            <label id="modal-label">
                                            <input type="checkbox" id="modal-label" class="confirm-check">
                                            <span>결제 취소 시 펀딩금을 돌려받을 수 있어요.</span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="accordion">
                                            <div class="heading">펀딩금 반환 정책</div>
                                            <div class="contents">만일 수령한 리워드에 하자가 존재하거나 메이커가 약속한 발송시작일에 발송이 이루어지지 않은 경우 펀딩금 반환 신청이 가능합니다. FunFunFun 프로젝트는 전자상거래법의 적용을 받아, 리워드가 마음에 들지 않는 경우에도 펀딩금 반환 신청이 가능합니다.</div>
                                    </div>
                                </div><!--body-contentbox-->
                                <div id="close">닫기</div>
                            </div>
                        </div>
                        <div class="popup-foot">
                        <button class="pop-btn confirm" id="confirm">계속해서 펀딩하기</button>
                        </div>
                    </div>
                </div>
            </div><!--모달-->
        </div>
    </div><!--content-wrap-->
    
    
<script>
	//다음단계 이동
		$("#confirm").click(function(){
		location.href = "/pay.do";
	});
	
		//updown버튼
		$("#up").on("click", function () {
			//let rewardPrice = val(".rewardPrice");
		    const count = Number($(".amount-input").val());
		    const countUp = count + 1;
		    $(".amount-input").attr("value", countUp);
		    //총 금액
		    const rewardPrice = Number($(".rewardPrice").val());
		    const rewardTotal = countUp * rewardPrice;
		    $(".reward-total").attr("value",rewardTotal);
		    //$(".reward-total").text(totalPrice.toLocaleString('ko-KR'));
		});
		
		$("#down").on("click", function () {
		    const count = $(".amount-input").val();
		    if (count != 0) {
		        const countDown = Number(count) - 1;
		        $(".amount-input").attr("value", countDown);		
		        //총 금액
		    	const rewardPrice = Number($(".rewardPrice").val());
			    const rewardTotal = countDown * rewardPrice;
			    $(".reward-total").attr("value",rewardTotal);		    
			}
		});//down
	
	
		
		
		
		/* 리워드 체크박스 확인
		$(".reward-count>.amount-btn").on("click",function(){
		    let currAmount = Number($(".amount-input").val());
		    //this = 둘 중(+,-) 현재 '클릭'한 버튼
		    if($(this).text()=='add'){
		        currAmount++;
		    }else{
		        if(currAmount != 1){//하한선 1이상 되도록 설정
		            currAmount--;
		        }
		    }
		    
		    //총액
		    $(".amount").text(currAmount);
		    const price = Number($(".price").children().first().text());
		    $("#totalPrice").text(currAmount*price);
		});	
	});	
		
		*/
		
		//구매하기
		function buyItNow(productId) {
		    const memberId = $("[name=memberId]").val();
		    const count = $(".count").val();
		    if (memberId == "") {
		        alert("로그인이 필요합니다.");
		    } else {
		        location.href = "/clientPaymentFrm.do?productId=" + productId + "&amount=" + count;
		    }
		}
		//장바구니
		function addToCart(productId) {
		    const count = $(".count").val();
		    const memberId = $("[name=memberId]").val();
		    if (memberId == "") {
		        alert("로그인이 필요합니다.");
		    } else {
		        location.href = "/insertCart.do?memberId=" + memberId + "&productId=" + productId + "&count=" + count;
		    }
		}
		
		//다음단계 체크박스 확인
		$(".confirm-check").change(function(){
		    if($(".confirm-check").length == $(".confirm-check").length){
		        alert("확인");
		    }
		});
		
		$("input:checkbox[id='confirm-check']").prop("checked", true);
		$("#confirm-check").prop("checked", true);
		
		
		
		$(function(){
		    if($(".confirm-check").is(":checked")==true){
		        console.log("체크된 상태");
		    }
		})
		
	//다음단계 모달
	$(function(){
	    $("#confirm").click(function(){
	        location.href="#";
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
	
	//다음단계 모달 아코디언
	$(document).ready(function(){
	    $(".accordion").on("click", ".heading", function() {
	
	    $(this).toggleClass("active").next().slideToggle();
	
	    $(".contents").not($(this).next()).slideUp(300);
	    $(this).siblings().removeClass("active");
	    });
	});
	 
	

	    
</script>
    
</body>
</html>