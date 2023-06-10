<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>My Info</title>
</head>
<body>
    <h1>내 정보</h1>
    
        <p>아이디 		 : ${user.id}</p>
        <p>비밀번호 		 : ${user.password}</p>
        <p>이름       	 : ${user.name}</p>
        <p>유형       	 : ${user.type}</p>
    
    <div>
   			 <form action="updateinfo.do" method="POST"> <%-- 회원정보수정버튼 생성 --%>
			<input type="submit" value="회원정보수정">
			</form>
			
			 <form action="deleteuser.do" method="POST"> <%-- 회원탈퇴버튼 생성 --%>
			<input type="submit" value="회원탈퇴">
			</form>
    </div>
    
    <div>
    대여중인 도서목록
   	<form action="returnbook.do" method="POST"> <%-- 회원탈퇴버튼 생성 --%>
			<input type="submit" value="회원탈퇴">
			</form>
    </div>
    
    <div>
    <jsp:include page="/jsp/include/returnbooklist.jsp"/>
    </div>
    
   
    
</body>
</html>