<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<fmt:bundle basename="ex15.message"> <!--   이렇게만 적으면 뒤에있는 en.properties 와 같은건 알아서 가져옴  -->
<fmt:message>msg</fmt:message>
</fmt:bundle>
<br/>


<fmt:setBundle basename="ex15.message"/>


<fmt:message>msg</fmt:message><br/>


<fmt:message key="msg1"><br/>
<fmt:param value="10"></fmt:param><br/>
<fmt:param value="20"></fmt:param><br/>
</fmt:message>
<br/>
<fmt:formatNumber value="1234567.89"/><br/>
<fmt:formatNumber value="0.5" type="percent"/><br/>
<fmt:formatNumber value="10000" type="currency" currencySymbol="$"/><br/>
<c:set var="now" value="<%=new java.util.Date() %>"/>
<fmt:formatDate value="${now }"/><br/>
<fmt:formatDate value="${now }" pattern="yyyy년 MM월 dd일, hh시 mm분 ss초"/>


</body>
</html>