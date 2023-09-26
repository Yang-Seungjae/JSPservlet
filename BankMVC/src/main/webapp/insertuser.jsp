<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
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

  <title>회원가입</title>
  
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
#postcode[readonly], #address[readonly]{
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
    height: 60px;
   
}

#submitbtn {

}



</style>
    
    <script>
        // 아이디 유효성 검사 함수
        function validateId() {
            var id = $("#id").val();
            var idRegex = /^[a-zA-Z0-9]{1,16}$/;
            if (!idRegex.test(id)) {
                $("#id").addClass("is-invalid");
                return false;
            } else {
                $("#id").removeClass("is-invalid");
                return true;
            }
        }

        // 비밀번호 유효성 검사 함수
        function validatePassword() {
            var password = $("#password").val();
            var passwordRegex = /^[a-zA-Z0-9]{1,16}$/;
            if (!passwordRegex.test(password)) {
                $("#password").addClass("is-invalid");
                return false;
            } else {
                $("#password").removeClass("is-invalid");
                return true;
            }
        }

        function checkSubmit() {
            var id = $("#id").val();
            // 유효성 검사 수행
            if (validateId() && validatePassword()) {
                // 유효성 검사 통과 시 AJAX 요청
                console.log('duplicate check start...')
                $.ajax({
                    url: "/BankMVC/checkduplicateid.do", // 중복 아이디 확인을 위한 서버 요청 URL
                    method: "POST",
                    data: {id: id}, // 폼 데이터 직렬화하여 전송
                    success: function(response) {
                        response = response.trim();
                        if (response === "duplicate") {
                            alert("중복된 아이디입니다. 다른 아이디를 사용해주세요.");
                        } else if (response === "success") {
                            // 유효성 검사와 중복 아이디 확인 모두 통과 시 회원가입 진행
                            $("#signupForm")[0].submit();
                        }
                    }
                });
            }
            return false;
        }

        $(document).ready(function() {
            // 아이디와 비밀번호 입력 필드의 유효성 검사
            $("#id").on("input", function() {
                validateId();
            });

            $("#password").on("input", function() {
                validatePassword();
            });

            // 회원가입 양식 제출 시 유효성 검사
            $("#signupForm").on("submit", function(event) {
                event.preventDefault(); // 기본 제출 동작 중지
            });
        });
        
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("extraAddress").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("address").value = addr;
                    $('#postcode').parent().addClass('field--not-empty')
                    $('#address').parent().addClass('field--not-empty')
                    $('#detailAddress').parent().addClass('field--not-empty')
                    $('#extraAddress').parent().addClass('field--not-empty')
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("detailAddress").focus();
                }
            }).open();
        }
        
      
     
      /*  
        $(document).ready(function() {
        	$('#postbtn').click(function() {
        		$('#postcode').parent().addClass('field--not-empty')
        		alert('!!')
        	
        	})
        })
        */
        
        	//	if($('#postcode').val() != '')
        	//		$('#postcode').parent().addClass('field--not-empty')
        
        
    </script>
</head>
<body>
<!-- ======= Header ======= -->
<div>
 <jsp:include page="topMenu.jsp"/>
</div>
<!-- End Header -->
<div class="container" >
  <div class="d-lg-flex half">
    <div class="contents order-2 order-md-1">
      
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7" id="join">
            <div class="mb-4">
              <h3>회원가입</h3>
              <p class="mb-4"></p>
            </div>
            <form action="/BankMVC/insertUserProcess.do" method="post" name="inputForm" id="signupForm" onsubmit="return checkSubmit()">
              <div class="row" id="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label for="username">ID</label>
                    <input type="text" class="form-control" id="id" name="id">
                  </div>
                  <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                  </div>
                  <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email">
                  </div>
                  <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name">
                  </div>
                  <div class="form-group">
                    <label for="jumin">주민번호</label>
                    <input type="text" class="form-control" id="jumin" name="usercode">
                  </div>
                   <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone">
                  </div>
                  
                </div>
                <div class="col-md-6" id="rightbar">
                  
                  <div class="form-group">
                    <label for="postcode"><b>우편번호찾기</b></label>
                    <input type="button" class="form-control" id="postbtn" value='' onclick="execDaumPostcode()">
                  </div>
                  <div class="form-group">
                    <label for="postcode">우편번호</label>
                    <input type="text" name="postcode" class="form-control" id="postcode" placeholder="" readonly required>
                  </div>
                  <div class="form-group">
                    <label for="address">주소</label>
                    <input type="text" name="address" class="form-control" id="address"  placeholder="" readonly required>
                  </div>
                  <div class="form-group">
                    <label for="detailAddress">상세주소</label>
                    <input type="text" name="detailAddress" class="form-control" id="detailAddress" placeholder="" required>
                  </div>
                  <div class="form-group">
                    <label for="extraAddress">참고항목</label>
                    <input type="text" name="extraAddress" id="extraAddress" class="form-control" placeholder="">
                  </div>
                  <input type="hidden" id="fulladdress" name="fulladdress" value="">
                  
                  <div class="form-group">
                    <label for="adminKey">관리자 암호 키</label>
                    <input type="text" class="form-control" id="adminKey" name="usertype">
                  </div>
                </div>
              </div>
              <input type="submit" id="submitbtn" value="회원가입" class="btn btn-block btn-primary">
            </form>
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
