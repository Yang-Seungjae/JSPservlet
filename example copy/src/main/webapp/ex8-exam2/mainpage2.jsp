<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // �α��� ���� Ȯ��
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


<h1><%= userId %>�� �α��� �Ͽ����ϴ�. <br/></h1>

<form method="POST" action="/example1/ex8-exam2/mainpage2.jsp">
        <input type="hidden" name="logout" value="true">
        <button type="submit">�α׾ƿ�</button>
    </form>

</body>
</html>
<%

    // �α׾ƿ� ó��
    String logoutValue = request.getParameter("logout");
    if (logoutValue != null && logoutValue.equals("true")) {
        // ���� ��ȿȭ
        if (currentSession != null) {
            currentSession.invalidate();
        }
        // �α��� �������� �����̷�Ʈ
        response.sendRedirect("login2.jsp");
    }
%>