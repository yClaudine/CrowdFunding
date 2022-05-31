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
	<%@include file="/WEB-INF/views/fund/fundHeader.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/fund/fundNav.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				//$(".nav-sub>li:nth-child(1)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<h2>펀딩 준비</h2>
			<h6>본격적으로 펀딩을 오픈하기 위해 프로젝트에 대한 필수항목을 작성하세요.</h6>
			<div class="menu-wrap">
				<div class="ready-menu">
					<div>
						<h6>요금제 선택</h6>
						<span class="check-fund">작성 전</span>
					</div>
						<button onclick="location.href='/fundFeeSelectFrm.do?tfNo=${tmpF.tfNo}'">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>기본 정보</h6>
						<span class="check-fund">작성 전</span>
					</div>
						<button onclick="location.href='/fundInfoUpdateFrm.do?tfNo=${tmpF.tfNo}'">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>스토리 작성</h6>
						<span class="check-fund">작성 전</span>
					</div>
						<button onclick="location.href='/fundStoryUpdateFrm.do?tfNo=${tmpF.tfNo}' ">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>리워드 설계</h6>
						<span class="check-fund">작성 전</span>
					</div>
						<button onclick="location.href='/fundRewardCreateFrm.do?tfNo=${tmpF.tfNo}' ">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>위험요인 및 정책</h6>
						<span class="check-fund">작성 전</span>
					</div>
						<button onclick="location.href='/fundPolicyCreateFrm.do?tfNo=${tmpF.tfNo}' ">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>대표자 및 정산정보</h6>
						<span class="check-fund">작성 전</span>
					</div>
						<button onclick = "location.href = '#' ">작성하기</button>
				</div>
				<button class="btn-info submit-btn">제출하기</button>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
	${tmpF.tfCategory}
	<script>
		$(document).ready(function(){
			
			//각 항목별 작성 체크
			const checkFund = $(".check-fund");
			const check = [0,0,0,0,0,0];
			<c:if test="${tmpF.tfFees ne 0}">
			check[0] = 1;
			</c:if>
			<c:if test="${tmpF.tfAmount ne 0 && tmpF.tfCategory ne null && tmpF.tfStart ne null && tmpF.tfEnd ne null}">
			check[1] = 1;
			</c:if>
			<c:if test="${tmpF.tfFilepath1 ne null && tmpF.tfIntro ne null}">
			check[2] = 1;
			</c:if>
			<c:if test="${tRList[0].trNo ne null}">
			check[3] = 1;
			</c:if>
			<c:if test="${tmpF.tfAs ne null}">
			check[4] = 1;
			</c:if>
			<c:if test="${tfc.tfcNo ne null}">
			check[5] = 1;
			</c:if>
			
			//작성 완료 된 항목 메시지 수정
			checkFund.each(function(index,item){
				if(check[index] == 1){
					$(checkFund[index]).text("작성완료");		
				}
			});
			
			//제출하기 버튼 눌렀을때 체크하고 작동
			$(".submit-btn").on("click",function(){
				if(confirm("작성 내용을 제출하시겠습니까?")){
					let count = 0;
					checkFund.each(function(index,item){
						if(check[index] == 1){
							count++;		
						}
					});
					if(count == 6){
						location.href="/CreateFund.do?tfNo=${tmpF.tfNo}";
					}else{
						alert("필수 항목들을 모두 작성해주세요.");
					}	
				}
			});			
		});
	</script>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>