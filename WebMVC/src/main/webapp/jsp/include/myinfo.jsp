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
        <p>이름       	 : ${user.name}</p>
        <p>유형(S:관리자, U:사용자)       	 : ${user.type}</p>
    
    <div>
   			 <form action="updateinfo.do" method="POST"> <%-- 회원정보수정버튼 생성 --%>
			<input type="submit" value="회원정보수정">
			</form>
			
			 <form action="deleteuser.do" method="POST"> <%-- 회원탈퇴버튼 생성 --%>
			<input type="submit" value="회원탈퇴">
			</form>
    </div>
    
    <div>
     <form action="returnbooklist.do" method="POST"> <%-- 회원탈퇴버튼 생성 --%>
			<input type="submit" value="대여중인 도서목록">
			</form>
    
    </div>
    
   
    
</body>
</html>