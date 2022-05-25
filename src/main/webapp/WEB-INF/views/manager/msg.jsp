<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</head>
<body>
<input type="hidden" class="title" value="${title }">
<input type="hidden" class="text" value="${text }">
<input type="hidden" class="icon" value="${icon }">
<input type="hidden" class="loc" value="${loc }">

<script>
const title = $(".title").val();
const text = $(".text").val();
const icon = $(".icon").val();
const loc = $(".loc").val();
	$(function(){
		swal({
			title : title,
			text : text,
			icon : icon,
			
		}).then(function(){
			location.href = loc;
		});
	});
</script>
</body>
</html>