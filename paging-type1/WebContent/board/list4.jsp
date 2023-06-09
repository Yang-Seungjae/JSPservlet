<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.vo.BoardVO"  %>
<%@ page import="java.util.List"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	// 현재 페이지 번호 저장 변수
	int pageNo = 1;
	try {
		// 페이지 파라미터가 있는 경우 현재 페이지 번호를 설정
		pageNo = Integer.parseInt(request.getParameter("pageNo"));
	} catch(Exception e) {
	}
	
	BoardDAO bDao = new BoardDAO();
	// 해당 페이지의 게시글 목록
	List<BoardVO> list = bDao.selectBoard(pageNo);
	// 전체 게시글 카운트
	int totalCount = bDao.selectBoardCount();

	// 한페이지에 보여질 목록 수
	int listSize = 1;
	// 마지막 페이지 구하기
	int lastPage = (totalCount % listSize == 0) ? totalCount / listSize 
			                                    : totalCount / listSize + 1;	

	pageContext.setAttribute("pageNo"  , pageNo);
	pageContext.setAttribute("lastPage", lastPage);
	pageContext.setAttribute("list"    , list);

	// ======================================================================
	// 탭 관련 작업 추가 파트
	// ======================================================================
	// 목록에 보여질 탭 사이즈
	int tabSize  = 3;
	// 현재 페이지에 해당하는 탭 위치 
	int currTab   = (pageNo  -1) / tabSize + 1;
	int beginPage = (currTab -1) * tabSize + 1;
	int endPage   = (currTab * tabSize < lastPage) ? currTab * tabSize 
			                                       : lastPage;
	
	pageContext.setAttribute("beginPage", beginPage);
	pageContext.setAttribute("endPage"  , endPage);
	// ======================================================================
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>                                                    	
<head>
	<title>페이징 처리</title>
	<link rel="stylesheet" href="../css/table.css" />
	<style>
		img {
			border: 0px;
		}
	</style>
</head>                          
<body>
	<div align="center">
		<br />
		<hr width="70%" />                                      	
		<h2>게시판 목록</h2>	                                        
		<hr width="70%" />                                      	
		<table width="70%">                                                	
		<tr>                                                    	
			<th width="12%">번호</th>
			<th>제목</th>
			<th width="12%">글쓴이</th>
			<th width="12%">등록일</th>    
		</tr>                                                       
		<c:forEach var="item" items="${list}">
			<tr>                                            
				<td><c:out value="${item.no}" /></td>
			    <td style="text-align:left;padding-left:10px;">
			    	<c:out value="${item.title}" />
			    </td>
			    <td><c:out value="${item.writer }" /></td>
			    <td><c:out value="${item.regDate}" /></td>
			</tr>
		</c:forEach>
		</table>   
		
		<%-- 페이징 테이블 --%>
		<table width="70%">
		<tr>
			<td valign="middle">
			<%-- 처음 페이지 설정 --%>
			<c:choose>
				<c:when test="${pageNo == 1}" >
					<img alt="처음으로" src="../images/btn_first.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=1">
						<img alt="처음으로" src="../images/btn_first.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 이전 페이지 설정 --%>
			<c:choose>
				<c:when test="${beginPage == 1}" >
					<img alt="이전" src="../images/btn_pre.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=${beginPage - 1}">
						<img alt="이전" src="../images/btn_pre.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 페이지 번호 설정 --%>			
			<c:forEach var="i" begin="${beginPage}" end="${endPage}">
				<c:if test="${i eq pageNo}">
					<strong>[${i}]</strong>
				</c:if>
				<c:if test="${i ne pageNo}">
					<a href="list4.jsp?pageNo=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<%-- 다음 페이지 설정 --%>
			<c:choose>
				<c:when test="${endPage == lastPage}" >
					<img alt="다음" src="../images/btn_next.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=${endPage + 1}">
						<img alt="다음" src="../images/btn_next.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- 마지막 페이지 설정 --%>
			<c:choose>
				<c:when test="${pageNo == lastPage}" >
					<img alt="마지막" src="../images/btn_last.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=${lastPage}">
						<img alt="마지막" src="../images/btn_last.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>	
		</table>
	</div>
</body>
</html>









 