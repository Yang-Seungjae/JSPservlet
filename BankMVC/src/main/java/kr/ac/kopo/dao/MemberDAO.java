package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.MemberVO;

public class MemberDAO {

	public void deleteUser(MemberVO vo) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from USER_INFO where id = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, vo.getId());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updateInfo(MemberVO vo) {
		StringBuilder sql = new StringBuilder();
		sql.append(
				"UPDATE USER_INFO SET password = ?, name = ?, email = ?, phone = ?, address = ?, postcode = ? WHERE id = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getAddress());
			pstmt.setString(6, vo.getPostcode());
			pstmt.setString(7, vo.getId());

			int r = pstmt.executeUpdate();
			System.out.println(r);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberVO getUser(MemberVO member) {

		StringBuilder sql = new StringBuilder();
		MemberVO loginUser = new MemberVO();
		sql.append("select * from USER_INFO where id = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, member.getId());
			System.out.println("로그인한 ID : " + member.getId());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				loginUser.setId(rs.getString("id"));
				loginUser.setPassword(rs.getString("password"));
				loginUser.setEmail(rs.getString("email"));
				loginUser.setName(rs.getString("name"));
				loginUser.setUsercode(rs.getString("usercode"));
				loginUser.setPhone(rs.getString("phone"));
				loginUser.setAddress(rs.getString("address"));
				loginUser.setPostcode(rs.getString("postcode"));
				loginUser.setUser_type(rs.getString("user_type"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return loginUser;

	}

	public boolean checkDuplicateId(String id) {

		StringBuilder sql = new StringBuilder();
		String id1 = null;
		sql.append("select id from USER_INFO ");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				id1 = rs.getString("id");
				if (id1.equals(id)) {
					return true;

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public MemberVO login(MemberVO vo) {
		MemberVO user = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM USER_INFO WHERE id = ? AND password = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPassword());

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				user = new MemberVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setEmail(rs.getString("EMAIL"));
				user.setUsercode(rs.getString("USERCODE"));
				user.setPhone(rs.getString("PHONE"));
				user.setAddress(rs.getString("ADDRESS"));
				user.setPostcode(rs.getString("POSTCODE"));
				user.setUser_type(rs.getString("USER_TYPE"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public void insertUser(MemberVO member) { // 회원 등록
		StringBuilder sql = new StringBuilder();
		sql.append(
				"INSERT INTO USER_INFO(id, password, email, name, usercode, phone, address, postcode, user_type) VALUES(?,?,?,?,?,?,?,?,?)");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getUsercode());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getPostcode());

			if (member.getUser_type().equals("admin")) {
				pstmt.setString(9, "A");
			} else {
				pstmt.setString(9, "U");
			}

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
