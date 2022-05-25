<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>

 .content-wrap{
     overflow: hidden;
     width: 1200px;
     margin: 0 auto;
     font-family: ns-medium;
     border-top: 1px solid #bfbfbf;
 }
 .main-content{
     float: left;
     width: 100%;
     padding: 80px;
     padding-top: 85px;
 }
 .top-title{
     text-align: center;
     padding: 50px;
     font-weight: bolder;
 }
 .main-content .btn{
     font-size: 20px;
     margin: 5px;
     height: 40px;
     line-height: 20px;
 }
 .form{
     overflow: hidden;
 }
 .main-content .btn-outline-primary{
     color:#00b2b2;
     border: 1px solid #00b2b2;
     display: block;
     float: right;
 }
 .main-content .btn-outline-primary:hover{
     background-color: #00b2b2;
     border: 1px solid #d1e2e2;;
     color:white;
 }
 .main-content .btn-primary{
     color: whitesmoke ;
     background-color: #02c9c9;
     border: 1px solid #02c9c9;
     display: block;
 }
 .main-content .btn-primary:hover{
     color: whitesmoke ;
     background-color: #02c9c9;
     border: 1px solid #02c9c9;
     display: block;
     cursor: default;
 }
 .manager-table{
     width: 100%;
     margin-top:30px;
     margin-bottom: 30px;
     border: 1px solid #bfbfbf;
 }
 .manager-table tr{
     border: 2px solid #f2f4f6;
 }
 .manager-table tr>td:nth-of-type(2){
 	text-align: center;
 }
 .manager-table th{
     width:20%;
     text-align: center;
     background-color: #e7f9f9;
     padding: 20px;
      border : 2px solid white;
 }
 .manager-table td{
     text-align: left;
     padding: 15px;
 }
 .manager-table select{
     width: 300px;
 }
 .manager-table p{
     margin: 0;
 }
 input[name='noticeTitle']{
     width: 100%;
     height: 40px;
 }
.img {
	width: 100px;
	height: 100px;
}
.delFile{
	 color: whitesmoke ;
     background-color: #02c9c9;
     border: 1px solid #02c9c9;
	 width: 70px;
	 height: 30px;
	 border-radius: 5px;
}
.delFile:hover{
 	 color:#00b2b2;
 	 background-color: white;
     border: 1px solid #00b2b2;

}
</style>
<!-- 섬머노트 -->
<link rel="stylesheet" href="/resources/css/summernote/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>

<%@include file="/WEB-INF/views/common/header.jsp"%>
<script src="/resources/js/summernote/summernote-lite.js"></script>
<script src="/resources/js/summernote/lang/summernote-ko-KR.js"></script>


	  <div class="content-wrap">
            <div class="main-content">
                <div class="top-title"><h2>공지사항</h2></div>
               
                <form class="form" action="/updateNotice.do" method="post" enctype="multipart/form-data" >
                	<input type="hidden" name="noticeNo" value="${n.noticeNo }">
                    <table class="manager-table">
                        <tr>
                            <th>분류</th>
                            <td>
                            	<c:choose>
                            		<c:when test="${n.noticeType eq 0}">
                            			공지사항
                            		</c:when>
                            		<c:otherwise>
                            			이벤트
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                            <th>상단글 고정</th>
                            <td><input type="checkbox" name="important" class="important" >
                            	
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="noticeTitle" class="noticeTitle" value="${n.noticeTitle }">
                            </td>
                            <th>작성자</th>
                            <td>
                            ${n.noticeWriter }
                            </td>
                        </tr>
                        <tr>
                            <th>대표이미지</th>
                            
                            <td colspan="3">
                            	<input type="hidden" name="status" value="stay">
                            	<c:choose>
                            		<c:when test="${empty n.noticeFilepath }">
                            			<input type="file" name="file">
                            			<input type="hidden" name="oldFile" value="none">
                            		</c:when>
                            		<c:otherwise>
                            			<input type="hidden" name="oldFile" value="${n.noticeFilepath }">
                            			<img class="img" src="/resources/image/notice/main/${n.noticeFilepath}">
                            			<input type="file" name="file" value="${n.noticeFilepath }" style="display:none;"  >
                            			<button type="button" class="delFile">삭제하기</button>
                            			<input type="file" name="newFile" style="display:none;">
                            		</c:otherwise>
                            	</c:choose>
                            </td>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <textarea cols="100" rows="20" id="noticeContent" name="noticeContent" class="noticeContent" >${n.noticeContent }</textarea>
                            </td>
                        </tr>
                        
                        <c:if test="${n.couponNo ne 0 }">
                        	<tr>
                       			<th>쿠폰</th>
                       			<td colspan="3"  style="text-align: left;">${c.couponName }</td>
                        	</tr>
                        </c:if>
                        <c:if test="${not empty n.dateStart }">
                        	<tr>
                        		<th>유효기간</th>
                        		<td  colspan="2"> ${n.dateStart }~${n.dateEnd }</td>
                        	</tr>
                        </c:if>
                    </table>
                    
                    <input  type="submit" value="수정하기" class="btn btn-outline-primary">
                </form>
                
            </div>
        </div>
        <input type="hidden" class="information" value="${n.important }" >
 <script>
 	//파일삭제
 	$(".delFile").on("click",function(){
 		$(this).prev().attr("name","old");
 		$(this).css("display","none");
 		$(this).next().attr("name","file").css("display","block");
 		$(this).prev().prev().css("display","none");
 		$(this).prev().prev().prev().prev().val("delete");
 	});
 	//값셋팅
 	const important = $(".information").val();
	if(important == 1){
		$(".important").prop("checked",true);
	} 

	//섬머노트
 	 $("#noticeContent").summernote({
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
        
      //제출하기 검사
        $("input[type='submit']").on("click",function(e){
        	
        	if($(".important").is(":checked")){
         		$("input[name='important']").val(1);
         	}else{
         		$("input[name='important']").val(0);
         	}
            const checkArr = [false, false];
            
            //제목 빈칸 확인
            const noticeTitle = $(".noticeTitle").val();
            if(noticeTitle != ""){
                checkArr[0] = true;
            }
            //내용 빈칸 확인
            const noticeContent = $(".noticeContent").val();
            if(noticeContent != ""){
                checkArr[1] = true;
                
            }
            if(!(checkArr[0]&&checkArr[1])){
                e.preventDefault();
                alert("값을 확인해주세요");
            }
           
        });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>