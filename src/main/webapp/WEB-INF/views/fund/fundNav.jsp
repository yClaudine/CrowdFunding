<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	ul{
		list-style: none;
		margin: 0;
		padding: 0;
		padding-left: 0px;
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
		background-image: url( "/resources/image/fund/fundCre.png" );
		background-size: 220px;
		background-position: center;
		background-repeat: no-repeat;
		filter: blur(3px);
	}
	.nav-image{
		position: relative;
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
</style>
<div class="nav-image">
	<div class="tmp-image"></div>
	<div class="tmp-text">
		${tmpF.memberId }의<br>
		펀딩 등록 준비<br><br>
		<span class="tmp-code">임시 프로젝트 번호 : ${tmpF.tfNo }</span>
	</div>
</div>
<ul class="nav-top">
	<li>
		<a href="#">
		펀딩준비
		</a>
		<ul class="nav-sub">
			<li><a href="#">요금제 선택</a></li>
			<li><a href="#">기본 정보</a></li>
			<li><a href="#">스토리 작성</a></li>
			<li><a href="#">리워드 설계</a></li>
			<li><a href="#">위험요인 및 정책</a></li>
			<li><a href="#">대표자 및 정산정보</a></li>
			<li><a href="#">펀딩 작성 완료</a></li>
		</ul>
</ul>