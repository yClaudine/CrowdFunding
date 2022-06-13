<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/mystore.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    
    
    
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
        
        #actice{
        	background-color : orangered;
        }
        .storeImg{
        	border : 1px solid rgba(20,20,20,0.2);
        }
        #active{
        	background-color : orangered;
        }
        .pagination{
        	width:auto;
        	margin:0 auto;	
        }
        
    </style>
</head>
<body>
	 <div class="content">
                <h5> <span class="material-symbols-outlined">
                    local_mall
                    </span> 나의 구매</h5>
                
                <div>
                    
                </div>
                <div class="storeC">
                    
                    <div class="f2">나의 구매</div>
                </div>
                <div class="storeHistory">
                    <h6 class="s2ZoneTitle">구매한 내역</h6>
                    <div class="s2Zone">
                        <div class="item">
                                
                            <a href=""><img src="/img/00.png"  alt="" class="storeImg"></a>
                            <div class="store_product">상품 이름 </div>
                            <div class="storePrice">결제 금액</div>
                            <div class="Ddate">결제일</div>
                            
                        </div >
                        
                    </div>
                    <div class="pagination">
                        <div class="btn-group me-2 page" role="group" aria-label="First group">
                            <button type="button" class="btn btn-secondary btns">1</button>
                            <button type="button" class="btn btn-secondary btns">2</button>
                            <button type="button" class="btn btn-secondary btns">3</button>
                            <button type="button" class="btn btn-secondary btns">4</button>
                        </div>
                    </div>
                </div>
                <div class="storeNone">
                    <span class="material-symbols-outlined storeSym" id="storeSym">store</span>
                    <div class="symbolB">
                        <span>아직 구매한 상품이 없어요.</span>
                        <span>펀스토어 만에 특별한 상품을 만나볼까요?</span>

                        <a href="/Store.do"><button type="button" class="btn btn-info btns">상품 보러가기</button></a>
                    </div>
                    
                </div>
            
    </div>
    <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
    <script>
        $(function(){
           
                
        	storelist(1);
            
        });
        
        function storelist(req){
        	const memberNo = $("[name=memberNo]").val();
        	
        	$.ajax({
        		
        		url:"mystore.do",
        		type: "post",
        		data : {memberNo:memberNo, req:req},
        		success : function(data){
        			//가져와야하는 데이터  상품이름 store_product
        			//결제금액 store_price
        			//결제일 
        			///storeView.do?storeNo=${s.storeNo }
        			console.log(data);
        			//상품의 번호 이미지 넣어주기
        			if(data.store.length==0){
        				$(".s2Zone").hide();
						 $(".storeNone").show();	
        			}else{
        				$(".s2Zone").show();
        				 $(".storeNone").hide();
        				 $(".s2Zone").empty();
	        			for(let i=0; i<data.store.length; i++){
	        				
		        			const div = $("<div>");
							div.addClass("item");
						
							const a =$("<a href='/storeView.do?storeNo="+data.store[i].storeNo+"'>");
							let img = $("<img src='resources/image/fund/food.jpg' class='storeImg'>");
							a.append(img);
							div.append(a);
							//상품 이름 넣어주기 
							const div1 = $("<div>");
							div1.addClass("storeName");
							div1.text(data.store[i].storeProduct);
							div.append(div1);
							//결제금액 넣어주기 
							const div2 = $("<div>");
							div2.addClass("storePrice");
							div2.text("결제금액 : "+data.storePay[i].storepayAllPrice);
							div.append(div2);
							//결제일 넣어주기 
							const div3= $("<div>");
							div3.addClass("Ddate");
							div3.text("결제일 : "+data.storePay[i].storepayDate);	
							
							
							
							div.append(div3);
							$(".s2Zone").append(div);
	        			}
	        			
	        			$(".pagination").empty();
	        			$(".pagination").append(data.pagenation);
        			}
        			
        		}//success
        		
        	});//ajax종료 
       
        	
        }
        
    </script>
</body>
</html>