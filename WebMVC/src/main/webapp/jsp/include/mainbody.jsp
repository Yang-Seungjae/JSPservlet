<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>도서검색</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/css/bootstrap.min.css" />
</head>

<style>
  #searchbook {
    color: white; /* 변경하고자 하는 색상으로 설정 */
  }
  
  

  .btn-search {
    background-color: #D2B48C; /* 연한 갈색 배경 */
    color: #8B4513; /* 갈색 텍스트 */
    border-color: #D2B48C; /* 연한 갈색 테두리 */
  }

  

</style>
<body>
  <div class="container">
    <div class="row justify-content-center mt-5">
      <div class="col-md-6">
        <form method="post" action="/WebMVC/booksearchprocess.do" name="searchform" onsubmit="return checkForm()">
          <h2 class="text-center mb-4" id="searchbook">도서검색</h2>
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
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
