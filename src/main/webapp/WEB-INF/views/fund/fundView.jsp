<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                   
                   
                        <!--주소 API-->
                        <div class="address-wrap">
                            <button id="post-find" class="post-find" onclick="searchAddr();">우편번호 검색</button>
                            <div type="text" name="postcode" id="postcode" class="post-fix" placeholder="우편번호" readonly>
                            <div type="text" name="address" id="address" class="post-fix" placeholder="주소" readonly>
                            <input type="text" name="detailAddress" id="detailAddress" class="input-form" placeholder="상세주소">
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
          
          
          
function searchAddr(){
    new daum.Postcode({
        oncomplete: function(data) { //data에 선택한 주소가 들어감
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
            console.log(data);
            //들어오는 data값 사용해서 활용하면 됨
            $("#postcode").val(data.zonecode);
            $("#address").val(data.roadAddress);
            $("#detailAddress").focus();
        }
    }).open();
}
</script>
                
</body>
</html>