<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>My Info</title>
    <style>
		header {
			background-color: #f0f0f0;
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
		}
    
        body {
            background-color: #f8f9fa;
            padding: 20px;
            background-image: url("/WebMVC/image/123.jpg"); /* ��� �̹��� �߰� */
            background-size: cover; /* �̹����� ȭ�鿡 �� ä�쵵�� ���� */
        }
        
        .info-box {
            background-color: rgba(245, 245, 220, 0.8);;
            color: #000000;
            padding: 20px;
            border-radius: 10px;
            margin: 0 auto; /* ��� ���� */
            margin-top: 250px;
            width: 400px; /* �ʺ� ���� */
        }
        
        .info-box p {
            margin: 10px 0;
        }
        
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        
        .button-container form {
            display: inline-block;
            margin-right: 10px;
        }
        
        .button-container form input[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
        
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
<header>
  <jsp:include page="/jsp/include/topMenu.jsp"/>
</header>
<section>
	<div class="info-box">
        <h1 style="color: #8B4513;">ȸ������</h1>
        <BR/>
        <p>���̵�: ${user.id}</p>
        <p>�̸�: ${user.name}</p>
        <p>����(S:������, U:�����): ${user.type}</p>
    </div>
    
    <div class="button-container">
        <form action="updateinfo.do" method="POST">
            <input type="submit" value="ȸ����������"  style="background-color: #D2B48C; color: #8B4513;">
        </form>
        
        <form action="deleteuser.do" method="POST">
            <input type="submit" value="ȸ��Ż��" style="background-color: #D2B48C; color: #8B4513;">
        </form>
        
        <form action="returnbooklist.do" method="POST">
            <input type="submit" value="�뿩���� �������" style="background-color: #D2B48C; color: #8B4513;">
        </form>
    </div>
</section>
    
</body>
</html>

