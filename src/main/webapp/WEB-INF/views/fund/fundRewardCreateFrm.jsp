<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
</head>
<style>
	.rewardIntro-wrap{
		width: 730px;
		padding: 20px;
		border: 1px solid #ccc;
	}
	.rewardIntro-wrap>table>tbody>tr>th{
		font-size: 13px;
		padding-right: 40px;
		padding-bottom: 10px;
	}
	.rewardIntro-wrap>table>tbody>tr>td{
		font-size: 13px;
		padding-right: 40px;
		padding-bottom: 10px;
	}
	#rewardIntro-header{
		font-size: 17px;
	}
	#rewardIntro-caution{
		padding: 10px;
		padding-right: 0px;
		border: 1px solid #ccc;
		background-color: #eee;
	}
	.rewardIntro-option>th{
		padding-top: 10px;
	}
	.rewardIntro-option>td{
		padding-top: 10px;
	}
	#rewardAdd{
		width: 150px;
		height: 50px;
		font-size: 17px;
		border-radius: 0px;
	}
	.reward-total-wrap{
		width: 720px;
		display: flex;
		justify-content: space-between;
	}
	.reward-wrap{
		width: 340px;
		border: 1px solid #ccc;
		padding: 20px;
		padding-bottom: 5px;
		font-size: 13px;
	}
	.reward-title{
		padding-bottom: 7px;
		border-bottom: 2px solid #aaa;
		display: flex;
		justify-content: space-between;
	}
	.reward-price{
		font-size: 17px;
		font-weight: bold;
	}
	.reward-count{
		width: 100px;
		height: 25px;
		line-height: 25px;
		text-align: center;
		color: rgb(0, 196, 196);
		background-color: rgb(231, 249, 249);
	}
	.reward-name{
		font-size: 15px;
		margin-top: 20px;
	}
	.reward-intro{
		margin-top: 10px;
	}
	.reward-deliveryFee-wrap{
		margin-top: 25px;
		display: flex;
		justify-content: space-between;
	}
	.reward-deliveryFee-wrap>div:first-child{
		font-weight: bold;
	}
	.reward-deliveryFee{
		padding-right: 10px;
	}
	.reward-send-wrap{
		display: flex;
		justify-content: space-between;
	}
	.reward-send-wrap>div:first-child{
		font-weight: bold;
	}
	.reward-send{
		padding-right: 10px;
	}
	.btn-wrap{
		margin-top: 5px;
		text-align: right;
		padding-right: 7px;
	}
	.btn-wrap>button{
		width: 50px;
		height: 25px;
		font-size: 13px;
		padding: 0px;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/fund/fundHeader.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/fund/fundNav.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				$(".nav-sub>li:nth-child(4)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩준비 > <b>리워드 설계</b></span>
			<h2>리워드 설계</h2>
			<h6>서포터에게 제공할 리워드 내용을 입력하세요. 서포터가 쉽게 펀딩할 수 있는 저렴한 리워드부터 서포터의<br>
				보다 빠른 펀딩을 유도할 수 있는 얼리버드 리워드까지 다양한 리워드를 구성하세요.</h6>
			<div class="rewardIntro-wrap">
				<table>
					<tr>
						<th colspan="2" id="rewardIntro-header">소개 사진 등록</th>
					</tr>
					<tr>
						<th>정렬 순서</th>
						<td>혜택이 높은 순으로 나오도록 정렬 순서를 등록하세요.</td>
					</tr>
					<tr>
						<th>제한수량</th>
						<td>생산 및 제공할 수 있는 리워드의 총 수량으로 해당 수량이 모두 펀딩되면 더 이상 펀딩이 불가합니다.</td>
					</tr>
					<tr>
						<th>발송 시작일</th>
						<td>프로젝트 종료일 이후부터 11개월 이내로 설계 가능합니다.</td>
					</tr>
					<tr>
						<th></th>
						<td id="rewardIntro-caution">
							※ 설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 <br>
							 신중하게 선택하세요.<br>
							※ 종료일 +11개월까지 발송이 시작되지 않은 경우, 미발송 상태인 서포터의 펀딩금 반환이 자동으로<br>
							반환(결제취소)되니 유의하세요.
						</td>
					</tr>
					<tr class="rewardIntro-option">
						<th>옵션 조건</th>
						<td>옵션(사이즈, 색상 등) 이 필요한 경우, 옵션을 추가하세요.</td>
					</tr>
				</table>
			</div>
			<br>
			<button type="button" id="rewardAdd" class="btn btn-secondary">+ 추가하기</button>
			<br><br><br>
			<div class="reward-total-wrap">
				<div class="reward-wrap">
					<div class="reward-title">
						<div class="reward-price">100,000원</div>
						<div class="reward-count">제한 수량 10개</div>
					</div>
					<div class="reward-name">리워드 1호</div>
					<div class="reward-intro">리워드 1호 상세설명 입니다.</div>
					<div class="reward-deliveryFee-wrap">
						<div>배송비</div>
						<div class="reward-deliveryFee">해당 없음</div>
					</div>
					<div class="reward-send-wrap">
						<div>리워드 발송 시작일</div>
						<div class="reward-send">2022년 08월초(1-10일)</div>
					</div>
					<div class="btn-wrap">
						<button type="button" id="reward-update" class="btn btn-outline-dark">편집</button>
						<button type="button" id="reward-delete" class="btn btn-outline-dark">삭제</button>	
					</div>
				</div>
				<div class="reward-wrap">
					<div class="reward-title">
						<div class="reward-price">100,000원</div>
						<div class="reward-count">제한 수량 10개</div>
					</div>
					<div class="reward-name">리워드 1호</div>
					<div class="reward-intro">리워드 1호 상세설명 입니다.</div>
					<div class="reward-deliveryFee-wrap">
						<div>배송비</div>
						<div class="reward-deliveryFee">해당 없음</div>
					</div>
					<div class="reward-send-wrap">
						<div>리워드 발송 시작일</div>
						<div class="reward-send">2022년 08월초(1-10일)</div>
					</div>
					<div class="btn-wrap">
						<button type="button" id="reward-update" class="btn btn-outline-dark">편집</button>
						<button type="button" id="reward-delete" class="btn btn-outline-dark">삭제</button>	
					</div>
				</div>
			</div>
			<br><br>
			<button class="save-btn btn-info">저장하기</button>
			<br><br><br><br><br>
		</div>
	</div>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>