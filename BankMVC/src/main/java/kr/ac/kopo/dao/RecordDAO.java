package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.OpenbankVO;
import kr.ac.kopo.vo.RecordVO;

public class RecordDAO {

	public void insertTransaction(long ac_number, String bank_cd, String type, String opBank_cd, long opAc_number,
			long transferAmount, String rc_text) {

		String query;
		switch (bank_cd) {
		case "204":
			query = "INSERT INTO ac_record@connectJY (rc_no, ac_number, id, rc_type, rc_name, rc_money, rc_text, rc_number, rc_balance) "
					+ "VALUES(seq_rc_no.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
			break;
		case "159":
			query = "INSERT INTO ac_record@connectSH (rc_no, accnum, id, rc_type, rc_name, rc_money, rc_text, rc_number) "
					+ "VALUES((SELECT NVL(MAX(rc_no), 0) + 1 FROM ac_record@connectSH), ?, ?, ?, ?, ?, ?, ?)";
			break;
		case "111":
			query = "INSERT INTO ac_record@connectBH (rc_no, ac_number, id, rc_type, rc_name, rc_money, rc_text, rc_number, rc_balance) "
					+ "VALUES(seq_rc_no.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
			break;
		case "616":
			query = "INSERT INTO ac_record (rc_no, ac_number, id, rc_type, rc_name, rc_money, rc_text, rc_number, rc_balance) "
					+ "VALUES(AC_RECORD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)";
			break;
		default:
			// 다른 은행 코드에 대한 처리를 여기에 추가하거나 또는 에러 처리를 할 수 있습니다.
			throw new RuntimeException("지원되지 않는 은행 코드입니다.");
		}

		OpenbankDAO dao = new OpenbankDAO();
		OpenbankVO account = dao.getAccount(ac_number, bank_cd);
		long AC_MONEY = account.getAC_MONEY();
		String Id = account.getId();

		OpenbankVO opAccount = dao.getAccount(opAc_number, opBank_cd);
		String Name = opAccount.getName();

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setLong(1, ac_number);
			pstmt.setString(2, Id);
			pstmt.setString(3, type);
			pstmt.setString(4, Name);
			pstmt.setLong(5, transferAmount);
			pstmt.setString(6, rc_text);
			pstmt.setLong(7, opAc_number);

			if (!"159".equals(bank_cd)) {
				pstmt.setLong(8, AC_MONEY);
			}

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<RecordVO> getAc_recordList(long ac_number) {
		List<RecordVO> ac_recordList = new ArrayList<>();
		String query = "SELECT ac_record.ac_number, ac_record.id, ac_record.rc_type, ac_record.rc_name, ac_record.rc_money, "
				+ "TO_CHAR(ac_record.rc_time, 'YYYY-MM-DD') AS rc_time, bank_info.bank_name, ac_record.rc_balance, ac_record.rc_text "
				+ "FROM ac_record "
				+ "JOIN account ON ac_record.ac_number = account.ac_number AND ac_record.id = account.id "
				+ "JOIN bank_info ON account.bank_cd = bank_info.bank_cd " + "WHERE ac_record.ac_number = ?";

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setLong(1, ac_number);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				RecordVO record = new RecordVO();
				record.setAc_number(rs.getString("ac_number"));
				record.setId(rs.getString("id"));
				record.setRc_type(rs.getString("rc_type"));
				record.setRc_name(rs.getString("rc_name"));
				record.setRc_money(rs.getString("rc_money"));
				record.setRc_time(LocalDate.parse(rs.getString("rc_time")));
				record.setBank_name(rs.getString("bank_name"));
				record.setRc_balance(rs.getString("rc_balance"));
				record.setRc_text(rs.getString("rc_text"));
				ac_recordList.add(record);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ac_recordList;
	}

	public int getAc_recordCount(long ac_number) {
		int count = 0;
		String query = "SELECT COUNT(*) AS count FROM ac_record WHERE ac_number = ?";

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {

			pstmt.setLong(1, ac_number);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

}