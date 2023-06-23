package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.vo.BoardVO;

//������ ��ȸ, ����, ����, ���

public class BoardDAO {
	
	private static final int LIST_SIZE = 1;
	private static final String URL  = "jdbc:oracle:thin:@localhost:1521:XE";
	private static final String USER = "hr";
	private static final String PASS = "hr";
	
	public List<BoardVO> selectBoard() {
		
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		String sql = 
			"select no, writer, title, to_char(reg_date, 'yyyy-mm-dd') reg_date  " +
			"  from t_board                                                      " +
			" order by no desc                                                   ";
		
		Connection          con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			con = DriverManager.getConnection(URL, USER, PASS);			
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO bVO = new BoardVO();
				bVO.setNo     (rs.getInt   ("no"));
				bVO.setWriter (rs.getString("writer"));
				bVO.setTitle  (rs.getString("title"));
				bVO.setRegDate(rs.getString("reg_date"));
				boardList.add(bVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return boardList;
	}	
	
	/**
	 * ��û�� ������ ���� ��� ��ȸ
	 * @param pageNo - ��û������ ��ȣ
	 * @return 
	 */
	public List<BoardVO> selectBoard(int pageNo) {
		int start = (pageNo -1) * LIST_SIZE + 1;
		int end   = pageNo      * LIST_SIZE;
		
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		String sql = 
			"select no, writer, title, to_char(reg_date, 'yyyy-mm-dd') reg_date  " +
			"  from ( select rownum rnum, b.*                 " +
			"		   from ( select a.*                      " +
			"		 		    from t_board a                " +
			"				   order by no desc ) b )         " +
			" where rnum >= ?                                 " +
			"   and rnum <= ?                                 ";
		
		Connection          con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			con = DriverManager.getConnection(URL, USER, PASS);			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO bVO = new BoardVO();
				bVO.setNo     (rs.getInt   ("no"));
				bVO.setWriter (rs.getString("writer"));
				bVO.setTitle  (rs.getString("title"));
				bVO.setRegDate(rs.getString("reg_date"));
				boardList.add(bVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return boardList;
	}

	/**
	 * ��ü �Խñ� ī��Ʈ
	 * @return
	 */
	public int selectBoardCount() {
		int totalCount = 0;
		ResultSet rs = null;
		String sql = "select count(*) cnt from t_board"; 
		
		Connection        con   = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	
			con = DriverManager.getConnection(URL, USER, PASS);
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totalCount = rs.getInt("cnt");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
			}
		}
		return totalCount;
	}	
}