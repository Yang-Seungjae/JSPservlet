<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
	<%
	 HttpSession currentSession = request.getSession(false); 
	
	 boolean isLoggedIn = (currentSession != null && currentSession.getAttribute("id") != null);

	 
	if(isLoggedIn) { 
		response.sendRedirect("mainpage2.jsp");
		
	} else {
		

	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="/example1/Login3" method="get">
		아이디 <input type="text" name="id"><br>
		비밀번호 <input type="password" name="password"><br>
		<input type="submit" value="로그인">
	</form>
	<%
	}
	%>
</body>
</html>