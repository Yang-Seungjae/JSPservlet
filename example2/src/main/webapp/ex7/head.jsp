<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.util.Date" %>
<%@ page session = "false" %>
<%! 
Date date;
String name;
String email;
%>
<%!
public int getLength(){
	int len = email.length();
	return len;
}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1> include + 지시문 예제</h1>
<%
	date = new Date();
%>

현재 날짜 : <%= date.toLocaleString() %>  
</body>
</html>