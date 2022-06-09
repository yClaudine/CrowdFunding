<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.calculate-wrap p{
		font-size: 13px;
	}
	.represent-policy>.policy-check{
		width: 150px;
		height: 50px;
		border-radius: 0px;
		display: flex;
		align-items: center;
		font-size: 14px;
		font-weight: 600;
	}
	.policy-detail{
		width: 750px;
		line-height: 20px;
		border: 1px solid #ccc;
		padding: 30px;
	}
	.policy-detail>.detail-date{
		background-color: #eee;
		padding: 10px;
	}
	.policy-detail>.detail-date>p{
		margin-bottom: 5px;
	}
	.policy-detail>.detail-image{
		width: 350px;
		margin: 50px auto;
	}
	.policy-detail>div>img{
		width: 350px;
		height: 140px;
		text-align: center;
	}
	.policy-detail p{
		margin-bottom: 5px;
	}
	.detail-calculate>br{
		line-height: 10px;
	}
	.policy-agree{
		display: flex;
		align-items: center;
	}
	.policy-agree>h6{
		padding-left: 10px;
	}
	form .upload-wrap{
		display: flex;
		align-items: center;
	}
	form .upload-wrap>label>span{
		padding-top: 5px;
		padding-left: 5px;
		font-size: 30px;
	}
	form .upload-wrap>label>span:hover{
		cursor: pointer;
	}
	.upload-wrap{
		padding-top: 10px;
	}
	form .upload-wrap>span{
		font-size: 30px;
		padding-left: 5px;
		margin-top: -5px;
	}
	form .upload-wrap>span:hover{
		cursor: pointer;
	}
	.represent-input p{
		margin-bottom: 5px;
	}
	.calculate-input p{
		margin-bottom: 5px;
	}
	input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
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
				$(".nav-sub>li:nth-child(6)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩준비 > <b>대표자 및 정산정보</b></span>
			<h2>대표자 및 정산정보</h2>
			<h6>펀딩 완료 후 정산을 위한 정보를 입력하여 주세요.</h6>
			<div class="calculate-wrap">
				<div class="represent-wrap">
					<div class="represent-title">
						<h6>대표자 정보</h6>
						<p>서비스 이용과 정산을 위한 정보이므로 정확한 정보를 입력해주세요.</p>
					</div>
					<br><br>
					<div class="represent-policy">
						<h6>정산 정책 확인</h6>
						<p>펀펀펀 정산 정책을 반드시 확인하세요.</p>
						<button type="button" class="btn btn-secondary policy-check">
							<span class="material-symbols-outlined">done</span>정책 확인하기
						</button>
						<br>
						<div class="policy-detail" style="display: none;">
							<h4>펀딩금 정산 안내</h4>
							<br>
							<h6>펀펀펀 정산 정책을 반드시 확인하세요.</h6>
							<br>
							<div class="detail-date">
								<p><b>펀펀펀 정산 정책 변경 안내 2020년 6월 3일 시행</b></p>
								<p>메이커와 서포터의 신뢰할 수 있는 펀딩을 중개하기 위해 펀펀펀 정산 정책이 변경되었으니, 아래 내용을 반드시 확인하세요.</p>
							</div>
							<div class="detail-image">
								<img src="/resources/image/fund/calculate.png">
							</div>
							<p>·펀딩이 성공적으로 종료되면 종료일 +약 10영업일 이내에 바로 정산이 시작됩니다.</p>
							<p>·바로정산 시, 최종 결제 금액의 일부가 먼저 지급됩니다.</p>
							<p>·리워드 배송과 펀딩금 반환이 모두 완료되면 펀딩 금액이 최종 확정되고 5영업일 이내에 최종정산이 시작됩니다.</p>
							<p>·바로정산과 최종정산이 시작되면 정산 내역서와 정산에 대한 안내가 메일로 발송됩니다.</p>
							<br><br>
							<h5>정산금 안내</h5>
							<br>
							<div class="detail-calculate">
								<h6>정산금 안내</h6>
								<p>최종 결제 금액에서 펀펀펀 중개 수수료, 결제(PG 등) 수수료, 펀딩금 반환 금액을 제외한 금액이 정산됩니다.</p>
								<br>
								<p>정산금은 최종 결제 금액에 따라 정해진 비율로 분할 정산됩니다.</p>
								<br>
								<p><b>1) 최종 결제 금액이 1,000만 원 미만인 경우</b></p>
								<p>최종 결제 금액에서 펀펀펀 중개 수수료, 결제(PG 등) 수수료를 제외한 금액의 80%가 바로 정산금으로 지급됩니다.</p>
								<br>
								<p><b>2) 최종 결제 금액이 1,000만 원 이상인 경우</b></p>
								<p>최종 결제 금액에서 와디즈 중개 수수료, 결제(PG 등) 수수료를 제외한 금액의 60%가 바로 정산금으로 지급됩니다.</p>
								<br>
							</div>
							<div class="policy-agree">
								<input type="checkbox" name="policyAgree"><h6>펀펀펀 정산 정책을 확인하였습니다</h6>
							</div>
						</div>
					</div>
				</div>
				<br>
				<form action="/saveTmpCalculate.do" method="post" enctype="multipart/form-data">
					<div class="represent-input">
						<label for="tfcRepCategory" class="form-label mt-4">사업자구분</label>
						<select class="form-select" id="tfcRepCategory" name="tfcRepCategory">
							<option value="개인">개인</option>
							<option value="사업자">사업자</option>
						</select>
						<br>
						<label class="form-label mt-4" for="tfcRepName">대표자명</label>
						<p>사업자인 경우 사업자등록증 상의 대표자명, 개인인 경우 주민등록증 상의 성명과 일치해야 합니다.</p>
						<input type="text" name="tfcRepName" class="form-control" id="tfcRepName" placeholder="대표자명 입력" >
						<br>
						<label class="form-label mt-4" for="tfcRepEmail">대표자 이메일</label>
						<p>펀딩하기 서비스 제공 시 추가 계약·약정이 필요한 경우, 입력된 대표자의 이메일로 전자 약정서가 발송됩니다.</p>
						<input type="text" name="tfcRepEmail" class="form-control" id="tfcRepEmail" placeholder="대표자 이메일 입력" >
						<br>
						<label class="form-label mt-4" for="TfcRepFilepath">대표자 신분증</label>
						<p>대표자 확인을 위해 신분증 사본을 업로드 하세요.</p>
						<p>주민등록번호 뒷자리 마스킹 필수</p>
						<p>JPG,JPEG,PNG,PDF / 10MB 이하 파일 업로드 가능</p>
						<div class="upload-wrap">
							<input class="form-control" id="image1" type="text" placeholder="No Image" disabled="">
							<label class="form-label1" for="TfcRepFilepath">
								<span class="material-symbols-outlined">file_upload</span>
							</label>
							<input type="file" name="upfile" id="TfcRepFilepath" class="upfile" style="display: none;">
							<span id="cancel1" class="material-symbols-outlined cancel" style="display: none;">close</span>
							<input type="hidden" name="imageStatus" value="new">
						</div>
					</div>
					<br><hr><br>
					<div class="calculate-wrap">
						<div class="calculate-title">
							<h6>세금계산서 발행 및 정산 게좌정보</h6>
						</div>
						<div class="calculate-input">
							<label class="form-label mt-4" for="tfcRepBirth">대표자 주민등록번호</label>
							<p>서비스 이용 수수료에 대해 세금계산서를 발행하며, 사업자등록을 하지 않은 개인의 경우, 고유 식별정보에 필요한 주민등록번호 (-포함)</p>
							<input type="text" name="tfcRepBirth" class="form-control" id="tfcRepBirth" placeholder="주민등록번호 입력" >
							<br>
							<label class="form-label mt-4" for="tfcMail">세금계산서 발행 이메일</label>
							<p>세금계산서 발행 시, 입력되는 이메일 주소를 입력하세요. (본인의 이메일 주소 또는 세무 대리인의 이메일 주소1)</p>
							<input type="text" name="tfcMail" class="form-control" id="tfcMail" placeholder="이메일 입력" >
							<br>
							<label for="tfcBankName" class="form-label mt-4">계좌 정보</label>
							<p>펀딩 성공 시 정산금을 수령할 게좌정보를 입력하세요.</p>
							<p>·개인(사업자)의 경우 본인/사업자 명의 계좌 등록이 간능하며, 법인 사업자의 경우 법인계좌만 등록 가능합니다.</p>
							<p>·입금이 가능한 계좌인지 확이 후 입력하세요.</p>
							<p>·저축성 예금계좌, 외화예금계좌, CMA계좌, 평생계좌번호(휴대폰 번호) 등은 입금 불가</p>
							<select class="form-select" id="tfcBankName" name="tfcBankName">
								<option value="신한은행">신한은행</option>
								<option value="국민은행">국민은행</option>
								<option value="농협은행">농협은행</option>
								<option value="우리은행">우리은행</option>
								<option value="KEB하나은행">KEB하나은행</option>
								<option value="기업은행">기업은행</option>
								<option value="SC은행">SC은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="부산은행">부산은행</option>
								<option value="대구은행">대구은행</option>
								<option value="한국씨티은행">한국씨티은행</option>
								<option value="경남은행">경남은행</option>
								<option value="광주은행">광주은행</option>
								<option value="전북은행">전북은행</option>
								<option value="KDB산업은행">KDB산업은행</option>
								<option value="제주은행">제주은행</option>
								<option value="우체국">우체국</option>
								<option value="수협중앙회">수협중앙회</option>
								<option value="신협중앙회">신협중앙회</option>
								<option value="새마을금고중앙회">새마을금고중앙회</option>
								<option value="상호저축은행중앙회">상호저축은행중앙회</option>
								<option value="산림조합중앙회">산림조합중앙회</option>
								<option value="지역농축협">지역농축협</option>
								<option value="BNP파리바은행">BNP파리바은행</option>
							</select>
							<input type="number" name="tfcBankNo" class="form-control" id="tfcBankNo" placeholder="계좌번호 입력" >
							<p>특수문자(-)없이 숫자만 입력해주세요.</p>
							<input type="text" name="tfcBankAccount" class="form-control" id="tfcBankAccount" placeholder="예금주명 입력" >
							<p>예금주 명은 계좌의 예금주와 정확하게 일치해야 합니다.</p>
							<br>
							<label class="form-label mt-4" for="TfcBankFilepath">통장 사본</label>
							<p>위 계좌 정보와 동일한 명의의 통장 사본을 제출해야 합니다.</p>
							<p>JPG,JPEG,PNG,PDF / 10MB 이하 파일 업로드 가능</p>
							<div class="upload-wrap">
								<input class="form-control" id="image2" type="text" placeholder="No Image" disabled="">
								<label class="form-label1" for="TfcBankFilepath">
									<span class="material-symbols-outlined">file_upload</span>
								</label>
								<input type="file" name="upfile" id="TfcBankFilepath" class="upfile" style="display: none;">
								<span id="cancel1" class="material-symbols-outlined cancel" style="display: none;">close</span>
								<input type="hidden" name="imageStatus" value="new">
							</div>
						</div>
						<br><br><br>
					</div>
					<input type="hidden" name="tfNo" value="${tmpF.tfNo }">
					<input type="hidden" name="status" value="new">
					<input type="submit" class="save-btn btn-info" value="저장하기">
				</form>
				<br><br><br><br>
			</div>
		</div>
	</div>
	<script>
		//저장하기 눌렀을 시 체크해야 할 값 배열
		const saveChk = [0,0,0,0,0,0,0,0,0]
		
		//정책 확인하기 버튼 클릭
		$(".policy-check").on("click",function(){
			$(".policy-detail").slideToggle(500,'linear');
		});
		
		//파일 업로드 했을때
		$(".upfile").on("change",function(){
			if($(this).val() == ""){
				$(this).prev().prev().val("");
			}else{
				$(this).prev().prev().val("image 등록 완료");
				$(this).prev().children().css("display","none");
				$(this).next().css("display","block");				
			}
		});
		
		//이미지 취소 버튼 클릭시 작동
		$(".cancel").on("click",function(){
			$(this).css("display","none");
			$(this).prev().prev().children().css("display","block");
			$(this).prev().prev().prev().val("");
			$(this).prev().val("");
			const status = $(this).next().val();
			if(status=="already"){
				$(this).next().val("modify");	
			}
		})
		
		//서브밋 활성화
		$("[type=submit]").on("click",function(e){
			if(confirm("변경 내용을 저장하시겠습니까 ? ")){
				//saveChk 값이 다 1이지 확인할 변수
				let chk = 0
				
				//0. 약관 동의 체크
				const checkBox = $("[type=checkbox]").is(':checked');
				if (checkBox){
					saveChk[0] = 1; 
				}else{
					saveChk[0] = 0;
				}
				
				//1. 대표자명 체크
				const nameReg = /^[가-힣]{2,10}$/;
				const trName = $("#tfcRepName").val();
				if(trName.match(nameReg) == null){
					saveChk[1] = 0;
				}else{
					saveChk[1] = 1;
				}
				
				//2. 대표자 이메일 체크
				const mailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				const trEmail = $("#tfcRepEmail").val();
				if(trEmail.match(mailReg) == null ){
					saveChk[2] = 0;
				}else{
					saveChk[2] = 1;
				}
				
				//3. 대표자 신분증 체크
				const trFilepath = $(".upfile").eq(0).val();
				const imageStatus1 = $("[name=imageStatus]").eq(0).val();
				if(trFilepath == "" && imageStatus1 != "already"){
					saveChk[3] = 0;
				}else{
					saveChk[3] = 1;
				}
				
				//4. 대표자 주민번호 체크
				const birthReg = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-8][0-9]{6}$/;
				const trBirth = $("#tfcRepBirth").val();
				if(trBirth.match(birthReg) == null ){
					saveChk[4] = 0;
				}else{
					saveChk[4] = 1;
				}
				
				//5. 세금계산서 발행 이메일 체크
				const tEmail = $("#tfcMail").val();
				if(tEmail.match(mailReg) == null ){
					saveChk[5] = 0;
				}else{
					saveChk[5] = 1;
				}
				
				//6. 계좌 번호 체크
				const tbNo = $("#tfcBankNo").val();
				if(tbNo == ""){
					saveChk[6] = 0;
				}else{
					saveChk[6] = 1;
				}
				
				//7. 예금주명 체크
				const tbAccount = $("#tfcBankAccount").val();
				if(tbAccount.match(nameReg) == null){
					saveChk[7] = 0;
				}else{
					saveChk[7] = 1;
				}
				
				//8. 통장사본 체크
				const tbFilepath = $(".upfile").eq(1).val();
				const imageStatus2 = $("[name=imageStatus]").eq(1).val();
				if(tbFilepath == "" && imageStatus2 != "already"){
					saveChk[8] = 0;
				}else{
					saveChk[8] = 1;
				}
				
				//9. saveChk 갯수 확인
				$.each(saveChk,function(index,item){
					if(item == 1){
						chk++;
					}
				});
				
				//검사에 걸린 부분에 따른 경고 메시지 담을 배열
				const alertArr = [
					"정산 정책을 확인하고 약관에 동의하여 주세요.",
					"대표자명은 10자 이하의 한글만 가능합니다.",
					"대표자 이메일 형식을 확인하여 주세요.",
					"대표자 신분증을 올려주세요.",
					"올바른 주민등록번호를 입력하여 주세요.",
					"세금계산서 발행 이메일 형식을 확인하여 주세요.",
					"계좌번호를 입력하여주세요.",
					"예금주명은 10자 이하의 한글만 가능합니다.",
					"통장 사본을 올려주세요."
				];
				
				//모든 조건 만족하지 않으면 버튼 비활성화
				if(chk != 9){
					let breakChk = 0;
					e.preventDefault();
					$.each(saveChk,function(index,item){
						if(item == 0){
							alert(alertArr[index]);
							breakChk++;
						}
						if(breakChk == 1){
							return false;
						}
					});
				}	
			}else{
				e.preventDefault();
			}
		});//submit
		
		//기존에 입력사항 체크
		$(document).ready(function(){
			//사전에 있던 정산정보 입력
			<c:if test="${tfc ne null}">
				$("[name=status]").val("modify");
				$("[name=imageStatus]").val("already");
				$("[type=checkbox]").prop("checked", true);
				$("#tfcRepCategory").val("${tfc.tfcRepCategory}");
				$("#tfcRepName").val("${tfc.tfcRepName}");
				$("#tfcRepEmail").val("${tfc.tfcRepEmail}");
				$(".form-label1>span").css("display","none");
				$(".cancel").css("display","block");
				$("#image1").val("image 등록 완료");
				$("#image2").val("image 등록 완료");
				$("#tfcRepBirth").val("${tfc.tfcRepBirth}");
				$("#tfcMail").val("${tfc.tfcMail}");
				$("#tfcBankName").val("${tfc.tfcBankName}");
				$("#tfcBankNo").val("${tfc.tfcBankNo}");
				$("#tfcBankAccount").val("${tfc.tfcBankAccount}");
			</c:if>
		});
	</script>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
</body>
</html>