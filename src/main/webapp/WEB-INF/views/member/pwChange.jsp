<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>pwChange</title>

<link rel="stylesheet" href="resources/css/pwChange.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="resources/js/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap')
	;
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="content">
		<h5>
			<span class="material-symbols-outlined" id="setting">settings</span>
			설정
		</h5>
		<ul class="pwChange">
			<div>비밀번호 변경</div>
			<li class="wrapper">
			<input type="hidden" name="memberId" value="${sessionScope.m.memberId}"> 
			<input type="password" name="memberPw" id="prePw" placeholder="기존 비밀번호를 입력하세요">
				<div></div>
			</li>
			<form action="changePw.do">
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId}"> 
				<li class="wrapper"><input type="password" name="memberPw"
					id="newPw" placeholder="새 비밀번호 입력">
					<div></div> <input type="password" name="memberPwRe" id="newPw2"
					placeholder="비밀번호 확인">
					<div></div></li>

				<button class="btn btn-outline-success" id="pwChange">비밀번호
					변경</button>
				<div></div>

			</form>
		</ul>
	</div>

	<script>
		$(function() {
			const prePw = $("#prePw");
			const newPw = $("#newPw");
			const newPw2 = $("#newPw2");
			const memberId = $("[name=memberId]").val();
			const arr = [ false, false, false ];
			const reg = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			prePw.on("change", function() {
				const memberPw = prePw.val();
		
				$.ajax({
					url : "/findPw.do",
					data : {
						memberId : memberId,
						memberPw : memberPw
					},
					type : "post",
					success : function(data) {
						if (data == "null") {
							arr[0] = false;
							prePw.next().text("비밀번호가 맞지 않습니다.");
							prePw.removeClass();
							prePw.addClass("form-control is-invalid");
							prePw.next().css({
								"color" : "red",
								"font-size" : "8px"
							});
						} else {
							arr[0] = true;
							prePw.removeClass();
                            prePw.addClass("form-control is-valid");
                            prePw.next().empty();
                             
						}

					},
					error : function() {
						console.log("서버요청실패");
					}
				});
			});

			newPw.on("change", function() {
				if (!reg.test(newPw.val())) {

					arr[1] = false;
					$(this).removeClass();
					$(this).addClass("form-control is-invalid");
					$(this).next().text("최소 8자 하나이상에 문자와 숫자,기호를 입력해주세요");
					$(this).next().css({
						"color" : "red",
						"font-size" : "8px",
						"margin-top" : "5px"
					});
				} else {
					arr[1] = true;
					$(this).removeClass();
					$(this).addClass("form-control is-valid");
					$(this).next().text("")

				}

			});
			newPw2.on("change", function() {
				if (newPw.val() != newPw2.val()) {
					arr[2] = false;
					$(this).removeClass();
					$(this).addClass("form-control is-invalid");
					$(this).next().text("비밀번호가 맞지 않습니다");
					$(this).next().css({
						"color" : "red",
						"font-size" : "8px",
						"margin-top" : "5px"
					});

				} else {
					arr[2] = true;
					$(this).removeClass();
					$(this).addClass("form-control is-valid");
					$(this).next().text("");
				}
			});
			const btn = $("#pwChange")
			btn.on("click", function(e) {

				if (arr[0] && arr[1] && arr[2]) {

				} else {
					e.preventDefault();
					$(this).next().text("조건이 충족되지 않았습니다.");
					$(this).next().css({
						"color" : "red",
						"font-size" : "8px",
						"margin-top" : "3px"
					});

				}
			});

		});
	</script>
</body>
</html>