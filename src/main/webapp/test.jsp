<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>
<!-- 섬머노트 -->
<script src="resources/js/summernote/summernote-lite.js"></script>
<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="resources/css/summernote/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summbernote-bs4.min.js"></script>
</head>
<body>
	<form class="form" id="allform" action="promotionInsert.do" method="post" enctype="multipart/form-data">
		<div class="page-content">
			<div class="belt">Promotion</div>
			<h3>JAVADICE CITY 에서 준비한 특별한 프로모션 상품들을 경험해보세요.</h3>
			<div class="promotion-page">프로모션</div>
			<input type="text" class="input-form" name="title"
				placeholder="Title" value="" /> <input type="text" class="input-form"
				name="sub" placeholder="Sub" />
			<div class="Date-input">
				<input type="date" class="input-form" id="start-date"
					placeholder="YYYY-MM-DD" name="start_date" /> <input type="date"
					class="input-form" id="end-date" name="end_date"
					placeholder="Date(YYYY-MM-DD)" />
			</div>
			<br><br><br>
			<textarea name="Content" id="text" placeholder="textarea"></textarea>
			<div class="input-form">
				<div class="filebox">
					<label for="file"></label> <input type="file" id="file" name="file">
				</div>
			</div>
		</div>
		<div class="button">
			<button class="btn bc1" type="submit">작성하기</button>
			<button class="btn bc2" type="button" onclick="location.href='/promotionList.do'">취소</button>
		</div>
	</form>
	<script>
		$("#text").summernote({
			height:600,
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
				url : "/uploadImage2.do",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					//결과로 받은 이미지파일 경로를 에디터에 추가
					$(editor).summernote("insertImage",data);
				}
			});
			//processData : 기본값 true {key1:value, key2:value2, key3:value3}
			//					-> 파일전송 시 String이 아니라 파일형태로 전송하기 위해서 기본값 제거
			//contentType : 기본값 "application/x-www-form-urlencoded;charset=UTF-8"
			//				-> form 태그 전송 시 enctype의 기본값임
			//				-> enctype="multipart/form-data"로 설정하기 위해 기본값을 제거 (기본값을 제거하면 자동으로 multipart/form-data가 됨)
		}
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>