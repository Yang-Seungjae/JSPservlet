<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보 수정</title>
</head>
<body>
    <h1>회원 정보 수정</h1>
    <hr />
    <div>
        <form action="updateuserinfo.do" method="post">
            <div>
                <label for="id">아이디 ${loginUser.id}</label>
                <input name="id" type="hidden" value="${loginUser.id}" />
            </div>
            <div>
                <label for="password">비밀번호</label>
                <input type="password" name="password" value="${loginUser.password}" />
            </div>
            <div>
                <label for="name">이름</label>
                <input type="text" name="name" value="${loginUser.name}" />
            </div>
            <div>
                <input type="submit" value="수정" />
            </div>
        </form>
        <br/>
        <a href="/jsp/include/main.jsp">뒤로가기</a>
    </div>
</body>
</html>