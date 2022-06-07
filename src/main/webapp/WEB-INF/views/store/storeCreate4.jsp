<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<body>
	<%@include file="/WEB-INF/views/store/storeHeader.jsp" %>
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
						<label class="form-label mt-4" for="stProductcontent">상품 설명</label>
						<textarea rows="2" cols="40" name="stProductcontent" class="form-control" style="vertical-align: top;" id="stProductcontent" placeholder="40자 이내로 입력해 주세요."></textarea>
						<div id="test_cnt" style="font-size: 14px; margin-top:10px; color: black; " >(0 / 40)</div>
			 	</div>
			 	<div class="form-group">
						<label class="form-label mt-4" for="stPrice">상품 가격</label>
						<input type="text"  name="stPrice" class="form-control" id="stPrice" placeholder="10원 이상으로 작성해 주세요." value="${tmp.stPrice}">
			 	</div>
			 	<div class="form-group">
						<label class="form-label mt-4" for="stTitle">상품 설명</label>
						<input type="text" name="stContent" class="form-control" id="stContent" placeholder="" >
						<textarea class="summernote" name="editordata"></textarea>
			 	</div>
			 	
			 	<br><br>
			 	<input type="submit" class="save-btn btn-info" value="저장하기">
			</form>
		</div>
	</div>
	<script>
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

			//$("#stDelivery").val("${tmp.stDelivery}");
			$("#stDelivery").change();
			$("#stProduct").val("${tmp.stProduct}");
			$("#stProduct").change();
			$("#stProductcontent").val("${tmp.stProductcontent}");
			$("#stProductcontent").change();
			//d$("#stPrice").val("${tmp.stPrice}");
			$("#stPrice").change();
			$("#stContent").val("${tmp.stContent}");
			$("#stContent").change();
			$("#test_cnt").html("("+"${tmp.stProductcontent}".length+" / 40)");
			$("#test_cnt").keyup();
		});
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 	<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

</body>
</html>