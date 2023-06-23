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
		background-image: url("/WebMVC/image/123.jpg"); /* ��� �̹��� �߰� */
		background-size: cover; /* �̹����� ȭ�鿡 �� ä�쵵�� ���� */
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
    background-color: rgba(245, 245, 220, 0.8); /* ���� �������� ��� */
    color: #000000; /* ������ �ؽ�Ʈ */
    padding: 20px; /* �¿� ���� �߰� */
    margin: 0 auto; /* ��� ���� */
    max-width: 800px; /* �ִ� �ʺ� ���� */
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
    <h1 style="color: #8B4513;">��ü ����</h1>
    <table>
      <thead>
        <tr style="color: #8B4513;">
          <th>������ȣ</th>
          <th>����</th>
          <th>�۰�</th>
          <th>���ǻ�</th>
          <th style="width : 100px">�뿩����</th>
          <c:if test="${loginUser.type eq ('U' || 'S')}"><th>����</th></c:if>
          <c:if test="${loginUser.type eq 'S'}"><th class="manage-column">����</th></c:if>
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
                <c:when test="${book.rented_book eq '1'}">���� ��</c:when>
                <c:otherwise>���� ����</c:otherwise>
              </c:choose>
            </td>
            <td>
              <c:choose>
                <c:when test="${book.rented_book eq '1'}">���� �Ұ�</c:when>
                <c:otherwise>
                  <form action="rentbook.do" method="POST">
                    <input type="hidden" name="no" value="${book.no}">
                    <input type="hidden" name="id" value="${loginUser.id}">
                    <input type="submit" value="�����ϱ�" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">
                  </form>
                </c:otherwise>
              </c:choose>
            </td>
            <c:if test="${loginUser.type eq 'S'}">
              <td class="manage-column">
                <form action="deletebook.do" method="post" onsubmit="return confirm('�����Ͻðڽ��ϱ�?');">
                  <input type="hidden" name="no" value="${book.no}" />
                  <input type="submit" value="����" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;" />
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

