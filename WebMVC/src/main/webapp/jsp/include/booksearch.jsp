<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>도서검색</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/css/bootstrap.min.css" />
<style>
  body {
    background-color: #f8f9fa;
    background-image: url("/WebMVC/image/123.jpg"); /* 배경 이미지 추가 */
  }
  
.btn.btn-search.btn-lg {
  background-color: #D2B48C;
  color: #8B4513;
  border-color: #D2B48C;
}

.search-form {
  text-align: center;
  padding: 10px;
  color: white;
  border-radius: 5px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
  margin-top: 20px;
  border-radius: 10px;
}

.search-form h2 {
  margin-bottom: 20px;
}

.search-form select,
.search-form input[type="search"] {
  margin-bottom: 10px;
}

.search-form button {
  background-color: #007bff;
  color: #ffffff;
  border-color: #007bff;
}

.search-results {
  margin-bottom: 10px;
  text-align: center;
  margin-top: 30px;
  background-color: rgba(245, 245, 220, 0.8); /* 연한 베이지색 배경 */
  color: #000000; /* 검은색 텍스트 */
  padding-left: 20px; /* 좌측 여백 추가 */
  padding-right: 20px; /* 우측 여백 추가 */
  margin-left: 150px;
  margin-right: 150px;
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
</style>
</head>
<body>
<header>
  <div class="headercss">
    <jsp:include page="/jsp/include/topMenu.jsp" />
  </div>
</header>
<section>
  <div class="container">
    <div class="row justify-content-center mt-5">
      <div class="col-md-6">
        <form method="post" action="/WebMVC/booksearchprocess.do" name="searchform" onsubmit="return checkForm()">
          <h2 class="text-center mb-4" id="searchbook" style="color: #ffffff;">도서검색</h2>
          <div class="mb-3">
            <select class="form-select" name="searchBy">
              <option id="total" value="total" selected>통합검색</option>
              <option id="title" value="title">도서명</option>
              <option id="writer" value="writer">저자</option>
              <option id="publisher" value="publisher">출판사</option>
            </select>
          </div>
          <div class="input-group mb-3">
            <input type="search" class="form-control" id="sckeyword" name="sckeyword" placeholder="검색" />
            <button type="submit" id="searchbook" class="btn btn-search btn-lg" style="color: #8B4513;">검색</button>
          </div>
        </form>
      </div>
    </div>
  </div>
    
    <div class="search-results">
      <c:choose>
        <c:when test="${empty sbook}">
          <p style="color: black;">검색결과가 없습니다.</p>
        </c:when>
        <c:otherwise>
          <h1>검색 도서</h1>
          <table>
            <thead>
              <tr>
                <th>도서번호</th>
                <th>제목</th>
                <th>작가</th>
                <th>출판사</th>
                <th>대여여부</th>
                <th>대출</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="book" items="${sbook}">
                <tr>
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
                      <c:when test="${empty loginUser}">
                        로그인 후 대출
                      </c:when>
                      <c:when test="${book.rented_book eq '1'}">
                        대출 중
                      </c:when>
                      <c:otherwise>
                        <form action="rentbook.do" method="POST">
                          <input type="hidden" name="no" value="${book.no}">
                          <input type="hidden" name="id" value="${loginUser.id}">
                          <input type="submit" value="대출하기" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">
                        </form>
                      </c:otherwise>
                    </c:choose>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>

