<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // 로그인 세션 확인
    HttpSession currentSession = request.getSession(false);
    String userId = null;
    if (currentSession != null && currentSession.getAttribute("userId") != null) {
        userId = (String) currentSession.getAttribute("userId");
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<h1><%= userId %>로 로그인 하였습니다. <br/></h1>

<form method="POST" action="/example1/ex8-exam2/mainpage2.jsp">
        <input type="hidden" name="logout" value="true">
        <button type="submit">로그아웃</button>
    </form>

</body>
</html>
<%

    // 로그아웃 처리
    String logoutValue = request.getParameter("logout");
    if (logoutValue != null && logoutValue.equals("true")) {
        // 세션 무효화
        if (currentSession != null) {
            currentSession.invalidate();
        }
        // 로그인 페이지로 리다이렉트
        response.sendRedirect("login2.jsp");
    }
%>