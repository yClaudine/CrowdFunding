<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FUNFUNFUN Store신청하기</title>
<style>
	.content-wrap{
		width: 1300px;
		margin: 0 auto;
		margin-top: 10px;
		display: flex;
	}
	.content-left{
		padding-left: 30px;
		padding-top: 100px;
		width: 550px;
		height: 100vh;
		background-color: #e7f9f9;

	}
	.content-right{
		padding-top: 50px;
		width: 700px;
		background-image: url(/resources/image/store/back2.png);
		padding-left: 20px;
	}
	.content-right>p{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 35px;
		font-weight: bold;
	}
	.sellername{
		padding-left: 100px;
	}
	.content-left>form>.form-control{
		width: 90%;
	}
	.content-left>form>.btn{
		width: 90%;
		margin-top: 30px;
		border-radius: 0px;
	}
	#stCategory{
		color: #212529;
		border-color: #00c4c4;
	}
	#stCategory:not(:last-child){
		margin-right: 30px;
	}
	#stCategory{
		margin-top: 30px;
		margin-left: 15px;
		font-weight: bold;
		font-size: 15px;
	}
	#stCategory:hover{
		color: white;
		background-color: #00c4c4;
	}
	.check-box{
		border-bottom: 1px solid #868e96;
		padding-bottom: 20px;
	}
	#nextbutton{
		margin-top: 20px;
		margin-left: 550px;
	}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<link
         href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
         rel="stylesheet"
         integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
         crossorigin="anonymous"
      />

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap">
		<!-- &nbsp; 1칸 띄어쓰기 &ensp; 2칸 띄어쓰기 &emsp; 3칸띄어쓰기 -->
		<div class="content-left">
				<h1>
					FUN<br>
					&ensp;FUN<br>
					&ensp;&ensp;FUN<br>
					<br>
					&emsp;&emsp;&emsp;FUN(뻔)하지 않은<br>
					&emsp;&emsp;&emsp;나의 스토어<br>
					<br>
					&emsp;&emsp;&emsp;&emsp;&emsp;FUN STORE
				</h1>	
		</div>
		<div class="content-right">
			<p class=sellername>
				${sessionScope.m.memberName} SELLER 님,<br>
				&emsp;&emsp;마지막으로 이런 준비가 필요해요.<br>
			</p>
			<p style="font-size:15px; font-weight:normal;">
				스토어를 진행하시려면 아래 내용을 준비해 주세요.<br>
			</p>
			<div class="check-box">
				<div class="form-check form-switch">
	                <input class="form-check-input check1" type="checkbox" id="flexSwitchCheckDefault" style="margin-top: 5px;">
	                <label class="form-check-label" for="flexSwitchCheckDefault" style="font-size: 15px;">스토어를 진행하기 위해서는 만 19세 이상의 성인이어야 합니다.</label> 
				</div>
	            <div class="form-check form-switch">
	                <input class="form-check-input check2" type="checkbox" id="flexSwitchCheckDefault" style="margin-top: 5px;">
	                <label class="form-check-label" for="flexSwitchCheckDefault" style="font-size: 15px;">본인(회사) 명의로 된 통장을 보유하고 있어야 합니다.</label> 
				</div>
			</div>
				<div class="checknext">
					<button type="button" class="btn btn-outline-dark" id="nextbutton">시작하기</button>
				</div>     


			</div>
</div>
	<script>
		$("#nextbutton").click(function(){
			var ok = document.querySelector('.check1'),
			ok2 = document.querySelector('.check2');
			if(ok.checked == true && ok2.checked == true){
				//화면 이동 바꿔야 됨
				location.href='/storeReadyFrm.do?stNo='+${stNo};
			}else{
				alert("약관 동의 체크를 모두 해 주시길 바랍니다.")
				return;
			}
		})
		
	
	
	</script>
</body>

</html>