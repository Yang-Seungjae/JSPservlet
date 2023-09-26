<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<html lang="en">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="loginassets/fonts/icomoon/style.css">
  <link rel="stylesheet" href="loginassets/css/owl.carousel.min.css">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="loginassets/css/bootstrap.min.css">
  
  <!-- Style -->
  <link rel="stylesheet" href="loginassets/css/style.css">

  <title>계좌개설</title>
  
  <style>
.half {
  display: flex;
  flex-wrap: wrap;
  margin-top: 50px;
  margin-bottom: 50px;
  
}

.half > div {
  flex: 1 1 50%;
}

#join {
  margin-top: 50px;
  margin-bottom: 50px;
  transform : scale(1);
 
}

#join .row > div {
  margin-top: 10px;
   border-radius:50%;
}
 #userid[readonly], #username[readonly],#product[readonly] {
background-color:#ffffff;
}

#submitbtn {

margin-top : 50px;

}

.half .contents .form-group, .half .bg .form-group {
    overflow: hidden;
    margin-bottom: 0;
    border: 2px solid #efefef;
    padding: 15px 15px;
    /* border-bottom: none; */
    position: relative;
    margin-bottom: 10px; 
    height: 80px;
   
}





</style>
    
    <script>
    
	
		    
        // 아이디 유효성 검사 함수
        function validateId() {
            var id = $("#accountName").val();
            var idRegex = /^[a-zA-Z0-9가-힣]{1,8}$/;
            if (!idRegex.test(id)) {
                $("#accountName").addClass("is-invalid");
                return false;
            } else {
                $("#accountName").removeClass("is-invalid");
                return true;
            }
        }

        // 비밀번호 유효성 검사 함수
        function validatePassword() {
            var password = $("#accountPassword").val();
            var passwordRegex = /^[0-9]{4}$/;
            if (!passwordRegex.test(password)) {
                $("#accountPassword").addClass("is-invalid");
                return false;
            } else {
                $("#accountPassword").removeClass("is-invalid");
                return true;
            }
        }
      
        $(document).ready(function() {
            // 아이디와 비밀번호 입력 필드의 유효성 검사
            $("#accountName").on("input", function() {
                validateId();
            });

            $("#accountPassword").on("input", function() {
                validatePassword();
            });

            // 회원가입 양식 제출 시 유효성 검사
            $("#signupForm").on("submit", function(event) {
                event.preventDefault(); // 기본 제출 동작 중지
            });
        });
     
    </script>
</head>
<body>
<!-- ======= Header ======= -->
<div>
 <jsp:include page="topMenu.jsp"/>
</div>
<!-- End Header -->
<div class="container">
  <div class="d-lg-flex half">
    
    <div class="contents order-2 order-md-1">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>계좌 개설</h3>
              <p class="mb-4"></p>
            </div>
            <form action="/BankMVC/insertaccount.do" method="post">
              <div class="form-group first">
                
                <input type="text" class="form-control"  id="userid" name="id" value="${loginUser.id}" readonly>
              </div>
              <div class="form-group last mb-3">
                
                <input type="text" class="form-control" id="username" name="name" value="${loginUser.name}" readonly>
              </div>
              <div class="form-group ">
                <label for="accountName">계좌 이름</label>
                <input type="text" class="form-control" id="accountName" name="accountName" placeholder="" required>
              </div>
              <div class="form-group ">
                <label for="accountPassword">계좌 비밀번호 (4자리)</label>
                <input type="password" class="form-control" id="accountPassword" name="accountPassword" pattern="[0-9]{4}" title="4자리 숫자를 입력하세요" required>
              </div>
              
              <div class="form-group field--not-empty">
                <label for="accountNumber">상품 이름</label>
                <input type="text" class="form-control" id="product" name="product" value="<%= request.getParameter("productName") %>" readonly>
                <input type="hidden" name="productNumber" value="<%= request.getParameter("productNumber") %>">
              </div>
              
              <div class="form-group">
					<div class="form-holder form-holder-2">
					<input type="text" class="form-control input-border" id="reCaptcha" name="reCaptcha" placeholder="reCaptcha api" >
					</div>
			 </div>
              <button type="submit" class="btn btn-block btn-primary">계좌 개설</button>
         
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="loginassets/js/jquery-3.3.1.min.js"></script>
<script src="loginassets/js/popper.min.js"></script>
<script src="loginassets/js/bootstrap.min.js"></script>
<script src="loginassets/js/main.js"></script>
</body>
</html>
