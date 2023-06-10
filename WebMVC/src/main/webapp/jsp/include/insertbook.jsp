<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <h1>신규도서등록</h1>
    <form action="insertbookprocess.do" method="POST">
        <div>
            <label for="title">제목</label>
            <input type="text" id="title" name="title">
        </div>
        <div>
            <label for="writer">작가</label>
            <input type="text" id="writer" name="writer">
        </div>
        <div>
            <label for="publisher">출판사</label>
            <input type="text" id="publisher" name="publisher">
        </div>
        <div>
            <input type="submit" value="등록">
        </div>
    </form>
</section>

	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>
</body>
</html>