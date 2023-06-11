<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�����˻�</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/css/bootstrap.min.css" />
<style>
  body {
    background-color: #f8f9fa;
    background-image: url("/WebMVC/image/123.jpg"); /* ��� �̹��� �߰� */
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
  background-color: rgba(245, 245, 220, 0.8); /* ���� �������� ��� */
  color: #000000; /* ������ �ؽ�Ʈ */
  padding-left: 20px; /* ���� ���� �߰� */
  padding-right: 20px; /* ���� ���� �߰� */
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
          <h2 class="text-center mb-4" id="searchbook" style="color: #ffffff;">�����˻�</h2>
          <div class="mb-3">
            <select class="form-select" name="searchBy">
              <option id="total" value="total" selected>���հ˻�</option>
              <option id="title" value="title">������</option>
              <option id="writer" value="writer">����</option>
              <option id="publisher" value="publisher">���ǻ�</option>
            </select>
          </div>
          <div class="input-group mb-3">
            <input type="search" class="form-control" id="sckeyword" name="sckeyword" placeholder="�˻�" />
            <button type="submit" id="searchbook" class="btn btn-search btn-lg" style="color: #8B4513;">�˻�</button>
          </div>
        </form>
      </div>
    </div>
  </div>
    
    <div class="search-results">
      <c:choose>
        <c:when test="${empty sbook}">
          <p style="color: black;">�˻������ �����ϴ�.</p>
        </c:when>
        <c:otherwise>
          <h1>�˻� ����</h1>
          <table>
            <thead>
              <tr>
                <th>������ȣ</th>
                <th>����</th>
                <th>�۰�</th>
                <th>���ǻ�</th>
                <th>�뿩����</th>
                <th>����</th>
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
                      <c:when test="${book.rented_book eq '1'}">���� ��</c:when>
                      <c:otherwise>���� ����</c:otherwise>
                    </c:choose>
                  </td>
                  <td>
                    <c:choose>
                      <c:when test="${empty loginUser}">
                        �α��� �� ����
                      </c:when>
                      <c:when test="${book.rented_book eq '1'}">
                        ���� ��
                      </c:when>
                      <c:otherwise>
                        <form action="rentbook.do" method="POST">
                          <input type="hidden" name="no" value="${book.no}">
                          <input type="hidden" name="id" value="${loginUser.id}">
                          <input type="submit" value="�����ϱ�" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">
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

