<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.fund-graph{
		width: 100%;
		padding-top: 25px;
	}
	.graph-wrap{
		width: 100%;
		padding: 10px 15px;
		border: 1px solid rgb(0, 178, 178);
	}
	.graph-title{
		display: flex;
		justify-content: space-between;
	}
	.title-money{
		display: flex;
	}
	.title-money>h6{
		padding-left: 5px;
	}
	.title-achive{
		display: flex;
	}
	.title-achive>h6{
		padding-left: 5px;
		color: rgb(0, 178, 178);
	}
	.graph-bar{
		width: 100%;
		height: 25px;
		border: 1px solid rgb(0, 178, 178);
		position: relative;
		overflow: hidden;
	}
	.bar-gage{
		width: 0%;
		height: 25px;
		background-color: rgb(0, 178, 178);
		position: absolute;
		transition: 1s;
	}
	.fund-board{
		width: 100%;
		padding-top: 75px;
	}
	.fund-board>table{
		wdith: 100%;
		font-size: 17px;
	}
	.fund-board>table>tbody{
		width: 100%;
	}
	.board-title{
		width: 100%;
		border-top: 1px solid rgb(0, 178, 178);
		border-bottom: 1px solid rgb(0, 178, 178);
	}
	.board-title>th{
		padding: 5px 30px;
		text-align: center;
	}
	tr>td{
		text-align: center;
	}
	.nopay{
		height: 300px;
		line-height: 300px;
	}
	.pageNavi{
		margin: 0 auto;
		display: flex;
		justify-content: center;
	}
	.page-item>.page-link{
		width: 35px;
		height: 35px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/fund/fundHeaderManage.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/fund/fundNavManage.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				$(".nav-sub>li:nth-child(4)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩관리 > <b>펀딩 현황</b></span>
			<h2>펀딩 현황</h2>
			<h6>현재 펀드 달성률, 진행도, 결제 리스트 등을 볼 수 있습니다.</h6>
			<div class="fund-graph">
				<h6>펀딩 달성률</h6>
				<div class="graph-wrap">
					<div class="graph-title">
						<div class="title-money">
							<h6>0</h6><h6>/</h6>
							<h6>${fund.fundAmount }</h6><h6>원 달성</h6>
						</div>
						<div class="title-achive">
							<h6>0</h6><h6>%</h6>
						</div>
					</div>
					<div class="graph-bar">
						<div class="bar-gage"></div>
					</div>
				</div>
			</div>
			<div class="fund-graph">
				<h6>펀딩 진행도</h6>
				<div class="graph-wrap">
					<div class="graph-title">
						<div class="title-money">
							<h6>1</h6><h6>월</h6>
							<h6>1</h6><h6>일 시작</h6>
						</div>
						<div class="title-achive">
							<h6>종료일까지</h6><h6>0</h6><h6>일 남음</h6>
						</div>
					</div>
					<div class="graph-bar">
						<div class="bar-gage"></div>
					</div>
				</div>
			</div>
			<div class="fund-board">
				<h6>결제 리스트</h6>
				<table class="table table-hover">
					<thead>
						<tr class=board-title>
							<th>번호</th>
							<th>서포터명</th>
							<th>서포터아이디</th>
							<th>리워드금액</th>
							<th>후원금액</th>
							<th>후원일자</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="pageNavi">
				${pageNavi }
			</div>
			<br><br>
			<button class="save-btn btn-info">나가기</button>
			<br><br><br><br><br>
		</div>
	</div>
	
	<script>
		//숫자에 comma 넣어주는 함수
		$.numberWithCommas = function (x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
		//숫자에 comma 제거해주는 함수
		$.withoutCommas = function (x) {
			return x.toString().replace(",", '');
		}
		//결제 리스트 입력
		$(document).ready(function(){
			//총 펀딩액을 저장할 변수
			let totalPay = 0;
			//목표 펀딩액 저장할 변수 & 입력
			const fundAmount = $(".title-money").eq(0).children().eq(2).text();
			$(".title-money").eq(0).children().eq(2).text($.numberWithCommas(fundAmount));
			//결제 리스트 table
			const payTable = $(".table>tbody");
			let tr;
			let td1;
			let td2;
			let td3;
			let td4;
			let td5;
			let td6;
			//펀드의 결제 수가 0이 아닐때 작동
			<c:choose>
				<c:when test="${fn:length(fpl) ne 0}">
					//펀딩 달성금액 입력
					totalPay = ${totalPay};
					$(".title-money").eq(0).children().eq(0).text($.numberWithCommas(totalPay));
					//펀딩 달성률 입력
					const achivePercent = Math.round(( totalPay / fundAmount ) * 100);
					$(".title-achive").eq(0).children().eq(0).text(achivePercent);
					$(".bar-gage").eq(0).css("width",achivePercent+"%");
					//리스트에 tr 클래스 정할 함수
					let fpStatus = 0
					//펀드 페이 리스트를 순회하는 forEach문
					<c:forEach var="fp" items="${fpl}" varStatus="status">
						tr = $("<tr>");
						td1 = $("<td>").text("${fp.fpayNo}");
						td2 = $("<td>").text("${fp.memberName}");
						td3 = $("<td>").text("${fp.memberId}");
						td4 = $("<td>").text($.numberWithCommas(${fp.fpayRewardTotal}));
						td5 = $("<td>").text($.numberWithCommas(${fp.fpaySupport}));
						td6 = $("<td>").text("${fp.fpayDate}");
						fpStatus = ${status.count}%2;
						if(fpStatus == 0){
							$(tr).addClass("table-active")	
						}
						tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
						payTable.append(tr);
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					//아직 결제가 하나도 없을 때 
					tr = $("<tr>");
					td1 = $("<td>").addClass("nopay").attr("colspan",6).text("아직 결제 내역이 존재하지 않습니다.");
					tr.append(td1);
					payTable.append(tr);
				</c:otherwise>
			</c:choose>
			
			//펀딩 진행도 불러오기
			$(".title-achive").eq(1).children().eq(0).css("color","#333").css("padding-right","5px");
			//펀드 시작일 종료일 오늘 저장한 변수
			const fundStart = new Date("${fund.fundStart}");
			const fundEnd = new Date("${fund.fundEnd}");
			const today = new Date();
			//필요한 값들 추출해서 변수에 저장
			const month = fundStart.getMonth()+1;
			const day = fundStart.getDate();
			const totalDay = (fundEnd-fundStart)/(1000*60*60*24);
			const restDay = Math.round((fundEnd-today)/(1000*60*60*24));
			const fundProgress = Math.round(((totalDay-restDay) / totalDay ) * 100);
			//추출한 값들 입력
			$(".title-money").eq(1).children().eq(0).text(month);
			$(".title-money").eq(1).children().eq(2).text(day);
			$(".title-achive").eq(1).children().eq(1).text(restDay);
			$(".bar-gage").eq(1).css("width",fundProgress+"%");
			
			//페이징 css
			$(".page-link").css("color","rgb(0, 178, 178)");
			$(".active>.page-link").css("background-color","rgb(0, 178, 178)").css("border","none").css("color","#fff");
			
			//나가기 버튼 클릭 시
			$(".save-btn").on("click",function(){
				location.href="/manageFundingFrm.do?fundNo=${fund.fundNo }";
			});
		})
	</script>
</body>
</html>