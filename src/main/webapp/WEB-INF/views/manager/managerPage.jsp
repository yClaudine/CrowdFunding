<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>

.chat-modal{
	position:fixed;
	right: 30px;
	bottom: 50px;
    background-color: #e7f9f9;
    width: 500px;
    height: 0;
    border-radius: 5px;
}
.close{
	height: 20px;
	width: 20px;
	background-color: transparent;
	border: none;
}
.chat-content{
	width: 500px;
	height:420px;
}
.text{
	width: 88%;
	height: 45px;
	margin: 3px;
}
.comment{
	min-height: 35px;
	line-height: 35px;
	max-width: 400px;
	margin: 5px;
	background-color: #ffffff;
	padding: 5px;
	border-radius: 5px;
}
.left{
	clear: right;
	margin-right: 15px;

}
.right{
	float: right;
}
.close:hover{
	cursor:pointer;
}
.send{
	height: 45px;
	width: 10%;
	border: 1px solid white;
	background-color:#00c4c4;
	color: white;
}
.title{
	background-color:#00c4c4;
	text-align: center;
}
#chat-table{
	width: 500px;
	margin: 50px;
}
#chat-table *{
	border: 1px solid black;
	padding: 5px;
		text-align: center;
}
#chat-table td{
	

}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
	




</body>
</html>