<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">

<style>
  .content-wrap{
      overflow: hidden;
      width: 1200px;
      margin: 0 auto;
      font-family: ns-medium;
      border-top: 1px solid #bfbfbf;
  }
  .left-content{
      float: left;
      width: 15%;
  }
  .main-content{
      float: left;
      width: 85%;
      padding: 80px;
      padding-top: 85px;
  }
  .left-content>.title{
      text-align: center;
      font-size: 30px;
      padding: 20px;
  }
.manager-menu{
      list-style-type: none;
      margin: 0;
      padding: 0;
      border: 1px solid lightgray;
  }
  .manager-menu>li{
      text-align: center;
      height: 50px;
      line-height: 50px;
      font-size: 15px;
      color: gray;
      
  }
  .manager-menu>li>a{
      display: block;
      text-decoration: none;
      color: #212529;
      background-color:#f2f4f6;
      text-align: center;
      height: 50px;
      line-height: 50px;
      font-size: 15px;
  }
  .manager-menu>li>a:hover{
      color: #e7f9f9;
      cursor: pointer;
      background-color: #00b2b2;
  }
  .manager-menu .active-menu{
      color: #00b2b2;
      font-weight: bold;
  }
  .main-content>.btn{
      font-size: 15px;
      margin: 5px;
  }
  .main-content>.btn-outline-primary, .coupon-modal .close-btn{
      color:#00b2b2;
      border: 1px solid #00b2b2;
  }
 .main-content>.btn-outline-primary:hover, .coupon-modal .close-btn:hover{
      background-color: #00b2b2;
      border: 1px solid #d1e2e2;;
      color:white;
      cursor: pointer;
  }
  .main-content>.btn-primary{
      color: whitesmoke ;
      background-color: #02c9c9;
      border: 1px solid #02c9c9;
  }
  .main-content>.btn-primary:hover{
      background-color: #00b2b2;
      border: 1px solid #00b2b2;
  }
  .table{
      margin-top: 50px;
  }
  .table>*{
      text-align: center;
  }
  .table>tbody>tr:hover{
      background-color: #e7f9f9;
  }
  input[name="radio"]:hover{
      cursor: pointer;
  }
  .coupon-modal{
  	display:none;
  	width: 100%;
  	height: 100%;
  	position: fixed;
  	top:0px;
  	left: 0px;
  	background-color: rgba(0,0,0,0.3);
  	align-items: center;
  }
  .modal-div{
  	margin: 0 auto;
  	margin-top : 150px;
  	background-color: #ffffff;
  	width: 500px;
  	height: auto;
  	padding: 30px;
  	border-radius : 5px;
  }
  .modal-title{
  	width: 300px;
  	margin: 0 auto;
  	color: #02c9c9 ;
      font-size: 20px;
      text-align: center;
  }
  .coupon-table{
  	margin: 10px auto;
  }
  .coupon-table tr{
  	border-bottom : 1px solid gray;
  }
  .coupon-table th{
  	border: 1px solid gray;
  	text-align: center;
  	background-color: #e7f9f9;
  	padding: 8px;
  	font-size: 13px;
  }
  .coupon-table td{
  	padding: 8px;
  	text-align: center;
  }
  .close-btn{
	text-align: center;
  	width: 50px;
  	margin: 0 auto;
  }
  .couponName{
  	text-decoration:none;
  	color: #212529;
  }
  .couponName:hover{
  	cursor:pointer;
  }
  
.top-search{
    width: 435px;
    margin: 50px auto;
}
.top-search ul{
    list-style-type: none;
    border: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    height: 60px;
    line-height: 60px;
}
.top-search li{
    float: left;
    margin: 10px;
    line-height: 40px;
}
.top-search li>*:not(.material-icons){
    height: 30px;
    font-size: 13px;
}
.search-btn{
    width: 60px;
    line-height: 25px;
    border-radius: 5px;
    border: 1px solid #868e96;
}
.search-btn:hover{
    cursor: pointer;
    font-size: 1.1em;
}
input[name='keyword']{
    width: 300px;
    border: none;
    border-bottom: 1px solid #868e96;
    outline: none;
}
.pagination{
	justify-content:center;
	margin: 0 auto;
	padding-top: 50px;
}
.pagination>.page-item>a {
	color: #00b2b2;
}

