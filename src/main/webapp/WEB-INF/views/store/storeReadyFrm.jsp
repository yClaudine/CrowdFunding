<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
	.menu-wrap{
		width: 850px;
		margin-top: 20px;
	}
	.ready-menu{
		height: 70px;
		padding-left: 35px;
		padding-right: 20px;
		display: flex;
		border: 1px solid #ccc;
		margin-bottom: 20px;
		border-left: 7px solid #00c4c4;
		justify-content: space-between;
		align-items: center;
	}
	.ready-menu>div{
		display: flex;
		align-items: center;
	}
	.ready-menu>div>h6{
		margin-bottom: 0px;
	}
	.ready-menu>div>span{
		padding-left: 12px;
		color: #00c4c4;
		font-size: 12px;
		font-weight: bold;
		margin-top: 3px;
	}
	.ready-menu>button{
		width: 100px;
		height: 40px;
		border: 1px solid #ccc;
		background-color: #fff;
		color: #aaa;
	}
	.ready-menu>button:hover{
		background-color: #00c4c4;
		color: #fff;
		transition: 0.2s;
	}
	.submit-btn{
		width: 350px;
		height: 50px;
		margin-top: 40px;
		align: right;
		border: none;
	}

</style>
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
			<h2>스토어 준비</h2>
			<h6>본격적으로 스토어를 오픈하기 위해 필수항목을 작성하세요.</h6>
			<div class="menu-wrap">
				<div class="ready-menu">
					<div>
						<h6>스토어 기본 정보</h6>
						<span class="check-store">작성 전</span>
					</div>
						<button onclick="location.href='/storeCreate3.do?stNo=${tmp.stNo}'">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>상품 정보</h6>
						<span class="check-store">작성 전</span>
					</div>
						<button onclick="location.href='/storeCreate4.do?stNo=${tmp.stNo }'">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>반품/교환</h6>
						<span class="check-store">작성 전</span>
					</div>
						<button onclick="location.href='/storeCreate5.do?stNo=${tmp.stNo }'">작성하기</button>
				</div>
				<div class="ready-menu">
					<div>
						<h6>대표자 및 정산 정보</h6>
						<span class="check-store">작성 전</span>
					</div>
						<button onclick="location.href='/storeCreate6.do?stNo=${tmp.stNo }'">작성하기</button>
				</div>

				<button class="btn-info submit-btn">제출하기</button>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
	<script>
		$(document).ready(function(){
			
			//각 항목별 작성 체크
			//보고 변경하기
			const checkStore = $(".check-store");
			const check = [0,0,0,0];
			<c:if test="${tmp.stTitle ne null && tmp.stCategory ne null && tmp.stImg1 ne null}">
			check[0] = 1;
			</c:if>
			<c:if test="${tmp.stDelivery ne null && tmp.stProduct ne null && tmp.stProductcontent ne null && tmp.stPrice ne null && tmp.stCount ne null && tmp.stContent ne null}">
			check[1] = 1;
			</c:if>
			<c:if test="${tmp.stReturn ne null && tmp.stChange ne null}">
			check[2] = 1;
			</c:if>
			//<c:if test="${tRList[0].trNo ne null}">
			//check[3] = 1;
			//</c:if>
			
			//작성 완료 된 항목 메시지 수정
			checkStore.each(function(index,item){
				if(check[index] == 1){
					$(checkStore[index]).text("작성완료");		
				}
			});
			
			//제출하기 버튼 눌렀을때 체크하고 작동
			$(".submit-btn").on("click",function(){
				if(confirm("작성 내용을 제출하시겠습니까?")){
					let count = 0;
					checkStore.each(function(index,item){
						if(check[index] == 1){
							count++;		
						}
					});
					if(count == 3){
						location.href="/CreateStore.do?stNo=${tmp.stNo}";
					}else{
						alert("필수 항목들을 모두 작성해주세요.");
					}	
				}
			});			
		});
	</script>
</body>
</html>