<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	#tfName{
		width: 700px;
	}
	.form-group>p{
		font-size: 13px;
		margin: 0;
		margin-top: -10px;
	}
	.date-calculate{
		padding-top: 7px;
		padding-left: 10px;
	}
	.date-calculate>div{
		margin-top: -5px;
	}
	.date-calculate>div>span{
		font-size: 13px;
		line-height: 13px;
		color: #00c4c4;
	}
	.date-calculate>div>span:first-child{
		color: #333;
	}
	.cal-date{
		padding-top: 15px;
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
				$(".nav-sub>li:nth-child(2)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩준비 > <b>기본 정보</b></span>
			<h2>기본 정보</h2>
			<h6>프로젝트를 대표할 주요 기본 정보를 입력하세요.</h6>
				<div class="form-group">
					<label class="form-label mt-4" for="tfName">프로젝트 제목</label>
					<input type="text" name="tfName" class="form-control" id="tfName" value="" >
					<div class=""></div>
				</div>
				<div class="form-group">
					<label class="form-label mt-4" for="tfAmount">목표 금액</label>
					<p>최소 50만원 ~ 최대 1억 원으로 설정하세요.</p>
					<input type="text" name="tfAmount" class="form-control" id="tfAmount" value="" >
					<div class=""></div>
				</div>
				<div class="form-group">
					<label for="tfCategory" class="form-label mt-4">카테고리</label>
					<select class="form-select" id="tfCategory" name="tfCategory">
						<option value="리빙">리빙</option>
						<option value="뷰티">뷰티</option>
						<option value="반려동물">반려동물</option>
						<option value="여행">여행</option>
						<option value="푸드">푸드</option>
					</select>
				</div>
				<div class="form-group">
					<label class="col-form-label mt-4" for="tfStart">프로젝트 시작일</label>
					<p>요건·콘텐츠 확인 및 프로젝트 진행 일정과 리워드 발송 일정을 함께 고려하여 시작일을 설정해 주세요.</p>
					<input type="date" class="form-control" id="tfStart">
				</div>
				<div class="form-group">
					<label class="col-form-label mt-4" for="tfEnd">프로젝트 종료일</label>
					<p>요건·콘텐츠 확인 및 프로젝트 진행 일정과 리워드 발송 일정을 함께 고려하여 종료일을 설정해 주세요.</p>
					<input type="date" class="form-control" id="tfEnd">
				</div>
				<div class="date-calculate">
					<div class="pay-date">
						<span>펀딩 결제일 : </span>
						<span class="pay-start">2022-01-01</span>
						<span>-</span>
						<span class="pay-end">2022-01-02</span>
					</div>
					<div>
						<span>펀딩이 성공 종료 된 후 결제가 +4 영업일 동안 진행됩니다.</span>
					</div>
					<div class="cal-date">
						<span>정산금 지급예정일 : </span>
						<span class="cal-start">01</span>
						<span>월 말(21~말일)</span>
					</div>
					<div>
						<span>정산은 최대 말일 이내에 시작될 예정이며, 정산금 지급까지는 종료일 기준 최대 +30 영업일이 소요됩니다.</span>
					</div>
				</div>
				<br><br>
				<button class="save-btn btn-info">저장하기</button>
				<br><br><br>
		</div>
	</div>
	<!--  ${tmpF.tfNo },${tmpF.tfName },${tmpF.memberId }-->
	<script>
		//각 항목 체크
		const chkIntro = [0,0,0];
		
		//프로젝트 제목 체크
		$("#tfName").on("change",function(){
			const tfName = $(this).val().length;
			if(tfName < 50 && tfName > 24){
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
				$(this).next().removeClass("invalid-feedback");
				$(this).next().addClass("valid-feedback");
				$(this).next().text("프로젝트 제목 입력 완료.");
				chkIntro[0] = 1;
			}else{
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
				$(this).next().removeClass("valid-feedback");
				$(this).next().addClass("invalid-feedback");
				$(this).next().text("프로젝트의 제목은 25~50자의 길이로 입력해주세요.");
				chkIntro[0] = 0;
			}
		})
		
		//목표금액 체크
		$("#tfAmount").on("change",function(){
			const tfAmount = $(this).val();
			if(tfAmount >= 500000 && tfAmount <= 100000000 && !(isNaN(tfAmount))){
				$(this).removeClass("is-invalid");
				$(this).addClass("is-valid");
				$(this).next().removeClass("invalid-feedback");
				$(this).next().addClass("valid-feedback");
				$(this).next().text("목표 금액 입력 완료.");
				chkIntro[1] = 1;
			}else{
				$(this).removeClass("is-valid");
				$(this).addClass("is-invalid");
				$(this).next().removeClass("valid-feedback");
				$(this).next().addClass("invalid-feedback");
				$(this).next().text("최소 50만 원 ~ 최대 1억 원의 숫자를 입력해주세요.");
				chkIntro[1] = 0;
			}
		})
		
		//시작일,종료일에 기본값&제한값  부여
		const sysdate = new Date().toISOString().slice(0, 10);
		$("[type=date]").attr("value",sysdate);
		$("[type=date]").attr("min",sysdate);
		
		//결제일, 정산일 변경
		$("[type=date]").on("change",function(){
			const tfStart = $("#tfStart").val();
			let tfEnd = $("#tfEnd").val();
			if(tfStart > tfEnd){
				alert("프로젝트 종료일은 프로젝트 시작일보다 앞 선 날짜일 수 없습니다.")
				chkIntro[2] = 0;
			}else{
				
				let yy = tfEnd.slice(0,4);
				let mm = tfEnd.slice(5,7);
				let dd = tfEnd.slice(8,10);
							
				const date = new Date(yy,mm,dd);
				date.setDate(date.getDate()+4);
				yy = date.getFullYear();
				mm = date.getMonth();
				if(mm < 10){
					mm = "0" + mm;
				}
				dd = date.getDate();
				if(dd < 10){
					dd = "0" + dd;
				}
				tfEnd = yy+"-"+mm+"-"+dd;
				
				$(".pay-start").text(tfStart);
				$(".pay-end").text(tfEnd);
				$(".cal-start").text(mm);
				chkIntro[2] = 1;
			}			
		})
		
		//저장하기 버튼
		$(".save-btn").on("click",function(){
			if(confirm("입력하신 정보를 저장하시겠습니까?")){
				//validation 체크값 초기화
				let count = 0;
				//값 추출
				const tfName = $("#tfName").val();
				const tfAmount = $("#tfAmount").val();
				const tfCategory = $("#tfCategory").val();
				const tfStart = $("#tfStart").val();
				const tfEnd = $("#tfEnd").val();
				
				chkIntro.forEach(function(item,index){
					if(chkIntro[index] == 1){
						count++;		
					}
				})
				
				if(count == 3){
					location.href="/SaveTmpBasic.do?tfNo=${tmpF.tfNo}&tfName="+tfName+"&tfAmount="+tfAmount+
									"&tfCategory="+tfCategory+"&tfStart="+tfStart+"&tfEnd="+tfEnd;
				}else{
					alert("각 항목들을 올바르게 작성해주세요.");
				}
			}
		})
		
		//사전에 입력된 값 있는지 체크
		$(document).ready(function(){
			//펀딩 제목
			$("#tfName").val("${tmpF.tfName}");
			$("#tfName").change();
			//펀딩 목표금액				
			<c:if test="${tmpF.tfAmount ne 0}">
				$("#tfAmount").val("${tmpF.tfAmount}");
				$("#tfAmount").change();
			</c:if>
			//펀딩 카테고리
			<c:if test="${tmpF.tfCategory ne null}">
				$("#tfCategory").val("${tmpF.tfCategory}");
			</c:if>
			//펀딩 시작일
			<c:if test="${tmpF.tfStart ne null}">
				$("#tfStart").val("${tmpF.tfStart}");
				$("#tfStart").change();
			</c:if>
			//펀딩 종료일
			<c:if test="${tmpF.tfEnd ne null}">
				$("#tfEnd").val("${tmpF.tfEnd}");
				$("#tfEnd").change();
			</c:if>
		});
	</script>
</body>
</html>