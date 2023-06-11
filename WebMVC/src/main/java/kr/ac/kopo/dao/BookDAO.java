package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.BookVO;

public class BookDAO {

	// 통합검색
	public List<BookVO> searchBook(String str) {
		List<BookVO> sbook = new ArrayList<>();
		BookVO book = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT INSTR((NO || TITLE || WRITER || PUBLISHER), ?) as scbook");
		sql.append(" ,NO, TITLE, WRITER, PUBLISHER, rented_book FROM books ");
		sql.append("WHERE INSTR((NO || TITLE ||  WRITER || PUBLISHER ), ?) != 0 ");
		sql.append("ORDER BY NO ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, str);
			pstmt.setString(2, str);
//	         System.out.println("1");
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				book = new BookVO();
				book.setNo(rs.getInt("no"));
				book.setTitle(rs.getString("title"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRented_book(rs.getInt("rented_book"));

				sbook.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sbook;
	}

	// 제목검색
	public List<BookVO> searchBookByTitle(String str) {
		List<BookVO> sbook = new ArrayList<>();
		BookVO book = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM books WHERE INSTR(TITLE, ?) != 0 ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, str);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				book = new BookVO();
				book.setNo(rs.getInt("no"));
				book.setTitle(rs.getString("title"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRented_book(rs.getInt("rented_book"));

				sbook.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sbook;
	}

	// 저자검색
	public List<BookVO> searchBookByWriter(String str) {
		List<BookVO> sbook = new ArrayList<>();
		BookVO book = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM books WHERE INSTR(WRITER, ?) != 0 ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, str);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				book = new BookVO();
				book.setNo(rs.getInt("no"));
				book.setTitle(rs.getString("title"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRented_book(rs.getInt("rented_book"));

				sbook.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sbook;
	}

	// 출판사 검색
	public List<BookVO> searchBookByPublisher(String str) {
		List<BookVO> sbook = new ArrayList<>();
		BookVO book = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM books WHERE INSTR(PUBLISHER, ?) != 0 ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, str);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				book = new BookVO();
				book.setNo(rs.getInt("no"));
				book.setTitle(rs.getString("title"));
				book.setWriter(rs.getString("writer"));
				book.setPublisher(rs.getString("publisher"));
				book.setRented_book(rs.getInt("rented_book"));

				sbook.add(book);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return sbook;
	}

	// 3-2 다중 검색!!!! 1=통합 2=제목 3=저자 4=출판사
	public List<BookVO> searchBooks(int choose, String str) {
		List<BookVO> sbook = new ArrayList<>();

		switch (choose) {
		case 1:
			sbook = this.searchBook(str);
			break;
		case 2:
			sbook = this.searchBookByTitle(str);
			break;
		case 3:
			sbook = this.searchBookByWriter(str);
			break;
		case 4:
			sbook = this.searchBookByPublisher(str);
			break;
		}
		return sbook;
	}

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
