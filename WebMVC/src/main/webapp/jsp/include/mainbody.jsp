<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<div>
<form method="post" action="/WebMVC/booksearchprocess.do"
			name="searchform" onsubmit="return checkForm()">
			<div align="center">
				<br>
				<h2>도서검색</h2>
				<br> <select name="searchBy">
					<option id="total" value="total" selected>통합검색</option>
					<option id="title" value="title" >도서명</option>
					<option id="writer" value="writer">저자</option>
					<option id="publisher" value="publisher">출판사</option>
				</select> 
				<input type="search" id="sckeyword" name="sckeyword"
					placeholder="검색할 도서명">
				<button type="submit" id="searchbook" class="btn btn-primary"
					>검색</button>
			</div>
		
		
		</form>

</div>
 