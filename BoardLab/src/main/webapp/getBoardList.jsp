<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Board List</h1>
<hr/>
<h3>${user.name}님 환영합니다. <a href="logout.do">logout</a></h3>
<form action="getBoardsByWriter.do" method="GET">
        <label for="writer">작성자:</label>
        <input type="text" id="writer" name="writer">
        <button type="submit">검색</button>
    </form>
<table border="1">
<tr>
<td>no</td><td>title</td><td>writer</td><td>date</td>
</tr>
<c:forEach var="board" items="${boardList}">
<tr>
<td>${board.seq }</td>
<td><a href="getBoard.do?seq=${board.seq}">${board.title }</a></td>
<td>${board.writer }</td>
<td>${board.regDate }</td>
</tr>
</c:forEach>

</table>
</body>
</html>