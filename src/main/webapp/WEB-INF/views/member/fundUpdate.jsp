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
 		}
 		
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="content">
        <h5> <span class="material-symbols-outlined" id="setting">storefront</span> 펀딩 진행중</h5>
        
        <div class="fm" name="my ">
            <div class="fmGoal">매출: <span class="moneyE">dsadsdsad 원</span></div>
        </div>
        <div class="fundC">
            <div class="c1">나의 펀드</div>
            
        </div>
        <div class="f1Zone">
            
            <table class="table table-hover ft">
            	 <thead>
	                <tr class="table-llght">
	                    
	                    <th>펀드 번호</th>
	                    <th>펀딩 물품</th>
	                    <th>펀딩 목표액</th>
	                    <th>펀딩 달성</th>
	                    <th>펀딩 Date</th>
	                    
	                    <th>펀딩 요금제</th>
	                    <th></th>
	                </tr>
	            </thead>
               <tbody>
                    <tr class="table-light fts">
                    
                        <td></td>
                        <td></td>
                        <td>뿅가는 쿠폰</td>
                        <td>펀딩</td>
                        <td>20120원</td>
                        <td>2022-12-23~21320213</td>
                        <td></td>
                        <td><a href=""><button class="btn btn-info">수정</button></a></td>
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
 			
 			fund(1);
 			 
 			
 			
 		});
 		//데이터 불러와서 넣어주기
 		function fund(req){
 			console.log(memberId);
 			
 			$.ajax({
 				url : "selectUFund.do",
 		 			data : {memberId:memberId,req:req},
 		 			type : "post",
 		 			success : function(data){
						let totalGain=0; 		 				
						console.log(data);
						const table = $(".ft>tbody");
						table.empty();
 		 				for(let i=0; i<data.fund.length; i++){
 		 					
 		 					//펀드 번호
 		 					const tr = $("<tr class='table-light table-hover fts'>");
 							const td = $("<td>");
 							td.text(data.fund[i].fundNo);
 							tr.append(td);
 							//펀딩 물품 
 							const td1 = $("<td>");
 							td1.text(data.fund[i].fundName);
 							
 							tr.append(td1);
 							//펀딩 목표액 
 							const td2 = $("<td>");
 							td2.text(data.fund[i].fundAmount+"원");
 							tr.append(td2);
 							//펀딩 달성액 
 							const td3= $("<td>");
 							td3.text(data.tlist[i].totalFinalPay+"원");
 							tr.append(td3);
 							//펀딩 데이트 
 							const td4 =$("<td>");
 							td4.text(data.fund[i].fundStart +" ~ "+data.fund[i].fundEnd);
 							tr.append(td4);
 							//펀딩 요금제 
 							const td5 =$("<td>");
 							td5.text(data.fund[i].fundFees);
 							td5.append(td5);
 							tr.append(td5);
 							//수정 버튼 넣어주기 
 							const td6 =$("<td>");
 							const a  = $("<a href='#'>");
 							const button =$("<button class='btn btn-info'>");
 							button.text("수정");
 							a.append(button);
 							td6.append(a);
 							tr.append(td6);
 							totalGain += (data.tlist[i].totalFinalPay)-(data.tlist[i].totalFinalPay/data.fund[i].fundFees);
 							table.append(tr);
 		 				}
 		 				$(".moneyE").text("");
 		 				$(".moneyE").text(Math.round(totalGain)+" 원");
 		 				
 		 				$(".pagination").empty();
 		 				$(".pagination").append(data.pagenation);
						
 		 			}//success진행 완료 
 			})//ajax완료 
 			
 		}//데이터 불러오기 완료
 		
 		
 	</script>
 	</body>
 	
</html>