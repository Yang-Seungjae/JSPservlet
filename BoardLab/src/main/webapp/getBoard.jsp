<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>�� �󼼺���</h1>
<hr/>
<form action="updateBoard.do" method = "post">
<input name="seq" type="hidden" value="${board.seq}"/>
<table border="1">
<tr>
<td>����</td>
<td><input name="title" type="text" value="${board.title}"/></td>
</tr>
<tr>
<td>�ۼ���</td>
<td>${board.writer}</td>
</tr>
<tr>
<td>����</td>
<td><textarea name="content" cols="40" rows="10">
${board.content}
</textarea></td>
</tr>
<tr>
<td>�ۼ���</td>
<td>${board.regDate}</td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="����"/>
</td>
</tr></table>

</form>
<hr/>
<a href="insertBoard.html">�� �� ����</a>
<br/>
<c:if test="${user.role == 'Admin'}">
<a href="deleteBoard.do?seq=${board.seq}">�� ����</a>
</c:if>
<br/>
<a href="getBoardList.do">���</a>
</body>
</html>