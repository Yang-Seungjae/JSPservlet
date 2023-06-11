<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    
  body {
		background-color: #f8f9fa;
		padding: 20px;
		background-image: url("/WebMVC/image/123.jpg"); /* ��� �̹��� �߰� */
		background-size: cover; /* �̹����� ȭ�鿡 �� ä�쵵�� ���� */
		text-align : center;
	}
	
	header {
		background-color: #f0f0f0;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
	}

    section {
        margin-top: 100px;
        padding: 20px;
    }

    h1 {
        margin-bottom: 20px;
    }

    table {
    background-color: rgba(245, 245, 220, 0.8);
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        border: 1px solid #ccc;
    }

    th {
        background-color: #f8f9fa;
        font-weight: bold;
    }

    td:first-child {
        text-align: center;
    }

    td:last-child {
        text-align: center;
        white-space: nowrap;
    }

    form {
        display: inline-block;
    }
</style>
</head>
<body>
<header>
    <jsp:include page="/jsp/include/topMenu.jsp"/>
</header>

<section>
    <div class="container">
        <h1 style="color : white;">�뿩�� ����</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>������ȣ</th>
                    <th>����</th>
                    <th>�۰�</th>
                    <th>���ǻ�</th>
                    <th>�뿩����</th>
                    <c:if test="${loginUser.type eq ('U' || 'S')}">
                        <th>�ݳ�</th>
                    </c:if>
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
                                <c:when test="${book.rented_book eq '1'}">
                                    <form action="returnbook.do" method="POST">
                                        <input type="hidden" name="no" value="${ book.no }">
                                        <input type="hidden" name="id" value="${ loginUser.id }">
                                        <input type="submit" value="�ݳ��ϱ�" class="btn btn-danger" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;" >
                                    </form>
                                </c:when>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</section>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
