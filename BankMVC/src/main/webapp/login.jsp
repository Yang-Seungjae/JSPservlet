<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="loginassets/fonts/icomoon/style.css">

    <link rel="stylesheet" href="loginassets/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="loginassets/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="loginassets/css/style.css">

    <title>Login</title>
    <style>
    
  
    
    </style>
  </head>
  <body>
  <!-- ======= Header ======= -->
  
 	<div>
     <jsp:include page="topMenu.jsp"/>
    </div>
    
    <!-- End Header -->
    
<div class="container">
<div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('loginassets/images/bg_3.jpg')"></div>
    <div class="contents order-2 order-md-1">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>로그인</h3>
              <p class="mb-4"></p>
            </div>
            <form action="/BankMVC/loginprocess.do" method="post">
              <div class="form-group first">
                <label for="username">ID</label>
                <input type="text" class="form-control" id="username">

              </div>
              <div class="form-group last mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password">
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption"></span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control indicator"></div>
                </label>
                <span class="ml-auto"><a href="/BankMVC/beforeinsertUser.do" class="newaccount" >회원가입</a></span>
                <span class="ml-auto"><a href="#" class="forgot-pass">비밀번호찾기</a></span> 
              </div>

              <input type="submit" value="로그인" class="btn btn-block btn-primary">

              <span class="d-block text-center my-4 text-muted">&mdash; 카카오톡으로 로그인 &mdash;</span>
              
              <div class="social-login">
              <%-- 이부분 카카오톡으로 수정 --%>
                <a href="#" class="facebook btn d-flex justify-content-center align-items-center">
                  <span class="icon-facebook mr-3"></span> Login with KakaoTalk
                </a>
               
               
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    
  </div>
    
</div>
  <!-- ======= footer ======= -->
  
 	<div>
     <jsp:include page="bottomMenu.jsp"/>
    </div>
    
    <!-- End footer -->

    <script src="loginassets/js/jquery-3.3.1.min.js"></script>
    <script src="loginassets/js/popper.min.js"></script>
    <script src="loginassets/js/bootstrap.min.js"></script>
    <script src="loginassets/js/main.js"></script>
  </body>
</html>