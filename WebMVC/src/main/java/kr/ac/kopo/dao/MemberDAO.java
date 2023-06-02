package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.ac.kopo.member.MemberVO;

public class MemberDAO {
	public MemberVO login(MemberVO login) throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pass = "hr";
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append("  from t_member ");
		sql.append(" where id = ? and password = ? ");
		
		try(
			Connection conn = DriverManager.getConnection(url, user, pass);
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		) {
			
			pstmt.setString(1, login.getId());
			pstmt.setString(2, login.getPassword());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				MemberVO loginUser = new MemberVO();
				loginUser.setId(rs.getString("id"));
				loginUser.setPassword(rs.getString("password"));
				loginUser.setName(rs.getString("name"));
				loginUser.setType(rs.getString("type"));
				return loginUser;
			}
		}
		return null;
	}
	
			
}
