<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!--  ��Ŭ���� , �ڹ� ������ ������  lib�� jar������ �־���� �����ü��ִ� �ֽŹ����� �� �ּҿ��� �ҷ��ͼ� �����ü����� �ٷ� -->
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