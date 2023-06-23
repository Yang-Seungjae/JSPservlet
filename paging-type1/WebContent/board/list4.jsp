<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.vo.BoardVO"  %>
<%@ page import="java.util.List"  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	// ���� ������ ��ȣ ���� ����
	int pageNo = 1;
	try {
		// ������ �Ķ���Ͱ� �ִ� ��� ���� ������ ��ȣ�� ����
		pageNo = Integer.parseInt(request.getParameter("pageNo"));
	} catch(Exception e) {
	}
	
	BoardDAO bDao = new BoardDAO();
	// �ش� �������� �Խñ� ���
	List<BoardVO> list = bDao.selectBoard(pageNo);
	// ��ü �Խñ� ī��Ʈ
	int totalCount = bDao.selectBoardCount();

	// ���������� ������ ��� ��
	int listSize = 1;
	// ������ ������ ���ϱ�
	int lastPage = (totalCount % listSize == 0) ? totalCount / listSize 
			                                    : totalCount / listSize + 1;	

	pageContext.setAttribute("pageNo"  , pageNo);
	pageContext.setAttribute("lastPage", lastPage);
	pageContext.setAttribute("list"    , list);

	// ======================================================================
	// �� ���� �۾� �߰� ��Ʈ
	// ======================================================================
	// ��Ͽ� ������ �� ������
	int tabSize  = 3;
	// ���� �������� �ش��ϴ� �� ��ġ 
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
	<title>����¡ ó��</title>
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
		<h2>�Խ��� ���</h2>	                                        
		<hr width="70%" />                                      	
		<table width="70%">                                                	
		<tr>                                                    	
			<th width="12%">��ȣ</th>
			<th>����</th>
			<th width="12%">�۾���</th>
			<th width="12%">�����</th>    
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
		
		<%-- ����¡ ���̺� --%>
		<table width="70%">
		<tr>
			<td valign="middle">
			<%-- ó�� ������ ���� --%>
			<c:choose>
				<c:when test="${pageNo == 1}" >
					<img alt="ó������" src="../images/btn_first.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=1">
						<img alt="ó������" src="../images/btn_first.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- ���� ������ ���� --%>
			<c:choose>
				<c:when test="${beginPage == 1}" >
					<img alt="����" src="../images/btn_pre.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=${beginPage - 1}">
						<img alt="����" src="../images/btn_pre.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- ������ ��ȣ ���� --%>			
			<c:forEach var="i" begin="${beginPage}" end="${endPage}">
				<c:if test="${i eq pageNo}">
					<strong>[${i}]</strong>
				</c:if>
				<c:if test="${i ne pageNo}">
					<a href="list4.jsp?pageNo=${i}">[${i}]</a>
				</c:if>
			</c:forEach>
			
			<%-- ���� ������ ���� --%>
			<c:choose>
				<c:when test="${endPage == lastPage}" >
					<img alt="����" src="../images/btn_next.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=${endPage + 1}">
						<img alt="����" src="../images/btn_next.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			
			<%-- ������ ������ ���� --%>
			<c:choose>
				<c:when test="${pageNo == lastPage}" >
					<img alt="������" src="../images/btn_last.gif" align="middle">
				</c:when>
				<c:otherwise>
					<a href="list4.jsp?pageNo=${lastPage}">
						<img alt="������" src="../images/btn_last.gif" align="middle">
					</a>
				</c:otherwise>
			</c:choose>
			</td>
		</tr>	
		</table>
	</div>
</body>
</html>









 