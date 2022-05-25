<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
view test

	<div class="count">
		 <span>수량</span>
		 <span class="btn bc3">-</span>
		 <span class="amount">1</span>
		 <span class="btn bc3">+</span>
	</div>
				<div class="total">
					총
					<!-- totalPrice 숫자는 '원' 포함하지 않아야 결제할 때 금액이 결제 제대로 됨!! -->
					<span id="totalPrice">1100</span>원
				</div>
				<button id="payment" class="btn bc1 bs4">결제하기</button>
			</div>
                   
<script>
$(".count>.btn").on("click",function(){
    let currAmount = Number($(".amount").text());
    //this = 둘 중(+,-) 현재 '클릭'한 버튼
    if($(this).text()=='+'){
        currAmount++;
    }else{
        if(currAmount != 1){//하한선 1이상 되도록 설정
            currAmount--;
        }
    }
    $(".amount").text(currAmount);
    const price = Number($(".price").children().first().text());
    $("#totalPrice").text(currAmount*price);
});
          
</script>
                
</body>
</html>