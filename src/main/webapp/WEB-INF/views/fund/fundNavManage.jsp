<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.nav-image>.fund-image{
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
	.nav-image>.fund-text{
		position: absolute;
		top: 25px;
		left: 25px;
		font-family: 'Noto Sans KR', sans-serif;
		color: #fff;
	}
	.nav-image>.fund-text>.fund-code{
		font-size: 14px;
	}
</style>
<div class="nav-image">
	<div class="fund-image"></div>
	<div class="fund-text">
		${fund.memberId }의<br>
		펀딩 관리<br><br>
		<span class="fund-code">프로젝트 번호 : ${fund.fundNo }</span>
	</div>
</div>
<ul class="nav-top">
	<li>
		<a href="/manageFundingFrm.do?fundNo=${fund.fundNo }">
		펀딩관리
		</a>
		<ul class="nav-sub">
			<li><a href="/fundStoryManageFrm.do?fundNo=${fund.fundNo}">스토리 수정</a></li>
			<li><a href="/fundRewardManageFrm.do?fundNo=${fund.fundNo}">리워드 추가</a></li>
			<li><a href="/fundCalculateManageFrm.do?fundNo=${fund.fundNo}">정산정보 수정</a></li>
			<li><a href="#">펀딩 현황</a></li>
		</ul>
</ul>