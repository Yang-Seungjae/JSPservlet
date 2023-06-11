package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.MemberVO;

public class MemberDAO {

	public void deleteUser(MemberVO vo) {

		StringBuilder sql = new StringBuilder();
		sql.append("delete from Lib_member where id = ? ");

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
		sql.append("update Lib_member set password = ?, name = ? where id = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, vo.getPassword());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getId());

			int r = pstmt.executeUpdate();
			System.out.println(r);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public MemberVO getUser(MemberVO member) {

		StringBuilder sql = new StringBuilder();
		MemberVO loginUser = new MemberVO();
		sql.append("select * from Lib_member where id = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, member.getId());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				loginUser.setId(rs.getString("id"));
				loginUser.setPassword(rs.getString("password"));
				loginUser.setName(rs.getString("name"));
				loginUser.setType(rs.getString("type"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return loginUser;

	}

	public boolean checkDuplicateId(String id) {

		StringBuilder sql = new StringBuilder();
		String id1 = null;
		sql.append("select id from Lib_member ");
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
		sql.append("select id, password, name, type from Lib_member where id = ? and password = ?");

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
				user.setType(rs.getString("TYPE"));
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return user;
	}

	public void insertUser(MemberVO member) { // 회원 등록

		StringBuilder sql = new StringBuilder();
		sql.append("insert into Lib_member(id, password, name, type) values(?,?,?,?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getType());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
