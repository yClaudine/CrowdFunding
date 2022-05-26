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
     border-top: 1px solid lightgray;
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
               
                <form class="form" action="/insertNotice.do" method="post" enctype="multipart/form-data" >
                    <table class="manager-table">
                        <tr>
                            <th>분류</th>
                            <td>
                                <input type="radio" name="noticeType" value="0" id="info">
                                <label for="info">공지</label>
                                <input type="radio" name="noticeType" value="1" id="event">
                                <label for="event">이벤트</label>
                            </td>
                            <th>상단글 고정</th>
                            <td><input type="checkbox" class="importantCheck">
                            	<input type="hidden" name="important">
                            </td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="noticeTitle" class="noticeTitle">
                            </td>
                            <th>작성자</th>
                            <td>
                            <c:if test="${not empty sessionScope.m && sessionScope.m.categoryNo eq 0}">
                            <input type="hidden" name="noticeWriter" value="${sessionScope.m.memberId }" >${sessionScope.m.memberId }
                            </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th>대표이미지</th>
                            <td colspan="3">
                                <input type="file" name="file">
                            </td>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <textarea cols="100" rows="20" id="noticeContent" name="noticeContent" class="noticeContent"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>쿠폰</th>
                            <td colspan="3"  style="text-align: left;">
                                <select name="couponNo" class="couponNo" readonly>
                                    <option value="0">없음</option>
                                    <c:forEach var="c" items="${couponList }">
                                    	<option value="${c.couponNo}" start="${c.validStart }" end="${c.validEnd }">${c.couponName }</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>유효기간</th>
                            <td  colspan="2" class="couponDate">
                                    <input type="date" name="dateStart" id="start"> ~
                                    <input type="date" name="dateEnd" id="end">
                            </td>
                        </tr>
                    </table>
                    
                    <input  type="submit" value="등록하기" class="btn btn-outline-primary">
                </form>
                
            </div>
        </div>
        
 <script>
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
 
	  
 
      //쿠폰 유효기간 시작일 제한
        function formatDate(){
            const d = new Date();
            month = ""+(d.getMonth()+1);
            day = ""+d.getDate();
            year = d.getFullYear();
            if(month.length<2){
                month = "0"+month;
            }
            if(day.length<2){
                day = "0"+day;
            }
            return [year, month, day].join('-');
        }

        //유효기간 지정시 -> 달력활성화 및 시작일, 끝나는날 제한
        const validStart = $("#start");
        const validEnd = $("#end");
        validStart.on("click",function(){
            validStart.attr("min",formatDate());
            if(validEnd.val() != ''){
                validStart.attr("max",validEnd.val());
            }else{
                validStart.removeAttr("max");
            }
        });
        validEnd.on("click",function(){
            if(validStart.val() != ''){
                validEnd.attr("min",validStart.val());
            }else{
                validEnd.attr("min",formatDate());
            }
        });

		//쿠폰선택시 유효기간 자동설정
        $("select[name='couponNo']").on("change",function(){
            const validStart = $("#start");
            const validEnd = $("#end");
            const couponStart = $("select[name='couponNo'] option:selected").attr("start");
            const couponEnd = $("select[name='couponNo'] option:selected").attr("end");
            if($(this).val() == 0){
            	validStart.val("");
            	validEnd.val("");
                validStart.attr("readonly",false);
                validEnd.attr("readonly",false);
            }else{
                validStart.attr("readonly",true).val(couponStart);
                validEnd.attr("readonly",true).val(couponEnd);
            }
        });
        
      //제출하기 검사
        $("input[type='submit']").on("click",function(e){
        	 //e.preventDefault();
        	if($(".importantCheck").is(":checked")){
         		$("input[name='important']").val(1);
         	}else{
         		$("input[name='important']").val(0);
         	}
            const checkArr = [false, false, false];
            //타입 체크 확인
            const noticeType = $("input[name='noticeType']:checked").val();
            if(noticeType != null){
                checkArr[0] = true;
            }
            //제목 빈칸 확인
            const noticeTitle = $(".noticeTitle").val();
            if(noticeTitle != ""){
                checkArr[1] = true;
            }
            //내용 빈칸 확인
            const noticeContent = $(".noticeContent").val();
            if(noticeContent != ""){
                checkArr[2] = true;
                
            }
            if(!(checkArr[0]&&checkArr[1]&&checkArr[2])){
                e.preventDefault();
                alert("값을 확인해주세요");
            }
           
        });
		
		
		
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>