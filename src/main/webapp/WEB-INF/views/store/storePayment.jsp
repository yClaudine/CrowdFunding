<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 및 결제</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
html>body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="resources/css/bootstrap.css" rel="stylesheet"/>
<!-- 다음api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- import 결제 api -->
<!-- 결제API 사용을 위한 라이브러리 경로 추가 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
	.order{
		margin-bottom: 30px; 
	}
	.payAll-wrap{
		width: 1268px;
		margin: 0 auto;
		min-width: 900px;
		padding-top: 80px;
		text-align: center;
		justify-content: center;
	}
	.payinfo-box1{
		background-color: #04d4d4;
		border-top-left-radius: 15px;
		border-bottom-right-radius: 15px;
		width: 60%;
		height: 140px;
		margin: 0 auto;
	}
	
	.payinfo-box2{
		background-color: #fff;
		border-top-left-radius: 15px;
		border-bottom-right-radius: 15px;
		width: 70%;
		margin: 0 auto;
		height: 90px;
		margin-top: 10px;
		
	}
	.payinfo-box2>span{
		padding-left: 10px;
	}
	.receiver-box{
		display: flex;
		padding-left: 490px;
	}
	.check{
		padding-left: 10px;
		font-size: 15px;
	}
	.delivery-wrap,.notification{
		padding-top: 50px;
	}
	.new{
		padding: 5px 5px 0px;
	}
	.product-num{
		display: flex;
	}
	.product-num2{
		float: right;
	}
	#address{
		background-color: #00c4c4;
		border: none;
		border-radius: 5px;
		color: white;
		font-size: 15px;
		padding: 2px 2px 2px;
	}
	.delivery>button:hover{
		background-color: #00c4c4;
		color: #fff;	
	}
	.new,.delivery,.storeProduct-info,.notification>p,.use-coupon>select{
		font-size: 15px;
	}
	.delivery,.receiver-Box,.receiver-box{
		text-align: center;
	}
	.delivery{
		background-color: #e7f9f9;
		padding-bottom: 30px;
		margin-top: 30px;
	}
	.delivery>h5{
		padding-top:20px;
	}
	.delivery-wrap1{
		text-align: left;
	}
	.delivery-wrap{
		text-align: center;
		min-width: 960px;
	}
	.storeProduct-info>div:nth-child(2){
		padding-left: 595px;
	}
	.final-payinfo{
		padding-top: 30px;
		border: 6px solid #04d4d4;
		text-align: center;
		width: 60%;
		margin: 0 auto;
		padding-bottom: 30px;
		border-top-left-radius: 30px;
		border-bottom-right-radius: 30px;
		min-width: 680px;
	}
	.product-price{
		display: flex;
		padding-left: 200px;
		padding-top: 5px;
		padding-bottom: 5px;
	}
	.product-price>div:first-child{
		font-weight: bold;
	}
	.right{
		padding-left: 50px;
	}
	.submit-btn{
		text-align: center;
		padding-bottom: 130px;
	}
	.submit-btn>#submit{
		width: 40%;
		border: none;
		background-color: #e7f9f9;
		height: 50px;
		border-radius: 15px;
	}

	.allselect{
		float: right;
		padding-right: 20px;
		font-size: 15px;
	}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<hr>
		<div class="payAll-wrap">
			<div class="payinfo-wrap">
				<h3 class="order"><span class="material-symbols-outlined">credit_score</span>주문 및 결제</h3>
				<div class="payinfo-box1">
					<h5>주문 정보</h5>
					<div class="payinfo-box2">
						<span>주문자명 : </span><span id="samename">${m.memberName }</span><br>
						<span>이메일 주소 : </span>${m.memEmail }<br>
						<span>핸드폰 번호 : </span><span id="samephone">${m.memPhone }</span><br>
					</div>
				</div>
				<div class="delivery-wrap">
					<form action="/pay.do" method="post" id="frm1" name="frm1">
					<div class="delivery-wrap1">
						<div class="receiver-Box">
							<div class="receiver-box">
								<h5>배송 정보</h5><div class="check"><input type="checkbox" id="same" name="same"/>받는 분과 주문자가 동일</div>
							</div>
							<div class="receiver-new">
								<p> 받는 분</p>
								<div class="new">
									<input id="newName" placeholder="이름" type="text" name="deliveryName"/></div>
								<div class="new">
									<input id="newPhone" placeholder="010-0000-0000" type="text" name="deliveryPhone"/>
								</div>
							</div>
						</div>
						<div class="delivery">
							<div class="delivery-1">
								<h5 style="padding-top:30px; padding-bottom: 20px;">배송지</h5>
								<input type="text" id="sample4_postcode" placeholder="우편번호" name="deliveryAddress">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="input4">
								<input type="text" id="sample4_jibunAddress" placeholder="지번주소" name="input5">
								<span id="guide" style="color:#999;display:none"></span>
								<input type="text" id="sample4_detailAddress" placeholder="상세주소">
								<input type="text" id="sample4_extraAddress" placeholder="참고항목" name="input6">
							</div>
							<div class="delivery">	
								<h5 style="padding-bottom: 20px;">배송 메세지</h5>
								<select name="select-dMSG" name="deliveryMsg">
									<option value="" selected disabled>배송메세지를 선택하세요.</option> 
								    <option value="1">직접 수령하겠습니다.</option>
								    <option value="2">문 앞에 놓아주세요.</option>
								    <option value="3">배송 전 연락바랍니다.</option>
								</select>
							</div>
						</div>
						<div class="delivery-wrap">
							<div class="receiver-Box">
								<div class="receiver-box1">
									<h5>상품 정보</h5>
									<div class="storeProduct-info">
										<div class="product-name">상품이름 &nbsp;: &nbsp;${s.storeProduct}</div>
										<div class="product-num">
											<div class="product-num1">수량   &nbsp;&nbsp;:&nbsp;&nbsp; ${number } 개 </div>
										</div>
									</div>
								</div>
							</div>
						<div class="notification">
							<h5>배송 안내사항</h5>
							<p style="padding-bottom:40px;">코로나로 인한 택배 배송(간선하차) 불가로 일부 지역은 배송이 제한될 수 있습니다.<br>자세한 내용은 공지사항을 참고 부탁드립니다.</p>
						</div>
						<div class="use-coupon">
							<h5>쿠폰 사용</h5>
							<select id="select" name="couponNo">
									<option value="0">쿠폰을 선택하세요.</option> 									
								<c:forEach items="${cList }" var="coupon" varStatus="i">
									<option value="${coupon.couponNo }" type="${coupon.couponType}" discount="${coupon.discount }">${coupon.couponName}</option>
								</c:forEach>
							</select>
						</div>
					</div><br>
						<div class="final-payinfo">
							<h5 style="background-color:#e7f9f9;">결제금액</h5>
							<div class="product-price">
								<div>상품금액</div><div class="right">${totalprice} 원</div>
							</div><div class="product-price">
								<div>쿠폰할인금액</div><div class="right" id="couponDiscount">0</div>
							</div>
							<div class="product-price">
								<div>배송비</div><div class="right" id="deliveryPrice">${s.storeDelivery }</div>
							</div><hr>
							<div class="product-price">
								<input type="hidden" name="storeNo" value="${s.storeNo }">
								<input type="hidden" name="memberNo" value="${m.memberNo }">
								<input type="hidden" name="storeDelivery" value="${s.storeDelivery }">
								<input type="hidden" name="storePrice" value="${s.storePrice }">
								<input type="hidden" name="storepayAllprice" value="${totalprice }" id="changePrice">
								<input type="hidden" name="number" value="${number }">
								<div>최종 결제금액</div><div class="right" id="finalPrice">${totalprice }</div>
							</div>
							<input type="checkbox" id="chk" name="service" class="button"/> 구매조건, 결제 진행 및 결제 대행 서비스 / 개인정보 제 3자 제공 동의(필수)
						</div><br>
							
						<div class="submit-btn"><button id="submit" type="button" disabled onclick="requestPay()">결제하기</button></div>
						<input type="submit" id="submitBtn">
					</div>
					</form>
				</div>
			</div>
		</div>

