package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.BookVO;
import kr.ac.kopo.vo.MemberVO;
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

	public List<BookVO> rentalBooksList(MemberVO vo) {
		List<BookVO> bookList = new ArrayList<>();
		BookVO book = null;
		StringBuilder sql = new StringBuilder();
		sql.append(
				"SELECT b.no, b.title, b.writer, b.publisher, b.rented_book FROM rental r JOIN books b ON r.no = b.no WHERE r.id = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, vo.getId());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				book = new BookVO();
				book.setNo(rs.getInt("no"));
				book.setTitle(rs.getString("title"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRented_book(rs.getInt("rented_book"));

				bookList.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookList;
	}

}
