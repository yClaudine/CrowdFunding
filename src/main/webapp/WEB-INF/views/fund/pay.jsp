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
    <!--다음 우편번호 찾기-->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    width: 650px;
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

.pay-wrap{
    padding-bottom: 15px;
}


.pay-wrap>.coupon{
    border-top: 3px dotted #b3b3b3;
    margin-top: 50px;
    padding-top: 10px;
    color: #4a4a4a;
    font-size: 15px;
    font-weight: 480;
}

.coupon-type{
    margin-top: 10px;
    width: 500px;
    height: 30px;
    border-radius: 3px;
    color: #60656a;
    justify-content: center;
    text-align: right;
    padding-right: 20px;
    margin-left: 100px;
}
.coupon-type option{
    margin-right: 20px;
}
.coupon-type:focus{
    outline: none;
}


.pay-wrap .reward-active{
    float: right;
    font-size: 14px;
    font-weight: 500;
    margin-left: 15px;
}
.pay-info{
    margin-top: 20px;
    margin-bottom: 10px;
}
.pay-info span:nth-child(1){
    font-size: 16px;
    font-weight: 600;
    margin-right: 10px;
}
.pay-info>.reward-span{
    font-size: 13px;
    font-weight:450;
    color: #60656a;
}
.payment{
    margin-bottom: 50px;
}
.one-pay{
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
    width: 100%;
}
.coupon-wrap{
    width: 100%;
    margin-top: 60px;
    border-top: 2px dotted #b3b3b3;
    
}



.reward-price{
    font-weight: 600;
    margin-bottom: 10px;
}
.reward-name{
    font-weight: 600;
    color: #00c4c4;
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
    font-size: 12px;
    color: #60656a;
    font-weight: 300;
}

.final-info{
    display: flex;
}
.final-info span{
    padding-top: 10px;
    color: #4a4a4a;
    font-size: 15px;
    font-weight: 500;
}
.flex-right{
    margin-left: auto;
}
.final-price{
    border-top: 2px solid #4a4a4a;
    margin-top: 20px;
}
.final-price span{
    font-size: 18px;
    font-weight: 500;
}
.delivery-wrap{
    display: flex;
}

.supporter-wrap{
    width: 650px;
}
.supporter-info{
    font-size: 22px;
    font-weight: 500;
}
.supporter-detail{
    background-color: #EEEDE9;
    margin-right: 20px;
    border-radius: 5px;
    padding: 30px;
}
.supporter-detail div{
    margin-bottom: 10px;
    color: #4a4a4a;
}
.supporter-fix{
    font-weight: 600;
}
.delivery-detail{
    border-top: 3px solid #b3b3b3;
    border-bottom: 3px solid #b3b3b3;
    padding: 20px;
    margin-left: auto;
    font-weight: 500;
}
.delivery-detail input{
    margin-bottom: 20px;
    width: 300px;
    height: 35px;
    border-radius: 3px;
    border: 1px solid #9F9583;
}
.post-find{
    font-size: 14px;
    font-weight: 400;
    color: #ffffff;
    border: none;
    border-radius: 5px;
    line-height: 35px;
    height: 35px;
    background-color: #9F9583;
    width: 120px;
    text-align: center;
    display: block;
    margin-bottom: 10px;
}
#postcode,#address{
    margin-bottom: 0;
    border: none;
}
#postcode,#address:focus{
    outline: none;
}

