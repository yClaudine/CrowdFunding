<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.crefund-content>div>p{
		font-size: 13px;
	}
	.btn.btn-secondary{
		width: 150px;
		height: 50px;
		border-radius: 0px;
		display: flex;
		align-items: center;
		font-size: 14px;
		font-weight: 600;
	}
	.refund-policy{
		width: 850px;
		border: 1px solid #ccc;
		padding: 20px;
	}
	.policy-wrap>div>h6{
		font-weight: 400;
	}
	.refund-policy>p{
		font-size: 13px;
	}
	.policy-wrap{
		border: 1px solid #ccc;
		padding: 20px;
		margin-top: 20px;
		
	}
	.policy-wrap>div{
		font-size: 13px;
	}
	.policy-wrap>div>h6{
		font-size: 15px;
	}
	.policy-title{
		display: flex;
		align-items: center;
		padding-bottom: 15px;
		border-bottom: 1px solid #ccc;
	}
	.policy-title>h6{
		padding-left: 10px;
		margin-bottom: 0px;
	}
	.policy-detail{
		padding-top: 15px;
		color: #999;
	}
	.policy-caution{
		padding-top: 20px;
		padding-right: 5px;
		padding-left: 10px;
	}
	.policy-caution>h6{
		font-size: 15px;
		font-weight: 400;
	}
	.aspolicy-wrap>textarea{
		resize: none;
		width: 750px;
		height: 300px;
		font-size: 15px;
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
				$(".nav-sub>li:nth-child(5)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩준비 > <b>위험요인 및 정책</b></span>
			<h2>위험요인 및 정책</h2>
			<h6>크라우드 펀딩 특성상, 리워드 발송 예상 변동 기간에 대하여 서포터에게 미리 알리고, 교환/펀딩금 반환/AS정책을<br>
			고지하여야 합니다. 서포터에게 하는 약속인 만큼, 프로젝트 오픈 후에는 수정이 불가하니 신중하게 작성하세요.</h6>
			<div class="refund-wrap">
				<h6>펀딩금 반환 정책</h6>
				<p>프로젝트 유형 선택 후, 유형에 해당하는 펀딩금 반환 정책을 확인하세요.</p>
				<button type="button" class="btn btn-secondary policy-check">
					<span class="material-symbols-outlined">done</span>정책 확인하기
				</button>
				<br>
				<div class="refund-policy" style="display: none;">
					<h4>펀딩금 반환 정책</h4>
					<br>
					<h6>펀딩금 반환 정책을 꼼꼼히 확인하세요.</h6>
					<p>펀딩 종료 후 아래와 같은 경우 펀딩금 반환을 신청할 수 있습니다.</p>
					<br>
					<h6><b>리워드 발송 지연에 의한 펀딩금 반환 정책</b></h6>
					<div class="policy-wrap">
						<div class="policy-title">
							<input type="checkbox">
							<h6>서포터는 리워드가 <b>리워드 발송 시작 예정일까지 발송되지 않은 경우</b> 펀딩금 반환을 신청할 수 있습니다.</h6>
						</div>
						<div class="policy-detail">
							메이커님이 직접 설정한, <b>리워드 발송 시작 예정일까지 리워드 발송이 시작되지 않은 경우</b> 서포터는 리워드
							발송 시작 예정일 다음날부터 펀딩금 반환을 신청할 수 있으며, 신청 즉시 결제 취소가 진행됩니다.<br>
							단, 메이커님이 리워드 발송을 시작하고 발송 상태를 변경한 경우 서포터는 펀딩금 반환을 신청할 수 없습니다.
						</div>
					</div>
					<div class="policy-wrap">
						<div class="policy-title">
							<input type="checkbox">
							<h6>리워드 발송이 <b>프로젝트 종료일 +11개월까지</b> 지연된 경우, 자동 결제 취소가 진행됩니다.</h6>
						</div>
						<div class="policy-detail">
							리워드 발송 지연에 의한 펀딩금 반환 신청을 하지 않고 프로젝트 종료일 +11개월까지 리워드 발송을 기다린 서포터들의
							펀딩 내역에 한하여, 자동으로 결제 취소가 진행됩니다.
						</div>
					</div>
					<br>
					<h6><b>리워드 하자에 의한 펀딩금 반환 정책</b></h6>
					<div class="policy-wrap">
						<div class="policy-title">
							<input type="checkbox">
							<h6>서포터는 리워드 배송 완료 후, <b>리워드에 하자가 발생한 경우</b>에 한해서 펀딩금 반환을 신청할 수 있습니다.</h6>
						</div>
						<div class="policy-detail">
							리워드 배송 완료 후 리워드에 하자가 발생한 경우, 서포터는 리워드 배송 완료일부터 14일 동안 펀딩금 반환을 신청할 수 있습니다.
						</div>
					</div>
					<div class="policy-wrap">
						<div class="policy-title">
							<input type="checkbox">
							<h6>메이커는 서포터의 펀딩금 반환 신청에 대해 <b>승인·거절</b> 할 수 있습니다.</h6>
						</div>
						<div class="policy-detail">
							서포터는 펀딩금 반환 신청 시 하자를 증명하는 자료를 제출해야 합니다. 메이커는 해당 신청 내역 확인 후 1)펀딩금 반환을 
							승인한거나 2)하자 기준에 부합하지 않는 경우 거절할 수 있습니다.
						</div>
					</div>
					<div class="policy-caution">
						<h6>·프로젝트가 취소되는 경우, 서포터의 개별적인 펀딩금 반환 신청이 없는 경우에도 일괄적으로 반환이 진행 될 수 있습니다.</h6>
						<h6>·프로젝트 취소에 대한 상세한 내용은 펀딩금 일괄 반환 정책을 확인하세요.</h6>
						<h6>·리워드별 발송 예정일이 다르기 때문에, 펀딩한 리워드에 따라 펀딩금 반환 신청 기간이 다르게 제공됩니다.</h6>
						<h6>·펀딩금 반환 처리 금액은 최종정산 금액에서 차감되어 최종정산이 진행됩니다.</h6>
						<h6>·하자에 해당되지 않는 예외 케이스를 직접 작성할 수 있으며 이 경우를 재외한 모든 하자의 케이스에는 책임감을 가지고 펀딩금 반환을 진행해야 합니다.</h6>
						<h6>·리워드가 무형 서비스인 경우, 하자에 의한 펀딩금 반환 대상에서 제외됩니다.</h6>
						<h6>·펀딩금 반환은 서포터의 결제 건을 취소하는 방식으로 진행됩니다.</h6>
						<h6>·메이커가 게좌 이체를 통해 서포터에게 별도로 환불을 진행하여 펀펀펀 결제 취소와 중복으로 적용될 경우, 펀펀펀은 해당 계좌 이체 건에 대해서 책임지지 않습니다.</h6>
					</div>
				</div>
			</div>
			<br><br>
			<div class="aspolicy-wrap">
				<h6>사용 중 발생한 하자에 대한 A/S 정책</h6>
				<p>초기 하자가 아닌 서포터가 사용 중에 발생하는 하자를 어떻게 처리할 것인지에 대한 정책을 작성하세요.</p>
				<textarea class="tfAs form-control" placeholder="(예시)
