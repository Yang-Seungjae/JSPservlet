<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>

<% 	
	String id = (String)request.getParameter("id"); 
	String password = request.getParameter("password");
	
	if((id!= null && id.equals("aaaa")&&password.equals("1111"))) {
		
		session.setAttribute("id", id);
		response.sendRedirect("mainpage.jsp");
	} else {
		
		response.sendRedirect("error.jsp");
	}
%>


</body>
</html>