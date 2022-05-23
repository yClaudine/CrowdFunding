<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/setting.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    
    
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;700&display=swap');
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="content">
        <h5> <span class="material-symbols-outlined" id="setting">settings</span> 설정</h5>
        <ul class="settings">
                <li class="my">
                    <span>my 정보설정</span>
                </li>
                <li class="wrap">
                    <a href="updateMemberFrm.do">
                        <div>
                            <span class="ti">기본 정보 설정</span>
                            <span class="ti">이름, 이메일 ,휴대폰등</span>
                        </div>
                        <span class="material-symbols-outlined"> keyboard_arrow_right  </span>
                    </a>
                </li>
                <li class="wrap">
                    <a href="pwChangeFrm.do">
                        <div>
                            <span class="ti">비밀번호 등록</span>
                            <span class="ti">계정 비밀번호 등록</span>
                        </div>
                        <span class="material-symbols-outlined"> keyboard_arrow_right  </span>
                    </a>
                </li>
                <li class="wrap">
                    <a href="signoutFrm.do">
                        <div>
                            <span class="ti">회원 탈퇴</span>
                            <span class="ti">이용해주셔서 감사합니다.</span>
                        </div>
                        <span class="material-symbols-outlined"> keyboard_arrow_right  </span>
                    </a>
                </li>
        </ul>
    
</div>
</body>
</html>