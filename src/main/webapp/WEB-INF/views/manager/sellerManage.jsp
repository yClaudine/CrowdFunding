<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 승인 관리</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
<style>
.content-wrap{
    overflow: hidden;
    width: 1200px;
    border-top: 1px solid #bfbfbf;
    font-family: ns-medium;
    border-top: 1px solid #bfbfbf;
    margin: 0 auto;
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
    font-size: 13px;
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
.content-wrap .btn{
    font-size: 13px;
    margin: 5px;
}

.content-wrap .btn-primary{
    color: whitesmoke ;
    background-color: #02c9c9;
    border: 1px solid #02c9c9;
    margin: 0;
    margin-bottom: 5px;
    width: 70px;
    height: 30px;
    line-height: 13px;
    font-size: 13px;
    border-radius: 5px;
}
.content-wrap .btn-primary:hover{
    background-color: #00b2b2;
    border: 1px solid white;
    border: 1px solid #00b2b2;
}
.sub-menu{
    width: 430px;
    margin: auto;
    margin-bottom: 50px;
}
.sub-menu>*{
    width: 200px;
    font-size: 20px;
}
.sub-menu a{
	text-decoration:none;
	color: whitesmoke ;
}

.top-search{
    width: 435px;
    margin: 0 auto;
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
.table{
    margin-top: 50px;
}
.table>*{
    text-align: center;
}
.table select{
	 font-size: 13px;
	 padding: 3px;
}
.main-content .table td{
    line-height: 30px;
    height: 30px;
}
#reportManage{
	background-color: #e7f9f9;
	border:none;
	border: 1px solid  #e7f9f9;
}
#reportManage>*{
	color: #60656a;
}
#sellerManage{
	color:#00b2b2;
    border: 2px solid #00b2b2;
    font-weight: bold;
    margin:0;
    margin-bottom: 5px;
}
#sellerManage:hover{
	cursor: default;
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
}
select{
	border: 1px solid #bfbfbf;
}
.nodata{
	text-align: center;
}
.table a{
	color: black;
	text-decoration: none;
}
#more-btn{
	font-size: 20px;
	margin: 5px;
	height: 50px;
	line-height: 25px;
	color: #00b2b2;
	border: 1px solid #00b2b2;
	display: none;
	margin: 5px auto;
	width: 99%;
	background-color:#e7f9f9;
}
#more-btn:hover{
	background-color: #00b2b2;
	border: 1px solid #d1e2e2;;
	color: white;
}
#reportManage>a{
	display:block;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	 <div class="content-wrap">
        <div class="left-content">
            <div class="title">회원관리</div>
            <div class="menu-wrap">
                <ul class="manager-menu">
                    <li>관리자페이지</li>
                    <li><a href="/fundManage.do?reqPage=1&keyword=&type=all" >펀딩관리</a></li>
                    <li><a href="/storeManage.do?reqPage=1&keyword=&type=all"  >스토어관리</a></li>
                    <li><a href="/memberManage.do?reqPage=1&keyword=&type=all" class="active-menu">회원관리</a></li>
                    <li><a href="/couponManage.do?reqPage=1&keyword=&type=3">쿠폰관리</a></li>
                </ul>
            </div>
        </div>
        <div class="main-content">
            <div class="sub-menu">
                <button type="button" class="btn" id="reportManage"><a href="/memberManage.do?reqPage=1&keyword=&type=all">회원 신고 관리</a></button>
                <button type="button" class="btn" id="sellerManage">판매자 승인 관리</button>
            </div>
            <div class="top-search">
                <ul>
                    <li style="line-height: 80px; margin: 0;">
                        <span class="material-icons" style="font-size: 30px; height: 20px;" >search</span>
                    </li>
                    <li>
                        <input type="text" name="keyword" id="keyword" placeholder="아이디를 입력해주세요">
                    </li>
                    <li>
                        <input type="submit" class="search-btn" value="검색"></input>
                    </li>
                </ul>
            </div>
            <div class="type">
            	<select class="authType">
            		<option value="3">전체</option>
            		<option value="0">심사전</option>
            		<option value="1">승인</option>
            		<option value="2">미승인</option>
            	</select>
            </div>
            
            <c:choose>
            	<c:when test="${totalCount eq 0}">
            		 <div class="nodata"><h6>조회 결과가 없습니다.</h6></div>
            	</c:when>
            	<c:otherwise>
            		<div class="seller-table">
		            	<table class="table table-hover">
		                    <thead>
		                        <tr>
		                            <th>아이디</th>
		                            <th>대표자</th>
		                            <th>사업자번호</th>
		                            <th>증빙</th>
		                            <th>허가상태</th>
		                            <th></th>
		                        </tr>
		                    </thead>
		                    
		                    <tbody class="tbody">
		                    
		                    <!--  
		                    	<c:forEach items="${sellerList }" var="s">
		                    		<tr>
			                            <td class="memberId">${s.memberId }</td>
			                            <td>${s.owner }</td>
			                            <td>${s.enNo }</td>
			                            <td>
											<a href="/photoFileDown.do?photopath=${s.enPath}">파일확인</a>
										</td>
			                            <td>
			                            	<input type="hidden" class="authSeller" value=${s.authSeller }>
			                                <select name="auth" id="auth">
			                                	<option value="1">승인</option>
			                                    <option value="2">미승인</option>
			                                    <option value="0" disabled>심사전</option>
			                                </select>
			                            </td>
			                            <td>
			                                <button type="button" class="btn btn-primary change">변경</button>
			                                <input type="hidden" class="oldAuth" value="${s.authSeller }">
			                                <input type="hidden" sellerNo="${s.sellerNo }" memberId="${s.memberId }">
			                            </td>
		                        	</tr>
		                    	</c:forEach>
		                    	
		                    	-->
		                    </tbody>
		                    
		                </table> 
           	 		</div>
            	</c:otherwise>
            </c:choose>
          
           	 <button class="more-btn" id="more-btn" totalCount="${totalCount }" currentCount="0" value="1" >더보기</button>

            	
        </div>
    </div>
  	<input type="hidden" class="information" optionType="${type }" keyword="${keyword }" >


