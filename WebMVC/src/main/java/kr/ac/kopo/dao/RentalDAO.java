package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.RentalVO;

public class RentalDAO {

	public void rentBook(RentalVO vo) {
		StringBuilder sql = new StringBuilder();
		sql.append("insert into rental (rntNo, id, no) values(seq_rental_no.nextval, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getNo());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void returnBook(int bookNO) {
		StringBuilder sql = new StringBuilder();
		sql.append("delete from rental where no = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, bookNO);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
