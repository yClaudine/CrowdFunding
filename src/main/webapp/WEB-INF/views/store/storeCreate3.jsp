<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 기본 정보</title>
<style>
	.content-right{
		width: 800px;
	}
	.content>div{
		float: left;
	}
	#stTitle{
		width: 700px;
	}
	.form-group>input{
		height: 44.4px;
		font-size: 15px;
	}
	
	.form-group{
		width: 700px;
	}
	.form-group>p{
		font-size: 13px;
		margin: 0;
		margin-top: -10px;
	}
	
	form>.upload-wrap{
		display: flex;
		align-items: center;
	}
	form>.upload-wrap>label>span{
		padding-top: 5px;
		padding-left: 5px;
		font-size: 30px;
	}
	form>.upload-wrap>label>span:hover{
		cursor: pointer;
	}
	.upload-wrap{
		padding-top: 10px;
	}
	form>.upload-wrap>span{
		font-size: 30px;
		padding-left: 5px;
		margin-top: -5px;
	}
	form>.upload-wrap>span:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/store/storeHeader.jsp" %>
	<div class="creFund-wrap">
		<div class="crefund-nav">
			<%@include file="/WEB-INF/views/store/storeNav.jsp" %>
			<script>
				$(".nav-top>li").addClass("select");
				//$(".nav-sub>li:nth-child(1)").addClass("select");
			</script>
		</div>
		<div class="content-right">
			<h2>스토어를 등록해 주세요</h2>
			<h6>FUNFUNFUN을 통해 간단하고 쉽게 스토어를 만들어서 상품을 등록해 보세요.</h6>
			
			
			<div class="form-group">
					<label class="form-label mt-4" for="stTitle">스토어 제목</label>
					<input type="text" name="stTitle" class="form-control" id="stTitle" placeholder="20자 이내로 입력해 주세요." >
			</div>
			
			<div class="form-group">
					<label for="stCategory" class="form-label mt-4">카테고리</label>
					<select class="form-select" id="stCategory" name="stCategory">
						<option value="리빙">리빙</option>
						<option value="뷰티">뷰티</option>
						<option value="반려동물">반려동물</option>
						<option value="여행">여행</option>
						<option value="푸드">푸드</option>
					</select>
				</div>
		<br>
		
		<div class="save-img">
			<h6 style="font-weight: normal;">대표 사진 등록</h6>
				<p style="font-size: 12px;">첫번째 이미지는 해당 펀딩의 대표 이미지로 사용됩니다.</p>
				<form action="/SaveTmpImg.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="stNo" value=${tmp.stNo }>
					<div class="upload-wrap">
						<input class="form-control" id="stImg1" type="text" placeholder="No Image" disabled="">
						<label class="form-label1" for="image1">
							<span class="material-symbols-outlined">file_upload</span>
						</label>
						<input type="file" name="upfile" id="image1" class="upflie" style="display: none;">
						<span id="cancel1" class="material-symbols-outlined cancel" style="display: none;">close</span>
						<input type="hidden" name="status" value="none">
					</div>
					<div class="upload-wrap">
						<input class="form-control" id="stImg2" type="text" placeholder="No Image" disabled="">
						<label class="form-label2" for="image2">
							<span class="material-symbols-outlined">file_upload</span>
						</label>
						<input type="file" name="upfile" id="image2" class="upflie" style="display: none;">
						<span id="cancel2" class="material-symbols-outlined cancel" style="display: none;">close</span>
						<input type="hidden" name="status" value="none">
					</div>
					<div class="upload-wrap">
						<input class="form-control" id="stImg3" type="text" placeholder="No Image" disabled="">
						<label class="form-label3" for="image3">
							<span class="material-symbols-outlined">file_upload</span>
						</label>
						<input type="file" name="upfile" id="image3" class="upflie" style="display: none;">
						<span id="cancel3" class="material-symbols-outlined cancel" style="display: none;">close</span>
						<input type="hidden" name="status" value="none">
					</div>
					<div class="upload-wrap">
						<input class="form-control" id="stImg4" type="text" placeholder="No Image" disabled="">
						<label class="form-label4" for="image4">
							<span class="material-symbols-outlined">file_upload</span>
						</label>
						<input type="file" name="upfile" id="image4" class="upflie" style="display: none;">
						<span id="cancel4" class="material-symbols-outlined cancel" style="display: none;">close</span>
						<input type="hidden" name="status" value="none">
					</div>
					<div class="upload-wrap">
						<input class="form-control" id="stImg5" type="text" placeholder="No Image" disabled="">
						<label class="form-label5" for="image5">
							<span class="material-symbols-outlined">file_upload</span>
						</label>
						<input type="file" name="upfile" id="image5" class="upflie" style="display: none;">
						<span id="cancel5" class="material-symbols-outlined cancel" style="display: none;">close</span>
						<input type="hidden" name="status" value="none">
					</div>
				</form>
			</div>
			
			
			<br><br>
			<button class="save-btn btn-info">저장하기</button>
			<br>
			<br>
		</div> <!-- content 끝 -->
		
	</div>
	
	<script>
	
	
	//사전에 입력된 값 있는지 체크
	$(document).ready(function(){
		//스토어 제목
		
		//스토어 카테고리
		$("#stCategory").val("${tmp.stCategory}");
		$("#stCategory").change();
	});
	
	//저장하기 버튼
	$(".save-btn").on("click",function(){
		if(confirm("입력하신 정보를 저장하시겠습니까?")){
			//validation 체크값 초기화
			let count = 0;
			//값 추출
			const stTitle = $("#stTitle").val();
			const stCategory = $("#stCategory").val();
			//사진 해야 됨
			
			
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
	</script>
</body>
</html>