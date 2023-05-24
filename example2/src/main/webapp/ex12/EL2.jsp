<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ page import="java.util.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
Map<String, String> map = new HashMap<>();
map.put("1", "a");
map.put("2", "b");
map.put("3", "c");
pageContext.setAttribute("map", map); // EL2.jsp에다가 map 속성에 map 값을 넣어라 

%>
${map["1"]}

</body>
</html>