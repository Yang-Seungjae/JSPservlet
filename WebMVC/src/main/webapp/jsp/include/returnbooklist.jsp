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

<section>
		<h1>��ü ����</h1>
		<table>
			<thead>
				<tr>
					<th>������ȣ	 |</th>
					<th>����		 |</th>
					<th>�۰�		 |</th>
					<th>���ǻ�	 |</th>
					<th>�뿩����	 |</th>
					<c:if test="${loginUser.type eq ('U' || 'S')}"><th>���� |</th></c:if>
					<c:if test="${ loginUser.type eq 'S' }"><th>���� |</th></c:if>
					
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
            					����Ұ�
        						</c:when>
								<c:otherwise>
							<form action="rentbook.do" method="POST">
								<input type="hidden" name="no" value="${ book.no }">
								<input type="hidden" name="id" value="${ loginUser.id }">
								<input type="submit" value="�����ϱ�">
							</form>
							<c:if test="${loginUser.type eq 'S'}"> <!-- �Ŵ����� ��쿡�� ���� ��ư ǥ�� -->
                 			   <td>
                			   
                           <form action="deletebook.do" method="post" onsubmit="return confirm('�����Ͻðڽ��ϱ�?');">
   								 <input type="hidden" name="no" value="${book.no}" />
   								 <input type="submit" value="����" />
							</form>

                            </td>
                        </c:if>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</section>

</body>
</html>