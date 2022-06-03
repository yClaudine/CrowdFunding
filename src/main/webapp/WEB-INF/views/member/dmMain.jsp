<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<link href="resources/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="resources/css/message.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<style>
.fourth1>span:hover {
	cursor: pointer;
}

.recDetail:hover {
	cursor: pointer;
	text-decoration: underline;
}

.sendDetail:hover {
	cursor: pointer;
	text-decoration: underline;
}

.mc2 {
	height: 400px;
}
</style>
<body>
	<!-- 첫 번째 Modal을 여는 클래스 -->
	<div class="btns" style="width: 40px; height: 40px;">
		<span class="material-symbols-outlined" id="mail"> mail </span> <span
			id="num">1</span>
	</div>

	<!-- 첫 번째 Modal -->
	<div class="modal">

		<!-- 첫 번째 Modal의 내용 -->
		<div class="modal-contents">
			<input type="hidden" id="memberId" value="${sessionScope.m.memberId}">
			<div class="header1">
				<div class="first1">
					<span class="material-symbols-outlined" id="con">
						contact_mail </span>
				</div>
				<div class="second1">
					<span class="user">user1</span> <span class="close">&times;</span>
				</div>
				<div class="third1">
					<button class="btn btn-primary" id="sendbtn" type="button"
						onclick="sendDmModal();">메시지보내기</button>
				</div>
				<div class="fourth1">
					<span class="recv" onclick="recvMemId();">수신</span> <span
						class="send" onclick="sendMemId();">발신</span>

				</div>

			</div>

			<div class="receiveContent content">
				<table class="table table-hover rT">
					<thead>
						<tr class="table-default down">
							<th>보낸사람</th>
							<th>제목</th>
							<th>발신 시간</th>
							<th>경고 여부</th>
							<th>읽음 여부</th>
						</tr>
					</thead>
					<tbody>


					</tbody>
					<tfoot>
					</tfoot>
				</table>
				<div class="footer"></div>
			</div>
			<div class="sendContent content">
				<table class="table table-hover sT">
					<thead>
						<tr class="table-default down"
							style="border-bottom: 1px solid #eee;">
							<th>받는 사람</th>
							<th>제목</th>
							<th>수신 시간</th>
							<th>읽음 여부</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
					<tfoot>
					</tfoot>
				</table>
			</div>

		</div>
	</div>

	<hr>
	<!-- 두 번째 Modal을 여는 클래스 -->
	<div class="btns">MODAL_2</div>

	<!-- 두 번째 Modal -->
	<div class="modal">

		<!-- 두 번째 Modal의 내용 -->
		<div class="modal-contents mc2">
			<table class="table down">
				<tr class="table-info down">
					<th colspan="1"
						style="border-top-left-radius: 10px; line-height: 50px; border-right: 1px solid rgba(0, 0, 0, 0.2); width: 60px;">제목</th>
					<td colspan="4" 
						style="border-top-right-radius: 10px; line-height: 50px;"
						scope="col"><span class="cmTitle"></span><span class="close">&times;</span></td>
				</tr>
				<tr class="table-light down">
					<th colspan="1" style="line-height:50px;" class=Cw>작성자</th>
					<td colspan="4" class="cmWriter" style="line-height: 50px;" scope="col"></td>

				</tr>
				<tr class="table-light down">
					<th colspan="1"
						style="line-height: 140px; width: 50px; border-right: 1px solid rgba(0, 0, 0, 0.2)">내용</th>
					<td colspan="4" class="cmContent" rowspan="1" style="height: 140px;"></td>
				</tr>
				<tr class="down receiveCk">
					<th colspan="3" class="Cd">작성일 </th>
					<td class="cmDate"></td>
				</tr>
				<tr>
					<td colspan="5" rowpan="2"
						style="border-bottom: none; padding-left: 250px">
						<input type="hidden" class="dmNo">
						<button class="btn btn-primary btnd" onclick="reply();">답장</button>
						<button class="btn btn-primary btnd" onclick="closeModal2();">확인</button>
					</td>

				</tr>

			</table>
		</div>
	</div>

	<div class="btns">MODAL_3</div>

	<!-- 세 번째 Modal -->
	<div class="modal">

		<!-- 세 번째 Modal의 내용 -->
		<div class="modal-contents3">
			<table class="table">
				<tr class=" down">
					<th colspan="1"
						style="border-top-left-radius: 10px; line-height: 50px; border-right: 1px solid rgba(0, 0, 0, 0.2);">선택</th>
					<td colspan="4"
						style="border-top-right-radius: 10px; line-height: 50px;"
						scope="col">
						<button class="btn btn-primary btnd choice">멤버</button>
						<button class="btn btn-primary btnd choice">펀딩</button>
						<button class="btn btn-primary btnd choice">스토어</button> <span
						class="close">&times;</span>
					</td>

				</tr>
				<tr class="down">
					<th colspan="1">제목</th>
					<td colspan="4" style="height: 40px;"><input type=text
						id="mTitle" class="modalInput mTitle" name="mTitle"></td>

				</tr>
				<tr class="down">
					<th colspan="1">발신자</th>
					<td>${sessionScope.m.memberId}</td>

				</tr>
				<tr class="down">
					<th colspan="1" class="receiver">수신자</th>
					<td><select class="form-select select" name="recvMemId">

					</select></td>

				</tr>
				<tr class="table-light down">
					<th colspan="1"
						style="line-height: 140px; width: 60px; border-right: 1px solid rgba(0, 0, 0, 0.2)">내용</th>
					<td colspan="4" rowspan="1" style="height: 140px;"><textarea
							class="modalInput" name="mContent" id="mContent"
							style="width: 300px;" rows="10" placeholder="100자 이내로 입력해주세요"></textarea></td>
				</tr>
				<tr class="down receiveCk">
					<th colspan="3">수신확인 <span>20212.2321</span></th>

				</tr>
				<tr>
					<td colspan="5" rowspan="2"
						style="border-bottom: none; padding-left: 250px">

						<button class="btn btn-primary btnd" onclick="dmSend();">전송</button>
						<button class="btn btn-primary btnd" onclick="closeModal();">확인</button>
					</td>

				</tr>

			</table>
		</div>
	</div>
	<script>
		//전역변수 선언 
		let memberId;
		//웹 소켓 
		let ws;
		let category;

		var modals = $(".modal");
		var btns = $(".btns");
		var spanes = $(".close");
		var choice = $(".choice");

		//펀딩 스토어 멤버에 따라서 다른 카테고리를 전달하기 위한 버튼 
		choice.each(function(index, item) {
			$(this).on("click", function() {
				for (let i = 0; i < choice.length; i++) {
					choice.eq(i).css({
						"background-color" : "#0d6efd"
					});
				}
				$(this).css({
					"background-color" : "#00c4c4",
					"box-shadow" : "none",
					"border" : "1px solid #00c4c4"
				});
			});
		});

		btns.each(function(index, item) {
			$(this).on("click", function() {
				modals.eq(index).css({
					"display" : "block"
				});
				recvMemId();
				choice.eq(0).click();
			});
			spanes.eq(index).on("click", function() {
				modals.eq(index).css({
					"display" : "none"
				});
			});
		});
		//메시지 수신 
		function recvMemId() {
			memberId = $("#memberId").val();
			$(".recv").addClass("active");
			$(".send").removeClass("active");
			$(".sendContent").hide()
			$(".receiveContent").show();
			$
					.ajax({
						url : "/getDmList.do",
						type : "post",
						data : {
							memberId : memberId,
							check : 0
						},
						success : function(list) {
							if (list.length == 0) {
								const table = $(".rT>tbody");
								table.empty();
								const span = $("<span class='material-symbols-outlined'>")
								span.text("priority_high");
								span.css({
									"padding-top" : "10px",
									"color" : "red"
								});
								const span2 = $("<span>");
								span2.text("받은 쪽지가 없습니다");
								table.append(span);
								table.append(span2);
								span2.css({
									"border-top" : "none",
									"color" : "red"
								});

							} else {
								const table = $(".rT>tbody");
								table.empty();
								for (let i = 0; i < list.length; i++) {

									const tr = $("<tr>");
									const tdh = $("<td>");
									tdh.text(list[i].dmNo);
									tdh.css({
										"display" : "none"
									});
									tr.append(tdh);
									tr.css({
										"font-size" : "12px"
									});
									tr.addClass("table-light");
									const td = $("<td>");
									td.css({
										"width" : "80px"
									});
									td.text(list[i].sendMemId);
									tr.append(td);
									const td1 = $("<td>");
									const div = $("<div>")
									div.text(list[i].mTitle);
									div.addClass("recDetail");
									div.css({
										"width" : "60px",
										"white-space" : "nowrap",
										"text-overflow" : "ellipsis",
										"overflow" : "hidden"

									});
									td1.append(div);

									const td2 = $("<td>");
									td2.text(list[i].mDatetime);
									const td3 = $("<td>");
									const td4 = $("<td>");
									if (list[i].warning == 1) {
										td3.addClass("warning");
										td3.text("!");
										$(".warning").css({
											"text-align" : "center",
											"font-size" : "13px",
											"font-color" : "red",
											"width" : "80px"
										});
									} else {
										td3.text("X");
										td3.css({
											"line-height" : "30px",
											"text-align" : "center",
											"font-size" : "13px",
											"color" : "green",
											"width" : "80px"
										});
									}
									if (list[i].readCk == 1) {

										td4.text("1");
										td4.css({
											"text-align" : "center",
											"font-size" : "18px",
											"color" : "#FBCB0A",
											"width" : "80px"
										});
									} else {
										td4.text("0");
										td4.css({
											"text-align" : "center",
											"font-size" : "18px",
											"color" : "green",
											"width" : "80px"
										});
									}
									tr.append(td);
									tr.append(td1);
									tr.append(td2);
									tr.append(td3);
									tr.append(td4);
									table.append(tr);

								}//else일때 나오는 값 
								//쪽지 값 불러오기 

							}
						}//success

					});

		}
		//수신자 정보 ajax로 값 가져오기

		//메시지 발신 상태 ajax
		function sendMemId() {
			$(".send").addClass("active");
			$(".recv").removeClass("active");
			$(".sendContent").show()
			$(".receiveContent").hide();
			$
					.ajax({
						url : "/getDmList.do",
						type : "post",
						data : {
							memberId : memberId,
							check : 1
						},
						success : function(list) {
							if (list.length == 0) {
								const table = $(".sT>tbody");
								table.empty();
								const span = $("<span class='material-symbols-outlined'>")
								span.text("priority_high");
								span.css({
									"padding-top" : "10px",
									"color" : "red"
								});
								const span2 = $("<span>");
								span2.text("받은 쪽지가 없습니다");
								table.append(span);
								table.append(span2);
								span2.css({
									"border-top" : "none",
									"color" : "red"
								});
								//받은 쪽지가 없을 경우에 
							} else {
								const table = $(".sT>tbody");
								table.empty();
								for (let i = 0; i < list.length; i++) {

									const tr = $("<tr>");
									const tdh = $("<td>");
									tdh.text(list[i].dmNo);
									tdh.css({
										"display" : "none"
									});
									tr.append(tdh);
									tr.css({
										"font-size" : "12px"
									});
									tr.addClass("table-light");
									const td = $("<td>");
									td.css({
										"width" : "80px"
									});
									td.text(list[i].recvMemId);
									tr.append(td);
									const td1 = $("<td>");
									const div = $("<div>");
									div.text(list[i].mTitle);
									div.addClass("sendDetail");
									div.css({
										"width" : "60px",
										"white-space" : "nowrap",
										"text-overflow" : "ellipsis",
										"overflow" : "hidden"

									});
									td1.append(div);
									const td2 = $("<td>");
									td2.text(list[i].mRectime);
									const td3 = $("<td>");
									if (list[i].readCk == 1) {

										td3.text("1");
										td3.css({
											"text-align" : "center",
											"font-size" : "18px",
											"color" : "#FBCB0A",
											"width" : "80px"
										});
									} else {
										td3.text("0");
										td3.css({
											"text-align" : "center",
											"font-size" : "18px",
											"color" : "green",
											"width" : "80px"
										});
									}
									tr.append(td);
									tr.append(td1);
									tr.append(td2);
									tr.append(td3);
									table.append(tr);

								}//else일때 나오는 값 
								//쪽지 값 불러오기 

							}
						}//success

					});
		}//발신자 정보 ajax로 값 가져오기 

		//메세지를 보낼 대 사용하는 모달 . 
		function sendDmModal() {
			let memberId = $("#memberId").val();
			console.log(memberId);

			choice
					.each(function(index, item) {
						choice.eq(0).click();
						$(this)
								.on(
										"click",
										function() {
											if (index == 0) {
												category = 3;
												$
														.ajax({
															url : "/selectAllMember.do",
															success : function(
																	list) {
																$(
																		"[name=recvMemId]")
																		.empty();
																for (let i = 0; i < list.length; i++) {
																	//관리자나 자기자신에게 메시지를 보낼 수 없도록 진행 
																	if (list[i].categoryNo != 0
																			&& list[i].memberId != memberId) {
																		let option = $("<option>");
																		option
																				.append(list[i].memberId);
																		$(
																				"[name=recvMemId]")
																				.append(
																						option);
																	}

																}

															}

														});
											}
											//멤버일 때 seller를 불러옴 
										});
					});

			modals.eq(2).css("display", "block");
		}
		function closeModal() {
			$(".modal").eq(2).css("display", "none");
			$("[name=mContent]").val("");
			$("[name=mTitle]").val("");
		}
		function closeModal2() {
			$(".modal").eq(1).css("display", "none");
		}
		//동적 진행 쿼리에서 구현
		$(function() {
			memberId = $("#memberId").val();

			//웹소켓을 구현할 함수를 만들어줍니다.
			//먼저 주소를 지정해줍니다
			ws = new WebSocket("ws://localhost/dm.do");
			//연결했을 때
			ws.onopen = onOpen;
			//메시지를 받았을 때 
			ws.onmessage = receiveMsg;
			//닫았을 때 각각 함수를 만들어줍니다. 
			ws.onclose = onClose;

			//디테일을 보기위한 함수 발신 상세보기 
			$(document).on("click", ".sendDetail", function() {
				const dmNo = $(this).parent().prev().prev().text();
				$(".Cd").empty();
				$(".Cd").text("수신일");
				$(".Cw").empty();
				$(".Cw").text("수신자");
				$(".cmDate").empty();
				$(".cmContent").empty();
				$(".cmTitle").empty();
				$(".cmWriter").empty();
				$.ajax({
					url :"selectOneDm.do",
					type : "post",
					data :{dmNo:dmNo},
					success: function(list){
						$(".cmDate").text(list.mRectime);
						$(".cmContent").text(list.mContent);
						$(".cmTitle").text(list.mTitle);
						$(".cmWriter").text(list.recvMemId);
						modals.eq(1).css({
							"display":"block"
						});
					}
				});

			});
			// 수신자 상세보기 
			$(document).on("click", ".recDetail", function() {
				const dmNo = $(this).parent().prev().prev().text();
				let sendMemId;
				$(".Cd").empty();
				$(".Cd").text("발신일");
				$(".Cw").empty();
				$(".Cw").text("작성자");
				$(".cmDate").empty();
				$(".cmContent").empty();
				$(".cmTitle").empty();
				$(".cmWriter").empty();
				$.ajax({
					url :"selectOneDm.do",
					type : "post",
					data :{dmNo:dmNo},
					success: function(dm){
						sendMemId = dm.sendMemId;
						$(".cmDate").text(dm.mDatetime);
						$(".cmContent").text(dm.mContent);
						$(".cmTitle").text(dm.mTitle);
						$(".cmWriter").text(dm.sendMemId);
						$(".dmNo").val("");
						$(".dmNo").val(dmNo);
						
						modals.eq(1).css({
							"display":"block"
						});
						
					}
				});
				//ajax로 정보를 가져와 연결 
				$.ajax({
					url : "/readCk.do",
					type :"post",
					data : {dmNo : dmNo},
					success : function(data){
						console.log(data);
						if(data>0){
							recvMemId();
							const data1 = {type : "read", memberId : memberId}
							ws.send(JSON.stringify(data1));
							
							

						}
					}
				});
				//ajax청보처리 완료
				//답장을 위한 모달 만들어서 전송 
				
			
			});

		});
		
		function reply(){
			let dmNo = $(".dmNo").val();
			$.ajax({
				url : "selectOneDm.do",
				type : "post",
				data : {dmNo:dmNo},
				success : function(data){
					$("[name=recvMemId]").val("");
					modals.eq(2).css({
						"display" : "block"
					});	
					console.log(data);
				}
				
			});
			
			
		}
		function onOpen() {
			//아이디를 전송합니다. 

			const data = {
				type : "enter",
				memberId : memberId
			};
			console.log(data);
			ws.send(JSON.stringify(data));
		}

		//데이터 보내기
		function dmSend() {
			const memberId = $("#memberId").val();
			const receiver = $("[name=recvMemId]").val();
			const dmContent = $("[name=mContent]").val();
			const mTitle = $("[name=mTitle]").val();

			//소켓으로 데이터를 보내줄 것임
			const data = {
				type : "dmSend",
				sendMemId : memberId,
				recvMemId : receiver,
				mContent : dmContent,
				category : category,
				mTitle : mTitle

			}
			console.log(data);
			ws.send(JSON.stringify(data));
			sendMemId();
			recvMemId();
			closeModal();
		}
		function receiveMsg(param) {
			console.log(param);
			$("#num").text(param.data);
			recvMemId();
			sendMemId();
		}
		function onClose() {

		}
	</script>
</body>
</html>