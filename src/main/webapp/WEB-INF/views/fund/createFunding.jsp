<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunFunFun</title>
<style>
	.content-wrap{
		width: 1000px;
		margin: 0 auto;
		margin-top: 50px;
		display: flex;
	}
	.content-left{
		width: 450px;
		height: 700px;
		padding-right: 50px;
	}
	.content-right{
		width: 550px;
	}
	.content-right>img{
		width: 550px;
		height: 700px;
	}
	.content-left>h2{
		padding-top: 35px;
	}
	.content-left>p{
		padding-top: 25px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	.content-left>form{
		padding-top: 30px;
	}
	.content-left>form>.form-control{
		width: 90%;
	}
	.content-left>form>.btn{
		width: 90%;
		margin-top: 30px;
		border-radius: 0px;
	}
	.fund-list{
		width: 1070px;
		margin: 0 auto;
		margin-top: 100px;
	}
	.list-wrap{
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.list-wrap>.list-btn{
		width: 35px;
		height: 200px;
		margin: 0;
		padding: 0;
		padding-bottom: 10px;
		border-radius: 0;
		font-size: 50px;
	}
	.list-content{
		width: 1000px;
		height: 200px;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
		overflow: hidden;
	}
	.content-all-wrap{
		display: flex;
		transition: 0.5s;
	}
	.fund-content-wrap{
		width: 250px;
		height: 200px;
		padding: 10px;
		display: flex;
		flex-direction: column;
	}
	.fund-content-wrap:hover{
		cursor: pointer;
	}
	.content-image>img{
		width: 230px;
		height: 140px;
	}
	.content-title{
		width: 230px;
		height: 40px;
		line-height: 40px;
		padding: 3px 10px;
		font-weight: 400;
		white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        color: #333;
	}
	.content-all-wrap>a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap">
		<div class="content-left">
			<br><br><br>
			<h2>
				비즈니스의<br>
				새로운 가능성을<br>
				발견하는 곳, 펀펀펀
			</h2>
			<p>
				매출과 고객, 꾸준한 성장의 기회까지.<br>
				메이커님의 성공적인 비즈니스의 여정을<br>
				펀펀펀이 함께합니다.<br>
			</p>
			<form action="/fundCreate.do" method="post">
				<input type="text" class="form-control" name="tfName" placeholder="펀딩 제목 입력">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<input type="submit" value="펀딩 생성하기" class="btn btn-outline-info">
			</form>
		</div>
		<div class="content-right">
			<img src="resources/image/createFund1.jpg" style="display:none;">
			<img src="resources/image/createFund2.jpg" style="display:none;">
			<img src="resources/image/createFund3.jpg" style="display:none;">
			<img src="resources/image/createFund4.jpg" style="display:none;">
		</div>
	</div>
	<c:choose>
		<c:when test="${sessionScope.m ne null }">
			<div class="fund-list">
				<h4>제작중인 펀드 리스트</h4>
				<div class="list-wrap">
					<button type="button" class="btn btn-outline-info list-btn left">&lt;</button>
					<div class="list-content">
						<div class="content-all-wrap">
							<c:choose>
								<c:when test="${fn:length(tfl) ne 0 }">
									<c:forEach var="tf" items="${tfl }" varStatus="status">
										<a href="/fundReadyFrm.do?tfNo=${tf.tfNo }">
											<div class="fund-content-wrap">
												<div class="content-image">
													<img src="/resources/image/fund/list${status.count % 4 }.jpg">
												</div>
												<div class="content-title">
													${tf.tfName }
												</div>
											</div>
										</a>
									</c:forEach>
								</c:when>
								<c:when test="${fn:length(tfl) eq 0 }">
									<div class="fund-content-wrap">
										<div class="content-image">
											<img src="/resources/image/fund/list1.jpg">
										</div>
										<div class="content-title">
											제작중인 펀딩이 없습니다.
										</div>
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>
					<button type="button" class="btn btn-outline-info list-btn right">&gt;</button>
				</div>
			</div>
			<div class="fund-list">
				<h4>진행중인 펀드 리스트</h4>
				<div class="list-wrap">
					<button type="button" class="btn btn-outline-info list-btn left">&lt;</button>
					<div class="list-content">
						<div class="content-all-wrap">
							<c:choose>
								<c:when test="${fn:length(fl) ne 0 }">
									<c:forEach var="tf" items="${fl }" varStatus="status">
										<a href="/manageFundingFrm.do?fundNo=${tf.fundNo }">
											<div class="fund-content-wrap">
												<div class="content-image">
													<img src="/resources/image/fund/flist${status.count % 4}.jpg">
												</div>
												<div class="content-title">
													${tf.fundName }
												</div>
											</div>
										</a>
									</c:forEach>
								</c:when>
								<c:when test="${fn:length(fl) eq 0 }">
									<div class="fund-content-wrap">
										<div class="content-image">
											<img src="/resources/image/fund/list1.jpg">
										</div>
										<div class="content-title">
											제작중인 펀딩이 없습니다.
										</div>
									</div>
								</c:when>
							</c:choose>
						</div>
					</div>
					<button type="button" class="btn btn-outline-info list-btn right">&gt;</button>
				</div>
			</div>
		</c:when>
	</c:choose>

	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	//이미지 담을 변수
	const image = $(".content-right>img");
	//보여주는 이미지 변수
	let cnt = 0;
	//seller 인지 체크하는 변수
	let seller = 0;
	
	//이미지 사라지는 함수
	function imageHide(cnt){
		$(image).eq(cnt).fadeOut(1000);	
	}
	
	//이미지 나타나는 함수
	function imageShow(cnt){
		$(image).eq(cnt).fadeIn(1000);	
	}
	
	
	$("[type=submit]").on("click",function(e){
		//펀딩 제목과 memberId를 체크할 변수
		const chk = [0,0];
		const tfName = $("[name=tfName]").val();
		const memberId = $("[name=memberId]").val();
		//펀딩 제목 체크
		if(tfName == ""){
			chk[0] = 0;
		}else{
			chk[0] = 1;
		}
		//로그인 상태 체크
		if(memberId == ""){
			chk[1] = 0;
		}else{
			chk[1] = 1;
		}
		//둘다 정상이 아니면 서브밋 비활성화
		if(chk[0] == 0 || chk[1] == 0 || seller == 0){
			alert("판매자 등록을 하신 후 펀딩 제목을 입력하여 주세요.");
			e.preventDefault();
		}
	});
	
	//펀드 리스트 호버시 타이틀 굵어지도록 효과
	$(".fund-content-wrap").hover(function(){
		const fundTitle = $(this).children().eq(1);
		$(fundTitle).css("font-weight",600);
	},function(){
		const fundTitle = $(this).children().eq(1);
		$(fundTitle).css("font-weight",400);
	});
	
	//임시펀드 리스트 좌우 버튼 이벤트
	let tmpFundMargin = 0;
	$(".list-btn.left").eq(0).on("click",function(){
		if(tmpFundMargin != 0){
			tmpFundMargin += 500;
			$(this).next().children().css("margin-left",tmpFundMargin+"px");	
		}
	});
	$(".list-btn.right").eq(0).on("click",function(){
		const tmpLength = -((${fn:length(tfl)} * 250)-1000);
		if(tmpFundMargin >= tmpLength){
			tmpFundMargin -= 500;
			$(this).prev().children().css("margin-left",tmpFundMargin+"px");	
		}
	});
	
	//펀드 리스트 좌우 버튼 이벤트
	let fundMargin = 0;
	$(".list-btn.left").eq(1).on("click",function(){
		if(fundMargin != 0){
			fundMargin += 500;
			$(this).next().children().css("margin-left",fundMargin+"px");	
		}
	});
	$(".list-btn.right").eq(1).on("click",function(){
		const tmpLength = -((${fn:length(fl)} * 250)-1000);
		if(fundMargin >= tmpLength){
			fundMargin -= 500;
			$(this).prev().children().css("margin-left",fundMargin+"px");	
		}
	});
	
	//페이지 로드 끝나면 이미지 효과 반복 작동
	$(document).ready(function(){
		<c:if test="${seller eq 1}">
			seller = ${seller};
		</c:if>
		//첫번째 이미지 바로 나타나도록
		imageShow(cnt);
		//4초마다 효과 반복
		setInterval(function(){
			imageHide(cnt);
			cnt++;
			//한바퀴 분기점
			if(cnt == 4){
				cnt = 0
				setTimeout("imageShow(cnt)", 1000);
			}else{
				setTimeout("imageShow(cnt)", 1000);	
			}
		},4000);
	});
	</script>
</body>
</html>