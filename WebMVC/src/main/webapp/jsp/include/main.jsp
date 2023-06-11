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
     
        html {
          background-image: url(space.jpg);
          /* background-size: cover; */
          z-index: -1;
        }
      

      #main {
        font-size: 20px;
        text-align: center;
        position: absolute;
        top: 42%;
        left: 42%;
        color: black;
      }
      .banner {
        background-color: rgba(17, 17, 17, 0.678);
        height: 40px;
        position: relative;
        margin: -8px;
      }
      #github {
        filter: invert();
        position: fixed;
        top: 0%;
        right: 0%;
      }
      #link1 {
        border: 1px solid white;
        padding: 10px;
        color: white;
      }
      a {
        text-decoration: none;
      }
      #right {
        filter: invert();
        transform: translate(3px);
      }
      #home {
        color: white;
        position: absolute;
        right: 7%;
        top: 20%;
      }
    </style>
    
    
  </head>
  <body>
<%-- 탑메뉴랑 바텀메뉴에 내용 넣기 --%>
    <div class="banner">
      <div id="star">
        <img src="star.png" width="40" height="40" style="filter: invert()" />
      </div>
      <div id="loginstatus">
  
        <c:if test="${ not empty loginUser }">
			[${ loginUser.name }(${ loginUser.id })님 로그인 중...]
			</c:if>
		
      </div>
      <div id="menu">
      
      <a href="/WebMVC/main.do">홈 |</a>
      
      <c:if test="${ loginUser.type eq 'S' }">
				<a href = "/WebMVC/insertbook.do">도서등록</a>|
			</c:if>
			 
			<c:choose> 
				<c:when test="${ empty loginUser }"> 
					
			 		<a href = "/WebMVC/insertUser.do">회원가입</a> |
			 		<a href="/WebMVC/login.do">로그인</a> |
			 	</c:when>
			 	<c:otherwise> 
			 		<a href = "/WebMVC/booklist.do">도서목록</a> |
			 		<a href = "/WebMVC/myinfo.do">마이페이지 |</a> 
			 		<a href="/WebMVC/logout.do">로그아웃</a>
			 	</c:otherwise>
			</c:choose>
      
      </div>
    </div>
 
    <div>
      <p id="main">
        <jsp:include page="/jsp/include/mainbody.jsp" />
      </p>
    </div>
  </body>
</html>