<script>

//더보기 버튼
$("#more-btn").on("click",function(){
	const amount = 5;
	const start = $(this).val();
	$.ajax({
		url : "/moreSeller.do",
		data: {start:start, amount:amount, type:optionType, keyword:keyword},
		success : function(data){
			for(let i=0; i<data.length; i++){
				const s = data[i];
				const tbody = $(".tbody");
				
				let code = "<tr><td class='memberId'>"+s.memberId+"</td><td>"+s.owner+"</td><td>"+s.enNo;
				code += "</td><td><a href='/photoFileDown.do?photopath="+s.enPath+"'>파일확인</a></td>";
				code += "<td><input type='hidden' class='authSeller' value="+s.authSeller;
				code += "><select name='auth' id='auth'><option value='1'>승인</option><option value='2'>미승인</option><option value='0' disabled>심사전</option></select></td>";
				code += "<td><button type='button' class='btn btn-primary change'>변경</button><input type='hidden' class='oldAuth' value="+s.authSeller;
				code += "><input type='hidden' sellerNo='"+s.sellerNo+"' memberId='"+s.memberId+"'></td></tr>";
				
				tbody.append(code);
			}
			$("#more-btn").val(Number(start)+amount);	
			const currVal = Number($("#more-btn").attr("currentCount"));
			$("#more-btn").attr("currentCount",currVal+data.length);
			const totalCount = Number($("#more-btn").attr("totalCount"));
			if(totalCount == (currVal+data.length)){
				//$("#more-btn").attr("disabled",true);
				//$("#more-btn").css("cursor","not-allowed");
				$("#more-btn").remove();
			}
			$("#more-btn").css("display","block");
			//허가상태값 셋팅
			const authSeller = $(".authSeller");
			authSeller.each(function(index,item){
				$(item).next().val($(item).val());
			});
			
			//저장버튼
			$(".change").on("click",function(){
			    const oldAuth = $(this).next().val();
			    const auth = $(this).parent().prev().children().eq(1).val();
			    const sellerNo = $(this).next().next().attr("sellerNo");
			    const memberId = $(this).next().next().attr("memberId");
			    if(auth == oldAuth){
			        alert("변경된 값이 없습니다.")
			    }else{
			        switch(auth){
			            case '1':
			                location.href="/authSellerChange.do?authSeller=1&categoryNo=2&sellerNo="+sellerNo+"&memberId="+memberId+"&msg=&type="+optionType+"&keyword="+keyword;
			                break;
			            case '2':
			            	const msg = prompt("판매자에게 전송할 미승인 사유를 적어주세요");
			            	if(msg != null){
			            		location.href="/authSellerChange.do?authSeller=2&categoryNo=1&sellerNo="+sellerNo+"&memberId="+memberId+"&msg="+msg+"&type="+optionType+"&keyword="+keyword;
			            	}
			                break;
			        }
			    }
			});
			
		},
		error : function(){
			console.log("서비스 호출 실패");
		}
	});
});

$(function(){
	$("#more-btn").click();
});

//키워드 셋팅
const keyword=$(".information").attr("keyword");
if(keyword != ""){
	$("#keyword").val(keyword);
}

//옵션셋팅(전체,미승인,승인,심사전)
const authType = $(".authType");
const optionType=$(".information").attr("optionType");
authType.val(optionType);



//검색버튼 클릭시
$(".search-btn").on("click",function(){
	const value = $("#keyword").val();
	location.href="/sellerManage.do?keyword="+value+"&type="+optionType;
	/*
	if( value == ""){
		alert("검색어를 입력해주세요");
	}else{
		
	}
	*/
});


//옵션 변경시 적용(전체,미승인,승인,심사전)
authType.on("change",function(){
	
	const authSeller = $(this).val();
	/*
	$("#more-btn").val(1);
	$("#more-btn").attr("currentCount",0);
	
	$(".tbody").empty();
	$("#more-btn").click();
	*/
	location.href="/sellerManage.do?keyword="+keyword+"&type="+authSeller;
});


//저장버튼
$(".change").on("click",function(){
    const oldAuth = $(this).next().val();
    const auth = $(this).parent().prev().children().eq(1).val();
    const sellerNo = $(this).next().next().attr("sellerNo");
    const memberId = $(this).next().next().attr("memberId");
    if(auth == oldAuth){
        alert("변경된 값이 없습니다.")
    }else{
        switch(auth){
            case '1':
                location.href="/authSellerChange.do?authSeller=1&categoryNo=2&sellerNo="+sellerNo+"&memberId="+memberId+"&msg=&type="+optionType+"&keyword="+keyword;
                break;
            case '2':
            	const msg = prompt("판매자에게 전송할 미승인 사유를 적어주세요");
            	if(msg != null){
            		location.href="/authSellerChange.do?authSeller=2&categoryNo=1&sellerNo="+sellerNo+"&memberId="+memberId+"&msg="+msg+"&type="+optionType+"&keyword="+keyword;
            	}
                break;
        }
    }
});

</script>
   	
	
	
</body>
</html>