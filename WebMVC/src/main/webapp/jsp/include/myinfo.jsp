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
        <p>��й�ȣ 		 : ${user.password}</p>
        <p>�̸�       	 : ${user.name}</p>
        <p>����       	 : ${user.type}</p>
    
    <div>
   			 <form action="updateinfo.do" method="POST"> <%-- ȸ������������ư ���� --%>
			<input type="submit" value="ȸ����������">
			</form>
			
			 <form action="deleteuser.do" method="POST"> <%-- ȸ��Ż���ư ���� --%>
			<input type="submit" value="ȸ��Ż��">
			</form>
    </div>
    
    <div>
    �뿩���� �������
   	<form action="returnbook.do" method="POST"> <%-- ȸ��Ż���ư ���� --%>
			<input type="submit" value="ȸ��Ż��">
			</form>
    </div>
    
    <div>
    <jsp:include page="/jsp/include/returnbooklist.jsp"/>
    </div>
    
   
    
</body>
</html>