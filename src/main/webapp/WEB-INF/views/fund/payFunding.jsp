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
	<!-- 아임포트 결제 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	

    
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
    display:inline-flex;         
    text-align: center;
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
.amount-btn{
	border:1px solid #868e96;
}
.reward-count{
    display: none;
    padding-top: 20px;
    padding-left: 80px;
    font-weight: 600;
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
    display:inline-flex;         
    text-align: center;
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

/*2번 단계---------------------*/
.fund-title2{
    font-size: 22px;
    background-color: #A29584;
    color: #f2f4f6;
    height: 70px;
    line-height: 70px;
    text-align: center;
}
.content-wrap2{
    margin: 0 auto;
    padding: 0 0 100px;
}
.pay-step2{
    height: 150px;
    align-items: center;
    display: flex;
    justify-content: center;
}
.pay-step2 div{
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
.pay-step2 .active2{
    background-color: #00c4c4;
    border: none;
    color: #f2f4f6;
}

.pay-wrap2{
    padding-bottom: 15px;
}


.pay-wrap2>.coupon2{
    border-top: 3px dotted #b3b3b3;
    margin-top: 50px;
    padding-top: 10px;
    color: #4a4a4a;
    font-size: 15px;
    font-weight: 480;
}

.coupon-type2{
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
.coupon-type2 option{
    margin-right: 20px;
}
.coupon-type2:focus{
    outline: none;
}


.pay-wrap2 .reward-active2{
    float: right;
    font-size: 14px;
    font-weight: 500;
    margin-left: 15px;
}
.pay-info2{
    margin-top: 20px;
    margin-bottom: 10px;
}
.pay-info2 span:nth-child(1){
    font-size: 16px;
    font-weight: 600;
    margin-right: 10px;
}
.pay-info2>.reward-span2{
    font-size: 13px;
    font-weight:450;
    color: #60656a;
}
.payment2{
    margin-bottom: 50px;
}
.one-pay2{
    background-color: #f9f9f9;
    border-radius: 5px;
    padding: 20px 20px;
    margin-bottom: 10px;
}

.checked-active2{
    display: flex;
    color: #4a4a4a;
}
.checkbox-wrap2{
    margin-left: 20px;
    margin-right: 40px;
    margin-top: 20px
}
.checkbox-wrap2>input{
    font-size: 20px;;
    width: 20px;
    height: 20px;
}
.reward-wrap2{
    width: 100%;
    display:none;
}
.coupon-wrap2{
    width: 100%;
    margin-top: 60px;
    border-top: 2px dotted #b3b3b3;
}

.reward-price2{
    font-weight: 600;
    margin-bottom: 10px;
}
.reward-name2{
    font-weight: 600;
    color: #00c4c4;
    font-size: 15px;
    margin-bottom: 10px;
}
.reward-remaining2{
    font-size: 13px;
    margin-left: 10px;
    color: #00c4c4;
}
.reward-intro2{
    font-size: 13px;
    color: #969696;
    font-weight: 500;
    margin-bottom: 20px;
}
.reward-fix2{
    font-size: 13px;
    color: #969696;
    font-weight: 500;
}
.reward-active2{
    font-size: 12px;
    color: #60656a;
    font-weight: 100;
}

.final-info2{
    display: flex;
}
.final-info2 span{
    padding-top: 10px;
    color: #4a4a4a;
    font-size: 15px;
    font-weight: 500;
}
.flex-right2{
    margin-left: auto;
}
.final-price2{
    border-top: 2px solid #4a4a4a;
    margin-top: 20px;
}
.final-price2 span{
    font-size: 18px;
    font-weight: 500;
}
.delivery-wrap2{
    display: flex;
}

.supporter-wrap2{
    width: 650px;
    margin-top: 60px;
}
.supporter-info2{
    font-size: 22px;
    font-weight: 500;
}
.supporter-detail2{
    background-color: #EEEDE9;
    margin-right: 20px;
    border-radius: 5px;
    padding: 30px;
}
.supporter-detail2 div{
    margin-bottom: 10px;
    color: #4a4a4a;
}
.supporter-fix2{
    font-weight: 600;
}
.delivery-detail2{
    border-top: 3px solid #b3b3b3;
    border-bottom: 3px solid #b3b3b3;
    padding: 20px;
    margin-left: auto;
    font-weight: 500;
}
.delivery-detail2 input{
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
	
.pay-btn2{
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
    margin-bottom: 100px;
    
    
}
.pay-btn2:hover{
    transition: 0.5s;
    background-color: #00b2b2;
    color: #dadce0;
    cursor: pointer;
}

.method{
    margin-top: 20px;
    margin-bottom: 10px;
}
label{
    margin-right: 20px;
}
label span{
    margin-left:5px;
}
/*page3---------------*/

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
	display:none;
    padding-bottom: 15px;
}

.pay-wrap3 .reward-active3{
    float: right;
    font-size: 14px;
    font-weight: 500;
    margin-left: 15px;
}
.reward-active3{
    font-size: 13px;
    color: #60656a;
    font-weight: 500;
    margin-bottom: 10px;
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
    font-size: 15px;
    margin-bottom: 10px;
}
.reward-intro3{
    font-size: 13px;
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
#purchaseForm2{
    width: 650px;
    margin: 0 auto;
}
.button-wrap3{
    margin-bottom: 100px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
<div class="payPage1" id="payPage1">
    <div class="fund-title">
        ${f.fundName}
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
           		<c:forEach items="${list }" var="r" varStatus="i">
                <!--리워드 1개 생성-->
                <div class="one-reward active">
                    <label id="checked-reward">
	                    <div class="checked-active">
	                        <div class="checkbox-wrap">
	                            <input type="checkbox" class="reward-check" name="reward-check" id="reward-check" value="${r.rewardNo }">
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
	                            <span class="reward-deliveryfee reward-active">
	                            	<span class="reward-delivery">${r.rewardDeliveryfee}</span>
	                            	<span>원</span>
	                            </span>
	                            <span class="reward-fix">| 리워드 발송 시작일</span>
	                            <span class="reward-send reward-active">${r.rewardSend}</span>
	                        </div><!--reward-wrap-->
	                    </div>
                    </label>
                        <div class="reward-count">
                            <div class="select-amount reward-active">수량</div>
                            <button type="button" class="material-icons amount-btn" name="${r.rewardNo }down" id="up" onclick="changeQty(this,'down')" value="${r.rewardNo }">remove</button>
                            <input type="text" class="amount-input" value="0" name="${r.rewardNo }" readonly></input>
                            <button type="button" class="material-icons amount-btn" name="${r.rewardNo }up" id="down" onclick="changeQty(this,'up')" value="${r.rewardNo }">add</button> 
                            <input type="hidden" class="rewardPrice" value="${r.rewardPrice}" >
                            <input type="text" class="reward-total" value="0">                           
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
                    <input type="text" class="donation-input" placeholder="0" ></input>
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
                        <input type="checkbox" name="nameShow" id="name-show" value="0">
                        <span>이름 비공개</span>
                    </label>
                    <label id="fund-public">
                        <input type="checkbox" name="fundingShow" id="fund-show" value="0">
                        <span>펀딩액 비공개</span>
                    </label>
                </div>     
            </div>
        </div>
        <div class="reward-confirm">
            <div class="funding-name">
        		${f.fundName}에
                <span class="funding-sum">0</span>원을 펀딩합니다.	<!-- 리워드+후원금 -->
                <input type="text" class="reward-sum">	<!-- 순수 리워드 합계 -->
                <input type="text" class="max-fee">	<!-- 최종 배송비 -->
                <input type="text" class="final-pay">	<!-- 최종 결제비용 -->
           
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
    
</div><!-- 페이지1========================================================================== -->  

<div class="payPage2" id="payPage2">    <!--두번째 단계 ---------------------------------------------------------->
    <div class="fund-title2">
        ${f.fundName}
    </div>
    <div class="content-wrap2">
        <div class="pay-step2">
            <div class="">리워드 선택</div>
            <div class="active2">결제</div>
            <div>결제 확인</div>
        </div>
        <!--form-->
        <form name="purchaseForm2" id="purchaseForm2" method="post">
            <!--전체 결제 상세-->
            <div class="paymen2t">
                <!--결제 상세1-->
                <div class="one-pay2 first-wrap2">
                    <div class="pay-wrap2">
           			<c:forEach items="${list }" var="r" varStatus="i">                   
                        <div class="reward-wrap2">
                            <span class="reward-name2">${r.rewardName}</span>
                            <div class="reward-intro2">${r.rewardOption }
                                <!-- 
                                <span class="reward-fee2 reward-active2">
                                	<span class="selected-sum"></span>
                                	<span>원 펀딩</span>
                                </span>
                                <span class="reward-active2">
                                	<span>수량 : </span>
                                	<input class="selected-amount" value="${r.rewardNo }" name="">
                                	<span>개</span>
                                </span>
                                 -->
                            </div>
                        </div>
                     </c:forEach>
                        <div class="coupon-wrap">
                            <div class="coupon">사용 가능 쿠폰</div>
                            <select id="coupon-type2" class="coupon-type2">
                                <option>사용 가능한 쿠폰이 없습니다.</option>
                            </select>
                        </div>
                    </div>
                </div><!--리워드박스-->
                
                <!--결제 상세2-->
                <div class="pay-info2">
                    <span>결제 금액</span>
                </div>  
                <div class="one-pay active2">
                    <div class="final-info2">
                        <span>리워드 선택 금액</span>
                        <span class="flex-right2 reward-sum2"></span>
                        <span>원</span>
                    </div>
                    <div class="final-info2">
                        <span>쿠폰 차감금액</span>
                        <span class="flex-right2">
                        	<span>-</span>
                        	<span class="coupon-discount2"></span>
                        	<span>원</span>
                        </span>
                    </div>
                    <div class="final-info2">
                        <span>추가 후원금</span>
                        <span class="flex-right2 donation-input2"></span>
                        <span>원</span>
                    </div>
                    <div class="final-info2">
                        <span>배송비</span>
                        <span class="flex-right2 delivery-fee2"></span>
                        <span>원</span>
                    </div>
                    <div class="final-info2 final-price2">
                        <span>최종 결제 금액</span>
                        <span class="flex-right2 final-pay2" id="final-pay2"></span>
                        <span>원</span>
                    </div>
                </div>
            </div><!--전체 결제 상세-->
            <!--서포터 정보, 배송지-->
            <div class="delivery-wrap2">
                <div class="supporter-wrap2">
                    <div class="supporter-info2">
                     	   펀딩 서포터
                    </div>
                    <div class="supporter-detail2">
                        <div class="supporter-fix2">이름</div>
                        <div>${sessionScope.m.memberName }</div>
                        <div class="supporter-fix2">이메일</div>
                        <div>${sessionScope.m.memEmail }</div>
                        <div class="supporter-fix2">휴대폰 번호</div>
                        <div>${sessionScope.m.memPhone }</div>
                    </div>
                    <div class="pay-method">
                        <div class="supporter-info2 method">결제 방법</div>
                        <label>
                            <input type="radio" name="payMethod" id="pay-method" value="0"><span>무통장입금</span>
                        </label>
                        <label>
                            <input type="radio" name="payMethod" id="pay-method" value="1"><span>카드결제</span>   
                        </label>
                    </div>        
                </div>    
                <div class="supporter-wrap2">
                    <div class="supporter-info2">
                  	      리워드 배송지
                    </div>
                    <div class="delivery-detail2">
                        <div>이름</div>
                        <input class="delivery-active2 d-name">
                        <div>휴대폰 번호</div>
                        <input class="delivery-active2 d-phone">
                        <div>주소</div>                                   
                        <!--주소 API-->
                    	<div class="address-wrap">
							<button type="button" id="post-find" class="post-find" onclick="searchAddr();">주소찾기</button>
                            <input type="text" name="postcode" id="postcode" class="input-form d-addr1" placeholder="주소를 먼저 검색하세요" readonly>
                            <input type="text" name="address" id="address" class="input-form d-addr2" placeholder="상세주소 입력란" readonly>
                            <input type="text" name="detailAddress" id="detailAddress" class="input-form d-addr3" placeholder="상세주소">
                        <div>배송 시 요청사항(선택)</div>
                        <input class="delivery-active2 d-message" placeholder="ex) 부재시 경비실에 보관해주세요.">
                    </div>        
                </div>
            </div>
        </form>
    </div><!--content-wrap-->
    <button id="payment2" class="pay-btn2">펀딩 결제하기</button>
</div>
<!--세번째 단계------------------------------------------------------------------->
<div class="payPage3" id="payPage3">
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
        <form name="purchaseForm3" id="purchaseForm3" method="post">
            <input type="hidden" name="" value="">
            <!--전체 결제 상세-->
            <div class="payment">
                <!--결제 상세1-->
                <div class="one-pay first-wrap3">
                     <!--리워드박스-->
                    <c:forEach items="${list }" var="r" varStatus="i">                   
                    <div class="pay-wrap3">
                        <span class="reward-name3">${r.rewardName }</span>
                        <div class="reward-intro3">
                        	<span>${r.rewardOption }</span>
	                        <!-- <span class="reward-active3">수량 : 1개</span>-->                        
                        </div>
                    </div><!--리워드 1개-->
                    </c:forEach>
                    <div class="final-info3 final-price3">
                        <span>최종 결제 금액</span>
                        <span class="flex-right3">
                        	<span class="final-pay2"></span>
                        	<span>원</span>
                        </span>
                    </div>
                </div><!--리워드박스-->
                
                <div class="cash-method">
                    <div class="cash-detail">2022년 6월 15일 자정까지 아래 계좌로 입금</div>
                    <div>국민은행  96594545-01-05787522 (FUNFUNFUN)</div>
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
<input type="hidden" class="memberNo" value="${sessionScope.m.memberNo }">
<input type="hidden" class="fundCategory" value="${f.fundCategory }">
<input type="hidden" class="fundNo" value="${f.fundNo }">
<input type="hidden" class="memberId" value="${sessionScope.m.memberId }">
<input type="hidden" class="memberName" value="${sessionScope.m.memberName }">  
</div>
 
  
    
<script>
	//페이지 컨트롤
	$(document).ready(function(){	
		$("#payPage1").show();
		$("#payPage2").hide();
		$("#payPage3").hide();
	});

	//결제 페이지 쿠폰리스트
	$("#confirm").on("click",function(){
		//<쿠폰용>
		//결제할 멤버 번호
		const memberNo = $(".memberNo").val();
		//카테고리명
		const fundCategory = $(".fundCategory").val();
		//선택한 리워드 총금액
		let rewardSum = Number($(".reward-sum").val()); 	
		$.ajax({
			url : "/selectCouponList.do",
			data : {memberNo:memberNo, fundCategory:fundCategory, rewardSum:rewardSum},
			success : function(data){
				const select = $("#coupon-type2");
				select.empty();
				select.append("<option value=-1>[다음 쿠폰 중 하나만 선택 가능합니다.]</option>")
				for(let i=0; i<data.length; i++){
					select.append("<option value="+data[i].discount+">"+data[i].couponName+"</option>");
				}//for문		
				$("#payPage2").show();
				$("#payPage1").hide();
			}//success
		});//ajax
		
		/*
		let reward = [];
		let obj = {};
		$("input[name='reward-check']:checked").each(function(i){
			//let index = $("reward-check").index(this);
			let memberNo = $(".memberNo").val();
			let fundNo = $(".fundNo").val();
			let rewardNo = ($(this).val());
			let rewardAmount = ($(this).parents(".one-reward").find(".amount-input").val());
			obj.memberNo = memberNo;
			obj.fundNo = fundNo;
			obj.rewardNo = rewardNo;
			obj.rewardAmount = rewardAmount;
			reward.push(obj);
			obj={};
		});
		console.log(reward);
		let jsonData = JSON.stringify(reward);
		
		$.ajax({
			url : "/insertReward.do",
			type:"post",
			traditional:true,
			data : {reward:jsonData},
			//{memberNo:memberNo,rewardNo:rewardNo,rewardAmount:rewardAmount,fundNo:fundNo},
			success : function(data){
				alert("성공");
			}
			
		})*/
	});
		

	//쿠폰 차감 반영 결제금액
	$("#coupon-type2").on("change",function(){
        let discount = $("#coupon-type2 option:selected").val();	//선택옵션
		//원래 배송비
        let fee = $(".max-fee").val();
        let fundingSum = Number($(".funding-sum").text());//리워드+후원(배송비X)
		let rewardSum2 = Number($(".reward-sum2").text());//리워드만
		let donation = Number($(".donation-input2").text());//후원금만
		let finalPay = Number($(".final-pay").val());//배송비 포함금액
        //최종 결제용
		//let coupon = Number($(".coupon-disount").text());//쿠폰차감액
		//let delivery = Number($(".delivery-fee2").text());//배송비 최종
		
        	if(discount==-1){		//쿠폰 선택안했을 때
		    	$(".coupon-discount2").text("0");
		    	$(".delivery-fee2").text(fee); 
		    	//최종 결제 금액 = 원래 최종결제용
		    	$(".final-pay2").text(finalPay);
        	}	
        	if(discount==0){	//0:배송비 무료
        		$(".delivery-fee2").text("0");
        		//최종 결제 금액 =원래 배송비 제외 금액
        		$(".final-pay2").text(fundingSum);
		    }else{ 
		    	$(".delivery-fee2").text(fee); 	
		    }
        	
        	if(0<discount){	//1:%할인 ex)30 -> 30%할인
				//차감될 금액
				let minus = rewardSum2 *discount/100;
				$(".coupon-discount2").text(minus);
				//최종 결제 금액 = 원래 최종에 쿠폰 차감
				$(".final-pay2").text(finalPay-minus);
		    }else{ 
		    	//쿠폰 다시 0
		    	$(".coupon-discount2").text("0");
		    }
        	
        	if(100<discount){	//2:원화 할인 ex)5000 -> 5000원할인       		
				//차감될 금액
				let minus = discount;
				$(".coupon-discount2").text(minus);
				//최종 결제 금액 = 원래 최종에 쿠폰 차감
				$(".final-pay2").text(finayPay-minus);
		    }else{ 
		    	//쿠폰 다시 0
		    	//$(".coupon-discount2").text("0");
		    }

    });

	//리워드 토글
	$('.reward-check').click(function(){
		let amountBox = $(this).parents(".one-reward").find(".reward-count");
		const index = $('.reward-check').index(this);
		//console.log($(".reward-wrap2").length);
		//console.log($(".reward-wrap2").eq(index).text());
		if(amountBox.css('display')==('none')){	//none일 때 클릭 -> 보이게하기
			//console.log(index+"인덱스");
			amountBox.css('display','block');
			//console.log($(".amount-btn").length);
			$(".amount-btn").eq(2*index+1).click();		
			$(".reward-wrap2").eq(index).show();
			$(".pay-wrap3").eq(index).show();

		}else{ 									//block일 때 클릭 -> 접기
			amountBox.css('display','none');
			$(".amount-input").eq(index).val(0);
			$(".reward-total").eq(index).val(0);
			$(".reward-wrap2").eq(index).hide();
			$(".pay-wrap3").eq(index).hide();
			
			//$(".selected-input").eq(index).val(0);
		}
		totalPrice();
	});

	//리워드 수량 조절
		function changeQty(obj,type){  
	    	if(type=='up'){
			   	let count = Number($(obj).prev().val());
			   	//리워드 sum 총액만 구하기용			   	
			    const countUp = count + 1;
			    $(obj).prev().val(countUp);
			    
			    /*
			    let origin = $(obj).val();
			    console.log(origin);
			    let select = $(obj).parents("body").find(".selected-amount").val();
			    console.log(select);
				const add = select +1;
			    if(origin == select){
				    $(obj).parents("body").find(".selected-amount").val(add);			    	
			    }*/
			   			    
			    //리워드 1개
			    const rewardPrice = Number($(obj).next().val());
			    const rewardTotal = countUp * rewardPrice;
			    $(obj).next().next().val(rewardTotal);    
			    				
	    	}else if(type=='down'){
		    	let count = Number($(obj).next().val());	
			   	//리워드 sum 총액만 구하기용			   	
			    const countDown = count - 1;			   	
			    if (count != 1) {        
			    	$(obj).next().val(countDown);				    	
			        //리워드 1개
			    	const rewardPrice = Number($(obj).next().next().next().val());
				    const rewardTotal = countDown * rewardPrice;
				    $(obj).next().next().next().next().val(rewardTotal);
				}			    
		    }
	    	totalPrice();
		}
	
	//후원금 더하기
		$(".donation-input").change(function(){
			totalPrice();
		});

	//리워드 수량 토탈 함수
		function totalPrice(){
			const checkBox = $('.reward-check:checked');
			let totalPrice = 0;
			for(let i=0;i<checkBox.length;i++){
				totalPrice += Number(checkBox.eq(i).parents(".one-reward").find(".reward-total").val());
			}
			//console.log(totalPrice);
			$(".reward-sum").val(totalPrice);
			$(".reward-sum2").text(totalPrice);	//다음페이지
			let currentDonation = Number($(".donation-input").val());
			$(".funding-sum").text(totalPrice+currentDonation);
			$(".donation-input2").text(currentDonation); //다음페이지
		
			//최종 결제
			let fundingSum = Number($(".funding-sum").text());
			let maxFee = Number($(".max-fee").val());
			$(".final-pay").val(fundingSum+maxFee);
			//다음페이지 적용
			$(".final-pay2").text(fundingSum+maxFee);			
		}
	
		//최대 배송비 구하기
		//배송비 array
		const fee = new Map();
		fee.set(0,0);
		$('.reward-check').on("change",function(){
		//인덱스
		const val = $(this).val();
			if($(this).is(":checked")){
				//console.log(val);
				const deliveryFee = $(this).parent().next().find(".reward-delivery").text();	
				fee.set(val,deliveryFee);			
				//console.log(fee.get(val));	
				//console.log(fee);
			}else{
				fee.delete(val);
			}	
			//console.log(Math.max(...fee.values()));
			const maxFee = Math.max(...fee.values());
			//두 페이지 적용
			$(".max-fee").val(maxFee);
			$(".delivery-fee2").text(maxFee);
		});


	
	//서포터 이름, 펀딩액 공개여부
	$("#name-show").change(function(){
		    if($(this).is(":checked")){
		        $(this).val(1);
		    }else{
		    	$(this).val(0);
		    }
		});
	$("#fund-show").change(function(){
	    if($(this).is(":checked")){
	        $(this).val(1);
	    }else{
	    	$(this).val(0);
	    }
	});
	
	//메모 - input 해킹 방지?? : on("propertychange change keyup paste input",

		/*다음단계 체크박스 확인
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
		})*/
		
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

	//============================================================
	//주소 API
	//다음 우편번호 주소찾기
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
	
	//결제 API=====================================================
		$("#payment2").on("click",function(){
			if(!$(".d-name").val()){
				alert("수령인을 확인해주세요.");
				$(".d-name").focus();
			}
			if(!$(".d-phone").val()){
				alert("전화번호를 확인해주세요.");
				$(".d-phone").focus();
			}
			if(!$(".d-addr3").val()){
				alert("배송지를 확인해주세요.");
				$(".d-addr3").focus();
			}
			if(!$(".d-message").val()){
				alert("배송메시지를 확인해주세요.");
				$(".d-message").focus();
			}

			//결제 변수 저장
			let memberId = $(".memberId").val();
			let memberName = $(".memberName").val();
			let fundNo = $(".fundNo").val();
			let fpayDeliveryfee = Number($(".delivery-fee2").text());
			let fpaySupport = Number($(".donation-input2").text());
			let fpayRewardTotal = Number($(".reward-sum2").text());
			let fpayFunding = fpaySupport+fpayRewardTotal;
			let fpayFinalpay = Number($(".final-pay2").text());
			let nameShow = $("#name-show").val();
			let fundingShow = $("#fund-show").val();
			let payMethod = $("input[name='payMethod']:checked").val();
			console.log(memberId+","+memberName+","+fundNo+","+fpaySupport+","+fpayDeliveryfee+","+fpayRewardTotal+","+fpayFunding+","+fpayFinalpay+","+nameShow+","+fundingShow+","+payMethod);
			
			//배송지 변수 저장
			let	fdeliveryName = $(".d-name").val();
			let	fdeliveryPhone = $(".d-phone").val();
			let	fdeliveryAddress = $(".d-addr1").val()+$(".d-addr2").val()+$(".d-addr3").val();
			let	fdeliveryMessage = $(".d-message").val();
			console.log(fdeliveryName+","+fdeliveryPhone+","+fdeliveryAddress+","+fdeliveryMessage)
						
			//카드결제일 때 아임포트
			if($("input[name='payMethod']:checked").val()=="1"){	
				const price = $("#final-pay2").text();
				//거래 고유 ID생성을 위해 현재 결제 날짜를 이용해서 처리
				const d = new Date();
				//date 값 생성 시 ""를 더하지 않으면 숫자 + 연산이 되므로 문자 덧셈을 위해 ""를 추가해줘야 함
				const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
				IMP.init("imp41020915");	//결제 API 사용을 위한 식별코드입력
				IMP.request_pay({
					merchant_uid : "상품코드_"+date,			//거래ID
					name : "결제 테스트",						//결제이름
					amount : price,							//결제금액
					buyer_email	: "khtest0401@gmail.com", 	//구매자 email주소
					buyer_tel : "010-0000-0000",			//구매자 전화번호
					buyer_addr : "일산",						//구매자 주소
					buyer_postcode : "12345"				//구매자 우편번호
				},function(rsp){
					if(rsp.success){
						console.log("결제 성공");
						console.log("고유ID : "+rsp.imp_uid);
						console.log("상점거래ID : "+rsp.merchant_uid);
						console.log("결제 금액 : "+rsp.paid_amount);
						console.log("카드승인번호 : "+rsp.apply_num);
						//추가 DB작업이 필요한 경우 이 부분에 결제내역을 DB에 저장하는 코드 작성
						//결제 정보 insert
						$.ajax({
							url : "/PayInfo.do",
							data : {
								memberId:memberId,memberName:memberName,fundNo:fundNo,fpayDeliveryfee:fpayDeliveryfee,
								fpaySupport:fpaySupport,fpayRewardTotal:fpayRewardTotal,fpayFunding:fpayFunding,
								fpayFinalpay:fpayFinalpay,nameShow:nameShow,fundingShow:fundingShow,payMethod:payMethod
							},
							success : function(data){
								location.href="/payConfirm.do?fundNo=${f.fundNo }&memberId="+memberId+"&fpayFinalpay="+fpayFinalpay;

							},
							error : function(){
								console.log("실패");
							}
						})//결제ajax
						
					}else{
						alert("결제가 취소되었습니다. 다시 시도해세요.");
					}
				});//카드결제 끝			
			}else if($("input[name='payMethod']:checked").val()=="0"){ //무통장입금일 때
				let result = confirm("무통장입금을 진행하시겠습니까?");
				if(result==true){
					$.ajax({
						url : "/PayInfo.do",
						data : {
							memberId:memberId,memberName:memberName,fundNo:fundNo,fpayDeliveryfee:fpayDeliveryfee,
							fpaySupport:fpaySupport,fpayRewardTotal:fpayRewardTotal,fpayFunding:fpayFunding,
							fpayFinalpay:fpayFinalpay,nameShow:nameShow,fundingShow:fundingShow,payMethod:payMethod
						},
						success : function(data){
							location.href="/payConfirm2.do?fundNo=${f.fundNo }&memberId="+memberId+"&fpayFinalpay="+fpayFinalpay;
						},
						error : function(){
							console.log("실패");
							alert("결제가 취소 되었습니다. 다시 시도하세요.");
						}
					});	//ajax			
				}
			}
		});	//payment2 버튼	
	
</script>
    
</body>
</html>