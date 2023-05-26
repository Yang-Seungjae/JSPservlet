<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href="/example2/css/layout.css">
</head>
<body>
<header>
<jsp:include page ="/jsp/include/topMenu.jsp"/>
</header>
<section>
메인 페이지 입니다
</section>
<footer>
 <%@ include file = "/jsp/include/bottom.jsp" %> <%-- 지시자 include는 모든내용이 들어가서 많은양의 데이터를 include 할때는 안쓰인다 --%>
</footer>


</body>
</html>