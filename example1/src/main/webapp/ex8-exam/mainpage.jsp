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
	String id = (String)session.getAttribute("id");
String sessionID = (String)session.getAttribute("id");


%>
<h1><%= id %>로 로그인 하였습니다. <br/></h1>
sessionID = <%= sessionID %> <br/>
<form method="POST" action="mainpage.jsp">
        <input type="hidden" name="logout" value="true">
        <button type="submit">로그아웃</button>
    </form>

<%
HttpSession currentSession = request.getSession(false);
    // 로그아웃 처리
    String logoutValue = request.getParameter("logout");
    if (logoutValue != null && logoutValue.equals("true")) {
        // 세션 무효화
        if (currentSession != null) {
            currentSession.invalidate();
        }
        // 로그인 페이지로 리다이렉트
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>