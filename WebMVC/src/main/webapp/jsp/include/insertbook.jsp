<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
		background-color: #f8f9fa;
		padding: 20px;
		background-image: url("/WebMVC/image/123.jpg"); /* 배경 이미지 추가 */
		background-size: cover; /* 이미지를 화면에 꽉 채우도록 설정 */
	}
.form-container {
	margin-top: 200px;
	background-color: rgba(245, 245, 220, 0.8); /* 베이지 색상과 80%의 투명도 설정 */
	padding: 30px;
	border-radius: 10px;
}
.form-container label {
	font-weight: bold;
}

header {
		background-color: #f0f0f0;
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp"/>
	</header>
	<section class="container">
		<div class="form-container">
			<h1 class="text-center" style="color: #8B4513;">신규도서등록</h1>
			<form action="insertbookprocess.do" method="POST">
				<div class="form-group">
					<label for="title" style="margin-right: 10px; color: #8B4513;">제목</label>
					<input type="text" class="form-control" id="title" name="title">
				</div>
				<div class="form-group">
					<label for="writer" style="margin-right: 10px; color: #8B4513;">작가</label>
					<input type="text" class="form-control" id="writer" name="writer">
				</div>
				<div class="form-group">
					<label for="publisher" style="margin-right: 10px; color: #8B4513;">출판사</label>
						<input type="text" class="form-control" id="publisher" name="publisher">
				</div>
				<div class="text-center">
					<input type="submit" class="btn btn-primary" value="등록" style="background-color: #D2B48C; color: #8B4513; border-color: #D2B48C;">
				</div>
			</form>
		</div>
	</section>
	<footer>
		<%-- <%@ include file="/jsp/include/bottom.jsp" %> --%>
	</footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
