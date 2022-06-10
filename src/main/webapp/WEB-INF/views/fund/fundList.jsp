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
    <!--페이지 css-->
<style>
.banner {
    background-color: rgb(211, 230, 236);
    height: 300px;
}

.content {
    height: 1000px;
    width: 1000px;
    margin: 0 auto;
}

.category {
    margin: 0 auto;
    display: flex;
    height: 200px;
    justify-content: center;
    padding-top: 50px;
}

.category-list {
    border: none;
    background-color: #fff;
    height: 100px;
    padding: 0;
}
.circle-list {
    display: inline-block;
    width: 80px;
    height: 110px;
}
.circle-list:hover>span{
    color: #00c4c4;
}

.circle-img {
    display: inline-block;
    background-color: yellowgreen;
    width: 65px;
    height: 65px;
    margin-top: 10px;
    border-radius: 65px;
}

.circle-name {
    display: inline-block;
    width: 80px;
    height: 20px;
    font-size: 15px;
    font-weight: 400;
    color: #212529;
    text-align: center;
}
.circle-img>img {
    width: 65px;
    height: 65px;
    border-radius: 65px;
}

.search-filter {
    align-items: center;
    justify-content: right;
    display: flex;
    height: 50px;
    margin-left: 10px;
}

.search-funding>form {
    display: flex;
}

.search-funding>form>input {
    border: none;
    border-bottom: 2px solid #868e96;
    font-size: 13px;
    width: 180px;
    height: 35px;
    padding-right: 20px;
    padding-left: 5px;
}

select {
    border: none;
    margin-left: 5px;
    width: 90px;
    padding-left:3px;
    color: #868e96;
}
select:focus{
	outline: none;
}
.list-search:focus {
    outline: none;
}

.search-funding>form>span {
    width: 35px;
    height: 35px;
    border: none;
    border-bottom: 2px solid #868e96;
    background-color: white;
    text-align: center;
}

search-funding>form>button>span {
    font-weight: lighter;
    line-height: 35px;
}


.space {
    margin-top: 5px;
    height: 1px;
    border-bottom: 2px solid #cacaca;
}

.project-container {
    margin-top: 20px;
    width: 1000px;
    height: 1000px;
    display: grid;
    grid-template-columns: repeat(3, 310px);
    grid-template-rows: 310px;
    grid-row-gap: 40px;
    grid-column-gap: 35px;
}

.item {
    display: inline-block;
}

.project-wrap {
    border-radius: 5px;
    display: inline-block;
    height: 175px;
    width: 310px;
    background-color: yellowgreen;
    text-decoration: none;
}

.project-wrap:hover>.project-card>.project-title {
    color: #00b2b2;
    transition: 0.2s;
}

.project-wrap>img {
    border-radius: 5px;
    height: 175px;
    width: 310px;
}

.project-card {
    padding-top: 10px;
    height: 90px;
    width: 310px;
    color: #212529;
}

.project-title {
    color: #212529;
    font-weight: 500;
    height: 50px;
}

.project-info {
    color: #868e96;
    font-size: 13px;
    font-weight: 700;
}

.divide {
    padding: 4px;
}

.line {
    padding-top: 14px;
    border-bottom: 4px solid #00b2b2;
}

.project-progress {
    padding-top: 5px;
}

.project-percent {
    margin-top: 10px;
    color: #00c4c4;
    font-weight: 700;
    font-size: 20px;
}

.project-amount {
    color: #868e96;
    font-weight: 500;
    font-size: 14px;
}

.project-dayleft {
    color: #868e96;
    font-weight: 500;
    font-size: 14px;
    float: right;
    padding-top: 6px;
}


/* Slideshow container */
li {
    list-style: none;
}
.slideContainer {
    width: 100%;
    position: relative;
}
.slideWrap {
    width: calc(100%*6);
    padding-left: 0;
    height: 300px;
    overflow: hidden;
    margin-left: calc(-100%*0);
    position: relative;
    z-index: 1
}

.slide {
    float: left;
}

.slide span {
    display: inline-block;
    font-size: 20px;
    font-weight: 400;
    color: aliceblue;
    position: absolute;
    top: 50px;
    margin-left: 50px;

}
.slide img{
    object-fit:cover;
    width: 100%;
    height: 300px;

}
.pageBtWrap {
    z-index: 2;
    position: absolute;
    left: 0;
    bottom: 7%;
    width: 100%;
    text-align: center;
}
.pageBtWrap li {
    display: inline;
}

