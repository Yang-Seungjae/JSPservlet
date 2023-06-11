<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script>
	function checkForm() {
		let f = document.searchform;
		if (f.sckeyword.value == '') {
			alert('검색어를 입력하세요')
			f.sckeyword.focus()
			return false
		}
		return true
	}
</script>
</head>
<body>

	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
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
			<c:forEach var="book" items="${sbook}">
						<c:choose>
        <c:when test="${empty sbook}">
           
            <p>검색결과가 없습니다.</p>
        </c:when>
        <c:otherwise>
           
            <h1>전체 도서</h1>
		<table>
			<thead>
				<tr>
					<th>도서번호	 |</th>
					<th>제목		 |</th>
					<th>작가		 |</th>
					<th>출판사	 |</th>
					<th>대여여부	 |</th>
					<c:if test="${loginUser.type eq ('U' || 'S')}"><th>대출 |</th></c:if>
					
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="book" items="${sbook}">
					<tr>
						<td>${book.no}</td>
						<td>${book.title}</td>
						<td>${book.writer}</td>
						<td>${book.publisher}</td>
						<td><c:choose>
								<c:when test="${book.rented_book eq '1'}">
                                        대출 중
                                    </c:when>
								<c:otherwise>
                                        대출 가능
                                    </c:otherwise>
							</c:choose></td>
						<td><c:choose>
								 <c:when test="${empty loginUser}">
							        로그인 후 대출
							    </c:when>
							    <c:when test="${book.rented_book eq '1'}">
							        대출 중
							    </c:when>
								<c:otherwise>
							<form action="rentbook.do" method="POST">
								<input type="hidden" name="no" value="${ book.no }">
								<input type="hidden" name="id" value="${ loginUser.id }">
								<input type="submit" value="대출하기">
							</form>
						
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
            
        </c:otherwise>
    </c:choose>
		</c:forEach>

			<!-- <div class="keywordInput">
				<label for="searchKeyword" class="blind">검색어 입력</label> 
				<input
					type="text" id="searchKeyword" name="booksearch"
					autocomplete="off" placeholder="검색어 입력">
			</div>
		<!-- 	<div class="bscSubmit"> 
				<a href="/WebMVC/bksearchprocess.do" id="searchbook">검색</a>
			</div> -->
			

	</section>
	
</body>
</html>












