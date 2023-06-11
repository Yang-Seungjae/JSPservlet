<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
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
