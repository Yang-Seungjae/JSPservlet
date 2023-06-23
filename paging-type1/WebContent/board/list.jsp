<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.vo.BoardVO"  %>
<%@ page import="java.util.List"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	BoardDAO bDao = new BoardDAO();
	// �ش� �������� �Խñ� ���
	List<BoardVO> list = bDao.selectBoard();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>                                                    	
<head>
	<title>����¡ ó��</title>
	<link rel="stylesheet" href="../css/table.css" />
</head>                          
<body>
	<div align="center">
		<br />
		<hr width="70%" />                                      	
		<h2>�Խ��� ���</h2>	                                        
		<hr width="70%" />                                      	
		<table width="70%">                                                	
		<tr>                                                    	
			<th width="12%">��ȣ</th>
			<th>����</th>
			<th width="12%">�۾���</th>
			<th width="12%">�����</th>    
		</tr>                                                       
		<c:forEach var="item" items="${list}">
			<tr>                                            
				<td><c:out value="${item.no}" /></td>
			    <td style="text-align:left;padding-left:10px;">
			    	<c:out value="${item.title}" />
			    </td>
			    <td><c:out value="${item.writer }" /></td>
			    <td><c:out value="${item.regDate}" /></td>
			</tr>
		</c:forEach>
		</table>   
	</div>
</body>
</html>









 