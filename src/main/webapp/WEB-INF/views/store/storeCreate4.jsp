<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보</title>
<!-- 섬머노트 -->
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

</head>

  
<body>

	
	<%@include file="/WEB-INF/views/store/storeHeader.jsp" %>
		<script src="/resources/js/summernote/summernote-lite.js"></script>
	<script src="/dresources/js/summernote/lang/summernote-ko-KR.js"></script>
	
		<div class="creStore-wrap">
			<div class="crestore-nav">
				<%@include file="/WEB-INF/views/store/storeNav.jsp" %>
				<script>
					$(".nav-top>li").addClass("select");
					//$(".nav-sub>li:nth-child(1)").addClass("select");
				</script>
			</div>
			<div class="content-right">
				<h2>상품을 등록해 주세요</h2>
				<h6>FUNFUNFUN을 통해 간단하고 쉽게 스토어를 만들어서 상품을 등록해 보세요.</h6>
				
				
			<form action="/updateStore4.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="stNo" value=${tmp.stNo }>
				<div class="form-group">
						<label class="form-label mt-4" for="stDelivery">배송비</label>
						<input type="text"  name="stDelivery" class="form-control" id="stDelivery" placeholder="숫자로만 입력해 주세요." value="${tmp.stDelivery}">
						<p style="font-size: 12px; margin-top:10px; color:#868e96; ">0원은 무료 배송입니다.</p>
			 	</div>
			 	<div class="form-group">
						<label class="form-label mt-4" for="stProduct">상품명</label>
						<input type="text" name="stProduct" class="form-control" id="stProduct" maxlength="20" placeholder="20자 이내로 입력해 주세요." >
			 	</div>
			 	<div class="form-group">
						<label class="form-label mt-4" for="stProductcontent">간략한 상품 설명</label>
						<textarea rows="2" cols="40" name="stProductcontent" class="form-control" style="vertical-align: top;" id="stProductcontent" placeholder="40자 이내로 입력해 주세요."></textarea>
						<div id="test_cnt" style="font-size: 14px; margin-top:10px; color: black; " >(0 / 40)</div>
			 	</div>
			 	<div class="form-group">
						<label class="form-label mt-4" for="stPrice">상품 가격</label>
						<input type="text"  name="stPrice" class="form-control" id="stPrice" placeholder="10원 이상으로 작성해 주세요." value="${tmp.stPrice}">
			 	</div>
			 	<div class="form-group">
						<label class="form-label mt-4" for="stCount">제한 수량</label>
						<input type="text"  name="stCount" class="form-control" id="stCount" placeholder="제한 수량을 작성해 주세요." value="${tmp.stCount}">
			 	</div>
			 	<div class="form-group">
						<label class="form-label mt-4" for="stTitle">상품 설명</label>
						<br>
						<textarea class="stContent" name="stContent" id="stContent">${tmp.stContent}</textarea>
			 	</div>
			 	
			 	<br><br>
			 	<input type="submit" class="save-btn btn-info" value="저장하기">
			</form>
			<br><br>
		</div>
	</div>
	<script>
	
	//섬머노트
	 $(".stContent").summernote({
			height:	600,
			width : 800,
			lang : "ko-KR",
			callbacks:{
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		});
		function uploadImage(file,editor){
			//ajax통해 서버에 이미지를 업로드하고 업로드 경로를 받아옴
			//form태그와 동일한 효과를 내는 FormData객체 생성
			const form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "/uploadImage.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					//결과로 받은 이미지파일 경로를 에디터에 추가
					$(editor).summernote("insertImage",data);
				}
			});
		}
		
		$(document).ready(function() {
		    $('#stProductcontent').on('keyup', function() {
		        $('#test_cnt').html("("+$(this).val().length+" / 40)");
		 
		        if($(this).val().length > 40) {
		            $(this).val($(this).val().substring(0, 40));
		            $('#test_cnt').html("(40 / 40)");
		        }
		    });
		});
		
		$(document).ready(function(){

			$("#stDelivery").val("${tmp.stDelivery}");
			$("#stDelivery").change();
			$("#stProduct").val("${tmp.stProduct}");
			$("#stProduct").change();
			$("#stProductcontent").val("${tmp.stProductcontent}");
			$("#stProductcontent").change();
			$("#stPrice").val("${tmp.stPrice}");
			$("#stPrice").change();
			$("#test_cnt").html("("+"${tmp.stProductcontent}".length+" / 40)");
			$("#test_cnt").keyup();
		});
		
		
 
	</script>

</body>
</html>