<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/store.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<!--메인 이미지-->
    <div class="mainimg">
        <ul class="slides">
            <li class="slide img1"></li>
            <li class="slide img2"></li>
            <li class="slide img3"></li>
            <li class="slide img4"></li>
            <li class="slide img5"></li>
        </ul>
    <p class="controller">
        <!--왼쪽 방향 화살표 오른쪽방향 화살표-->
        <span class="prev">&lang;</span>
        <span class="next">&rang;</span>
    </p>    
    </div>
    <!--이벤트 이미지-->
    
    <!--스토어 등록-->
    <div class="sellerstore"></div>
    
    <script>
    var slides = document.querySelector('.slides'),
    slide = document.querySelectorAll('.slides li'),
    currentIdx = 0, 
    slideCount = slide.length,
    slideWidth = 1600,
    slideMargin = 6,
    prevBtn = document.querySelector('.prev'),
    nextBtn = document.querySelector('.next');

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
        var crrentSlides = document.querySelectorAll('.slides li');
        var newSlideCount = crrentSlides.length;

        //너비 전체 구하기
        var newWidth = (slideWidth + slideMargin)*newSlideCount-slideMargin+'px';
        slides.style.width = newWidth;
    }
    function setInitialPos(){
        var initialTranslateValue = -(slideWidth + slideMargin)*slideCount;
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

    //다음 버튼
    function moveSlide(num) {
        slides.style.left = -num * (slideWidth+slideMargin) +'px';
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
    </script>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>