.pageBtWrap li .pageBt {
    display: inline-block;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    margin-left: 10px;
    background-color: #fff;
}

.pageBtWrap li .pageBt.addPageBt {
    background-color: #00c4c4;
}
.search-submit{
border : none;
background-color:white;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="banner">
        <div class="slideContainer">
            <ul class="slideWrap">
                <li class="slide slide4">
                    <span>서포터님의 사랑을 받은 인기펀딩은 곧 끝나요</span>
                    <img src="resources/image/fund/living.jpg">
                </li>
                <li class="slide slide1">
                    <span>쉽게 펀딩을 시작해보세요 </span>
                    <img src="resources/image/fund/travel.jpg">
                </li>
                <li class="slide slide2">
                    <span>FUN FUN FUN</span>
                    <img src="resources/image/fund/cats.jpg">
                </li>
                <li class="slide slide3">
                    <span>궁금했던 펀딩을 검색해보세요</span>
                    <img src="resources/image/fund/salad.jpg">
                </li>
                <li class="slide slide4">
                    <img src="resources/image/fund/living.jpg">
                    <span>test</span>
                </li>
                <li class="slide slide1">
                    <span>test</span>
                    <img src="resources/image/fund/travel.jpg">
                </li>
            </ul>
            <ul class="pageBtWrap">
                <li><a href="#" class="pageBt addPageBt"></a></li>
                <li><a href="#" class="pageBt"></a></li>
                <li><a href="#" class="pageBt"></a></li>
                <li><a href="#" class="pageBt"></a></li>
            </ul>
        </div>

            
        </div>
    </div><!--banner-->
    
    
    <div class="content">
    <!--카테고리 5개-->
        <div class="category" value="${f.fundCategory }">
            <button class="category-list"><!--카테고리1개-->
                <span class="circle-list">
                    <span class="circle-img">
                        <img src="resources/image/fund/leaves.jpg">
                    </span>
                    <span class="circle-name">BEST</span>
                </span>
            </button><!--카테고리1개-->
            <button class="category-list"><!--카테고리1개-->
                <span class="circle-list">
                    <span class="circle-img">
                        <img src="resources/image/fund/living.jpg">
                    </span>
                    <span class="circle-name">리빙</span>
                </span>
            </button><!--카테고리1개-->
            <button class="category-list"><!--카테고리1개-->
                <span class="circle-list">
                    <span class="circle-img">
                        <img src="resources/image/fund/beauty.jpg">
                    </span>
                    <span class="circle-name">뷰티</span>
                </span>
            </button><!--카테고리1개-->
            <button class="category-list"><!--카테고리1개-->
                <span class="circle-list">
                    <span class="circle-img">
                        <img src="resources/image/fund/pet.jpg">
                    </span>
                    <span class="circle-name">반려동물</span>
                </span>
            </button><!--카테고리1개-->
            <button class="category-list"><!--카테고리1개-->
                <span class="circle-list">
                    <span class="circle-img">
                        <img src="resources/image/fund/travel.jpg">
                    </span>
                    <span class="circle-name">여행</span>
                </span>
            </button><!--카테고리1개-->
            <button class="category-list"><!--카테고리1개-->
                <span class="circle-list">
                    <span class="circle-img">
                        <img src="resources/image/fund/food.jpg">
                    </span>
                    <span class="circle-name">푸드</span>
                </span>
            </button><!--카테고리1개-->

        </div>

    <!--검색 옵션들-->
        <div class="search-filter">
            <div class="search-funding">
                <form action="/fundSearch.do">
                    <input type="text" class="list-search" id="keyword" name="keyword" value="${keyword }" placeholder="궁금한 펀딩을 검색해보세요">
                    <button type="submit" class="search-submit"><span class="material-symbols-outlined searchI">search</span></button>
                    
            <!--필터링1 - 진행중/종료된-->
                    <select name="fstatus">
                        <option value="ongoing"<c:if test="${fstatus eq 'onging' }">selected</c:if>>진행순</option>
                        <option value="end"<c:if test="${fstatus eq 'end' }">selected</c:if>>종료된</option>
                    </select>
            <!--필터링2 - 인기순/펀딩액순/최신순-->
                    <select name="searchType" class="searchType">
                        <option value="current" <c:if test="${searchType eq 'current' }">selected</c:if>>최신순</option>
                        <option value="popular" <c:if test="${searchType eq 'popular' }">selected</c:if>>인기순</option>
                        <option value="total" <c:if test="${searchType eq 'total' }">selected</c:if>>펀딩액순</option>
                    </select>
                    
                </form>
            </div>
        </div>
        <div class="space"></div>

<!--펀딩 리스트-->
	<div class="ajax-container" >
        <div class="project-container" id="project-container"> 
        <c:choose>
        	<c:when test="${empty list }">
            	<div class="no-search"><h6>다른 펀딩을 검색해보세요.</h6></div>
            </c:when>
           <c:otherwise>          
           <c:forEach items="${list }" var="f" varStatus="i">
            <div class="item"><!--grid 1개 item-->
                <a href="/fundView.do?fundNo=${f.fundNo }&memberId=${sessionScope.m.memberId }" class="project-wrap">
                    <img src="resources/image/fund/living.jpg">
                    <div class="project-card">
                        <div class="project-title">
                            ${f.fundName }
                        </div>
                        <div class="project-info">
                            <span class="project-category">${f.fundCategory }</span>
                            <span class="divide">|</span>
                            <span class="project-seller">${f.owner }</span>
                        </div>
                    </div>
                </a>
                <div class="line"></div>
                <div class="project-progress">
                
                    <span class="project-percent achieve">${f.rate }%</span>                
                    <span class="project-amount">∙${f.fundAmount }원</span>
                    <span class="project-dayleft">${f.dateGap }일 남음</span>
                </div>
            </div><!--grid 1개--> 
            
            
    		<input type="hidden" class="fundingSum" value="${f.fundingSum}">
    		<input type="hidden" class="fundAmount" value="${f.fundAmount}">
            </c:forEach>
           </c:otherwise>
         </c:choose>
           
        </div><!--grid container-->
       </div>
    </div><!--content-->
    <input type="hidden" value="${sessionScope.m.memberId }">

	<%@include file="/WEB-INF/views/common/footer.jsp" %>

    
<script>
   
    //onclick="location.href='/fund.do?category=BEST'"
    //const category = $(this).children().children().eq(1).text();
	
    $(".category-list").on("click",function(){
        const category = $(this).children().children().eq(1).text();

    	//let category = $(this).val(); //개별버튼값
    	$.ajax({
    		url : "/fund.do",
    		data : {
    			"category":category //버튼 value값 따라 작동하게
    		},
    		success : function(data){
    			//console.log(data);
		    	//$("#ajax-container").load(location.href+' #ajax-container');
    			location.href="/fund.do?category="+category;
    			
    		}
		})
    });  
    
  
    
    //이미지 슬라이드(수정 필요)
    $(function () {
        var winW = cnt = setId = 0;
        resizeFn();

        function resizeFn() {
            winW = $(window).innerWidth();
            $(".slide").css({
                width: winW
            });
        };
        
        $(window).resize(function () {
            resizeFn();
        });
        autoplayFn();

        function autoplayFn() {
            setId = setInterval(nextCountFn, 4000);
        };

        $(".pageBt").each(function (idx) {
            $(this).click(function () {
                clearInterval(setId);
                cnt = idx;
                mainslideFn();
            });
        });

        function nextCountFn() {
            cnt++;
            mainslideFn();
        };

        function prevCountFn() {
            cnt--;
            mainslideFn();
        };

        function mainslideFn() {
            $(".slideWrap").stop().animate({
                left: (-100 * cnt) + "%"
            }, 600, function () {
                if (cnt > 3) {
                    cnt = 0;
                }
                if (cnt < 0) {
                    cnt = 3
                }
                $(".slideWrap").stop().animate({
                    left: (-100 * cnt) + "%"
                }, 0)
            });
            $(".pageBt").removeClass("addPageBt");
            $(".pageBt").eq(cnt > 3 ? cnt = 0 : cnt).addClass("addPageBt");
        };
    });    
    </script>
   
    <!--부트스트랩-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>