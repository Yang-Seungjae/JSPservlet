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
<h1><%= id %>�� �α��� �Ͽ����ϴ�. <br/></h1>
sessionID = <%= sessionID %> <br/>
<form method="POST" action="mainpage.jsp">
        <input type="hidden" name="logout" value="true">
        <button type="submit">�α׾ƿ�</button>
    </form>

<%
HttpSession currentSession = request.getSession(false);
    // �α׾ƿ� ó��
    String logoutValue = request.getParameter("logout");
    if (logoutValue != null && logoutValue.equals("true")) {
        // ���� ��ȿȭ
        if (currentSession != null) {
            currentSession.invalidate();
        }
        // �α��� �������� �����̷�Ʈ
        response.sendRedirect("login.jsp");
    }
%>
</body>
</html>