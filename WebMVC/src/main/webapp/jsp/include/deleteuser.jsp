<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            background-image: url("/WebMVC/image/123.jpg"); /* 배경 이미지 추가 */
            background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
        }
        
	section {
		margin-top: 100px;
	}

	form {
		
		max-width: 400px;
		margin: 0 auto;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 5px;
		background-color: rgba(245, 245, 220, 0.8);
		
	}

	form label {
		font-weight: bold;
	}

	form input[type="password"] {
		width: 100%;
		padding: 10px;
		margin-bottom: 20px;
		border: 1px solid #ccc;
		border-radius: 5px;
	}

	form input[type="submit"] {
		width: 100%;
		padding: 10px;
		border: none;
		border-radius: 5px;
		background-color: #dc3545;
		color: #fff;
		
	}

	form input[type="submit"]:hover {
		background-color: #c82333;
	}

	
</style>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section>
		<div class="container">
			
				<div class="card-body">
					<form action="deleteuserprocess.do" method="POST">
					<h1 class="card-title text-center" style="color: #8B4513;">회원탈퇴</h1>
					<br/>
						<input type="hidden" name="id" value="${ loginUser.id }">
						<div>
							<label for="currentPassword" style="color: #8B4513;">현재 비밀번호:</label>
							<input type="password" id="currentPassword" name="password" required>
						</div>
						<div>
							<label for="confirmPassword" style="color: #8B4513;">비밀번호 확인:</label>
							<input type="password" id="confirmPassword" name="pwcheck" required>
						</div>
						<div>
							<input type="submit" value="회원탈퇴" class="btn btn-danger" style="background-color: #D2B48C; color: #8B4513;">
						</div>
					</form>
				</div>
			
		</div>
	</section>
	
</body>
</html>
