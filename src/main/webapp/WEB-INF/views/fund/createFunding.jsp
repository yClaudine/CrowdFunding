<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
	//이미지 담을 변수
	const image = $(".content-right>img");
	//보여주는 이미지 변수
	let cnt = 0;
	
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
		if(chk[0] == 0 || chk[1] == 0){
			alert("로그인을 하시고 펀딩 제목을 입력하여 주세요.");
			e.preventDefault();
		}
	});
	
	//페이지 로드 끝나면 이미지 효과 반복 작동
	$(document).ready(function(){
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