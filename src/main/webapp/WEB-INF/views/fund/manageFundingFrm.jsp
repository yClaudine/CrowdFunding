<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
</head>
<style>
	.menu-wrap{
		width: 850px;
		margin-left: -5px;
	}
	.ready-menu{
		height: 80px;
		padding-left: 35px;
		padding-right: 20px;
		display: flex;
		border: 1px solid #ccc;
		margin-bottom: 20px;
		border-left: 7px solid #00c4c4;
		justify-content: space-between;
		align-items: center;
	}
	.ready-menu>div{
		display: flex;
		align-items: center;
	}
	.ready-menu>div>h6{
		margin-bottom: 0px;
	}
	.ready-menu>div>span{
		padding-left: 12px;
		color: #00c4c4;
		font-size: 12px;
		font-weight: bold;
		margin-top: 3px;
	}
	.ready-menu>button{
		width: 112px;
		height: 50px;
		border: 1px solid #ccc;
		background-color: #fff;
		color: #aaa;
	}
	.ready-menu>button:hover{
		background-color: #00c4c4;
		color: #fff;
		transition: 0.2s;
	}
	.submit-btn{
		width: 350px;
		height: 50px;
		margin-top: 40px;
		align: right;
		border: none;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/fund/fundHeaderManage.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/fund/fundNavManage.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				//$(".nav-sub>li:nth-child(1)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<h2>펀딩 관리</h2>
			<h6>등록하신 펀딩이 성공적으로 진행될 수 있도록 각  항목들을 관리해주세요.</h6>
			<div class="menu-wrap">
				<div class="ready-menu">
					<div>
						<h6>스토리 수정</h6>
					</div>
						<button onclick="location.href='/fundStoryManageFrm.do?fundNo=${fund.fundNo}' ">수정하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>리워드 추가</h6>
					</div>
						<button onclick="location.href='/fundRewardManageFrm.do?fundNo=${fund.fundNo}'">추가하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>정산정보 수정</h6>
					</div>
						<button onclick="location.href='/fundCalculateManageFrm.do?fundNo=${fund.fundNo}'">수정하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>펀딩 현황</h6>
					</div>
						<button onclick="location.href='/fundStatusManageFrm.do?fundNo=${fund.fundNo}&reqPage=1'">살펴보기</button>
				</div>
				<button class="btn-info submit-btn">나가기</button>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
	<script>
		//나가기 버튼 눌렀을때 체크하고 작동
		$(".submit-btn").on("click",function(){
			if(confirm("수정을 완료하고 메인 페이지로 나가시겠습니까?")){
				location.href="/";
			}
		});			
	</script>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>