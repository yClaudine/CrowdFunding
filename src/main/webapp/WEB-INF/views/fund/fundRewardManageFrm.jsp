<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
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
		flex-wrap: wrap;
	}
	.reward-wrap{
		width: 340px;
		margin-top: 30px;
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
		margin-left: 5px;
		border-radius: 3px;
		width: 50px;
		height: 25px;
		font-size: 13px;
		padding: 0px;
	}
	.reward-modal-back{
		position: absolute;
		z-index: 1;
		width: 100vw;
		height: 300vh;
		top: 0;
		left: 0;
		background-color: rgba(0,0,0,0.3);
		display: flex;
		justify-content: center;
	}
	.reward-modal-wrap{
		width: 900px;
		height: 1120px;
		padding: 100px 80px;
		margin-top: 100px;
		background-color: #fff;
	}
	.modal-title{
		display: flex;
		justify-content: space-between;
	}
	.modal-title>span{
		margin-top: -40px;
		font-size: 40px;
	}
	.modal-title>span:hover{
		cursor: pointer;
	}
	input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
	}
	.modal-input{
		padding-top: 40px;
	}
	.modal-input *{
		font-size: 17px;
	}
	.table-input>th{
		width: 130px;
		height: 60px;
		margin-top: -10px;
	}
	.table-input>td{
		width: 550px;
		display: flex;
		height: 60px;
		align-items: center;
	}
	.table-input>td>input::placeholder{
		color: #ccc;
		font-weight: 300;
	}
	.table-input>td>span{
		padding-left: 5px;
	}
	.modal-price>td>input{
		width: 250px;
	}
	.table-caution>td{
		font-size: 13px;
		color: #aaa;
	}
	.table-caution>td>span{
		font-size: 13px;
	}
	.modal-price.table-caution>td{
		color: #f00;
	}
	.textarea>th{
		height: 100px;
	}
	.textarea>td{
		height: 100px;
	}
	.textarea>td>textarea{
		height: 90px;
		resize: none;
	}
	.textarea>td>textarea::placeholder{
		color: #ccc;
		font-weight: 300;
	}
	.modal-deliveryfee.table-input>td>input{
		width: 250px;
	}
	.modal-count.table-input>td>input{
		width: 250px;
	}
	.modal-send>td>input{
		width: 275px;
	}
	.modal-input>p{
		font-size: 13px;
		margin-bottom: 8px;
	}
	.modal-btn-wrap{
		text-align: right;
	}
	.modal-btn-wrap>button{
		width: 82px;
		height: 50px;
		border-radius: 3px;
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
				$(".nav-sub>li:nth-child(2)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩관리 > <b>리워드 추가</b></span>
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
			<button type="button" id="rewardAdd" class="btn btn-secondary" onclick="addReward();">+ 추가하기</button>
			<br><br><br>
			<div class="reward-total-wrap"></div>
			<br><br>
			<button class="save-btn btn-info">저장하기</button>
			<br><br><br><br><br>
		</div>
	</div>
	<div class="reward-modal-back" style="display: none;">
		<div class="reward-modal-wrap">
			<div class="modal-title">
				<h3>리워드 추가</h3>
				<span class="material-symbols-outlined">close</span>
			</div>
			<div class="modal-input">
				<table>
					<tr class="modal-price table-input">
						<th>금액</th>
						<td>
							<input type="number" class="form-control" placeholder="금액 입력"><span>원</span>
						</td>
					</tr>
					<tr class="modal-price table-caution" style="display:none;">
						<th></th>
						<td>리워드 금액은 최소 1,000원 이상 입력하세요.</td>
					</tr>
					<tr class="modal-name table-input">
						<th>리워드명</th>
						<td>
							<input type="text" class="form-control" placeholder="타이틀 입력 ex)[얼리버드] 기본 리워드">
						</td>
					</tr>
					<tr class="modal-name table-caution">
						<th></th>
						<td><span>60</span><span>자 남음</span></td>
					</tr>
					<tr class="modal-intro table-input textarea">
						<th>상세설명</th>
						<td>
							<textarea class="form-control" placeholder="제공하는 리워드가 무엇인지 간략하게 제시해주세요."></textarea>
						</td>
					</tr>
					<tr class="modal-intro table-caution">
						<th></th>
						<td><span>400</span><span>자 남음</span></td>
					</tr>
					<tr class="modal-option table-input textarea">
						<th>옵션조건</th>
						<td>
							<textarea class="form-control" placeholder="옵션값을 입력하세요."></textarea>
						</td>
					</tr>
					<tr class="modal-option table-caution">
						<th></th>
						<td>옵션값은 엔터로 구분됩니다.(선택사항)</td>
					</tr>
					<tr class="modal-option-preview table-input">
						<th>옵션 미리보기</th>
						<td>
							<select class="form-select" >
							</select>
						</td>
					</tr>
					<tr class="modal-deliveryfee table-input">
						<th>배송비</th>
						<td>
							<input type="number" class="form-control" placeholder="금액 입력"><span>원</span>
						</td>
					</tr>
					<tr class="modal-deliveryfee table-caution">
						<th></th>
						<td>무료일 경우 0원을 입력해주세요.</td>
					</tr>
					<tr class="modal-count table-input">
						<th>제한수량</th>
						<td>
							<input type="number" class="form-control" placeholder="수량입력"><span>개</span>
						</td>
					</tr>
					<tr class="modal-send table-input">
						<th>발송시작일</th>
						<td>
							<input type="date" class="form-control">
						</td>
					</tr>
				</table>
				<br>
				<p>※설정한 발송 시작일까지 리워드가 발송되지 않은 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택하세요.</p>
				<p>※종료일+11개월까지 리워드 발송이 시작되지 않은 경우, 미발송 상태인 서포터의 펀딩금 반환이 자동으로 완료 처리(결제 취소)되니 유의하세요.</p>
				<br>
				<div class="modal-btn-wrap">
					<button type="button" class="btn btn-outline-secondary" onclick="modalClose();">취소</button>
					<button type="button" class="btn btn-info">등록</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		//리워드 생성, 수정, 로드에 쓸 변수
		let trStatus;
		let trNo;
		let tfNo;
		let trName;
		let trIntro;
		let trPrice;
		let trCount;
		let trOption;
		let trSend;
		let trDeliveryfee;
		
		//리워드 생성 했을시 임시 리워드 번호로 사용할 변수
		let tmpTrNo = 0;
		
		//모달 체크 변수
		const modalChk = [0,0,0,0,0,0];
		
		//모달 옵션조건 값 변경하면 옵션 미리보기에 옵션으로 들어가도록
		$(".modal-option.table-input>td>textarea").on("change",function(){
			const optionVal = $(this).val().split("\n");
			const optionPreview = $(".modal-option-preview>td>select");
			optionPreview.text("");
			$.each(optionVal,function(index,item){
				const option = $("<option>").text(item);
				optionPreview.append(option);
			});
		});
		
		//모달 닫는 메소드
		function modalClose(){
			if(confirm("작성중인 리워드를 저장하지 않고 종료하시겠습니까?")){
				$(".reward-modal-back").css("display","none");	
			}
		}

		//모달 위에 X 버튼 클릭 시 모달 닫도록
		$(".modal-title").on("click",function(){
			modalClose();
		})
		
		//모달 리워드 금액 체크
		$(".modal-price.table-input>td>input").on("keydown change",function(){
			const priceVal = $(this).val();
			const priceCaution = $(".modal-price.table-caution");
			if(priceVal < 1000 || priceVal > 100000000){
				priceCaution.css("display","");
				modalChk[0] = 0;
			}else{
				priceCaution.css("display","none");
				modalChk[0] = 1;
			}
		})
		
		//리워드 제목 체크
		$(".modal-name.table-input>td>input").on("keydown change",function(){
			const nameLength = $(this).val().length;
			const nameCaution = $(".modal-name.table-caution>td>span");
			if(nameLength <= 60){
				nameCaution.eq(0).text(60-nameLength);	
				nameCaution.eq(0).css("color","#aaa");
				nameCaution.eq(1).text("자 남음");
				modalChk[1] = 1;
			}else{
				nameCaution.eq(0).text("리워드 제목은 60자를 넘길 수 없습니다.");	
				nameCaution.eq(0).css("color","#f00");
				nameCaution.eq(1).text("");
				modalChk[1] = 0;
			}
		});
		
		//리워드 설명 체크
		$(".modal-intro.table-input>td>textarea").on("keydown change",function(){
			const introLength = $(this).val().length;
			const introCaution = $(".modal-intro.table-caution>td>span");
			if(introLength <= 400){
				introCaution.eq(0).text(400-introLength);	
				introCaution.eq(0).css("color","#aaa");
				introCaution.eq(1).text("자 남음");
				modalChk[2] = 1;
			}else{
				introCaution.eq(0).text("리워드 설명은 400자를 넘길 수 없습니다.");	
				introCaution.eq(0).css("color","#f00");
				introCaution.eq(1).text("");
				modalChk[2] = 0;
			}
		});
		
		//발송시작일 최소값 부여
		const sysdate = new Date().toISOString().slice(0, 10);
		$("[type=date]").attr("min",sysdate);
		
		//추가하기 -> 등록시 발동할 메소드
		function createRewardModal(){
			//등록전 체크를 위한 변수 초기화
			modalChk[3] = 0;
			modalChk[4] = 0;
			modalChk[5] = 0;
			trStatus = "new";
			tmpTrNo++;
			trNo = tmpTrNo;
			tfNo = ${fund.fundNo};
			trName = $(".modal-name>td>input").val();
			trIntro = $(".modal-intro>td>textarea").val();
			trPrice = $(".modal-price>td>input").val();
			trCount = $(".modal-count>td>input").val();
			trOption = $(".modal-option>td>textarea").val();
			trSend = $(".modal-send>td>input").val();
			trDeliveryfee = $(".modal-deliveryfee>td>input").val();
			if(trPrice == ""){
				modalChk[0] = 0;
			}
			if(trName == ""){
				modalChk[1] = 0;
			}
			if(trIntro == ""){
				modalChk[2] = 0;
			}
			if(trDeliveryfee >= 0 && trDeliveryfee != ""){
				modalChk[3] = 1;
			}
			if(trCount >= 0 && trCount != ""){
				modalChk[4] = 1;
			}
			if(trSend != ""){
				modalChk[5] = 1;
			}
			//최종 변수 체크
			let chkCnt = 0;
			$.each(modalChk,function(index,item){
				if(item==1){
					chkCnt++;
				}
			});
			//작성 완료
			const conf = confirm("작성한 리워드를 등록하시겠습니까?"); 
			if(conf && chkCnt == 6){
				rewardAppend();
				$(".reward-modal-back").css("display","none");
			}else if(conf == false){
				
			}else{
				alert("필수항목들을 작성해주세요");
			}
		}
		
		//편집 -> 수정시 발동할 메소드
		function modifyRewardModal(){
			//등록전 체크를 위한 변수 초기화
			modalChk[0] = 1;
			modalChk[1] = 1;
			modalChk[2] = 1;
			modalChk[3] = 1;
			modalChk[4] = 1;
			modalChk[5] = 1;
			trStatus = "update";
			trName = $(".modal-name>td>input").val();
			trIntro = $(".modal-intro>td>textarea").val();
			trPrice = $(".modal-price>td>input").val();
			trCount = $(".modal-count>td>input").val();
			trOption = $(".modal-option>td>textarea").val();
			trSend = $(".modal-send>td>input").val();
			trDeliveryfee = $(".modal-deliveryfee>td>input").val();
			if(trPrice == ""){
				modalChk[0] = 0;
			}
			if(trName == ""){
				modalChk[1] = 0;
			}
			if(trIntro == ""){
				modalChk[2] = 0;
			}
			if(trDeliveryfee >= 0 && trDeliveryfee != ""){
				modalChk[3] = 1;
			}
			if(trCount >= 0 && trCount != ""){
				modalChk[4] = 1;
			}
			if(trSend != ""){
				modalChk[5] = 1;
			}
			//최종 변수 체크
			let chkCnt = 0;
			$.each(modalChk,function(index,item){
				if(item==1){
					chkCnt++;
				}
			});
			//작성 완료
			const conf = confirm("해당 리워드를 수정하시겠습니까?"); 
			if(conf && chkCnt == 6){
				//수정해야할 개체 찾기
				$(".reward-modal-back").css("display","none");
				const searchNo = $(".reward-no").filter(function(){
					return $(this).text() == trNo;
				});
				const modifyWrap = $(searchNo).parent();
				//수정해야할 개체에 값 입력
				if(modifyWrap.children().eq(0).text() == "upload"){
					modifyWrap.children().eq(0).text("update");	
				}
				modifyWrap.children().eq(1).text(trOption);
				const commaPrice = trPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
				modifyWrap.children().eq(2).children().eq(0).children().text(commaPrice);
				modifyWrap.children().eq(2).children().eq(1).children().eq(0).text(trCount);
				modifyWrap.children().eq(3).text(trName);
				modifyWrap.children().eq(4).text(trIntro);
				modifyWrap.children().eq(5).children().eq(1).children().text(trDeliveryfee);
				modifyWrap.children().eq(6).children().eq(1).text(trSend);
			}else if(conf == false){
				
			}else{
				alert("필수항목들을 작성해주세요");
			}
		}
		
		//추가하기 버튼 클릭시 발동할 메소드
		function addReward(){
			$(".modal-title>h3").text("리워드 추가")
			$(".modal-name>td>input").val("");
			$(".modal-name.table-caution>td>span").eq(0).text("60");
			$(".modal-intro>td>textarea").val("");
			$(".modal-intro.table-caution>td>span").eq(0).text("400");
			$(".modal-price>td>input").val("");
			$(".modal-count>td>input").val("");
			$(".modal-option>td>textarea").val("");
			$(".modal-option-preview>td>select").text("");
			$(".modal-send>td>input").val("");
			$(".modal-deliveryfee>td>input").val("");
			$(".modal-btn-wrap>.btn-info").text("등록");
			$(".modal-btn-wrap>.btn-info").attr("onclick","createRewardModal()");
			$(".reward-modal-back").css("display","");
		}
		
		//저장하기 버튼 클릭 시 모든 리워드의 상태값과 정보를 json string으로 전달
		$(".save-btn").on("click",function(){
			if(confirm("작성 내용을 저장하시겠습니까?")){
				//reward들을 담을 json
				const data = {};
				
				//reward 하나하나를 json화
				$(".reward-wrap").each(function(index,item){
					const reward = {
							"tfNo" : ${fund.fundNo},
							"rewardNo" : $(item).children().eq(7).text(),
							"rewardStatus" : $(item).children().eq(0).text(),
							"rewardName" : $(item).children().eq(3).text(),
							"rewardIntro" : $(item).children().eq(4).text(),
							"rewardPrice" : $(item).children().eq(2).children().eq(0).children().text().replace(/,/gi,""),
							"rewardCount" : $(item).children().eq(2).children().eq(1).children().eq(0).text(),
							"rewardOption" : $(item).children().eq(1).val(),
							"rewardSend" : $(item).children().eq(6).children().eq(1).text(),
							"rewardDeliveryFee" : $(item).children().eq(5).children().eq(1).children().text()
					}
					data[index] = reward;
				});
				
				//controller로 json string 파일 전송
				$.ajax({
					method: 'post',
					url: '/saveReward.do',
					traditional: true,
					data: {
						data: JSON.stringify(data)
					},
					dataType: 'json',
					success: function(res){
						if(res > 0){
							location.href="manageFundingFrm.do?fundNo=${fund.fundNo}"	
						}
					}
				});//ajax	
			}
		});//savebtn
		
		//리워드 생성, 로드
		function rewardAppend(){
			//개체 생성
			const rewardWrap = $("<div>").addClass("reward-wrap");
			const rewardStatus = $("<div>").addClass("reward-status").css("display","none").text(trStatus);
			const rewardOption = $("<textarea>").addClass("reward-option").css("display","none").text(trOption);
			const rewardTitle = $("<div>").addClass("reward-title");
			const rewardPrice = $("<div>").addClass("reward-price").text("원");
			const trPriceComma = trPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			const rewardPriceSpan = $("<span>").text(trPriceComma);
			const rewardCount = $("<div>").addClass("reward-count").text("제한수량 ");
			const rewardCountSpan1 = $("<span>").text(trCount);
			const rewardCountSpan2 = $("<span>").text("개");
			const rewardName = $("<div>").addClass("reward-name").text(trName);
			const rewardIntro = $("<div>").addClass("reward-intro").text(trIntro);
			const rewardDeliveryFeeWrap = $("<div>").addClass("reward-deliveryFee-wrap")
			const rewardDeliveryFeeWrapDiv = $("<div>").text("배송비");
			const rewardDeliveryFee = $("<div>").addClass("reward-deliveryFee").text("원");
			const rewardDeliveryFeeSpan = $("<span>").text(trDeliveryfee);
			const rewardSendWrap = $("<div>").addClass("reward-send-wrap");
			const rewardSendWrapDiv = $("<div>").text("리워드 발송 시작일");
			const rewardSend = $("<div>").addClass("reward-send").text(trSend);
			const rewardNo = $("<div>").addClass("reward-no").css("display","none").text(trNo);
			const btnWrap = $("<div>").addClass("btn-wrap");
			const rewardUpdate = $("<button>").addClass("btn-outline-dark").addClass("btn").text("편집");
			const rewardDelete = $("<button>").addClass("btn-outline-dark").addClass("btn").text("삭제");
			//하위 개체 붙이기
			rewardPrice.prepend(rewardPriceSpan);
			rewardTitle.append(rewardPrice);
			rewardCount.append(rewardCountSpan1);
			rewardCount.append(rewardCountSpan2);
			rewardTitle.append(rewardCount);
			rewardDeliveryFee.prepend(rewardDeliveryFeeSpan);
			rewardDeliveryFeeWrap.append(rewardDeliveryFeeWrapDiv);
			rewardDeliveryFeeWrap.append(rewardDeliveryFee);
			rewardSendWrap.append(rewardSendWrapDiv);
			rewardSendWrap.append(rewardSend);
			btnWrap.append(rewardUpdate);
			btnWrap.append(rewardDelete);
			//상위 개체 붙이기
			rewardWrap.append(rewardStatus);
			rewardWrap.append(rewardOption);
			rewardWrap.append(rewardTitle);
			rewardWrap.append(rewardName);
			rewardWrap.append(rewardIntro);
			rewardWrap.append(rewardDeliveryFeeWrap);
			rewardWrap.append(rewardSendWrap);
			rewardWrap.append(rewardNo);
			rewardWrap.append(btnWrap);
			//리워드 붙이기
			$(".reward-total-wrap").append(rewardWrap);
			//수정버튼에 이벤트 부여
			rewardUpdate.on("click",function(){
				//모달 띄우기 전 변수 저장
				const updateWrap = $(this).parent().parent();
				tfNo = ${fund.fundNo};
				trNo = updateWrap.children().eq(7).text();
				trStatus = updateWrap.children().eq(0).text();
				trName = updateWrap.children().eq(3).text();
				trIntro = updateWrap.children().eq(4).text();
				trPrice = updateWrap.children().eq(2).children().eq(0).children().text().replace(/,/gi,"");
				trCount = updateWrap.children().eq(2).children().eq(1).children().eq(0).text();
				trOption = updateWrap.children().eq(1).val();
				trSend = updateWrap.children().eq(6).children().eq(1).text();
				trDeliveryfee = updateWrap.children().eq(5).children().eq(1).children().text();
				
				//모달에 값 넣고 띄우기
				$(".modal-title>h3").text("리워드 수정")
				$(".modal-name>td>input").val(trName);
				$(".modal-name>td>input").change();
				$(".modal-intro>td>textarea").val(trIntro);
				$(".modal-intro>td>textarea").change();
				$(".modal-price>td>input").val(trPrice);
				$(".modal-count>td>input").val(trCount);
				$(".modal-option>td>textarea").val(trOption);
				$(".modal-option>td>textarea").change();
				$(".modal-send>td>input").val(trSend);
				$(".modal-deliveryfee>td>input").val(trDeliveryfee);
				$(".modal-btn-wrap>.btn-info").text("수정");
				$(".modal-btn-wrap>.btn-info").attr("onclick","modifyRewardModal()");
				$(".reward-modal-back").css("display","");
				
			})
			//삭제버튼에 이벤트 부여
			rewardDelete.on("click",function(){
				const deleteWrap = $(this).parent().parent();
				deleteWrap.children().eq(0).text("delete");
				deleteWrap.css("display","none");
			})
		}//rewardAppend()
		
		//사전에 입력된 값 있는지 체크
		$(document).ready(function(){
			//각 리워드 로드
			<c:forEach var="reward" items="${fundReward}">
				trStatus = "upload";
				trNo = ${reward.rewardNo};
				tfNo = ${reward.rewardNo};
				trName = "${reward.rewardName}";
				trIntro = "${reward.rewardIntro}";
				trPrice = ${reward.rewardPrice};
				trCount = ${reward.rewardCount};
				trOption = "${reward.rewardOption}";
				trSend = "${reward.rewardSend}";
				trDeliveryfee = ${reward.rewardDeliveryfee};
				rewardAppend();
			</c:forEach>
			//console.log($(".btn-outline-dark.btn"));
			//$(".btn-outline-dark.btn").attr('disabled', true);
			$(".btn-outline-dark.btn").off("click");
			$(".btn-outline-dark.btn").on("click",function(){
				alert("기존에 공개한 리워드는 수정/삭제 할 수 없습니다.");
				$(this).attr('disabled', true);
			})
		});
	</script>
	<!--  ${fund.fundNo },${fund.fundName },${fund.memberId }-->
</body>
</html>