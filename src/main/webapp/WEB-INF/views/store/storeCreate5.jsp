<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
			<h2>반품/교환 정책을 등록해 주세요</h2>
			<h6>FUNFUNFUN을 통해 간단하고 쉽게 스토어를 만들어서 상품에 관한 반품/교환 정책을 등록해 보세요.</h6>
			
			
		<form action="/updateStore5.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="stNo" value=${tmp.stNo }>
			
			<div class="form-group">
				<label class="form-label mt-4" for="stReturn">반품</label>
				<textarea rows="2" cols="40" name="stReturn" class="form-control" style="vertical-align: top; height: 300px;" id="stReturn" placeholder="4000자 이내로 입력해 주세요.">${tmp.stReturn }</textarea>
				<div id="test_cnt" style="font-size: 14px; margin-top:10px; color: black; " >(0 / 4000)</div>
			 </div>
			 <br>
			 <div class="form-group">
				<label class="form-label mt-4" for="stChange">교환</label>
				<textarea rows="2" cols="40" name="stChange" class="form-control" style="vertical-align: top; height: 300px;" id="stChange" placeholder="4000자 이내로 입력해 주세요.">${tmp.stChange }</textarea>
				<div id="test_cnt1" style="font-size: 14px; margin-top:10px; color: black; " >(0 / 4000)</div>
			 </div>
			 
			 
			 <br><br>
			 	<input type="submit" class="save-btn btn-info" value="저장하기">
		</form>
		<br>
		<br>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
	    $('#stReturn').on('keyup', function() {
	        $('#test_cnt').html("("+$(this).val().length+" / 4000)");
	 
	        if($(this).val().length > 4000) {
	            $(this).val($(this).val().substring(0, 4000));
	            $('#test_cnt').html("(4000 / 4000)");
	        }
	    });
	    
	    $('#stChange').on('keyup', function() {
	        $('#test_cnt1').html("("+$(this).val().length+" / 4000)");
	 
	        if($(this).val().length > 4000) {
	            $(this).val($(this).val().substring(0, 4000));
	            $('#test_cnt1').html("(4000/ 4000)");
	        }
	    });
	});
	
	$(document).ready(function(){
		
		$("#test_cnt").html("("+"${tmp.stReturn}".length+" / 4000)");
		$("#test_cnt").keyup();
		
		$("#test_cnt1").html("("+"${tmp.stChange}".length+" / 4000)");
		$("#test_cnt1").keyup();
	});
</script>
</html>