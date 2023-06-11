<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>양승재의 도서관홈페이지</title>
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
        
        margin-top: -80px;
      }
      
      #homepage {
        background-image: url("/WebMVC/image/123.jpg");
        background-size: cover;
        background-position: center;
        height: 89vh;
        width: 100vw;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
      }
   </style>
  </head>
  <body>
    <%-- 탑메뉴랑 바텀메뉴에 내용 넣기 --%>
    <div>
     <jsp:include page="/jsp/include/topMenu.jsp"/>
    </div>
 
    <div id="homepage">
      <p id="main">
        <jsp:include page="/jsp/include/mainbody.jsp" />
      </p>
    </div>
  </body>
</html>


