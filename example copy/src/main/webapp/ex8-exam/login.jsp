<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
	<%
	 HttpSession currentSession = request.getSession(false); 
	
	 boolean isLoggedIn = (currentSession != null && currentSession.getAttribute("id") != null);

	 
	if(isLoggedIn) { 
		response.sendRedirect("mainpage.jsp");
		
	} else {
		

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="loginProcess.jsp" method="post">
		���̵� <input type="text" name="id"><br>
		��й�ȣ <input type="password" name="password"><br>
		<input type="submit" value="�α���">
	</form>
	<%
	}
	%>
</body>
</html>