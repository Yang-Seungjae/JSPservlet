<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>

<section>
		<h1>�뿩�� ����</h1>
		<table>
			<thead>
				<tr>
					<th>������ȣ	 |</th>
					<th>����		 |</th>
					<th>�۰�		 |</th>
					<th>���ǻ�	 |</th>
					<th>�뿩����	 |</th>
					<c:if test="${loginUser.type eq ('U' || 'S')}"><th>�ݳ� |</th></c:if>
				
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${sbook}">
					<tr>
						<td>${book.no}</td>
						<td>${book.title}</td>
						<td>${book.writer}</td>
						<td>${book.publisher}</td>
						<td><c:choose>
								<c:when test="${book.rented_book eq '1'}">
                                        ���� ��
                                    </c:when>
								<c:otherwise>
                                        ���� ����
                                    </c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${book.rented_book eq '1'}">
            					<form action="returnbook.do" method="POST">
								<input type="hidden" name="no" value="${ book.no }">
								<input type="hidden" name="id" value="${ loginUser.id }">
								<input type="submit" value="�ݳ��ϱ�">
							</form>
        						</c:when>
				
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</section>

</body>
</html>