.pay-btn{
    margin: 50px auto 10px;
    font-size: 18px;
    font-weight: 400;
    color: #ffffff;
    border: none;
    border-radius: 2px;
    line-height: 50px;
    height: 50px;
    background-color: #00c4c4;
    width: 200px;
    text-align: center;
    display: block;
    
}
.pay-btn:hover{
    transition: 0.5s;
    background-color: #00b2b2;
    color: #dadce0;
    cursor: pointer;
}
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="fund-title">
        ${f.fundName }
    </div>
    <div class="content-wrap">
        <div class="pay-step">
            <div class="">리워드 선택</div>
            <div class="active">결제</div>
            <div>결제 확인</div>
        </div>
        <!--form-->
        <form name="purchaseForm" id="purchaseForm" method="post">
            <input type="hidden" name="" value="">
            <!--전체 결제 상세-->
            <div class="payment">
                <!--결제 상세1-->
                <div class="one-pay first-wrap">
                    <div class="pay-wrap">
           			<c:forEach items="${rlist }" var="r" varStatus="i">
                        <div class="reward-wrap">
                            <span class="reward-name">${r.rewardName}</span>
                            <div class="reward-intro">${r.rewardOption }
                                <span class="reward-fee reward-active">${r.rewardPrice }원 펀딩</span>
                                <span class="reward-active">수량 : 1개</span>
                            </div>
                        </div>
                    </c:forEach>    
                        <div class="coupon-wrap">
                            <div class="coupon">사용 가능 쿠폰</div>
                            <select name="coupon-type" class="coupon-type">
                            <c:forEach items="${clist }" var="c" varStatus="i">
                                <option><span>${c.couponName}</span></option>                                                        
                            </c:forEach>
                            	<option><span>쿠폰 예시</span></option>
                            </select>
                        </div>
                    </div>
                </div><!--리워드박스-->
                
                <!--결제 상세2-->
                <div class="pay-info">
                    <span>결제 금액</span>
                </div>  
                <div class="one-pay active">
                    <div class="final-info">
                        <span>리워드 금액</span>
                        <span class="flex-right">100,090 원</span>
                    </div>
                    <div class="final-info">
                        <span>쿠폰 차감금액</span>
                        <span class="flex-right">-</span>
                    </div>
                    <div class="final-info">
                        <span>추가 후원금</span>
                        <span class="flex-right">100원</span>
                    </div>
                    <div class="final-info">
                        <span>배송비</span>
                        <span class="flex-right">2000원</span>
                    </div>
                    <div class="final-info final-price">
                        <span>최종 결제 금액</span>
                        <span class="flex-right">100,900원</span>
                    </div>
                </div>
            </div><!--전체 결제 상세-->
            <!--서포터 정보, 배송지-->
            <div class="delivery-wrap">
                <div class="supporter-wrap">
                    <div class="supporter-info">
                        펀딩 서포터
                    </div>
                    <div class="supporter-detail">
                        <div class="supporter-fix">이름</div>
                        <div>${sessionScope.m.memberName }</div>
                        <div class="supporter-fix">이메일</div>
                        <div>${sessionScope.m.memEmail }</div>
                        <div class="supporter-fix">휴대폰 번호</div>
                        <div>${sessionScope.m.memPhone }</div>
                    </div>        
                </div>    
                <div class="supporter-wrap">
                    <div class="supporter-info">
                        리워드 배송지
                    </div>
                    <div class="delivery-detail">
                        <div>이름</div>
                        <input class="delivery-active">
                        <div>휴대폰 번호</div>
                        <input class="delivery-active">
                        <div>주소</div>
                                    
                        <!--주소 API-->
                        <div class="address-wrap">
                            <button id="post-find" class="post-find" onclick="searchAddr();">우편번호 검색</button>
                            <input type="text" name="postcode" id="postcode" class="input-form" placeholder="우편번호를 먼저 검색하세요" readonly>
                            <input type="text" name="address" id="address" class="input-form" placeholder="상세주소 입력란" readonly>
                            <input type="text" name="detailAddress" id="detailAddress" class="input-form" placeholder="상세주소">
                        </input>

                        <div>배송 시 요청사항(선택)</div>
                        <input class="delivery-active" placeholder="ex) 부재시 경비실에 보관해주세요.">
                    </div>        
                </div>
            </div>
        </form>
    </div><!--content-wrap-->
    <button id="payment" class="pay-btn">펀딩 결제하기</button>
    
    <script>
    $("#payment").click(function(){
    	location.href = "/payConfirm.do";
    });
    
    //주소 API
    function searchAddr(){
        new daum.Postcode({
            oncomplete: function(data) { //data에 선택한 주소가 들어감
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                console.log(data);
                //들어오는 data값 사용해서 활용하면 됨
                $("#postcode").val(data.zonecode);
                $("#address").val(data.roadAddress);
                $("#detailAddress").focus();
            }
        }).open();
    }
    </script>
</body>
</html>