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
		<h1>전체 도서</h1>
		<table>
			<thead>
				<tr>
					<th>도서번호	 |</th>
					<th>제목		 |</th>
					<th>작가		 |</th>
					<th>출판사	 |</th>
					<th>대여여부	 |</th>
					<c:if test="${loginUser.type eq ('U' || 'S')}"><th>대출 |</th></c:if>
					<c:if test="${ loginUser.type eq 'S' }"><th>관리 |</th></c:if>
					
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
                                        대출 중
                                    </c:when>
								<c:otherwise>
                                        대출 가능
                                    </c:otherwise>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${book.rented_book eq '1'}">
            					대출불가
        						</c:when>
								<c:otherwise>
							<form action="rentbook.do" method="POST">
								<input type="hidden" name="no" value="${ book.no }">
								<input type="hidden" name="id" value="${ loginUser.id }">
								<input type="submit" value="대출하기">
							</form>
							<c:if test="${loginUser.type eq 'S'}"> <!-- 매니저인 경우에만 삭제 버튼 표시 -->
                 			   <td>
                			   
                           <form action="deletebook.do" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
   								 <input type="hidden" name="no" value="${book.no}" />
   								 <input type="submit" value="삭제" />
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