<%@include file="/WEB-INF/views/common/footer.jsp" %>
<script>
$("#select").on("change",function(){
	const type = $(this).children(":selected").attr("type");
	const discount = $(this).children(":selected").attr("discount");
	//배송비
	const resultElement1 = document.getElementById('deliveryPrice');
	let deliveryPrice = resultElement1.innerText;
	//변동금액
	const resultElement2 = document.getElementById('changePrice');
	let changePrice = resultElement2.value;
	//쿠폰 적용될 금액
	const resultElement3 = document.getElementById('finalPrice');
	let finalPrice = resultElement3.innerText;
	
	console.log(type,discount,deliveryPrice,changePrice);	//금액 확인 완료
	/*1.couponType= 0 일땐 최종금액 = 총금액 - 배송비
	2.couponType=1 일 땐 최종금액 = 총금액 - (총금액0.01discount)
	3.couponType=2 일 땐 최종금액 = 총금액 - discount*/
	
	if(type==0){
		finalPrice = changePrice - deliveryPrice;
	}else if(type==1){
		finalPrice = changePrice-(discount * 0.01 * changePrice)
	}else{
		finalPrice = changePrice - discount;
	}
	console.log(finalPrice);
	$("#couponDiscount").text(changePrice-finalPrice+"원");
	$("#finalPrice").text(finalPrice);
});

