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

.pay-wrap .reward-active{
    float: right;
    font-size: 14px;
    font-weight: 500;
    margin-left: 15px;
}
.reward-active{
    font-size: 13px;
    color: #60656a;
    font-weight: 500;
    margin-bottom: 10px;
}
.one-pay{
    background-color: #f9f9f9;
    border-radius: 5px;
    padding: 20px 20px;
    margin-bottom: 10px;
}
.reward-name{
    font-weight: 600;
    color: #00c4c4;
    font-size: 15px;
    margin-bottom: 10px;
}
.reward-intro{
    font-size: 13px;
    color: #969696;
    font-weight: 500;
    margin-bottom: 20px;
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
    border-top: 2px solid #9f9f9f;
    border-bottom: 2px solid #9f9f9f;
    margin-top: 20px;
}
.final-price span{
    padding-top: 5px;
    padding-bottom: 5px;
    font-size: 18px;
    font-weight: 500;
}
.pay-info{
    margin-top: 50px;
    margin-bottom: 10px;
    font-weight: 300;
}
.pay-info span{
    font-size: 16px;
    font-weight: 500;
    margin-right: 10px;
}
.info-detail{
    margin-top: 10px;
    font-size: 14px;
}
.payment{
    margin-bottom: 0px;
}

.button-wrap{
    margin: 0 auto;
    display: flex;
    width: 450px;
    text-align: center;
    justify-items: center;
}

.project-btn{
    background-color: #c5c5c5;
}
.mypage-btn{
    background-color: #A29584;
}

.pay-btn{
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
.project-btn:hover{
    transition: 0.5s;
    background-color: #979696;
    color: #ffffff;
    cursor: pointer;
}
.mypage-btn:hover{
    transition: 0.5s;
    background-color: #b9a386;
    color: #ffffff;
    cursor: pointer;
}
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
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
    <link href="../final_220518/resources/css" rel="stylesheet"/> 
    <!--구글 아이콘-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!--페이지 css, js-->
    <script src=""></script>
    <link href="resources/p3_confirm.css" rel="stylesheet">
</head>
<body>
    <div class="fund-title">
        [16000명의 선택] 초경량 카본 자동 단우산이 돌아왔어요(앵콜)
    </div>
    <div class="content-wrap">
        <div class="pay-step">
            <div class="">리워드 선택</div>
            <div class="">결제</div>
            <div class="active">결제 확인</div>
        </div>
        <!--form-->
        <form name="purchaseForm" id="purchaseForm" method="post">
            <input type="hidden" name="" value="">
            <!--전체 결제 상세-->
            <div class="payment">
                <!--결제 상세1-->
                <div class="one-pay first-wrap">
                    <div class="pay-wrap">
                        <span class="reward-name">[울트라슈퍼얼리버드] 쟁여두기 6개</span>
                        <div class="reward-intro">자외선은 튕기고 비타민D는 흡수하는 광합썬! 세븐데이즈 마일드 선크림 6개</div>
                        <span class="reward-active">수량 : 1개</span>
                    </div>
                    <div class="final-info final-price">
                        <span>최종 결제 완료 펀딩가</span>
                        <span class="flex-right">100,900원</span>
                    </div>
                </div><!--리워드박스-->
                
                <!--결제 상세2-->
                <div class="pay-info">
                    <span>결제완료 유의사항</span>
                    <div class="info-detail">
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
    </div><!--content-wrap-->
    <div class="button-wrap">
        <button id="payment" class="pay-btn project-btn" onclick="">다른 프로젝트 보기</button>
        <button id="payment" class="pay-btn mypage-btn" onclick="">마이페이지 확인</button>
    </div>
</body>
</html>