.pagination>.page-item.active>a {
	background-color: #00b2b2;
	border: 1px solid #00b2b2;
}
.type{
	overflow: hidden;
	margin-bottom: 30px;
	margin-top: 30px;
}
.type>select{
	width: 100px;
	height: 30px;
	float: right;
	font-size: 13px;
}
select{
	border: 1px solid #bfbfbf;
}
.modal-wrap{
    width: 100vw;
    height: 100vh;
    background-color: rgba(0,0,0,0.5);
    position: absolute;
    top: 0;
    left: 0;
    display: none;
    justify-content: center;
    align-items: center;
    z-index: 4;
}
.detail-modal{
    background-color: #e7f9f9;
    width: 50vw;
    min-width: 500px;
    max-width: 1000px;
    max-height: 800px;
    border-radius: 5px;
}
.modal-top{
	width: 190px;
	margin: 0 auto;
	padding: 10px;
}
.modal-top h3{
	margin: 0;
}
.detail-btn:hover{
	cursor: pointer;
}
.detail-table{
	margin: 10px;
	min-height: 330px;
}
.detail-table tr{
	border: 1px solid #bfbfbf;
}
.detail-table th{
	border: 1px solid #bfbfbf;
	width: 17%;
	vertical-align: middle;
	text-align:center;
}
.detail-table td{
	vertical-align: middle;
	padding: 5px;
}
.modal-close{
	width: 100%;
	height: 50px;
	border: #00c4c4;
	background-color:  #00c4c4;
	color: #ffffff;
	border-bottom-left-radius: 5px;
    border-bottom-right-radius: 5px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="content-wrap">
		<div class="left-content">
	        <div class="title">쿠폰관리</div>
	        <div class="menu-wrap">
	            <ul class="manager-menu">
	                <li>관리자페이지</li>
	                <li><a href="/fundManage.do?reqPage=1&keyword=&type=all" >펀딩관리</a></li>
                    <li><a href="/storeManage.do?reqPage=1&keyword=&type=all"  >스토어관리</a></li>
                    <li><a href="/memberManage.do?reqPage=1&keyword=&type=all" >회원관리</a></li>
                    <li><a href="/couponManage.do?reqPage=1&keyword=&type=3" class="active-menu">쿠폰관리</a></li>
	            </ul>
	        </div>
	    	</div>
    	<div class="main-content">
	        <button type="button" class="btn btn-outline-primary insert">쿠폰등록</button>
	        <button type="button" class="btn btn-primary modify">수정하기</button>
	        <button type="button" class="btn btn-primary delete">삭제하기</button>
	        
	         <div class="top-search">
                <ul>
                    <li style="line-height: 80px; margin: 0;">
                        <span class="material-icons" style="font-size: 30px; height: 20px;" >search</span>
                    </li>
                    <li>
                        <input type="text" name="keyword" id="keyword" placeholder="쿠폰명을 입력해주세요">
                    </li>
                    <li>
                        <input type="submit" class="search-btn" value="검색"></input>
                    </li>
                </ul>
            </div>
            <div class="type">
            	<select class="changeType">
            		<option value="3">전체</option>
            		<option value="0">게시전</option>
            		<option value="1">진행중</option>
            		<option value="2">만료</option>
            	</select>
            </div>
            
	        
	        
	            <table class="table table-hover">
	                <thead>
	                    <tr>
	                        <th scope="col"></th>
	                        <th scope="col">쿠폰번호</th>
	                        <th scope="col">쿠폰명</th>
	                        <th scope="col">유효기간</th>
	                        <th scope="col">상태</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${list }" var="cp">
	                	<tr>
	                        <th scope="col"><input type="radio" name="radio" value="${cp.couponNo }"></th>
	                        <td class="couponNo">${cp.couponNo }</td>
	                        <td>
	                        	<a class="couponName" >${cp.couponName }</a>
	                        	<!-- 
	                        	<input type="hidden" value="${cp.validStart } ~ ${cp.validEnd }">
	                        	<input type="hidden" value="${cp.discount}">
	                        	<input type="hidden" value="${cp.couponType}">
	                        	<input type="hidden" value="${cp.mainTarget}">
	                        	<input type="hidden" value="${cp.subTarget}">
	                        	<input type="hidden" value="${cp.minPrice }">
	                        	 -->
	                        </td>
	                        <td>${cp.validStart } ~ ${cp.validEnd }</td>
	                        <c:choose>
	                        	<c:when test="${cp.couponStatus eq 0}">
	                        		<td>게시전</td>
	                       		</c:when>
	                       		<c:when test="${cp.couponStatus eq 1}">
	                        		<td>진행중</td>
	                       		</c:when>
	                       		<c:otherwise>
	                       			<td>만료</td>
	                       		</c:otherwise>
	                       	</c:choose>	
	                    </tr>
	                	</c:forEach>
	                </tbody>
	           </table>
	           ${pageNavi}
    	</div>
    	
	</div>
	
         <!-- 모달 -->
		<div class="modal-wrap">
	        <div class="detail-modal">
	            <div class="modal-top">
	                <h3>펀딩 상세정보</h3>
	            </div>
	            <div class="modal-content">
	                <table border="1" class="detail-table">
	                	
	                </table>
	            </div>
	            <button class="modal-close">닫기</button>
	        </div>
	    </div>
         
          
	<input type="hidden" class="information" optionType="${type }" keyword="${keyword }" reqPage="${reqPage }">
<script>

//모달 오픈
 $(".couponName").on("click",function(){
        $(".modal-wrap").css("display","flex");
        const couponNo = $(this).parent().prev().text();
        $.ajax({
        	url : "/couponDetail.do",
        	type:"post",
        	data : {couponNo:couponNo},
        	success: function(c){
        		const table = $(".detail-table");
        		let discount = c.discount.toLocaleString('ko-KR');
        		if(discount == 0){
        			discount = "";
        		}
        		let couponType = c.couponType;
        		if(couponType == 0){
        			couponType = "무료배송";
        		}else if(couponType ==1){
        			couponType="%";
        		}else{
        			couponType="원"
        		}
        		
        		let content = "<tr><th>쿠폰명</th><td>"+c.couponName+"</td></tr><tr><th>유효기간</th><td>"+c.validStart+"~"+c.validEnd+"</td></tr><tr><th>할인액</th><td>"+discount+couponType+"</td></tr>";
        		content += "<tr><th>메인카테고리</th><td>"+c.mainTarget+"</td></tr><tr><th>서브카테고리</th><td>"+c.subTarget+"</td></tr>";
        		content += "<tr><th>최소구매금액</th><td>"+c.minPrice.toLocaleString('ko-KR');
        		table.empty();
        		table.append(content);
        	
        	},
        	error :function(){
        		console.log("서비스 호출 실패");
        	}
        });
    });
 $(".modal-close").on("click",function(){
        $(".modal-wrap").css("display","none");
    });





//쿠폰등록
$(".insert").on("click",function(){
	location.href="/insertCouponFrm.do";
});


//삭제버튼
$(".delete").on("click",function(){
    //쿠폰코드 가져오기
    const check = $("input[name='radio']:checked").val();
    if(check == null){
        alert("삭제할 쿠폰을 선택해주세요");
    }else{
    	if($("input[name='radio']:checked").parent().next().next().next().next().text() == "게시전"){
    		if(confirm("쿠폰을 삭제하시겠습니까?")){
    			location.href="/deleteCoupon.do?couponNo="+check;
    		}
    	}else{
    		alert("게시전 쿠폰만 삭제 가능합니다.");
    	}
    }
});
//수정버튼
$(".modify").on("click",function(){
    const check = $("input[name='radio']:checked").val();
    if(check == null){
        alert("수정할 쿠폰을 선택해주세요");
    }else{
    	if($("input[name='radio']:checked").parent().next().next().next().next().text() == "게시전"){
            location.href="/updateCouponFrm.do?couponNo="+check;
    	}else{
    		alert("게시전 쿠폰만 수정 가능합니다.");
    	}
    }
});


//기존값들
const keyword=$(".information").attr("keyword");
const type=$(".information").attr("optionType");
const reqPage = $(".information").attr("reqPage");

//키워드 셋팅
if(keyword != ""){
	$("#keyword").val(keyword);
}

//옵션셋팅(전체,0게시전,1게시후,2만료])
const changeType = $(".changeType");
changeType.val(type);

//검색버튼 클릭시
$(".search-btn").on("click",function(){
	const value = $("#keyword").val();
	location.href="/couponManage.do?reqPage="+reqPage+"&keyword="+value+"&type="+type;
});

//옵션 변경시 적용(전체, 게시전, 진행중, 만료)
changeType.on("change",function(){
	const change = $(this).val();
	location.href="/couponManage.do?reqPage="+reqPage+"&keyword="+keyword+"&type="+change;
});


</script>
</body>
</html>