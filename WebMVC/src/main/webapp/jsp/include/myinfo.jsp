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
    <h1>�� ����</h1>
    
        <p>���̵� 		 : ${user.id}</p>
        <p>�̸�       	 : ${user.name}</p>
        <p>����(S:������, U:�����)       	 : ${user.type}</p>
    
    <div>
   			 <form action="updateinfo.do" method="POST"> <%-- ȸ������������ư ���� --%>
			<input type="submit" value="ȸ����������">
			</form>
			
			 <form action="deleteuser.do" method="POST"> <%-- ȸ��Ż���ư ���� --%>
			<input type="submit" value="ȸ��Ż��">
			</form>
    </div>
    
    <div>
     <form action="returnbooklist.do" method="POST"> <%-- ȸ��Ż���ư ���� --%>
			<input type="submit" value="�뿩���� �������">
			</form>
    
    </div>
    
   
    
</body>
</html>