· 보증기간 : 리워드 수령일로부터 1년	
· 규정 : 정상적인 상태에서 사용중 발생한 제품하자인 경우 1:1 교체
· A/S 불가 규정 : 보증기간 이내일지라도 사용자의 고의 또는 과실로 인하여 제품 수리 및 재생이 불가능한 경우
· 접수 방법 : 접수처를 통해 하자에 대한 정확한 소명 후 처리됩니다.
· 접수처 : 010-1234-5678 / 카카오톡 아이디 @abcd
"></textarea>
				<p><span>800</span><span>자 남음</span></p>
			</div>
			<br>
			<button class="save-btn btn-info">저장하기</button>
			<br><br><br>
		</div>
	</div>
	<script>
		//as체크 변수
		let totalChk = 0;
		
		//정책 확인하기 버튼 클릭시 메뉴 펼치고 접기
		$(".policy-check").on("click",function(){
			$(".refund-policy").slideToggle(500,'linear');			
		})
		
		//A/S 정책 글자수 체크
		$(".aspolicy-wrap>textarea").on("keydown change",function(){
			let length = $(this).val().length;
			const asChk = $(".aspolicy-wrap>p>span").eq(0);
			const asMsg = $(".aspolicy-wrap>p>span").eq(1);
			if(length < 800){
				asChk.text(800-length);
				asMsg.text("자 남음");
				asMsg.css("color","#999");
				totalChk = 1;
			}else{
				asChk.text("");
				asMsg.text("A/S 정책은 800자를 넘을 수 없습니다.");
				asMsg.css("color","#f00");
				totalChk = 0;
			}
		});
		
		//저장하기 버튼 클릭
		$(".save-btn").on("click",function(){
			if(confirm("작성하신 내용을 저장하시겠습니까?")){
				let chk = 0;
				if($(".aspolicy-wrap>textarea").val().length==0){
					totalChk = 0;
				}
				const checkBox = $("[type=checkbox]");
				$.each(checkBox,function(index,item){
					if(item.checked){
						chk++;
					}
				});
				if(chk==4 && totalChk == 1){
					const tfAs = $(".aspolicy-wrap>textarea").val().replace(/(?:\r\n|\r|\n)/g, '<br>');
					console.log(tfAs)
					location.href="/SaveTmpPolicy.do?tfNo=${tmpF.tfNo}&tfAs="+tfAs;
				}else{
					alert("약관에 동의하시고 A/S 정책을 작성하여주세요.")
				}				
			};
		});
		
		//기존에 입력된 값 있는지 체크
		$(document).ready(function(){
			<c:if test="${tmpF.tfAs ne null}">
			const text = "${tmpF.tfAs}";
			tfAs = text.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
			$(".aspolicy-wrap>textarea").val(tfAs);
			$(".aspolicy-wrap>textarea").keydown();
			const checkBox = $("[type=checkbox]");
			$.each(checkBox,function(index,item){
				item.checked = true;
			});
			</c:if>
		});
		
	</script>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>