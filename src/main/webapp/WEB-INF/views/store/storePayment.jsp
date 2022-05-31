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
		height: 110px;
		margin: 0 auto;
	}
	
	.payinfo-box2{
		background-color: #fff;
		border-top-left-radius: 15px;
		border-bottom-right-radius: 15px;
		width: 70%;
		margin: 0 auto;
		height: 60px;
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
	.submit-btn>#submit:hover{

		background-color: #00c4c4;
		color: #fff;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<hr>
	<div class="payAll-wrap">
		<div class="payinfo-wrap">
			<h3 class="order">${s.storeTitle }주문 및 결제</h3>
			<div class="payinfo-box1">
				<b><a>주문 정보</a></b>
				<div class="payinfo-box2">
					<span>주문자명</span><span>${m.memberId }</span><br>
					<span>이메일 주소</span>${m.memEmail }
				</div>
				
			</div>
			<div class="delivery-wrap">
			<div class="delivery-wrap1">
				<div class="receiver-Box">
					<div class="receiver-box">
						<h5>배송 정보</h5><div class="check"><input type="checkbox" id="same" name="same" value="deliveryName"/>받는 분과 주문자가 동일</div>
					</div>
					<div class="receiver-new">
						<p>< 받는 분 ></p>
						<div class="new">
						<input name="newName" placeholder="이름" type="text"/></div>
						<div class="new">
						<input name="newPhone" placeholder="010-0000-0000" type="text"/>
						</div>
					</div>
				</div>
				<div class="delivery">
					<div class="delivery-1">
					<h5 style="padding-top:30px; padding-bottom: 20px;">배송지</h5>
					<button id="address">우편번호 검색</button>
					<input name="newName" placeholder="상세주소" type="text"/>
					</div>
				
					<div class="delivery">	
						<h5 style="padding-bottom: 20px;">배송 메세지</h5>
						<select name="select-dMSG">
							<option value="orange">배송지 요청사항을 선택해주세요.</option>
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
							<div class="product-name">상품이름 : ${s.storeProduct}</div>
							<div class="product-num">
								<div class="product-num1">수량 : 1개 </div><div class="product-num2"> 원 </div>
							</div>
						</div>
					</div>
				</div>
					<div class="notification">
						<h5>배송 안내사항</h5>
						<p style="padding-bottom:40px;"">코로나로 인한 택배 배송(간선하차) 불가로 일부 지역은 배송이 제한될 수 있습니다.<br>자세한 내용은 공지사항을 참고 부탁드립니다.</p>
					</div>
					<div class="use-coupon">
						<h5>쿠폰 사용</h5>
						<select name="select-coupon">
							<c:forEach items="${cList }" var="c"> ${c.couponName} </c:forEach>
							<option value="orange">사용가능한 쿠폰이 없습니다.</option>
						   	<option value="orange">오렌지</option>
						   	<option value="melon">멜론</option>
						</select>
					</div>
					
		</div><br>
					<div class="final-payinfo">
						<h5 style="background-color:#e7f9f9;">결제금액</h5>
						<div class="product-price">
							<div>상품금액</div><div class="right">${s.storePrice }</div>
						</div><div class="product-price">
							<div>쿠폰할인금액</div><div class="right">${mc.mem_coupon_no }</div>
						</div>
						<div class="product-price">
							<div>배송비</div><div class="right">${s.storeDelivery }</div>
						</div><hr>
						<div class="product-price">
							<div>최종 결제금액</div><div class="right">최종 결제금액 작성</div>
						</div><br>
						<input type="checkbox" id="service" name="service"/>구매조건, 결제 진행 및 결제 대행 서비스 동의(필수)
						<input type="checkbox" id="three" name="three"/> 개인정보 제 3자 제공 동의(필수)
					</div><br>
					<div class="submit-btn">
					<button id="submit">결제하기</button>
					</div>
			</div>
		</div>
	</div>
	
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>