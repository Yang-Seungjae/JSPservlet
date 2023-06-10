package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.BookVO;

public class BookDAO {

	public void deleteBook(BookVO book) {
		String sql = "DELETE FROM books WHERE no = ?";

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql)) {

			pstmt.setInt(1, book.getNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void returnCheck(int bookNO) {
		StringBuilder sql = new StringBuilder();
		sql.append("update books set rented_book = 0 where no = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, bookNO);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void rentCheck(int bookNO) {
		StringBuilder sql = new StringBuilder();
		sql.append("update books set rented_book = 1 where no = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, bookNO);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<BookVO> allBooks() {
		List<BookVO> bookList = new ArrayList<>();
		BookVO book = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select * from books order by no");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
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

	public List<BookVO> selectByAll(String bookinfo) {
		List<BookVO> bookList = new ArrayList<>();
		BookVO book = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select instr((no || title || writer || publisher), ?)as bookh");
		sql.append(" , no, title, writer, publisher, rented_book");
		sql.append(" from books");
		sql.append(" where instr((no || title || writer || publisher), ?) != 0");
		sql.append(" order by no");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, bookinfo);
			pstmt.setString(2, bookinfo);

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

	public void insertBook(BookVO book) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO books (no, title, writer, publisher) VALUES (SEQ_BOOKS_NO.nextval, ?, ?, ?)");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, book.getTitle());
			pstmt.setString(2, book.getWriter());
			pstmt.setString(3, book.getPublisher());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
