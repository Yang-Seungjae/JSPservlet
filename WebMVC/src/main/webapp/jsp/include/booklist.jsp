<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>


  body {
		background-color: #f8f9fa;
		padding: 20px;
		background-image: url("/WebMVC/image/123.jpg"); /* 배경 이미지 추가 */
		background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
	}
	
	header {
		background-color: #f0f0f0;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
	}
  
  .search-results {
    margin-bottom: 10px;
    text-align: center;
    margin-top: 30px;
    background-color: rgba(245, 245, 220, 0.8); /* 연한 베이지색 배경 */
    color: #000000; /* 검은색 텍스트 */
    padding: 20px; /* 좌우 여백 추가 */
    margin: 0 auto; /* 가운데 정렬 */
    max-width: 800px; /* 최대 너비 지정 */
    border-radius: 10px;
    margin-top : 100px;
  }
  
  .search-results h1 {
    margin-bottom: 20px;
    color: #333333;
  }
  
  .search-results table {
    width: 100%;
    border-collapse: collapse;
  }
  
  .search-results th,
  .search-results td {
    padding: 10px;
    border: 1px solid #dddddd;
  }
  
  .search-results th {
    background-color: #f2f2f2;
  }
  
  .search-results .manage-column {
    text-align: center;
  }
  
  .search-results .manage-column form {
    display: inline;
  }
</style>
</head>
<body>
<header>
  <jsp:include page="/jsp/include/topMenu.jsp"/>
</header>
<section>
  <div class="search-results">
    <h1 style="color: #8B4513;">전체 도서</h1>
    <table>
      <thead>
        <tr style="color: #8B4513;">
          <th>도서번호</th>
          <th>제목</th>
          <th>작가</th>
          <th>출판사</th>
          <th style="width : 100px">대여여부</th>
          <c:if test="${loginUser.type eq ('U' || 'S')}"><th>대출</th></c:if>
          <c:if test="${loginUser.type eq 'S'}"><th class="manage-column">관리</th></c:if>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="book" items="${sbook}">
          <tr >
            <td>${book.no}</td>
            <td>${book.title}</td>
            <td>${book.writer}</td>
            <td>${book.publisher}</td>
            <td>
              <c:choose>
                <c:when test="${book.rented_book eq '1'}">대출 중</c:when>
                <c:otherwise>대출 가능</c:otherwise>
              </c:choose>
            </td>
            <td>
              <c:choose>
                <c:when test="${book.rented_book eq '1'}">대출 불가</c:when>
                <c:otherwise>
                  <form action="rentbook.do" method="POST">
                    <input type="hidden" name="no" value="${book.no}">
                    <input type="hidden" name="id" value="${loginUser.id}">
                    <input type="submit" value="대출하기" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">
                  </form>
                </c:otherwise>
              </c:choose>
            </td>
            <c:if test="${loginUser.type eq 'S'}">
              <td class="manage-column">
                <form action="deletebook.do" method="post" onsubmit="return confirm('삭제하시겠습니까?');">
                  <input type="hidden" name="no" value="${book.no}" />
                  <input type="submit" value="삭제" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;" />
                </form>
              </td>
            </c:if>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
</section>
</body>
</html>

