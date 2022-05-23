<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.service-wrap{
			width: 670px;
	}
	.service-title{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.service-title>div{
		display: flex;
		align-items: center;
	}
	.service-title>div>span{
		color: rgb(0, 196, 196);
		margin-top: -8px;
	}
	.service-title>div>h4{
		padding-left: 10px;
		font-size: 24px;
	}
	.service-sub>h6{
		padding-top: 10px;
		font-size: 16px;
		font-weight: 400;
	}
	.service-content{
		padding-top: 30px;
		font-size: 16px;
	}
	.service-content>h5{
		font-size: 16px;
		padding-bottom: 7px;
	}
	.service-content>p{
		display: flex;
		align-items: center;
		margin-bottom: 10px;
	}
	.service-caution{
		width: 670px;
		margin-top: 20px;
		padding-top: 20px;
		padding-bottom: 15px;
		padding-left: 30px;
		background-color: rgb(245, 245, 245);
		border-radius: 10px;
	}
	.caution-title{
		display: flex;
		align-items: center;
		font-size: 14px;
		margin-bottom: 5px;
		font-weight: 600;
	}
	.caution-title>span{
		font-variation-settings: 'FILL' 1;
		padding-right: 5px;
	}
	.caution-detail>p{
		font-size: 12px;
		margin-bottom: 5px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/fund/fundHeader.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/fund/fundNav.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				$(".nav-sub>li:nth-child(1)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩준비 > 요금제 선택 <b>요금제 상세 설명</b></span>
			<h2>메이커 서비스</h2>
			<h6>요금제에 맞는 메이커 서비스를 확인하고 신청하세요.</h6>
			<c:if test="${value > 13}">
			<div class="service-wrap">
				<div class="service-title">
					<div>
						<span class="material-symbols-outlined">auto_awesome</span>
						<h4>공간 펀펀펀 쇼룸</h4>
					</div>
					<span>
						<span class="badge bg-info">Pro</span>
					</span>
				</div>
				<div class="service-sub">
					<h6>메이커님의 리워드를 직접 체험할 수 있도록 성수동에 위치한 오프라인 공간 쇼룸을 제공합니다.</h6>
				</div>
				<div class="service-content">
					<h5>이런 분들께 추천드려요.</h5>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	펀딩 진행 중에 서포터들에게 리워드를 체험할 수 있도록 제공하고 싶으신 분
					</p>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	오프라인 공간 펀펀펀 쇼룸에서 펀딩 홍보를 하고 싶으신 분
					</p>
				</div>
				<div class="service-caution">
					<div class="caution-title">
					<span class="material-symbols-outlined">info</span>
					쇼룸 신청은 프로젝트 제출 후부터 가능합니다.
					</div>
					<div class="caution-detail">
						<p>-전시 신청은 프로젝트 제출 후부터 가능합니다.</p>
						<p>-전시유형에 따라 추가 수수료 발생 및 추가 심사가 진행 될 수 있습니다.</p>
						<p>-Pro 요금제 선택 후, 반드시 공간 펀펀펀 쇼룸을 신청해야 전시 가능합니다.</p>
					</div>
				</div><br><hr><br>
			</div>
			</c:if>
			<c:if test="${value > 10}">
			<div class="service-wrap">
				<div class="service-title">
					<div>
						<span class="material-symbols-outlined">campaign</span>
						<h4>오픈예정 서비스</h4>
					</div>
					<span>
						<span class="badge bg-success">Basic</span>
						<span class="badge bg-info">Pro</span>
					</span>
				</div>
				<div class="service-sub">
					<h6>예비 서포터에게 오픈할 프로젝트를 사전에 홀보할 수 있는 서비스로, 오픈 알림 신청한 서포터에게<br>
						알림톡을 통해 오픈소식을 알릴 수 있습니다.</h6>
				</div>
				<div class="service-content">
					<h5>70% 메이커가 오픈예정 서비스를 이용 중이에요!</h5>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	오픈 직후 3일 내 전체 펀딩 금액의 약 35% 모집
					</p>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	평균 펀딩 금액 3배 이상 달성
					</p>
				</div>
				<div class="service-caution">
					<div class="caution-title">
					<span class="material-symbols-outlined">info</span>
					오픈에정 서비스를 진행하는 경우, [스토리 작성 - 스토리 요약] 항목을 반드시 작성하여주세요.
					</div>
					<div class="caution-detail">
						<p>-Pro, Basic 요금제 선택 후, 반드시 오픈예정 서비스를 신청해야 사용 가능합니다.</p>
					</div>
				</div><br><hr><br>
			</div>
			</c:if>
			<div class="service-wrap">
				<div class="service-title">
					<div>
						<span class="material-symbols-outlined">school</span>
						<h4>펀펀펀 스쿨 수강</h4>
					</div>
					<span>
						<span class="badge bg-secondary">Light</span>
						<span class="badge bg-success">Basic</span>
						<span class="badge bg-info">Pro</span>
					</span>
				</div>
				<div class="service-sub">
					<h6>펀딩 입문부터 실전까지 펀딩 준비를 도와주는 온·오프라인 강의를 제공합니다.</h6>
				</div>
				<div class="service-content">
					<h5>이런 분들께 추천드려요</h5>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	펀딩 오픈 절차와 방법이 궁금한 분
					</p>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	성공적인 펀딩을 위한 실전 팁이 필요한 분
					</p>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	창업과 비즈니스 관련 인사이트를 얻고 싶은 분
					</p>
				</div><br><hr><br>
			</div>
			<div class="service-wrap">
				<div class="service-title">
					<div>
						<span class="material-symbols-outlined">movie_filter</span>
						<h4>컨텐츠 제작 도우미</h4>
					</div>
					<span>
						<span class="badge bg-secondary">Light</span>
						<span class="badge bg-success">Basic</span>
						<span class="badge bg-info">Pro</span>
					</span>
				</div>
				<div class="service-sub">
					<h6>디자이너, 영상 전문가 없이도 쉽게 디자인과 영상을 완성할 수 있도록 도와드립니다.</h6>
				</div>
				<div class="service-content">
					<h5>이런 분들께 추천드려요</h5>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	간단한 방법으로 펀딩에 필요한 이미지와 영상을 제작하고 싶으신 분
					</p>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	펀딩 상세페이지 이미지 디자인, 소개 영상이 필요하신 분
					</p>
				</div><br><hr><br>
			</div>
			<div class="service-wrap">
				<div class="service-title">
					<div>
						<span class="material-symbols-outlined">archive</span>
						<h4>펀딜리버리</h4>
					</div>
					<span>
						<span class="badge bg-secondary">Light</span>
						<span class="badge bg-success">Basic</span>
						<span class="badge bg-info">Pro</span>
					</span>
				</div>
				<div class="service-sub">
					<h6>펀펀펀이 배송 파트너와 제휴하여 메이커에게 배송비 할인, 물류 컨설팅 헤택을 제공해드립니다.</h6>
				</div>
				<div class="service-content">
					<h5>이런 분들께 추천드려요</h5>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	펀딩 제품의 수량이 적거나 비정기적이라 배송 단가 협의가 어려운 분
					</p>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	물류, 배송 전문가를 찾고있는 분
					</p>
				</div>
				<div class="service-caution">
					<div class="caution-title">
					<span class="material-symbols-outlined">info</span>
					이 서비스는 파트너사와의 제휴를 통해 제공되는 서비스로 서비스 상황에 따라 변경, 중단될 수 있습니다.
					</div>
				</div><br><hr><br>
			</div>
			<div class="service-wrap">
				<div class="service-title">
					<div>
						<span class="material-symbols-outlined">notifications_active</span>
						<h4>새소식 알림</h4>
					</div>
					<span>
						<span class="badge bg-secondary">Light</span>
						<span class="badge bg-success">Basic</span>
						<span class="badge bg-info">Pro</span>
					</span>
				</div>
				<div class="service-sub">
					<h6>새소식 작성 시 서포터들이 프로젝트 소식을 빠르게 알 수 있도록 알림을 제공합니다.</h6>
				</div>
				<div class="service-content">
					<h5>이런 분들께 추천드려요</h5>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	펀딩 진행을 서포터에게 빠르게 알리고 싶으신 분
					</p>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	서포터와의 관계를 꾸준히 이어가고 싶으신 분
					</p>
				</div>
				<div class="service-caution">
					<div class="caution-title">
					<span class="material-symbols-outlined">info</span>
					펀딩 오픈 이후 [새소식] 메뉴에서 사용할 수 있고 말머리 선택 시 알림 발송 대상을 확인할 수 있습니다.
					</div>
				</div><br><hr><br>
			</div>
			<div class="service-wrap">
				<div class="service-title">
					<div>
						<span class="material-symbols-outlined">sentiment_very_satisfied</span>
						<h4>펀딩 인증마크</h4>
					</div>
					<span>
						<span class="badge bg-secondary">Light</span>
						<span class="badge bg-success">Basic</span>
						<span class="badge bg-info">Pro</span>
					</span>
				</div>
				<div class="service-sub">
					<h6>펀펀펀 펀딩을 알리고 싶은 메이커에게 Funded with FunFunFun 인증마크를 제공해드립니다.</h6>
				</div>
				<div class="service-content">
					<h5>이런 분들께 추천드려요</h5>
					<p>
						<span class="material-symbols-outlined">done</span>
					 	펀딩 소식을 홍보할 때 신뢰도를 높이고 싶으신 분
					</p>
				</div>
				<div class="service-caution">
					<div class="caution-title">
					<span class="material-symbols-outlined">info</span>
					반드시 가이드 규정을 따르며 형태의 왜곡과 변형, 오남용을 급지합니다.
					</div>
				</div><br><hr><br>
			</div>
		</div>
	</div>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>