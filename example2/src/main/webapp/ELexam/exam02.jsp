<%--

<%@page import="kr.ac.kopo.book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	BookVO b = new BookVO();
	b.setIsbn("123-456");
	b.setTitle("EL이란 무엇인가?");
	b.setWriter("홍길동");
	
	// 공유영역(pageContet)에 "book"이란이름으로 생성된 BookVO객체를 등록
	pageContext.setAttribute("book", b);
	
	// "book" 객체 조회
	BookVO book = (BookVO)pageContext.getAttribute("book");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	ISBN : <%= book.getIsbn() %><br>
	ISBN : <%= ((BookVO)pageContext.getAttribute("book")).getIsbn() %><br> <!-- EL을 안쓰면 이렇게 복잡하게 불러와야하는데 아래 EL은 아주 간단하게 해결 가능 -->
	EL ISBN : ${ book.isbn }<br>
</body>
</html>


--%>
