<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/css/bootstrap.min.css" />
  <style>


    .navbar {
      justify-content: center;
    }

    .navbar-brand {
      margin-right: auto;
    }

    .navbar-nav {
      margin-left: auto;
    }

    .navbar .nav-link {
      padding: 0.5rem 1rem;
      transition: all 0.3s;
    }

    .navbar .nav-link:hover {
      transform: scale(1.1);
    }
  </style>
</head>

<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/WebMVC/main.do">
        <img src="/WebMVC/image/banner.jpg" alt="Logo" id="logo" width="80" height="80" style="border-radius: 50%; object-fit: cover;">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="/WebMVC/main.do">홈</a>
          </li>
          <c:if test="${ loginUser.type eq 'S' }">
            <li class="nav-item">
              <a class="nav-link" href="/WebMVC/insertbook.do">도서등록</a>
            </li>
          </c:if>
          <c:choose>
            <c:when test="${ empty loginUser }">
              <li class="nav-item">
                <a class="nav-link" href="/WebMVC/insertUser.do">회원가입</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/WebMVC/login.do">로그인</a>
              </li>
            </c:when>
            <c:otherwise>
              <li class="nav-item">
                <a class="nav-link" href="/WebMVC/booklist.do">도서목록</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/WebMVC/myinfo.do">마이페이지</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/WebMVC/logout.do">로그아웃</a>
              </li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </nav>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>

