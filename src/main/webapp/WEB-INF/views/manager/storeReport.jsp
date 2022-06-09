<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 경고 관리</title>
<style>
.content-wrap{
    overflow: hidden;
    width: 1200px;
    border-top: 1px solid #bfbfbf;
    font-family: ns-medium;
    border-top: 1px solid #bfbfbf;
    margin: 0 auto;
}
.left-content{
    float: left;
    width: 15%;
}
.main-content{
    float: left;
    width: 85%;
    padding: 80px;
    padding-top: 85px;
    font-size: 13px;
}
.left-content>.title{
    text-align: center;
    font-size: 30px;
    padding: 20px;
}
.manager-menu{
     list-style-type: none;
     margin: 0;
     padding: 0;
     border: 1px solid lightgray;
 }
 .manager-menu>li{
     text-align: center;
     height: 50px;
     line-height: 50px;
     font-size: 15px;
     color: gray;
     
 }
 .manager-menu>li>a{
     display: block;
     text-decoration: none;
     color: #212529;
     background-color:#f2f4f6;
     text-align: center;
     height: 50px;
     line-height: 50px;
     font-size: 15px;
 }
 .manager-menu>li>a:hover{
     color: #e7f9f9;
     cursor: pointer;
     background-color: #00b2b2;
 }
 .manager-menu .active-menu{
     color: #00b2b2;
     font-weight: bold;
 }
.content-wrap .btn{
    font-size: 13px;
    margin: 5px;
}

.content-wrap .btn-primary{
    color: whitesmoke ;
    background-color: #02c9c9;
    border: 1px solid #02c9c9;
    margin: 0;
    margin-top: 10px;
    width: 110px;
    height: 35px;
    line-height: 13px;
    font-size: 15px;
    border-radius: 5px;
}
.content-wrap .btn-primary:hover{
    background-color: #00b2b2;
    border: 1px solid white;
    border: 1px solid #00b2b2;
}
.tables>*{
    text-align: center;
}
.main-content .table td:last-child{
	width: 200px;
}
.main-content .table td{
    line-height: 30px;
    height: 30px;
}
#reportManage{
	background-color: #e7f9f9;
	border:none;
	border: 1px solid  #e7f9f9;
}
#reportManage>*{
	color: #60656a;
}
#sellerManage{
	color:#00b2b2;
    border: 2px solid #00b2b2;
    font-weight: bold;
    margin:0;
    margin-bottom: 5px;
}
#sellerManage:hover{
	cursor: default;
}
select{
	border: 1px solid #bfbfbf;
}
.nodata{
	text-align: center;
	height: 200px;
	line-height: 200px;
	font-size: 20px;
}
.fund-tbl th{
	width: 20%;
}

.table a{
	color: black;
	text-decoration: none;
}
.table td{
	vertical-align: middle;
}
.fund-tbl td, .fund-tbl th{
	vertical-align: middle;
}
#reportManage>a{
	display:block;
	width: 100%;
	height: 100%;
}
.box{
	margin-bottom: 100px;
	margin-top: 30px;
	padding: 30px;
	border: 1px solid #bfbfbf;
	
	border-radius: 5px;
	min-height: 300px;
}
.review-tbl tr>*:last-child{
	width: 60%;
}
.modal-wrap{
    width: 100vw;
    height: 130vh;
    background-color: rgba(0,0,0,0.5);
    position: absolute;
    top: 0;
    left: 0;
    display: none;
    justify-content: center;
    align-items: center;
    z-index: 4;
}
.detail-modal{
    background-color: #e7f9f9;
    min-width: 600px;
    min-height: 500px;
    border-radius: 5px;
}
.modal-header{
	width: 190px;
	margin: 0 auto;
	padding: 10px;
}
.modal-top h3{
	margin: 0;
}
.detail-table{
	margin: 5px auto;
	min-height: 300px;
	width: 100%;
}
.detail-table tr{
	border: 1px solid #bfbfbf;
}
.detail-table th{
	border: 1px solid #bfbfbf;
	width: 17%;
	vertical-align: middle;
	text-align:center;
}
.detail-table td{
	vertical-align: middle;
	padding: 5px;
}
.report-tbl tr>th:nth-child(2), .report-tbl tr>td:nth-child(2){
	width: 20%;
}
.report-tbl tr>th:nth-child(4), .report-tbl tr>td:nth-child(4){
	width: 40%;
}
.report-tbl tr>th:nth-child(5), .report-tbl tr>td:nth-child(5){
	width: 10%;
}
.detail-table input{
	width: 100%;
}

