<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
.body{
	overflow-x: hidden;
}

.eventimg1 {
	background-image:  url(/resources/image/notice/main/15_fruit.jpg);
}
.eventimg2 {
	background-image:  url(/resources/image/notice/main/11_house.jpg);
}
.eventimg3 {
	background-image:  url(/resources/image/notice/main/13_beauty.jpg);
}
.eventimg4 {
	background-image:  url(/resources/image/notice/main/12_tomato.jpg);
}
.eventimg5 {
	background-image:  url(/resources/image/notice/main/16_flowers-gec9380e71_1920.jpg);
}
.sellerstore>a{
	font-size: 20px;
	font-weight: bold;
	margin-left: 200px;
}

.controller2>span{ 
    position:absolute; 
    display: flex;
    background-color: gray; 
    color: rgba(255, 255, 255, 0.516); 
    text-align: center; 
    padding: 1px 10px; 
    font-size: 0.8em; 
    cursor: pointer; 
}

.prev2{
    right: 300px;
}
.next2{
    right: 250px;
}
/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */ 
.controller2 span:hover{ 
    color: snow; 
}

.events{
	position: relative;
	width: 1100px;
	margin: 0 auto;
	margin-top: 50px;
	height: 200px;
	overflow: hidden;
}

.events.animated{
	transition: 0.5s ease-out;
}

.events div {
	width: 1100px;
	height: 200px;
	float: left;
}

.events div:not(:last-child) {
	margin-right: 40px;
}

.content-category{
		align-self: center;
		display: flex;
		padding: 20px;
		width: 100%;
		text-align: center;
	}
.content-categorylist{
		align-self: center;
		padding-left: 100px;
		padding-right: 100px;
		text-align: center;
	}
.sellerstore>a{
	text-decoration-line: none;
	color:#000000;
}
.sellerstore>a:hover{
	color:#212529;
}

.marquee{
	transform: rotate(-2deg);
	margin-top: 50px;
}	

.marquee2{
	transform: rotate(2deg);
	margin-top: 50px;
}	

.marquee:hover{
	cursor: pointer;
}

.marquee2:hover{
	cursor: pointer;
}
	

</style>


<!-- slick -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<!-- 구글폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>
<!-- store.css -->
<link rel="stylesheet" href="resources/css/store.css">

<link rel="stylesheet" href="resources/css/reset.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
<div class="content-wrap">
	<!--메인 이미지-->
    <div class="mainimg" >
        <ul class="slides">
        
            <li class="slide img1 maintext">      
            	<p class="imgtext">
            		육아는 장비빨
            		<br>
            		육아 꿀템 모음전
            	</p>
            	<p class="imgtext2">슬기로운 육아템 추천</p>   	
            </li>
            
            <li class="slide img2 maintext">
            	<p class="imgtext">
            		아늑한 캠핑에
            		<br>
            		걸맞는 감성
            	</p>
            	<p class="imgtext2">감성 캠핑템</p>
            </li>
            
            <li class="slide img3 maintext">
            	<p class="imgtext">
            		사소한 불편함이
            		<br>
            		사라지는 마법
            	</p>
            	<p class="imgtext2">삶의 질 상승템</p>
            </li>
            
            <li class="slide img4 maintext">
            	<p class="imgtext">
            		더워지는 날씨
            		<br>
            		미리 준비해요
            	</p>
            	<p class="imgtext2">미리 준비하는 여름</p>
            </li>
            
            <li class="slide img5 maintext">
            	<p class="imgtext">
            		역대급브런치
            		<br>
            		카페 마마스
            	</p>
            	<p class="imgtext2">최대 17% 할인 혜택</p>
            </li>
        </ul>
    <p class="controller">
        <!--왼쪽 방향 화살표 오른쪽방향 화살표-->
        <span class="material-symbols-outlined prev">arrow_back_ios</span>
        <span class="material-symbols-outlined next">arrow_forward_ios</span>
    </p>    
    </div>
</div>
    <!--이벤트 이미지-->
    
    <!--스토어 등록-->
    <div class="sellerstore">
    	<a href="/notice.do?reqPage=1&type=event" id="event">이벤트</a>
    	<p class="controller2">
	        <!--왼쪽 방향 화살표 오른쪽방향 화살표-->
	        <span class="prev2">&lang;</span>
	        <span class="next2">&rang;</span>
    	</p>
    	<div class="events autoplay">
    		<div class="eventimg1" style="background-size: 330px;"></div>
    		<div class="eventimg2" style="background-size: 330px;"></div>
    		<div class="eventimg3" style="background-size: 330px;"></div>
    		<div class="eventimg4" style="background-size: 330px;"></div>
    		<div class="eventimg5" style="background-size: 330px;"></div>
    	</div>
    </div>
		
	<div class="marquee">
	 	<marquee width=window.innerWidth height=50 bgcolor="#00b2b2" scrollamount="10"><font size="6" color="white">좋은 물건이 떠오르시나요? 
	 	&emsp;&emsp; 지금 당장 FUNFUNFUN 스토어 신청을 클릭 한 번으로 해 보세요. </font></marquee>
	</div>
	<div class="marquee2">
	 	<marquee width=window.innerWidth direction=right height=50 bgcolor="#e7f9f9" scrollamount="10"><font size="6" color="#868e96">FUNFUNFUN과 함께라면 
	 	&emsp; 스토어 신청도 간편하게! </font></marquee>
	</div>
	<br><br><br>
  
    
    <div class="category-title">
			<h5>상품 카테고리 <a href="/storeList.do?reqPage=1&storeCategory=all" style="font-weight: normal; font-size: 18px; padding-left: 15px;">전체 보기</a>
			</h5>
				
			<div class="content-category">
				<div class="content-categorylist">
					<a href="/home.do"><span class="material-symbols-outlined" style="font-size:45px; color:black;  border-radius: 10px; background-color: #e7f9f9; padding: 7px;">home</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">가전</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/beauty.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">hand_gesture</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">뷰티</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/pet.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">pets</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">반려동물</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/travel.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">airplane_ticket</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">여행</span>
	                </div>
				</div>
				<div class="content-categorylist">
					<a href="/food.do"><span class="material-symbols-outlined" style="font-size:45px; color:black; border-radius: 10px; background-color: #e7f9f9; padding: 7px;">dinner_dining</span></a>
					<div class="content-categoryname">
	                	<span class="store-content">푸드</span>
	                </div>
				</div>
			</div>
		
