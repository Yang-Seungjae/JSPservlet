<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!--  이클립스 , 자바 버전이 낮으면  lib에 jar파일을 넣어줘야 가져올수있다 최신버전은 저 주소에서 불러와서 가져올수잇음 바로 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:out value="Hello world"/>

<c:set var="price" scope="page" value="1000"/>
${price }

</body>
</html>