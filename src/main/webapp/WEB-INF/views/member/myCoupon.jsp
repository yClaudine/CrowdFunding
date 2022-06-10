<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/coupon.css">
<script src="resources/js/jquery-3.6.0.js"></script>




<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
	
	.ct{
		width:1000px;
	}
	.ah:hover{
		
		font-weight : bold;
		text-decoration : underline;
	}
	.couponImg{
		border:1px solid rgba(20,20,20,0.2);
		
	}
	.c2Zone{
		height:350px;
	}
	.pagination{
		width:1300px;
		margin-bottom:30px;
	}
	#active{
		background-color: orangered;
	}
	.coupH{
	    padding-left: 200px;
	    padding-top:40px;
	    height:100px;
	    border-bottom: 1px solid rgba(20, 20, 20, 0.1);
	}
</style>
</head>
<body>
	<div class="content">
		<h5>
			<span class="material-symbols-outlined" id="setting">redeem</span> 나의
			쿠폰
		</h5>
		<select class="form-select cps" name="myCouponSel">
			<option value="0">사용가능 쿠폰</option>
			<option value="1">만료된 쿠폰</option>
		</select> <select class="form-select cps" name="couponZon">
			<option value="all">All</option>
			<option value="fund">fund</option>
			<option value="store">store</option>
		</select>
		<div class="couponC">
			<div class="c1">나의 쿠폰</div>
			<div class="c2">쿠폰존</div>

		</div>
		<div class="c1Zone">
			<div class="coupC">
				<span class="couponStatus">현재 사용 가능한 쿠폰 <span
					class="leftCoupon"></span>장
				</span>
			</div>
			<div class="coupH">
				<span class="couponStatus">현재 만료된 쿠폰 <span
					class="leftCoupon"></span>장
				</span>
			</div>
			<table class="table table-hover ct">
				<thead>
					<tr class="table-info">
						<th class="cP"><span class="material-symbols-outlined">
								local_activity </span></th>
						<th>쿠폰 이름</th>
						<th>쿠폰 메인사용처</th>
						<th>쿠폰 서브사용처</th>
						<th>최소 구매금액</th>
						<th>쿠폰 만료일</th>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
		</div>

		<div class="c2Zone">
			<div class="item">
				<a href=""><img src="/img/00.png" alt="" class="couponImg"></a>
				<div class="couponName"></div>
				<div class="notice-title"></div>

				<div class="Ddate">
					<span class="startDate"></span>~<span class="lastDate"></span>
				</div>
				<button type="button" class="couponCondition"></button>
			</div>
			<div class="item">
				<a href=""><img src="/img/00.png" alt="" class="couponImg"></a>
				<div class="couponName"></div>
				<div class="notice-title"></div>
				<div class="Ddate">
					<span class="startDate"></span>~<span class="lastDate"></span>
				</div>
				<button type="button" class="couponCondition"></button>
			</div>
			<div class="item">
				<a href=""><img src="/img/00.png" alt="" class="couponImg"></a>
				<div class="couponName"></div>
				<div class="notice-title"></div>

				<div class="Ddate">
					<span class="startDate"></span>~<span class="lastDate"></span>
				</div>
				<button type="button" class="couponCondition"></button>
			</div>
			<div class="item">

				<a href=""><img src="/img/00.png" alt="" class="couponImg"></a>
				<div class="couponName"></div>
				<div class="notice-title"></div>
				<div class="Ddate">
					<span class="startDate"></span>~<span class="lastDate"></span>
				</div>
				<button type="button" class="couponCondition"></button>
			</div>
			
		</div>
		<div class="pagination"></div>
	</div>
	<input type="hidden" value="${sessionScope.m.memberNo}" name="memberNo">
	<script>
	$(function(){
		$(".pagination").hide();
	    //시작했을 땐 나의 쿠폰이 나오도록 설정 
	    $(".c1").click();

	    $("[name=myCouponSel]").on("change",function(){
	        myCoupon($(this).val());
	
	    });
	    $("[name=couponZon").on("change",function(){
	        couponZon($(this).val(),1);
	    	
							
	    })
	    myCoupon(0);
	})
	//나의 쿠폰 버튼을 눌렀을 때 
	
	$(".c1").on("click",function(){
	    $(this).css({
	        "border-bottom" : "3px solid #00c4c4"
	        
	    });
	    
	    $(".c2").css({
	        "border" : "none"
	    });
	    //나의 쿠폰 컨텐츠가 나타나도록 
	    
	    $(".c1Zone").show();
	    $(".c2Zone").hide();
	    //나의 쿠폰 select가 타나나도록 
	    $("[name=myCouponSel").show();
	    $("[name=couponZon").hide();
	    myCoupon(status);
	});
	    //필요한 데이터 : 회원 번호, 
	    //사용 만료인지 아닌지 
	    function myCoupon(status){
	    	const memberNo =$("[name=memberNo]").val();
	    	
	    	$.ajax({
	    		url : "/myCoupon.do",
	    		data : {status:status,memberNo:memberNo},
	    		type : "get",
	    		success : function(data){ 		
	    			
	    			const table = $("tbody");
    				table.empty();
    				
	    			for(let i=0; i<data.coupon.length; i++){
	    				
	    				const tr = $("<tr>");
	    				tr.css({
	    					"line-height" : "70px"
	    				});
		    			tr.addClass("table-light");
		    			tr.addClass("cts");
		    			const td = $("<td>");
		    			td.addClass("cP1b");	
		    			const span=$("<span>")
		    			span.addClass("material-symbols-outlined");
		    			span.attr('id','cP1');
		    			span.text("local_activity");
		    			td.append(span);
		    			//<a class="noticeTitle" href="/noticeView.do?noticeNo=${n.noticeNo }">${n.noticeTitle}</a>
		    			const a = $("<a class='ah' href='/noticeView.do?noticeNo="+data.notice[i].noticeNo+"'>");
		    			
		    			//쿠폰 이름 
		    			const td1 = $("<td>");
		    			a.text(data.coupon[i].couponName);
		    			td1.append(a);
		    			
		    			a.css({
		    				"margin" :"0 auto",
		    				"text-align" : "center",
		    				"display" : "block",
		    				"text-decoration" :"none",
		    				"color" : "black",
		    				"width" : "200px",
			    			"overflow" : "hidden",
			    			"white-space" : "nowrap",
			    			"text-overflow" : "ellipsis"
		    			});
		    			
		    			
		    			//쿠폰카테고리 
		    			const td2 = $("<td>");
		    			td2.text(data.coupon[i].mainTarget);
		    			//쿠폰 서브 카테고리 
		    			const td3 = $("<td>");
		    			td3.text(data.coupon[i].subTarget);
		    			//쿠폰 구매금액 
		    			const td4 = $("<td>");
		    			td4.text(data.coupon[i].minPrice);
		    			//쿠폰 만료일 
		    			const td5 = $("<td>");
		    			td5.text(data.mCoupon[i].validEnd);
		    			
		    			tr.append(td).append(td1).append(td2).append(td3).append(td4).append(td5);
		    			table.append(tr);
		    			
		    			
	    			}
	    			if(status==1){
	    				$(".coupC").hide();
	    				$(".coupH").show();
	    			}else{
	    				$(".coupC").show();
	    				$(".coupH").hide();
	    			}
	    			$(".leftCoupon").text(data.coupon.length);
	    			$(".leftCoupon").css({
	    				"color" : "#A760FF",
	    				"font-weight" : "bold"
	    			});
	    			
	    		}
	    		
	    	}); //ajax종료 
	    }//my coupon종료 
	

	//쿠폰존 버튼을 눌렀을 떄 
	$(".c2").on("click",function(){

	    $(this).css({
	        "border-bottom" : "3px solid #00c4c4"     
	    });
	    $(".c1").css({
	        "border" : "none"
	    });
	    //쿠폰존 컨텐츠가 나타나게 
	    $(".c2Zone").show();
	    $(".c1Zone").hide();
	    //다른 것들을 show해야합니다. 
	    //쿠폰존 select가 나타나도록 진행 
	    $("[name=myCouponSel").hide();
	    $("[name=couponZon").show();
	    const req = 1;
	    const mainTarget= "all";
	    couponZon(mainTarget,req);
	});
	  
	  function couponZon(mainTarget,req){


	
		 $.ajax({
			url : "/myCouponList.do",
			data : {req:req,
					mainTarget:mainTarget
					},
			type : "post",
			
			success : function(data){
				//이미지 넣는 div 한개
				
					console.log(data);
					console.log(data.pagination);
					const cZone =$(".c2Zone");
					cZone.empty();
					for(let i=0; i<data.coupon.length; i++){
						
					const div = $("<div>");
					div.addClass("item");
					const a =$("<a class='ah' href='/noticeView.do?noticeNo="+data.notice[i].noticeNo+"'>");
					let img=""
					if(data.notice[i].noticeFilepath!=null){
						 img = $("<img src='resources/image/notice/main/"+data.notice[i].noticeFilepath+"' class='couponImg'>");
					}else{
						 img = $("<img src='resources/image/fund/beauty.jpg' class='couponImg'>");
					}
					$(".couponImg").css({
						"border" : "1px solid rgba(20,20,20,0.2)"
					});
					a.append(img);
					div.append(a);
					//쿠폰 이름 넣는 div한개 
					const div1 =$("<div>");
					div1.addClass("couponName");
					div1.text(data.coupon[i].couponName);
					div.append(div1);
					//notice 제목 넣는 div 
					const div2 = $("<div>");
					div2.addClass("notice-title");
					div2.text(data.notice[i].noticeTitle);
					div.append(div2);
					//시작기간과 만료기간 넣는 것 
					const div3= $("<div>");
					div3.addClass("Ddate");
					if(data.coupon[i].validStart!=null){
						
					const span=$("<span class='startDate'>");
					span.text(data.coupon[i].validStart);
					div3.append(span);
					
					const span1=$("<span class='lastDate'>");
					span1.text("~"+data.coupon[i].validEnd);
					div3.append(span1);
					}else{
						div3.text("무제한 이용가능");
					}
					div.append(div3);
					//버튼에 진행중인지 아닌지 넣는 것 
					const button = $("<button type='button' class='couponCondition'>");
					if(data.coupon[i].couponStatus==0){
						button.text("게시전");	
					}else if(data.coupon[i].couponStatus==1){
						button.text("진행중");
					}else if(data.coupon[i].couponStatus==2){
						button.text("만료");
					}
					div.append(button);
					
					cZone.append(div);
					
				}//for문 종료
				
					$(".pagination").show();
					$(".pagination").empty();
					$(".pagination").append(data.pagination);
					
					
				
			}//success 종료 
		 });
	  }//couponzon function 종료 
	</script>

</body>
</html>
