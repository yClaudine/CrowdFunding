<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
    html>body {
        font-family: 'Noto Sans KR', sans-serif;
    }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="resources/css/bootstrap.css" rel="stylesheet"/>
    <link rel="stylesheet" href="resources/css/header7.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>
    <div class="header">
        <div class="logo"><a href=""><img src="resources/image/파이널로고2.png"></a></div>
        
        <div><a href=""><h6>펀딩</h6></a></div>
        <div><a href=""><h6>스토어</h6></a></div>
        <div><a href=""><h6>공지사항</h6></a></div>
        
        <div class="log">
           
            <div>
                <div class="searchFund">
                    <form action="/searchFund" method="post">
                        <button type="submit"><span class="material-symbols-outlined searchI">
                        search
                        </span></button>
                        <input type="text" name="fundName"  placeholder="어떤 펀딩을 찾고 계신가요? ">
                    </form>
                </div>
                
                <div><a href="" class="access">로그인</a></div>
                <div><a href="" class="access">회원가입</a></div>
                <a href=""><div class="openReq">프로젝트 오픈신청</div></a>
            </div>
        </div>
        
        
    </div>
    <script>
        $(function(){
            const scInput = $("[name=fundName]");
            scInput.on("focus",function(){
                $(this).css("border","2.0px solid #00b2b2");
            });
            scInput.on("focusout",function(){
                $(this).css("border","1.8px solid #868e96");
            });
            
            
        })
        
    </script>
</body>
</html>