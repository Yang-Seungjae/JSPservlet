<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>My Info</title>
    <style>
		header {
			background-color: #f0f0f0;
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
		}
    
        body {
            background-color: #f8f9fa;
            padding: 20px;
            background-image: url("/WebMVC/image/123.jpg"); /* 배경 이미지 추가 */
            background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
        }
        
        .info-box {
            background-color: rgba(245, 245, 220, 0.8);;
            color: #000000;
            padding: 20px;
            border-radius: 10px;
            margin: 0 auto; /* 가운데 정렬 */
            margin-top: 250px;
            width: 400px; /* 너비 지정 */
        }
        
        .info-box p {
            margin: 10px 0;
        }
        
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        
        .button-container form {
            display: inline-block;
            margin-right: 10px;
        }
        
        .button-container form input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
<header>
  <jsp:include page="/jsp/include/topMenu.jsp"/>
</header>
<section>
	<div class="info-box">
        <h1 style="color: #8B4513;">회원정보</h1>
        <BR/>
        <p>아이디: ${user.id}</p>
        <p>이름: ${user.name}</p>
        <p>유형(S:관리자, U:사용자): ${user.type}</p>
    </div>
    
    <div class="button-container">
        <form action="updateinfo.do" method="POST">
            <input type="submit" value="회원정보수정"  style="background-color: #D2B48C; color: #8B4513;">
        </form>
        
        <form action="deleteuser.do" method="POST">
            <input type="submit" value="회원탈퇴" style="background-color: #D2B48C; color: #8B4513;">
        </form>
        
        <form action="returnbooklist.do" method="POST">
            <input type="submit" value="대여중인 도서목록" style="background-color: #D2B48C; color: #8B4513;">
        </form>
    </div>
</section>
    
</body>
</html>

