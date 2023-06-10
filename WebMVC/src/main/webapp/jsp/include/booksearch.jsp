<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webLib/css/layout.css">
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
<section>
    <h1>도서검색</h1>
    <form action="booksearchprocess.do" method="POST">
        <div>
            <label for="title"></label>
            <input type="text" id="title" name="title">
            <input type="submit" value="�˻�">
        </div>
    </form>
    
    <c:choose>
        <c:when test="${empty sbook}">
           
            <p>검색결과가 없습니다.</p>
        </c:when>
        <c:otherwise>
           
            <table>
                <thead>
                    <tr>
                        <th>도서번호	|</th>
                        <th>제목	    |</th>
                        <th>작가   	|</th>
                        <th>출판사	|</th>
                        <th>대여여부	|</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${sbook}">
                        <tr>
                            <td>${book.bookNO}</td>
                            <td>${book.bookTitle}</td>
                            <td>${book.bookWriter}</td>
                            <td>${book.bookPublisher}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${book.rented_book eq '1'}">
                                        대출 중
                                    </c:when>
                                    <c:otherwise>
                                       대출 가능
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>
</section>


	<footer>
		<%@ include file="/jsp/include/bottom.jsp" %>
	</footer>
</body>
</html>		