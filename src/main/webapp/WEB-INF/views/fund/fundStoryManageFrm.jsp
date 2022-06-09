<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.crefund-content>p{
		margin: 0px;
		font-size: 13px;
	}
	.crefund-content>h6:nth-of-type(2){
		padding-bottom: 0px;
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
	form>p{
		padding-top: 5px;
		font-size: 13px;
	}
	#fundInfo{
		resize: none;
	}
	form>div>p{
		font-size: 13px;
		padding: 0px;
		margin: 0px;
	}
	.introChk{
		display: flex;
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
				$(".nav-sub>li:nth-child(1)").addClass("select");
			</script>
		</div>
		<div class="crefund-content">
			<span class="category">펀딩관리 > <b>스토리 수정</b></span>
			<h2>스토리 수정</h2>
			<h6>메이커님의 프로젝트를 소개해 보세요. 스토리에는 메이커님의 진심과 목소리가 잘 녹여질 수 있도록 명확하고,<br>
				솔직하게, 친근한 어투로 작성하세요.</h6>
			<h6>소개 사진 등록</h6>
			<p>등록하신 사진은 틀에 맞춰 리사이징 해서 순서대로나열됩니다.</p>
			<p>첫번째 이미지는 해당 펀딩의 대표 이미지로 사용됩니다.</p>
			<form action="/updateFundStory.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="fundNo" value=${fund.fundNo }>
				<div class="upload-wrap">
					<input class="form-control" id="imageName1" type="text" placeholder="No Image" disabled="">
					<label class="form-label1" for="image1">
						<span class="material-symbols-outlined">file_upload</span>
					</label>
					<input type="file" name="upfile" id="image1" class="upflie" style="display: none;">
					<span id="cancel1" class="material-symbols-outlined cancel" style="display: none;">close</span>
					<input type="hidden" name="status" value="none">
				</div>
				<div class="upload-wrap">
					<input class="form-control" id="imageName2" type="text" placeholder="No Image" disabled="">
					<label class="form-label2" for="image2">
						<span class="material-symbols-outlined">file_upload</span>
					</label>
					<input type="file" name="upfile" id="image2" class="upflie" style="display: none;">
					<span id="cancel2" class="material-symbols-outlined cancel" style="display: none;">close</span>
					<input type="hidden" name="status" value="none">
				</div>
				<div class="upload-wrap">
					<input class="form-control" id="imageName3" type="text" placeholder="No Image" disabled="">
					<label class="form-label3" for="image3">
						<span class="material-symbols-outlined">file_upload</span>
					</label>
					<input type="file" name="upfile" id="image3" class="upflie" style="display: none;">
					<span id="cancel3" class="material-symbols-outlined cancel" style="display: none;">close</span>
					<input type="hidden" name="status" value="none">
				</div>
				<div class="upload-wrap">
					<input class="form-control" id="imageName4" type="text" placeholder="No Image" disabled="">
					<label class="form-label4" for="image4">
						<span class="material-symbols-outlined">file_upload</span>
					</label>
					<input type="file" name="upfile" id="image4" class="upflie" style="display: none;">
					<span id="cancel4" class="material-symbols-outlined cancel" style="display: none;">close</span>
					<input type="hidden" name="status" value="none">
				</div>
				<div class="upload-wrap">
					<input class="form-control" id="imageName5" type="text" placeholder="No Image" disabled="">
					<label class="form-label5" for="image5">
						<span class="material-symbols-outlined">file_upload</span>
					</label>
					<input type="file" name="upfile" id="image5" class="upflie" style="display: none;">
					<span id="cancel5" class="material-symbols-outlined cancel" style="display: none;">close</span>
					<input type="hidden" name="status" value="none">
				</div>
				<p>사이즈 : 최소 630X400 픽셀 이상, 2MB 이하의 이미지 파일</p>
				<label for="fundInfo" class="form-label mt-4" style="padding-top:20px; margin-bottom:5px;">프로젝트 요약</label>
				<p style="margin-bottom:0px; padding-top:0px;">프로젝트 페이지 상단 및 지지서명 시 노출됩니다.</p>
     			<textarea class="form-control" id="fundInfo" rows="3" name="fundIntro"></textarea>
     			<div class="introChk">
     				<p class="rest">100</p><p> 자 남음<p>
     			</div>
     			<br><br>
				<input type="submit" class="save-btn btn-info" value="저장하기">
			</form>
			<br><br><br>
		</div>
	</div>
	<!--  ${fund.fundNo },${fund.fundName },${fund.memberId }-->
	<script>
		//업로드 파일 정했을 때 이미지 칸 변화
		$(".upflie").on("change",function(){
			if($(this).val() == ""){
				$(this).prev().prev().val("");
			}else{
				const id = $(this).attr("id");
				$(this).prev().prev().val(id);
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
			if(status=="upload"){
				$(this).next().val("remove");	
			}
		})
		
		//프로젝트 요약 길이 체크
		$("[name=fundIntro]").on("keyup",function(){
			let length = $(this).val().length;
			let rest = 100-length;
			if(rest >= 0){
				$(".rest").css("color","#333")
				$(".rest").text(rest);
				$(".rest").next().text("자 남음");
			}else{
				$(".rest").css("color","#f00")
				$(".rest").text("프로제트 요약은 100글자를 넘길 수 없습니다.");
				$(".rest").next().text("");
			}
		})
		
		//서브밋 활성화
		$("[type=submit]").on("click",function(e){
			let chk1 = 0;
			if($("#imageName1").val() != ""){
				chk1 = 1;
			}
			let chk2 = 0;
			if($("[name=fundIntro]").val() != "" && $("[name=fundIntro]").val().length <= 100){
				chk2 = 1;
			}
			if(chk1 == 0 || chk2 == 0){
				alert("첫번째 이미지를 입력해주시고, 프로젝트 요약을 작성해주세요.")
				e.preventDefault();	
			}else if(!confirm("작성 내용을 저장하시겠습니까?")){
				e.preventDefault();
			}
		})
		
		//기존에 입력사항 체크
		$(document).ready(function(){
			<c:if test="${fund.fundFilepath1 ne null}">
				$("#imageName1").val("image1");
				$(".form-label1>span").css("display","none");
				$("#cancel1").css("display","block");
				$("#cancel1").next().val("upload");
			</c:if>
			<c:if test="${fund.fundFilepath2 ne null}">
				$("#imageName2").val("image2");
				$(".form-label2>span").css("display","none");
				$("#cancel2").css("display","block");
				$("#cancel2").next().val("upload");
			</c:if>
			<c:if test="${fund.fundFilepath3 ne null}">
				$("#imageName3").val("image3");
				$(".form-label3>span").css("display","none");
				$("#cancel3").css("display","block");
				$("#cancel3").next().val("upload");
			</c:if>
			<c:if test="${fund.fundFilepath4 ne null}">
				$("#imageName4").val("image4");
				$(".form-label4>span").css("display","none");
				$("#cancel4").css("display","block");
				$("#cancel4").next().val("upload");
			</c:if>
			<c:if test="${fund.fundFilepath5 ne null}">
				$("#imageName5").val("image5");
				$(".form-label5>span").css("display","none");
				$("#cancel5").css("display","block");
				$("#cancel5").next().val("upload");
			</c:if>
			<c:if test="${fund.fundIntro ne null}">
				const introVal = "${fund.fundIntro}";
				$("#fundInfo").val(introVal.replaceAll("<br>","\r\n"));
				$("#fundInfo").keyup();
			</c:if>
		});
	</script>
</body>
</html>