$(".box button").attr("disabled", true);
$("#chk").on('click',function(){
    var chk = $('input:checkbox[id="chk"]').is(":checked");
    
    if(chk==true){
        $(".submit-btn button").removeAttr('disabled');
        $(".submit-btn").removeClass("on");
    }else{
        $(".submit-btn button").attr("disabled", true);
        $(".submit-btn").addClass("on");
    }
});

$('input:checkbox[id="same"]').on('click',function(){
	var check = $('input:checkbox[id="same"]').is(":checked");
	//멤버 이름 정보 가져오기
	const resultElement1 = document.getElementById('samename');
	let samename = resultElement1.innerText;
	//멤버 폰번호 가져오기
	const resultElement2 = document.getElementById('samephone');
	let samephone = resultElement2.innerText;
	if(check==true){
		$("#newName").val(samename);
		$("#newPhone").val(samephone);
	}else{
		$("#newName").val('');
		$("#newPhone").val('');
	}

});




//위치 api
function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }

	
	function requestPay() {
		
		//쿠폰 적용될 금액
		const resultElement3 = document.getElementById('finalPrice');
		let finalPrice = resultElement3.innerText;
		theForm=document.frm1;  		
		if(theForm.deliveryName.value=="" || theForm.deliveryPhone.value=="" || theForm.deliveryAddress.value=="" || theForm.input4.value=="" || theForm.input5.value=="" || theForm.input6.value=="" ){
			alert("필수 입력란이 비었습니다. 확인해 주세요.");
			return;
		}else{
			//거래 고유ID생성을 위해 현재 결제 날짜를 이용하여 처리
			const d = new Date();
			//date 값 생성 시 "" 를 더하지 않으면 숫자 + 연산이 되므로 문자 덧셈을 위해 추가, month는 0~11이 되니까 +1 해준 거
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
		  IMP.init('imp93003387'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    merchant_uid : '${s.storeNo}'+date,
		    name : '결제테스트',
		    amount : finalPrice,
		    buyer_email : '${m.memEmail }',
		    buyer_name : '${m.memberName }',
		    buyer_tel : '${m.memPhone }',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		  }, function (rsp) { // callback
		      if (rsp.success) {
		    	console.log("결제가 완료되었습니다.");
				console.log("고유ID : "+rsp.imp_uid);
				console.log("상점거래ID : "+rsp.merchant_uid);
				console.log("결제금액 : "+rsp.paid_amount);
				console.log("카드승인번호 : "+rsp.apply_num);
				//결제금액value를 넣어줄 곳
				const resultElement3 = document.getElementById('finalPrice');
				let finalPrice = resultElement3.innerText;
				$("#submitBtn").click();				
				
		      } else {		    	  
		    	  alert("결제 도중 에러가 발생했습니다. 관리자에게 문의하세요.");
		      }
		  });
		}
	}
	
</script>
</body>
</html>