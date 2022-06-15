<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/fundUpdate1.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
        
        .ft{
        	padding:0px;
        	margin:0px;
        }
        #active{
        	background-color:orangered;
        }
        .fmGoal{
		    border-radius: 5px;
		    background-image: url(resources/image/member/bI.png);
		    text-align: center;
		    padding-top: 20px;
		    color: #60656a;
		    font-family: Noto sans kr;
		    font-weight: bold;
		    font-size: 20px;
		    width:200px;
		    height:80px;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    overflow: hidden;
		}
		
 		.td1{
	 		 white-space:nowrap;
	 		 width:100px;
	 		 text-overflow : ellipsis;
	 		 overflow:hidden;						
 		);
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="content">
        <h5> <span class="material-symbols-outlined" id="setting">local_mall</span> 스토어/판매중</h5>
        
        <div class="fm" name="my ">
            <div class="fmGoal">매출: <span class="moneyE">dsadsdsad 원</span></div>
        </div>
        <div class="fundC">
            <div class="c1">myStore</div>
            
        </div>
        <div class="f1Zone">
            
            <table class="table table-hover ft">
            	 <thead>
	                <tr class="table-llght">
	                    
	                   	<th>스토어 번호</th>
	                    <th>스토어 제목</th>
	                      
	                    <th>상품 이름</th>
	                    
	                </tr>
	            </thead>
               <tbody>
                    <tr class="table-light fts">
                    
                        <td></td>
                        <td></td>
                        <td>뿅가는 쿠폰</td>
                        <td>펀딩</td>
                        
                    </tr>
                </tbody>
                
            </table>
        </div>
        <div class="pagination">
            dsadsass
        </div>
 	</div>
 	<input type="hidden" name="memberId" value="${sessionScope.m.memberId}">
	<script>
 		const memberId= $("[name=memberId]").val();
 		$(function(){
 			$(".c1").css({
 				"border-bottom" : "2px solid #00c4c4"
 			});	
 			
 			store(1);
 			go();
 			function go(){
 				const req=1;
 			
 			$.ajax({
				
 				url : "selectUStore.do",
 		 			data : {memberId:memberId,req:req},
 		 			type : "post",
 		 			success : function(data){
						 console.log(data); 		 				
 		 			
						let totalGain=0;
 		 				for(let i=0; i<data.tlist.length; i++){
 		 					
 		 					//스토어 번호
 		 				
 							
 							
 							totalGain += data.tlist[i].totalFinalPay;
 						
 							
 		 				}
 		 				$(".moneyE").text("");
 		 				$(".moneyE").text(totalGain);
						
 		 			}//success진행 완료 
 			});//ajax완료 
 			}
 		
 		});
 		//데이터 불러와서 넣어주기
 		function store(req){
 			console.log(memberId);
 			
 			$.ajax({
 				url : "selectUStore.do",
 		 			data : {memberId:memberId,req:req},
 		 			type : "post",
 		 			success : function(data){
						 				
						
						const table = $(".ft>tbody");
						table.empty();
 		 				for(let i=0; i<data.store.length; i++){
 		 					console.log(data);
 		 					//스토어 번호
 		 					const tr = $("<tr class='table-light  fts'>");
 							const td = $("<td>");
 							td.text(data.store[i].storeNo);
 							tr.append(td);
 							//스토어 제목 
 							const td1 = $("<td>");
 							td1.text(data.store[i].storeTitle);
 							
 							tr.append(td1);
 							//스토어 매출 
 							
 							//상품 이름  
 							const td3= $("<td>");
 							td3.text(data.store[i].storeProduct);
 							tr.append(td3);
 							//수정 버튼 넣어주기 
 							
 							
 								table.append(tr);
 							
 		 				}
 		 				
 		 				
 		 				$(".pagination").empty();
 		 				$(".pagination").append(data.pagenation);
						
 		 			}//success진행 완료 
 			});//ajax완료 
 			
 		}//데이터 불러오기 완료
 		</script>
 		

</body>
</html>