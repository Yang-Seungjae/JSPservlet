<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ���� ����</title>
</head>
<body>
    <h1>ȸ�� ���� ����</h1>
    <hr />
    <div>
        <form action="updateuserinfo.do" method="post">
            <div>
                <label for="id">���̵� ${loginUser.id}</label>
                <input name="id" type="hidden" value="${loginUser.id}" />
            </div>
            <div>
                <label for="password">��й�ȣ</label>
                <input type="password" name="password" value="${loginUser.password}" />
            </div>
            <div>
                <label for="name">�̸�</label>
                <input type="text" name="name" value="${loginUser.name}" />
            </div>
            <div>
                <input type="submit" value="����" />
            </div>
        </form>
        <br/>
        <a href="/jsp/include/main.jsp">�ڷΰ���</a>
    </div>
</body>
</html>