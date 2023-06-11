<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

	.card {
		margin-top: 250px;
		
	}

	form {
		margin: 20px;
	}

	.form-group {
		margin-bottom: 15px;
	}

	label {
		font-weight: bold;
	}

	.btn-primary {
		background-color: #007bff; /* 버튼 배경색 변경 */
		color: #ffffff; /* 버튼 글자색 변경 */
		border-color: #007bff;
	}

</style>

<script>
	function checkForm() {
		let f = document.loginForm;
		if (f.id.value == '') {
			alert('ID를 입력하세요');
			f.id.focus();
			return false;
		}

		if (f.password.value == '') {
			alert('패스워드를 입력하세요');
			f.password.focus();
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
			<br>
			<h2>로그인</h2>
			<br>
			<div class="card" style="width: 18rem; background-color: rgba(245, 245, 220, 0.8);">
				<form method="post" action="/WebMVC/loginProcess.do" name="loginForm" onsubmit="return checkForm()">
					<div class="form-group">
						<label for="id" style="color: #8B4513;">ID</label>
						<input type="text" class="form-control" id="id" name="id">
					</div>
					<div class="form-group">
						<label for="password" style="color: #8B4513;">Password</label>
						<input type="password" class="form-control" id="password" name="password">
					</div>

					<button type="submit" class="btn btn-primary" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">로그인</button>
				</form>
			</div>
		</div>
	</section>
</body>
</html>

