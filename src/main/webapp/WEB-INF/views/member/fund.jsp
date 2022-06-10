<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/funding.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
        .pagination{
		width:1300px;
		margin-bottom:30px;
		
	}
	#active{
		background-color:orangered;
	}
    </style>
</head>

<body>
	 <div class="content">
                <h5> <span class="material-symbols-outlined" id="setting">storefront</span> 나의 펀딩</h5>
                
                <select class="form-select cps" name="fpaySatus">
                    <option value="0">결제완료</option>
                    <option value="1">결제 취소 완료</option>
                
                </select>
                <div class="couponC">
                    
                    <div class="f2">펀딩 내역</div>
                </div>
                <div class="fundingHistory">
                    <h6 class="f2ZoneTitle">알림 신청한 펀딩</h6>
                    <div class="f2Zone">
                            <div class="item">
                                
                            <a href=""><img src="/img/00.png" alt="" class="fundingImg"></a>
                            <div class="fundName"></div>
                            <div class="collectMoney"></div>
                            <div class="Ddate"><span class="fundStart"></span>~<span class="fundEnd"></span></div>
                            <div class="bs-component">
                                <div class="progress">
                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-info" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 25%;"><span>100%</span></div>
                                </div>
                            </div>
                        </div >
                        
                    </div>
                    <div class="pagination">
                        
                    </div>
                </div>
            
    </div>
    <input type="hidden" value="${sessionScope.m.memberId}" name="memberId">
    <script>
    let fpayStatus=0;
    $(function(){
		        //시작했을 땐 나의 펀드가 나오도록 설정 
		
		const req =1; 
		      
		        
		  $("[name=fpaySatus").on("change",function(){
		      fpayStatus = $(this).val();
		      fundlist(1);
		   })
		   
		   //보내줘야하는 데이터 회원 아이디
		   fundlist(1);
		  
	 });
    
    function fundlist(req){
    	const memberId = $("[name=memberId]").val();
    	
    	 $.ajax({
    		 
			  url : "/myfund.do",
			  data : {memberId:memberId,req:req,fpayStatus:fpayStatus},
			  type:"post",
			  success : function(list){
				 
				console.log(list);
					const wrap = $(".f2Zone");
					wrap.empty();
				  for(let i=0; i<list.fund.length; i++){
						//  <a href="/fundView.do?fundNo=${f.fundNo }">
						//이미지 넣어주기
						
						
						const div = $("<div>");
						div.addClass("item");
					
						const a =$("<a href='/fundView.do?fundNo="+list.fund[i].fundNo+"'>");
						let img = $("<img src='resources/image/fund/beauty.jpg' class='fundingImg'>");
						a.append(img);
						div.append(a);
						//펀드 이름 넣어주기 
						const div1 = $("<div>");
						div1.addClass("fundName");
						div1.text(list.fund[i].fundName);
						div.append(div1);
						//목표액 넣어주기 
						const div2 = $("<div>");
						div2.addClass("collectMoney");
						div2.text("목표액 : "+list.fund[i].fundAmount+"원");
						div.append(div2);
						//데이트 넣어주기 
						const div3= $("<div>");
						div3.addClass("Ddate");
							
						const span=$("<span class='startDate'>");
						span.text(list.fund[i].fundStart);
						div3.append(span);
						
						const span1=$("<span class='lastDate'>");
						span1.text("~"+list.fund[i].fundEnd);
						div3.append(span1);
						div.append(div3);
						//현재 진행단계 넣어주기
						let cal =0;
						if(list.fund[i].fundNo==list.fpay[i].fundNo){
							
							 cal += list.fpay[i].fpayFunding
						}
						let statusM = Math.round((cal/(list.fund[i].fundAmount))*100);
						const div4=$("<div>");
						div4.addClass("bs-component");
						const div4s=$("<div>");
						div4s.addClass("progress");
						div4.append(div4s);
						const div4ss=$("<div class='progress-bar progress-bar-striped progress-bar-animated bg-info' role='progressbar' aria-valuenow='75' aria-valuemin='0' aria-valuemax='100'>");
                        
						div4ss.css({
                        	"width": statusM
                        });
                       	const span3 =$("<span>");
                       	span3.text(statusM+"% 달성");
						div4ss.append(span3);
						div4s.append(div4ss);
						div.append(div4);
						
						wrap.append(div);
			  }
				 const pagenation = $(".pagination");
				 pagenation.empty();
				 pagenation.append(list.pagenation);
		   }//success종료 
    	});//ajax종료 
    }
		  
    
    </script>
</body>
</html>