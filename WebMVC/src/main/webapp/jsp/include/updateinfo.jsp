<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>

  body {
		background-color: #f8f9fa;
		padding: 20px;
		background-image: url("/WebMVC/image/123.jpg"); /* 배경 이미지 추가 */
		background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
	}
	
	header {
		background-color: #f0f0f0;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
	}

form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
     background-color: rgba(245, 245, 220, 0.8);
    margin-top: 150px;
}

form label {
    font-weight: bold;
}

form .form-group {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

form input[type="password"],
form input[type="text"] {
    width: 70%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

form input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
}

form input[type="submit"]:hover {
    background-color: #0056b3;
}

a {
    color: #007bff;
}

a:hover {
    color: #0056b3;
}
</style>
</head>
<body>

<header>
  <jsp:include page="/jsp/include/topMenu.jsp"/>
</header>
    
   
    <div>
    
        <form action="updateuserinfo.do" method="post">
        <h1 class="text-center" style=" color: #8B4513;">회원 정보 수정</h1>
        <BR/>
            <div class="form-group">
                <label for="id" style=" color: #8B4513;">아이디 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${loginUser.id}</label>
                <input name="id" type="hidden" value="${loginUser.id}" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password" style="width: 30%; color: #8B4513;">비밀번호</label>
                <input type="password" name="password" value="${loginUser.password}" class="form-control" style="width: 70%;" />
            </div>
            <div class="form-group">
                <label for="name" style="width: 30%; color: #8B4513;">이름</label>
                <input type="text" name="name" value="${loginUser.name}" class="form-control" style="width: 70%;" />
            </div>
            <div class="form-group">
                <input type="submit" value="수정" class="btn btn-primary" style="background-color: #D2B48C; color: #8B4513;"/>
            </div>
        </form>
        <br/>
    </div>
    
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

