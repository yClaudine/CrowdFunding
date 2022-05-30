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
    <link href="../final_220518/resources/css" rel="stylesheet"/> 
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
.funding-navi>a:nth-child(2){
    border-bottom: 3px solid #00c4c4;
}
.funding-navi>a:nth-child(2){
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
.return{
    font-weight: 700;
    font-size: 24px;
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

.return-content{
    color: #4a4a4a;
    font-weight: 600;
    font-size: 18px;
    margin-top: 30px;
}
.detail-fix, .detail-active{
    margin-top: 10px;
    color: #60656a;
    font-size: 14px;
    line-height: 18px;
    font-weight: 500;
    padding-bottom: 20px;
}
.detail-fix>a{
    color: #00c4c4;
    font-weight: 500;
    text-decoration:underline;
}
.detail-fix>span{
    color: #969696;
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
            <div class="return">이 프로젝트의 정보 및 정책을</div>
            <div class="return">반드시 확인하세요.</div>
            <div class="return-content">펀딩 취소 및 리워드 옵션 변경, 배송지 변경 안내</div>
            <div class="detail-fix">참여한 펀딩 정보는 <a href="#">내 펀딩 내역</a>에서확인해주세요. 마감일 이후에는 펀딩에 대한 리워드 제작 및 배송이 시작되어, 취소와 더불어 배송지 및 리워드 옵션 변경은 불가합니다.</div>
            <hr>
            <div class="return-content">사용 중 발생한 하자에 대한 A/S 정책</div>
            <div class="detail-active">예시 - 보증기간 : 리워드 수령일로부터 한 달
                - A/S규정 : 시착 및 세탁 전 발생한 문제에 대하여 제품 교환
                - A/S가 불가한 경우 : 보증기간 이내일지라도 사용자의 고의 또는 과실로 인해 제품이 훼손되었거나 속옷의 특성상 시착&세탁 과정에서 제품의 가치가 현저히 손상된 경우</div>
            <hr>
            <div class="return-content">펀딩금 반환 안내</div>
            <div class="detail-fix">아래 어느 하나에 해당될 경우 펀딩금 반환은 불가합니다.<br><span>- 메이커가 프로젝트 페이지 내에 명시적으로 고지한 하자 불인정 사유에 해당하는 경우<br>(예) 공장 제작 과정상 벌어짐 방지를 위해 봉제되어 제공되는 포켓은 하자 사유가 되지 않습니다.<br>- 서포터의 귀책 사유로 리워드의 일부 혹은 전체가 분실/파손/고장/오염/훼손이 발생된 경우<br>- 모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 다른 경우<br>- 공연, 디지털컨텐츠, 여행 패키지 상품, 무형 서비스 및 컨텐츠의 제공이 완료되었을 경우</span><br><br>기타 주의 사항<br><span>- 크라우드펀딩의 특성상 프로젝트 종료 후 서포터의 단순변심으로 인한 펀딩금 반환은 불가합니다.<br>- 회사는 메이커와 상호 협의 하에 프로젝트를 취소할 수 있으며, 펀딩 종료 후 프로젝트가 취소될 경우에는 펀딩금이 반환됩니다.<br>- 하자가 있는 경우, 리워드 반송을 위한 배송비는 메이커가 부담하여야 하고 하자가 없는 경우에는 리워드 반송 및 재반송에 대한 배송비를 서포터에게 청구될 수 있습니다.</span>
            </div>
 

        </div><!--왼쪽 콘텐츠 끝-->
        <div class="space"></div>
        
        <!--오른쪽 콘텐츠-->
        <div class="detail-reward">
            <!--프로젝트 상태-->
            <div class="project-status">
                <div class="remaining-day">16일 남음</div><br>
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
                <a href="#" class="funding-linkwrap">
                    <div class="funding-link">펀딩하기</div>
                </a>
                <br>
                <div class="btn-box">
                    <button class="like-btn">
                        <span class="material-icons">favorite_border</span>
                        <span class="material-icons">favorite</span>
                        <span class="btn-value">0</sp>
                    </button>
                    <button class="report-btn" type="submit">
                        <span class="material-icons">report</span>                
                        <span class="btn-value">프로젝트 신고하기</sp>
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
                        주식회사 리빙팩토리
                    </span>
                </div>
                <div class="seller-intro">
                    주식회사 리빙팩토리는 인테리어 용품, 가구 등을 판매합니다. 
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
            <a href="#" class="reward-linkwrap">
                <div class="reward-wrap">
                    <div class="reward-price">71,900원 펀딩</div>
                    <div class="reward-name">[울트라슈퍼얼리버드] 쟁여두기 6개</div>
                    <div class="reward-intro">자외선은 튕기고 비타민D는 흡수하는 광합썬! 세븐데이즈 마일드 선크림 6개</div>
                    <div class="reward-intro option">*옵션*<br>1.감귤주스 1리터<br>2.감귤주스 갈고 남은 즙</div>
                    <div class="reward-fix">배송비</div>
                    <div class="reward-deliveryfee reward-active">0원</div>
                    <div class="reward-fix">리워드 발송 시작일</div>
                    <div class="reward-send reward-active">2022년 05월 말 예정</div>
                    <div class="reward-count">
                        <span class="reward-fixcount">제한수량 700개</span>
                        <span class="reward-remaining">현재 675개 남음!</span>
                    </div>
                    <div class="reward-status reward-active">총 25개 펀딩완료</div>
                </div>
            </a><!--리워드 1개 생성-->
        </div><!--오른쪽 콘텐츠 끝-->
    </div>

</body>
</html>