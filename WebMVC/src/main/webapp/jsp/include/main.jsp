<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
     <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }

      .banner {
        background-color: #f0f0f0;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

     
      

      #main {
        background-image: url(/WebMVC/image/);
     	
      	height : 200px;
        margin: 20px;
      }
      
   </style>
    
  </head>
  <body>
<%-- 탑메뉴랑 바텀메뉴에 내용 넣기 --%>
    <div>
     <jsp:include page="/jsp/include/topMenu.jsp"/>
    </div>
 
    <div>
      <p id="main">
        <jsp:include page="/jsp/include/mainbody.jsp" />
      </p>
    </div>
  </body>
</html>