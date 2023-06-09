<%@page import="kr.ac.kopo.vo.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		작업순서
		1. 파라미터 추출(아이디, 패스워드)
		2. 추출된 파라미터를 가진 회원 검색
		3. 검색결과에 따른 화면 구성
	*/
	
	request.setCharacterEncoding("utf-8"); // 인코딩 코드가 위치하는 순서도 중요함
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	System.out.println("id : " + id + ", password : " + password);
	
	Class.forName("oracle.jdbc.driver.OracleDriver"); // jsp 자체가 try의 부분안에 내부적으로 실행되는거라 try catch 안해도 된다.
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
			
	StringBuilder sql = new StringBuilder();
	sql.append("select * ");
	sql.append(" from t_member2 ");
 	sql.append(" where id = ? and password = ?");
	
			try(
					
	Connection conn = DriverManager.getConnection(url, user, pass);
					PreparedStatement pstmt = conn.prepareStatement(sql.toString());
					
					) {
				
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				
				ResultSet rs = pstmt.executeQuery();
				
				
				String msg ="";
				
				String locUrl = "";
				
				if(rs.next()) {
					MemberVO loginUser = new MemberVO();
					loginUser.setId(rs.getString("id"));
					loginUser.setPassword(rs.getString("password"));
					loginUser.setName(rs.getString("name"));
					loginUser.setType(rs.getString("type"));
					
					msg = loginUser.getName() + "님 환영합니다";
					locUrl = "/example2/index.jsp";
					session.setAttribute("loginUser", loginUser);
					
					
				} else {
					
					msg = "입력하신 ID 또는 패스워드가 잘못되었습니다";
					locUrl = "/example2/LibLoginExample/login.jsp";
				}
				
				pageContext.setAttribute("msg", msg);
				pageContext.setAttribute("url", locUrl);
				
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			
	
%>    

<script >

alert('${msg}')
// history.go(-1); 이전페이지로 이동

location.href = '${url}'
</script>
