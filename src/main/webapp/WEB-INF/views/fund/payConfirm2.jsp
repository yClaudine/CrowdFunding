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
.fund-title3{
    font-size: 22px;
    background-color: #A29584;
    color: #f2f4f6;
    height: 70px;
    line-height: 70px;
    text-align: center;
}
.content-wrap3{
    width: 650px;
    margin: 0 auto;
    padding: 0 0 100px;
}
.pay-step3{
    height: 150px;
    align-items: center;
    display: flex;
    justify-content: center;
}
.pay-step3 div{
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
.pay-step3 .active3{
    background-color: #00c4c4;
    border: none;
    color: #f2f4f6;
}

.pay-wrap3{
    margin-top: 30px;
    padding-bottom: 10px;    
}

.pay-wrap3 .reward-active3{
    float: right;
    font-size: 14px;
    font-weight: 500;
    margin-left: 15px;
}
.one-pay3{
    background-color: #f9f9f9;
    border-radius: 5px;
    padding: 20px 20px;
    margin-bottom: 10px;
}
.reward-name3{
    font-weight: 600;
    color: #00c4c4;
    font-size: 17px;
    margin-bottom: 10px;
}
.reward-intro3{
    font-size: 16px;
    color: #969696;
    font-weight: 500;
    margin-bottom: 20px;
}
.final-info3{
    display: flex;
}
.final-info3 span{
    padding-top: 10px;
    color: #4a4a4a;
    font-size: 15px;
    font-weight: 500;
}
.flex-right3{
    margin-left: auto;
}
.final-price3{
    border-top: 2px solid #9f9f9f;
    border-bottom: 2px solid #9f9f9f;
    margin-top: 20px;
}
.final-price3 span{
    padding-top: 5px;
    padding-bottom: 5px;
    font-size: 18px;
    font-weight: 500;
}
.pp2{
    color: #979696;
}
.pp3{
    border-top: none;
    margin-top: 3px;
}
.pp3 span{
    color: #b9a386;
}
.pay-info3{
    margin-top: 50px;
    margin-bottom: 10px;
    font-weight: 300;
}
.pay-info3 span{
    font-size: 16px;
    font-weight: 500;
    margin-right: 10px;
}
.info-detail3{
    margin-top: 10px;
    font-size: 14px;
}
.payment3{
    margin-bottom: 0px;
}

.button-wrap3{
    margin: 0 auto;
    display: flex;
    width: 450px;
    text-align: center;
    justify-items: center;
}

.project-btn3{
    background-color: #c5c5c5;
}
.mypage-btn3{
    background-color: #A29584;
}

.pay-btn3{
    margin: 0 auto;
    font-size: 18px;
    font-weight: 400;
    color: #ffffff;
    border: none;
    border-radius: 2px;
    line-height: 50px;
    height: 50px;
    width: 200px;
    text-align: center;
    display: block;
    
}
.project-btn3:hover{
    transition: 0.5s;
    background-color: #979696;
    color: #ffffff;
    cursor: pointer;
}
.mypage-btn3:hover{
    transition: 0.5s;
    background-color: #b9a386;
    color: #ffffff;
    cursor: pointer;
}
.cash-method{
    margin-top: 50px;
    color: #b9a386;
    margin-bottom: 70px;
}
.cash-detail{
    font-size: 19px;
    font-weight: 500;
    color: #60656a;
}
</style>
</head>
<body>
<div class="last-page">
    <div class="fund-title3">
        [16000명의 선택] 초경량 카본 자동 단우산이 돌아왔어요(앵콜)
    </div>
    <div class="content-wrap3">
        <div class="pay-step3">
            <div class="">리워드 선택</div>
            <div class="">결제</div>
            <div class="active3">결제 확인</div>
        </div>
        <!--form-->
        <form name="purchaseForm3" id="purchaseForm3" method="post3">
            <input type="hidden" name="" value="">
            <!--전체 결제 상세-->
            <div class="payment">
                <!--결제 상세1-->
                <div class="one-pay first-wrap3">
                    <div class="pay-wrap3">
                        <span class="reward-name3">펀딩 프로젝트 : ${f.fundName }</span>
                        <div class="reward-intro3">${f.fundIntro }</div>
                    </div>
                    <div class="final-info3 final-price3 pp2">
                        <span>이 프로젝트에 펀딩한 금액</span>
                        <span class="flex-right3">${fp.fpayFunding }원</span>
                    </div>
                    <div class="final-info3 final-price3 pp3">
                        <span>최종 결제 금액</span>
                        <span class="flex-right3">${fp.fpayFinalpay }원</span>
                    </div>
                </div><!--리워드박스-->
                
                <div class="cash-method">
                    <div class="cash-detail">2022년 6월 15일 자정까지 아래 계좌로 입금</div>
                    <div>국민은행  96594545-01-05787522 (FUN여수민FUN)</div>
                    <div>입금자명 : ${sessionScope.m.memberName }</div>
                </div>


                <!--결제 상세2-->
                <div class="pay-info3">
                    <span>결제완료 유의사항</span>
                    <div class="info-detail3">
                        <div>
                            - 펀딩이 달성되지 않을 시, 결제 금액은 순차적으로 취소됩니다.</div>
                        <div>
                            - 결제실행일에 결제자 귀책사유(한도초과, 이용정지 등)로 인하여 결제가 실패할 수 있습니다.
                        </div> 
                        <div>
                            - 1차 결제 실패 시 실패일로부터 3 영업일 동안 재 결제를 실행합니다.
                        </div>
                    </div>  
                </div>  
            </div><!--전체 결제 상세-->
        </form>
    </div><!--content-wrap-->
    <div class="button-wrap3">
        <button id="payment3" class="pay-btn3 project-btn3" onclick="location.href='/fund.do?category=BEST'">다른 프로젝트 보기</button>
        <button id="payment3" class="pay-btn3 mypage-btn3" onclick="location.href='/myPageFrm.do'">마이페이지 확인</button>
    </div>
</div>
</body>
</html>