.btns{
	width: 100px;
	height: 50px;
	border: #00c4c4;
	background-color:  #00c4c4;
	color: #ffffff;
	margin: 5px;
	border-radius: 5px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	 <div class="content-wrap">
        <div class="left-content">
            <div class="title">펀딩관리</div>
            <div class="menu-wrap">
                <ul class="manager-menu">
                    <li>관리자페이지</li>
                    <li><a href="/fundManage.do?reqPage=1&keyword=&type=all"  >펀딩관리</a></li>
                    <li><a href="/storeManage.do?reqPage=1&keyword=&type=all"  class="active-menu">스토어관리</a></li>
                    <li><a href="/memberManage.do?reqPage=1&keyword=&type=all" >회원관리</a></li>
                    <li><a href="/couponManage.do?reqPage=1&keyword=&type=3">쿠폰관리</a></li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <div class="mini-title"><h4>신고 스토어 상세</h4></div>
            <!-- 
	        <button type="button" class="btn btn-primary delete">스토어삭제</button>
	         -->
	        
            <div class="box">
           		<div class="tables">
	            	<table class="table table-hover fund-tbl" >
	                    <tr>
	                    	<th>펀드번호</th>
	                    	<td class="storeNo">${s.storeNo }</td>
	                    </tr>
	                    <tr>
	                    	<th>스토어제목</th>
	                    	<td>${s.storeTitle }</td>
	                    </tr>
	                    <tr>
	                    	<th>판매자아이디</th>
	                    	<td>${s.memberId }</td>
	                    </tr>
	                    <tr>
	                    	<th>카테고리</th>
	                    	<td>${s.storeCategory }</td>
	                    </tr>
	                    <tr>
	                    	<th>내용</th>
	                    	<td>${s.storeContent }%</td>
	                    </tr>
	                    <tr>
	                    	<th>상품이름</th>
	                    	<td>${s.storeProduct }</td>
	                    </tr>
	                    <tr>
	                    	<th>상품설명</th>
	                    	<td>${s.storeProductcontent }</td>
	                    </tr>
	                    <tr>
	                    	<th>상품가격</th>
	                    	<td>${s.storePrice }</td>
	                    </tr>
	                    <tr>
	                    	<th>제한수량</th>
	                    	<td>${s.storeCount }</td>
	                    </tr>
	                    <tr>
	                    	<th>배송비</th>
	                    	<td>${s.storeDelivery }</td>
	                    </tr>
	                    <tr>
	                    	<th>반품정책</th>
	                    	<td>${s.storeReturn }</td>
	                    </tr>
	                    <tr>
	                    	<th>교환정책</th>
	                    	<td>${s.storeChange }</td>
	                    </tr>
	                </table> 
          	 		</div>
            </div>
            <div class="mini-title"><h4>경고 관리</h4></div>
            <button type="button" class="btn btn-primary" onclick="sendDmModal();" >쪽지 보내기</button>
            <div class="box report">
            	<c:choose>
	            	<c:when test="1=2">
	            		 <div class="nodata"><h6>조회 결과가 없습니다.</h6></div>
	            	</c:when>
	            	<c:otherwise>
	            		<div class="tables">
			            	<table class="table table-hover report-tbl">
			                    <thead>
			                        <tr>
			                            <th>받은사람</th>
			                            <th>제목</th>
			                            <th>보낸시간</th>
			                            <th>내용</th>
			                            <th>읽음여부</th>
			                        </tr>
			                    </thead>
			                    <tbody class="tbody sendTbody">
			                    	
			                    </tbody>
			                </table> 
	           	 		</div>
	            	</c:otherwise>
           	 	</c:choose>
            
           </div>
           
        </div>
    </div>
    <!-- 쪽지 보내기 모달 -->
  <div id="sendDm-modal" class="modal-wrap">
		<div class="detail-modal">
			<div class="modal-header"><h3>쪽지보내기</h3></div>
			<hr>
			<div >
				<table class="sendDmFrm detail-table">
					<tr>
						<th>수신자 : </th>
						<td><input  id="memberId" name="memberId" value="${memberId }" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="mTitle"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="60" rows="10" name="dmContent"></textarea></td>
					</tr>
				</table>
				<button class="btns" onclick="dmSend();">쪽지보내기</button>
				<button class="btns modal-close" onclick="dmClose();">닫기</button>
			</div>
		</div>
	</div>
	
  
  
  
  
  <script>
  const storeNo = $(".storeNo").text();
  let memberId;
  let ws;
	$(function(){
		memberId = $("#memberId").val();
		ws = new WebSocket("ws://localhost/dm.do");
		ws.onopen = onOpen;
		ws.onmessage = receiveMsg;
		ws.onclose = onClose;
	});
	function onOpen(){
		//소켓연결이 되면 자동으로 실행되는 메서드
		const data = {type:"enter",memberId:memberId};
		ws.send(JSON.stringify(data));
	}
	function receiveMsg(param){
		getSendDm();
	}
	function onClose(){
		
	}
	
//쪽지보내기 클릭시 모달띄우기
	function sendDmModal(){
		$("#sendDm-modal").css("display","flex");
	}
	function dmClose(){
        $("#sendDm-modal").css("display","none");
        $("[name=dmContent]").val("");
        $("[name=mTitle]").val("");
    }
	
//쪽지보내기 버튼
	function dmSend(){
		const dmContent = $("[name=dmContent]").val();
		const mTitle = $("[name=mTitle]").val();
		const data = {
				type: "dmSend",
				sendMemId: "admin",
				recvMemId : memberId,
				mContent : dmContent,
				mTitle: mTitle,
				category: 2,
				categoryNo: storeNo
		}
		//data를 json객체로 만들어 넘겨주기
		ws.send(JSON.stringify(data));
		getSendDm();  //보낸메세지함 업데이트
		dmClose(); //모달닫기
		
	}
//쪽지보내기 버튼시 보낸메세지함 업데이트
	function getSendDm(){
		$.ajax({
			url : "/getReportList.do",
			type : "post",
			data : {
					memberId:memberId, 
					category: 2,
					categoryNo: storeNo
					},
			success : function(list){
				const tr= $(".sendTbody");
				tr.empty();
				let code;
				if(list.length == 0){
					code = "<tr><td colspan='5'>쪽지가 없습니다.</td></tr>";
				}else{
					for(let i=0; i<list.length;i++){
						if(list[i].readCk == 0){
							code += "<tr><td>"+list[i].recvMemId+"</td><td>"+list[i].mTitle+"</td><td>"+list[i].mDatetime+"</td><td>"+list[i].mContent+"</td><td>읽음</td></tr>"
						}else{
							code += "<tr><td>"+list[i].recvMemId+"</td><td>"+list[i].mTitle+"</td><td>"+list[i].mDatetime+"</td><td>"+list[i].mContent+"</td><td>읽지않음</td></tr>"
						}
						
						//code += "<tr><td>"+list[i].recvMemId+"</td><td>"+list[i].mTitle+"</td><td>"+list[i].mDatetime+"</td><td>"+list[i].mContent+"</td><td>"+읽음+"</td></tr>"
					}
				}
				tr.append(code);
				
				
			}
		});
	}
 //스토어 삭제
 $(".delete").on("click",function(){
	if(confirm("삭제 하시겠습니까?")){
		location.href="/deleteStore.do?storeNo="+storeNo;
	} 
 });
	
	
  </script>

</body>
</html>