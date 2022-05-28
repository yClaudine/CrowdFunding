<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul{
	    list-style: none;
	    margin: 0;
	    padding: 0;
	    padding-left: 0px;
	}
	.nav-top{
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
	li{
	    font-size: 14px;
	    font-weight: bold;
	}
	li>a{
	    color: #333;
	    text-decoration: none;
	    display: flex;
	    align-items: center;
	    height: 55px;
	}
	li>a:hover{
	    color: rgb(0, 178, 178);
	}
	.nav-top>li>a{
	    padding-left: 20px;
	}
	.nav-sub{
	    background-color: rgb(248, 248, 249);
	    padding-left: 50px;
	}
	.select>a{
	    color: rgb(0, 178, 178);
	}
	.nav-image>.tmp-image{
	    width: 100%;
	    height: 140px;
	    background-size: 220px;
	    background-position: center;
	    filter: blur(1.5px);
	    background-image: url( "/resources/image/fund/fundCre.png" );
	    background-repeat: no-repeat;
	}
	.nav-image{
	    position: relative;
	    border-right: 1px solid #ccc;
	}
	.nav-image>.tmp-text{
	    position: absolute;
	    top: 25px;
	    left: 25px;
	    font-family: 'Noto Sans KR', sans-serif;
	    color: #fff;
	}
	.nav-image>.tmp-text>.tmp-code{
	    font-size: 14px;
	}
	.navi{
		width: 200px;
	}
	.content-right{
		width:80%;
		padding-left: 75px;
		padding-top: 60px; 
	}
	
</style>
</head>
	<div class="nav-image">
        <div class="tmp-image"></div>
        <div class="tmp-text">
            ${tmp.memberId}의<br>
            스토어 등록 준비<br><br>
            <span class="tmp-code">임시 스토어 번호 : ${tmp.stNo}</span>
        </div>
    </div>
    <ul class="nav-top">
        <li>
            <a href="/storeReadyFrm.do?stNo=${tmp.stNo }">
            스토어 준비
            </a>
            <ul class="nav-sub">
                <li><a href="/storeCreate3.do?stNo=${tmp.stNo}">스토어 기본 정보</a></li>
                <li><a href="">상품 정보</a></li>
                <li><a href="">반품/교환</a></li>
                <li><a href="#">대표자 및 정산 정보</a></li>
            </ul>
    </ul>

</html>