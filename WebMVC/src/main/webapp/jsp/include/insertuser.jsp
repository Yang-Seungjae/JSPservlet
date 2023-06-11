<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        .form-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        
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
		background-image: url("/WebMVC/image/123.jpg"); /* 배경 이미지 추가 */
		background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
	}
	
		.form-container {
		margin-top : 200px;
		background-color: rgba(245, 245, 220, 0.8);
		text-align: center;
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
                    url: "/WebMVC/checkduplicateid.do", // 중복 아이디 확인을 위한 서버 요청 URL
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
    </script>
</head>
<body>
<header>
    <jsp:include page="/jsp/include/topMenu.jsp" />
</header>
<div class="container">
    <div class="form-container">
        <h1 style=" color: #8B4513;">Sign Up</h1>
        <form action="insertUserProcess.do" method="post" name="inputForm" id="signupForm" onsubmit="return checkSubmit()">
            <div class="form-group">
                <label for="id"style=" color: #8B4513;"><strong>ID</strong></label>
                <input type="text" class="form-control" name="id" id="id" required>
            </div>
            <div class="form-group">
                <label for="password"style=" color: #8B4513;"><strong>Password</strong></label>
                <input type="password" class="form-control" name="password" id="password" required>
            </div>
            <div class="form-group">
                <label for="name"style=" color: #8B4513;"><strong>Name</strong></label>
                <input type="text" class="form-control" name="name" id="name" required>
            </div>
            <div class="form-group">
                <label></label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="type" value="S" id="role-admin" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;"checked>
                    <label class="form-check-label" for="role-admin" style="color: #8B4513;">관리자</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="type" value="U" id="role-user" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">
                    <label class="form-check-label" for="role-user" style="color: #8B4513;">사용자</label>
                </div>
            </div>
            <button type="submit" class="btn btn-primary"style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">회원가입</button>
        </form>
    </div>
</div>
</body>
</html>
