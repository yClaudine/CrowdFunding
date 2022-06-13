<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mypage</title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/mypage4.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <script src="resources/js/mypage1.js"></script>
    
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<style>
		.btn-info{
			margin-top:10px;
			width:650px;
		}
		#miss{
			margin:0px;
		}
		#mypg{
		text-align:center;
	    color: #FFC4DD;
	    margin: 30px auto;
	     
	    font-size:50px;
	    border-radius: 50px;
	    display: block;
	    width:80px;
	    
	 
	    
		}
		#active {
			background-color : orangered;
		}
		.pagination{
			margin-top: 50px;
			margin-left:300px;
		}
		#mypgI{
		
	    
	    
	    border-radius: 50px;
	    display: block;
	    width:100px;
	    height:100px;
		
		}
		.mImgBox{
		   margin:30px auto;
		   display: block;
			width:80px;
			height:80px;
			border-radius:50px;
			overflow:hidden;
		}
		#mypg:hover{
			transform : none;
		}
		.Bupdate{
			font-size :15px;
			width:100px;
			text-align:center;
		}
		#h5{
		    font-size: 20px;
		    padding-left: 80px;
		    color: #212529;
		    font-weight:400;
		}
		.fund-wrap{
			margin:0px;
		}
		.exp{
		}
		.fundtitle{
			padding-left:10px;
			
		}
		.exp{
			padding-left:10px;
		}
		
	</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>    
	
	
	<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
    <div class="content1">
        <div class="wrapper">
            <div class="one"></div>
            <div class="three">
                <div class="profile">
                	<c:if test="${sessionScope.m.gender==0 }">	
                    <span class="material-symbols-outlined" id="myp">
                        account_circle
                        </span>
                    </c:if>
                    <c:if test="${sessionScope.m.gender==1 }">	
                    <span class="material-symbols-outlined" id="mypg">
                        account_circle
                        </span>
                    </c:if>
                    <a href="myProfile.do?memberId=${sessionScope.m.memberId }" class="Bupdate">-<span>${sessionScope.m.memberName}</span>님</a>
                        
                    <div class="int">서포터 * 개인화면</div>
                </div>
                <div class="logout">
                	<c:if test="${sessionScope.m.categoryNo==1 }">
                    	<a href="sellerReqFrm.do" class="aout"><button class="btn btn-outline-success" id="outBtn">판매자 신청</button></a>
                    </c:if>
                    <c:if test="${sessionScope.m.categoryNo==2 }">
                    	<a href="logout.do" class="aout"><button class="btn btn-outline-success" id="outBtn">로그아웃</button></a>
                    </c:if>
                </div>
                
	                <div class="logout onload">
	                	
	                	<a href="onLoadFrm.do" class="aout"><button class="btn btn-outline-success" id="outBtn">신청 현황</button></a>
	                	
	                </div>
                
                <div class="setting">
                    <a href="setting.do" class="mUS"><span class="material-symbols-outlined" id="sett">
                        settings
                        
                    </span><sup>설정</sup></a>
                    
                </div>
                
            </div>
            <div class="four">
                <ul class="count">
                    <li class="fundCount">
                        <span class="fleftCount">0</span>
                        <a href="fundingFrm.do">펀딩</a>
                    </li>
                    <li class="buyCount">
                        <span class="storeCount">0</span>
                        <a href="mystoreFrm.do">구매</a>
                    </li>
                </ul>
                <div class="myCoupon">
                    <div>
                        <a href="dmMain.do">
                            <span class="material-symbols-outlined" id="symbols">
                                mail
                                </span>
                            <sup id="text1">메시지</sup>
                            <sup id="text2">></sup>
                        </a>
                        <a href="mycouponFrm.do" class="cou" >
                            <span class="material-symbols-outlined symbols" id="symbols">
                                redeem
                                </span>
                            <sup id="text1">쿠폰</sup>
                            <sup id="text2">></sup>
                        </a>
                    </div>
                </div>
                <span id="h5">Community</span>
                <div class="myCommunity">
                    
                    <div class="comm">
                        <a href="myfollowerFrm.do">
                            <span class="material-symbols-outlined" id="symbols">
                                group
                                </span>
                            <sup id="text3">나의 팔로워</sup>
                            <sup id="text2">></sup>
                        </a>
                        <a href="myfollowingFrm.do" class="cou" >
                            <span class="material-symbols-outlined" id="symbols">
                                group_add
                                </span>
                            <sup id="text3">나의 팔로잉</sup>
                            <sup id="text2">></sup>
                        </a>
                    </div>
                </div>
                
            </div>
            
            <div class="five">
                <div class="mypage">
                    <span >서포터</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                        </span>
                    
                </div>
            </div>
            <c:if test="${sessionScope.m.categoryNo==2}">
            <div class="six">
                <div class="sellerpage">
                    <span>메이커</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                        </span>
                </div>

            </div>
            </c:if>
        </div>
        <div class="wrapper1">
            <div class="one"></div>
            <div class="three">
                <div class="profile2">
                    <div class="mImgBox"><img src="resources/image/notice/main/02_truck.png" id="mypg"></div>
                    <div class="Bupdate1">-<span class="sellerName">와디즈 메이커</span>님</div>
                    <a href="updateSellerFrm.do" class="Bupdate1">-<span>프로필 편집하기</span> ></a>
                    <div class="int">판매자 * 서포터</div>
                    
                </div>
                <div class="logout">
                    <a href="logout.do" class="aout"><button class="btn btn-outline-success" id="outBtn">로그아웃</button></a>
                </div>
                <div class="setting">
                    <a href="mypageUpdate.do" class="mUS"><span class="material-symbols-outlined" id="sett">
                        settings
                        
                    </span><sup>설정</sup></a>
                </div>
            </div>
            <div class="four">
                <div class="fc">
                    <div class="funding">
                            <h6>펀딩</h6>
                    </div>
                    <div class="store">
                            <h6>스토어</h6>
                    </div>
                </div>
                <div class="fund">
                	<div class="fund-wrap">
	                    <div>만든펀딩</div>
	                    <ul class="Info">
	                       
	                    </ul>
	                    <ul class="pagination pagination-sm">
	                       
	                     </ul>
	                    <a href="createFunding.do" class="fundopen"><button class="btn btn-info btnf">펀딩 오픈 신청하기</button></a>
	                    <div class="mycomment1">
                        <div class="comm">
                            <a href="fundUpdateFrm.do">
                                <span class="material-symbols-outlined" id="symbols">
								storefront
								</span>
                                <sup id="text3">나의 펀딩</sup>
                                <sup id="text2">></sup>
                            </a>
                            
                        </div>
                    </div>
	                </div>

                </div>
                <div class="notthingF">
		                <div class="msgI">
		                    <span class="material-symbols-outlined" class="idea">
		                        light
		                        </span>
		                    <span>메이커님의 아이디어로 세상을 밝게 비춰보세요!</span>
		                </div>
		                
		                <a href="createFunding.do" class="fundopen"><button class="btn btn-info btnf">펀딩 프로젝트 시작하기</button></a>
	            </div>
                <!-- 스토어 페이지 시작  -->
                <div class="storeCt">
                	<div class="store-wrap">
		                    <div>판매물품</div>
		                    <ul class="Info">
		                        
		                       
		                       
		                    </ul>
		                    <ul class="pagination pagination-sm">
		                       
		                      </ul>
		                    <a href="storeStart.do" class="fundopen"><button class="btn btn-info btnf">스토어 프로젝트 시작하기</button></a>
		                     <div class="mycomment1">
		                        <div class="comm">
		                            <a href="storeUpdateFrm.do">
		                               <span class="material-symbols-outlined" id="symbols">
										local_mall
										</span>
		                                <sup id="text3">나의 스토어</sup>
		                                <sup id="text2">></sup>
		                            </a>
		                            
		                        </div>
		                    </div>
		                </div>
		             </div>
                 <div class="notthingF">
	                <div class="msgI">
	                    <span class="material-symbols-outlined" class="idea">
	                        light
	                        </span>
	                    <span>메이커님의 아이디어로 세상을 밝게 비춰보세요!</span>
	                </div>
	                
	                <a href="storeStart.do" class="fundopen"><button class="btn btn-info btnf">스토어 프로젝트 시작하기</button></a>
            	</div>
            </div>
           
            
            <div class="five">
                <div class="mypage mypage1">
                    <span >서포터</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                        </span>
                    
                </div>
            </div>
            <div class="six">
                <div class="sellerpage sellerpage1">
                    <span>메이커</span>
                    <span class="material-symbols-outlined">
                        arrow_drop_down_circle
                    </span>
                </div>
        </div>
        </div>
    </div>
    <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
    <script>
   		 const memberId = $("[name=memberId]").val();
    	$(function(){
    		$(".aout").eq(0).show();
    		$.ajax({
        		url: "/selectSeller.do",
        		data:{memberId:memberId},
        		type:"get",
        		success:function(data){
        			console.log(data)
        			if(data.authSeller==0){
        							//권한이 0일때 
        				$(".aout").eq(0).hide();
        			}else if(data.authSeller==2){
        				$(".aout").eq(0).hide();
        				$(".logout").show();
        			}
        		},
        		error:function(){
        			console.log("에러처리");
        		}
        		
        	});
    		const onload =$(".onload");
    		
    		$.ajax({
    			url : "/selectSeller.do",
    			data : {memberId:memberId},
    			type : "get",
    			success: function(s){
    				//이미지 변경하기 
    				$(".mImgBox").empty();
    				$(".mImgBox").append("<img src='resources/image/member/"+s.enPath+"' id='mypgI'>");
    				//이름 변경하기 
    				$(".sellerName").text("");
    				$(".sellerName").text(s.owner);
    				$(".sellerName").css({
    					"font-size" : "12px"
    				});
    				if(s!=null&&s.authSeller==0||s.authSeller==1||s.authSeller==2){
    					
    					onload.show();
    				}
    			},
    			error: function(){
    				contsole.log("프로그램 데이터 에러");
    			}
    		});
    		//스토어 카운트 가져오기 
    		const memberNo = $("[name=memberNo]").val();
    		const req =1;
			$.ajax({
        		
        		url:	"mystore.do",
        		type:	 "post",
        		data : {memberNo:memberNo, req:req},
        		success : function(data){
        			;
        			//가져와야하는 데이터  상품이름 store_product
        			$(".storeCount").text(data.storeCount);
        			
        		}//success
        		
        	});//ajax종료
        	//결제한 카운트 구하기
			 
			    //펀딩카운트 가져오기
			    	const fpayStatus=0;
			    	 $.ajax({
			    		 
						  url : "/myfund.do",
						  data : {memberId:memberId,req:req,fpayStatus:fpayStatus},
						  type:"post",
						  success : function(list){
							 
							$(".fleftCount").text(list.fpayCount);
					   }//success종료 
			    	});//ajax종료 
			 
    	});
    	//펀딩을 클릭했을 때 
    	$(".funding").on("click",function(){
    		funding(1);
    		$(".store-wrap").show();
			$(".notthingF").eq(1).hide();
    	});
    	function funding(req){
    		$.ajax({
    		  url : "selectSFund.do",
    		  data : {memberId:memberId,req:req},
    		  success: function(fund){
    			  console.log(fund);
    			if(fund.fund.length==0){
    				$(".fund-wrap").hide();
    				$(".notthingF").eq(0).show();
    			}else{
    				
    				$(".fund-wrap").show();
    				$(".notthingF").eq(0).hide();
    				  $(".Info").empty();
    	              	for(let i=0; i<fund.fund.length; i++){
    	              		const li =$("<li>");
    	                	//이미지 만들기
    	                  	const a =$("<a href='fundView.do?fundNo="+fund.fund[i].fundNo+"&memberId="+fund.fund[i].memberId+"'>");
    	                	const div = $("<div class='imgbox'>");
    	                	const img = $("<img src='resources/image/fund/upload/"+fund.fund[i].fundFilepath1+"' class='fundImg'>");
    	                	div.append(img);
    	                	a.append(div);
    	                	li.append(a);
    	                	//펀드 이름 
    	                	const div1 = $("<div class='fundtitle'>");
    	                	div1.text(fund.fund[i].fundName);
    	                	li.append(div1);
    	                	//펀드 내용
    	                	const div2 = $("<div class='exp'>");
    	                	div2.append(fund.fund[i].fundIntro);
    	                	li.append(div2);
    	                	$(".Info").append(li);
    	              	}
    	            		$(".pagination").empty();
    	            		$(".pagination").append(fund.pagenation);
	
    			}//펀드의 length가 0이 아닐때
            	              	
    		  }//success종료
    		});
    	}//펀딩 클릭시 종료 
    	
    	//스토어를 클릭했을 때 
    	$(".store").on("click",function(){
    		store(1);
    		$(".notthingF").eq(0).hide();
    		
    	})
    	function store(req){
    		$.ajax({
    			url : "selectSStore.do",
    			data : {memberId:memberId,req:req},
    			success : function(store){
    				console.log(store);
    				if(store.store.length==0){
    					$(".store-wrap").hide();
    					$(".notthingF").eq(1).show();
    				}else{
    					$(".store-wrap").show();
    					$(".notthingF").eq(1).hide();
    					 $(".Info").empty();
    					for(let i=0; i<store.store.length; i++){
    						const li =$("<li>");
    	                	//이미지 만들기
    	                  	const a =$("<a href='storeView.do?storeNo="+store.store[i].storeNo+"'>");
    	                	const div = $("<div class='imgbox'>");
    	                	const img = $("<img src='resources/image/store/upload/"+store.store[i].storeImg1+"' class='fundImg'>");
    	                	div.append(img);
    	                	a.append(div);
    	                	li.append(a);
    	                	//스토어 이름 
    	                	const div1 = $("<div class='fundtitle'>");
    	                	div1.text(store.store[i].storeProduct);
    	                	li.append(div1);
    	                	//스토어내용
    	                	const div2 = $("<div class='exp'>");
    	                	div2.append(store.store[i].storeProductcontent);
    	                	li.append(div2);
    	                	$(".Info").append(li);
    	              	}
    	            		$(".pagination").empty();
    	            		$(".pagination").append(store.pagenation);
    				}//null이 아닐때 종료 
    			}//success시 
    		});//ajax
    	}//store 종료 
    
    </script>
</body>
</html>