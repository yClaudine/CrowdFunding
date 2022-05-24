<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.fee-wrap{
		width: 700px;
		display: flex;
		border: 1px solid #ccc;
		border-radius: 10px;
		margin-bottom: 35px;
	}
	.fee-name{
		width: 130px;
		padding-left: 25px;
		padding-top: 40px;
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
	}
	.fee-light{
		background-color: rgb(238, 238, 238);
	}
	.fee-basic{
		background-color: rgb(231, 249, 249);
	}
	.fee-pro{
		background-color: rgb(0, 196, 196);
	}
	.fee-name>h4{
		font-size: 24px;
	}
	.fee-name>h5{
		padding-top: 5px;
		font-size: 16px;
		font-weight: 400;
	}
	.fee-name>h5>b{
		padding-left: 5px;
		font-size: 20px;
		font-weight: 600;
	}
	.fee-name>h6{
		padding-top: 5px;
		font-size: 12px;
		font-weight: 400;
	}
	.fee-detail{
		width: 570px;
		padding: 40px 30px;
		padding-bottom: 20px;
	}
	.select-line{
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.select-line>h6{
		font-weight: 400;
		color: #777;
		line-height: 30px;
	}
	.select-line>.select-fee{
		display: flex;
		justify-content: center;
		align-items: center;
		width: 130px;
		height: 45px;
		background-color: #fff;
		border: 1px solid rgb(0, 196, 196);
		color: rgb(0, 196, 196);
	}
	.select-line>.select-fee>span{
		margin-left: -5px;
	}
	.select-line>.select-fee:hover{
		background-color: rgb(0, 196, 196);
		color: #fff;
	}
	.intro-line{
		padding-top: 15px;
	}
	.intro-line>p{
		display: flex;
		align-items: center;
		margin-bottom: 5px;
	}
	.intro-line>p>span{
		margin-right: 5px;
	}
	.more-line{
		padding-top: 20px;
	}
	.more-line>p{
		color: rgb(0, 196, 196);
		font-size: 15px;
	}
	.more-line>p:hover{
		cursor: pointer;
	}
	.intro-line>p>b{
		padding-top: 40px;
		padding-bottom: 10px;
	}
	.caution{
		width: 700px;
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
	}
	.caution-title>span{
		font-variation-settings: 'FILL' 1;
		padding-right: 5px;
	}
	.caution-detail>p{
		font-size: 12px;
		margin-bottom: 5px;
	}
	.select-line>.selectF{
		background-color: rgb(0, 178, 178);
		color: #fff;
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
			<span class="category">펀딩준비 > <b>요금제선택</b></span>
			<h2>요금제 선택</h2>
			<h6>원하는 요금제를 선택해주세요.</h6>
			<div class="fee-wrap">
				<div class="fee-name fee-light">
					<h4>Light</h4>
					<h5>수수료<b>9%</b></h5>
					<h6>(VAT 별도)</h6>
				</div>
				<div class="fee-detail">
					<div class="select-line">
						<h6>가볍게 펀딩을 시작하고 싶다면</h6> 
						<button class="select-fee" value="0" name="9"><span class="material-symbols-outlined"></span>선택하기</button>
					</div>
					<div class="intro-line">
						<p><span class="material-symbols-outlined">done</span> 펀딩 오픈<br></p>
						<p><span class="material-symbols-outlined">done</span> 펀펀펀 스쿨 수강<br></p>
						<p><span class="material-symbols-outlined">done</span> 컨텐츠 제작 도우미<br></p>
						<p><span class="material-symbols-outlined">done</span> 펀딜리버리<br></p>
						<p><span class="material-symbols-outlined">done</span> 새소식 알림<br></p>
						<p><span class="material-symbols-outlined">done</span> 펀딩 인증마크<br></p>
					</div>
					<div class="more-line">
						<p value="9">자세히보기 ></p>
					</div>
				</div>
			</div>
			<div class="fee-wrap">
				<div class="fee-name fee-basic">
					<h4>Basic</h4>
					<h5>수수료<b>12%</b></h5>
					<h6>(VAT 별도)</h6>
				</div>
				<div class="fee-detail">
					<div class="select-line">
						<h6>펀딩을 미리 오픈해서<br>사전에 서포터를 모으고 싶다면</h6> 
						<button class="select-fee" value="0" name="12"><span class="material-symbols-outlined"></span>선택하기</button>
					</div>
					<div class="intro-line">
						<p><b>Light 요금제의 모든 서비스 포함 +</b></p>
						<p><span class="material-symbols-outlined">done</span> 오픈예정 서비스<br></p>
					</div>
					<div class="more-line">
						<p value="12">자세히보기 ></p>
					</div>
				</div>
			</div>
			<div class="fee-wrap">
				<div class="fee-name fee-pro">
					<h4>Pro</h4>
					<h5>수수료<b>14%</b></h5>
					<h6>(VAT 별도)</h6>
				</div>
				<div class="fee-detail">
					<div class="select-line">
						<h6>온·오프라인에서<br>동시에 서포터를 모으고 싶다면</h6> 
						<button class="select-fee" value="0" name="14"><span class="material-symbols-outlined"></span>선택하기</button>
					</div>
					<div class="intro-line">
						<p><b>Light 요금제의 모든 서비스 포함 +</b></p>
						<p><span class="material-symbols-outlined">done</span> 오픈예정 서비스<br></p>
						<p><span class="material-symbols-outlined">done</span> 공간 펀펀펀 쇼룸<br></p>
					</div>
					<div class="more-line">
						<p value="14">자세히보기 ></p>
					</div>
				</div>
			</div>
			<br>
			<button class="save-btn btn-info">저장하기</button>
			<br><br>
			<div class="caution">
				<div class="caution-title">
					<span class="material-symbols-outlined">info</span>
					요금제 선택 시 유의해주세요
				</div>
				<div class="caution-detail">
					<p>-프로젝트 제출 이후에는 요금제 변경이 불가합니다</p>
					<p>-요금제별 서비스 이용으로 인해 프로젝트 제출 전 게획하신 일정에서 변동이 필요할 수 있습니다.</p>
					<p>-PG 수수료는 포함, 부가가치세(VAT)는 포함되지 않은 수수료입니다.</p>
				</div>
			</div>
			<br><br><br>
		</div>
	</div>
	<script>
		// 요금 선택 버튼
		$(".select-fee").on("click",function(){
			const check = $(this).val();
			if(check > 0){
				$(this).val(0);
				$(this).removeClass("selectF");
				$(this).text("선택하기");
			}else{
				$(".select-fee").each(function(index, item){
					$(this).val(0);
					$(this).removeClass("selectF");
					$(this).text("선택하기");
				});
				$(this).val(1);
				$(this).addClass("selectF");
				$(this).html("<span class='material-symbols-outlined'>done</span>선택완료");
			}
		});
		
		// 저장하기 버튼
		$(".save-btn").on("click",function(){
			let tfFees = 0;
			$(".select-fee").each(function(index, item){
				const fee = $(item).attr("name");
				if($(item).val() != 0){
					tfFees = fee;
				}
			});
			if(tfFees == 0){
				alert("원하시는 요금제를 선택해주세요.");
			}else{
				location.href="/SaveTmpFees.do?tfNo=${tmpF.tfNo}&tfFees="+tfFees;
			}
		});
		
		//자세히보기
		$(".more-line>p").on("click",function(){
			value = $(this).attr("value");
			location.href="/TmpDetail.do?tfNo=${tmpF.tfNo}&value="+value;
		})
		
		// 사전에 입력된 요금제 있는지 체크
		$(document).ready(function(){
			<c:if test="${tmpF.tfFees ne 0}">
			$(".select-fee").each(function(index, item){
				const fee = $(item).attr("name");
				if(fee == ${tmpF.tfFees}){
					item.click();	
				}
			});
			</c:if>
		});
	</script>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>