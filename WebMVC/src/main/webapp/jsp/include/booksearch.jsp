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
			alert('�˻�� �Է��ϼ���')
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
				<h2>�����˻�</h2>
				<br> <select name="searchBy">
					<option id="total" value="total" selected>���հ˻�</option>
					<option id="title" value="title" >������</option>
					<option id="writer" value="writer">����</option>
					<option id="publisher" value="publisher">���ǻ�</option>
				</select> 
				<input type="search" id="sckeyword" name="sckeyword"
					placeholder="�˻��� ������">
				<button type="submit" id="searchbook" class="btn btn-primary"
					>�˻�</button>
			</div>
		
		
		</form>
			<c:forEach var="book" items="${sbook}">
						<c:choose>
        <c:when test="${empty sbook}">
           
            <p>�˻������ �����ϴ�.</p>
        </c:when>
        <c:otherwise>
           
            <h1>��ü ����</h1>
		<table>
			<thead>
				<tr>
					<th>������ȣ	 |</th>
					<th>����		 |</th>
					<th>�۰�		 |</th>
					<th>���ǻ�	 |</th>
					<th>�뿩����	 |</th>
					<c:if test="${loginUser.type eq ('U' || 'S')}"><th>���� |</th></c:if>
					
					
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
                                        ���� ��
                                    </c:when>
								<c:otherwise>
                                        ���� ����
                                    </c:otherwise>
							</c:choose></td>
						<td><c:choose>
								 <c:when test="${empty loginUser}">
							        �α��� �� ����
							    </c:when>
							    <c:when test="${book.rented_book eq '1'}">
							        ���� ��
							    </c:when>
								<c:otherwise>
							<form action="rentbook.do" method="POST">
								<input type="hidden" name="no" value="${ book.no }">
								<input type="hidden" name="id" value="${ loginUser.id }">
								<input type="submit" value="�����ϱ�">
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
				<label for="searchKeyword" class="blind">�˻��� �Է�</label> 
				<input
					type="text" id="searchKeyword" name="booksearch"
					autocomplete="off" placeholder="�˻��� �Է�">
			</div>
		<!-- 	<div class="bscSubmit"> 
				<a href="/WebMVC/bksearchprocess.do" id="searchbook">�˻�</a>
			</div> -->
			

	</section>
	
</body>
</html>