</div>
    <script>
    
    //첫번째 메인 이미지 스크립트
    var slides = document.querySelector('.slides'),
    slide = document.querySelectorAll('.slides li'),
    currentIdx = 0, 
    slideCount = slide.length,
    //모니터 별 와이드 잡아 주기
    slideWidth = window.innerWidth,
    slideMargin = 0,
    prevBtn = document.querySelector('.prev'),
    nextBtn = document.querySelector('.next');
    console.log(slideWidth);
    makeClone();
    //원래 있는 li 앞 뒤에 새로운 li 만들어 주기
    function makeClone() {
        for(var i = 0; i<slideCount; i++) {
            //a.clonNode(), a.cloneNode(true)
            var cloneSlide = slide[i].cloneNode(true);
            cloneSlide.classList.add('clone');
            //a.appendChild(b)
            slides.appendChild(cloneSlide);
        }
        for(var i = slideCount -1; i>=0; i-- ){
            //a.clonNode(), a.cloneNode(true)
            var cloneSlide = slide[i].cloneNode(true);
            cloneSlide.classList.add('clone');
            //a.prepend(b)
            slides.prepend(cloneSlide);
        }
        updateWidth(); //새로운 너비
        setInitialPos();
        
        setTimeout(function(){
            slides.classList.add('animated');
        },100);
    
    }
	
    function updateWidth(){
       var currentSlides = document.querySelectorAll('.slides li');
        var newSlideCount = currentSlides.length;

        //너비 전체 구하기
        var newWidth = (slideWidth)*newSlideCount+'px';
        slides.style.width = newWidth;
    }
    function setInitialPos(){
        var initialTranslateValue = -(window.innerWidth)*slideCount;
        //slides { fransform:translateX(-10000px);}
        slides.style.transform = 'translateX(' + initialTranslateValue+'px)';
    }

    // 다음 버튼 이동
    nextBtn.addEventListener('click',function(){
        moveSlide(currentIdx + 1);
    });
    //이전 버튼 이동 
    prevBtn.addEventListener('click',function(){
        moveSlide(currentIdx - 1);
    });

    //슬라이드 보이는 표시
    function moveSlide(num) {
        slides.style.left = -num * (window.innerWidth) +'px';
        currentIdx = num;
        
        //마지막이 되었을 때 다시 처음으로 돌아가게 하는 것
        if(currentIdx == slideCount || currentIdx == -slideCount){
            setTimeout(function(){

                slides.classList.remove('animated');
                slides.style.left = '0px';
                currentIdx = 0;
            }, 500);
            setTimeout(function(){
                slides.classList.add('animated');
            },600);
        }
    }

    //자동 슬라이드
    //clearInterval(timer);

    var timer = undefined;

    function autoSLide(){
        if(timer == undefined){
            timer = setInterval(function(){
                moveSlide(currentIdx + 1);
            },6000);
        }
    }
	    autoSLide();
    function stopSlide(){
        clearInterval(timer);
        timer = undefined;
    }
    //마우스가 들어오면 자동 슬라이드 멈추게
    slides.addEventListener('mouseenter', function(){
        stopSlide();
    });
    //마우스가 떠나면 자동 슬라이드 시작
    slides.addEventListener('mouseleave', function(){
        autoSLide();
    });
    
    window.addEventListener('resize', function () {
        var img = document.querySelector('.slide');
        var imgs = document.querySelectorAll('.slides li');
        var imgWidth = slideWidth;
        var imgsWidth = updateWidth;

        //뷰포트 1600px 이상일 때  width 변화
        if (innerWidth >= 1600) {
        	img.style.width = slideWidth;
        	updateWidth();
        	setInitialPos();
        	

        } else {
        	img.style.width = slideWidth;
        	updateWidth();
        	setInitialPos();
        	
            
        }
    })
	$(function(){
	   $('.autoplay').slick({
		  slidesToShow: 3,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 3000,
		  prevArrow : $('.prev2'),        // 이전 화살표 모양 설정
          nextArrow : $('.next2')        // 다음 화살표 모양 설정
		});
		
	})
    
    $(".marquee").click(function(){
    	location.href='/storeStart.do';
    });
    
    $(".marquee2").click(function(){
    	location.href='/storeStart.do';
    });
    
	

  
   


    </script>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>
</html>