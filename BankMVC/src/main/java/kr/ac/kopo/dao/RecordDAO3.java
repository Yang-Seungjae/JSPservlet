//package kr.ac.kopo.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.time.LocalDate;
//import java.time.format.DateTimeFormatter;
//import java.util.ArrayList;
//import java.util.List;
//
//import factory.ConnectionFactory;
//import kr.ac.kopo.vo.RecordVO;
//
//public class RecordDAO3 {
//
//	public String getRecipientIdJY(String accountNumber) {
//		String recipientId = null;
//
//		// SQL 쿼리문 작성
//		String sql = "SELECT id FROM ACCOUNT@connectJY WHERE ac_number = ?";
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)) {
//
//			// 파라미터 설정
//			pstmt.setString(1, accountNumber);
//
//			// 쿼리 실행
//			ResultSet rs = pstmt.executeQuery();
//
//			// 결과 처리
//			if (rs.next()) {
//				recipientId = rs.getString("id");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return recipientId;
//	}
//
//	public String getRecipientIdBH(String accountNumber) {
//		String recipientId = null;
//
//		// SQL 쿼리문 작성
//		String sql = "SELECT id FROM ACCOUNT@connectBH WHERE ac_number = ?";
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)) {
//
//			// 파라미터 설정
//			pstmt.setString(1, accountNumber);
//
//			// 쿼리 실행
//			ResultSet rs = pstmt.executeQuery();
//
//			// 결과 처리
//			if (rs.next()) {
//				recipientId = rs.getString("id");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return recipientId;
//	}
//
//	public String getRecipientIdSH(String accountNumber) {
//		String recipientId = null;
//
//		// SQL 쿼리문 작성
//		String sql = "SELECT id FROM ACCOUNT@connectSH WHERE ac_number = ?";
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)) {
//
//			// 파라미터 설정
//			pstmt.setString(1, accountNumber);
//
//			// 쿼리 실행
//			ResultSet rs = pstmt.executeQuery();
//
//			// 결과 처리
//			if (rs.next()) {
//				recipientId = rs.getString("id");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return recipientId;
//	}
//
//	public String getRecipientId(String accountNumber) {
//		String recipientId = null;
//
//		// SQL 쿼리문 작성
//		String sql = "SELECT id FROM ACCOUNT WHERE ac_number = ?";
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)) {
//
//			// 파라미터 설정
//			pstmt.setString(1, accountNumber);
//
//			// 쿼리 실행
//			ResultSet rs = pstmt.executeQuery();
//
//			// 결과 처리
//			if (rs.next()) {
//				recipientId = rs.getString("id");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return recipientId;
//	}
//
//	public List<RecordVO> getAccountRecords(String acNumber) {
//		List<RecordVO> accountRecords = new ArrayList<>();
//		String sql = "SELECT * FROM AC_RECORD WHERE AC_NUMBER = ? ORDER BY RC_TIME DESC";
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql)) {
//
//			pstmt.setString(1, acNumber);
//
//			ResultSet rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				RecordVO accountRecord = new RecordVO();
//				accountRecord.setRc_no(rs.getInt("RC_NO"));
//				accountRecord.setRc_type(rs.getString("RC_TYPE"));
//				accountRecord.setRc_name(rs.getString("RC_NAME"));
//				accountRecord.setRc_money(rs.getString("RC_MONEY"));
//				accountRecord.setRc_time(LocalDate.parse(rs.getString("RC_TIME")));
//				accountRecord.setRc_balance(rs.getString("RC_BALANCE"));
//				accountRecord.setAc_number(rs.getString("AC_NUMBER"));
//				accountRecord.setId(rs.getString("ID"));
//				accountRecord.setRc_number(rs.getString("RC_NUMBER"));
//				accountRecord.setRc_text(rs.getString("RC_TEXT"));
//
//				accountRecords.add(accountRecord);
//
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return accountRecords;
//	}
//
//	public String getRecipientMoney(String rc_number) {
//		String receiverMoney = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT ac_money FROM ").append("ACCOUNT");
//		sql.append(" WHERE ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				receiverMoney = rs.getString("ac_money");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return receiverMoney;
//	}
//
//	public String getRecipientMoneyJY(String rc_number) {
//		String receiverMoney = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT ac_money FROM ").append("ACCOUNT@connectJY");
//		sql.append(" WHERE ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				receiverMoney = rs.getString("ac_money");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return receiverMoney;
//	}
//
//	public String getRecipientMoneyBH(String rc_number) {
//		String receiverMoney = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT ac_money FROM ").append("ACCOUNT@connectBH");
//		sql.append(" WHERE ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				receiverMoney = rs.getString("ac_money");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return receiverMoney;
//	}
//
//	public String getRecipientMoneySH(String rc_number) {
//		String receiverMoney = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT ac_money FROM ").append("ACCOUNT@connectSH");
//		sql.append(" WHERE ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				receiverMoney = rs.getString("ac_money");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return receiverMoney;
//	}
//
//	public String getRecipientNameSH(String rc_number) {
//		String rc_name = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT U.name FROM ").append("ACCOUNT@connectSH").append(" A");
//		sql.append(" INNER JOIN USER_INFO@connectSH U ON A.id = U.id");
//		sql.append(" WHERE A.ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				rc_name = rs.getString("name");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return rc_name;
//	}
//
//	public String getRecipientNameBH(String rc_number) {
//		String rc_name = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT U.name FROM ").append("ACCOUNT@connectBH").append(" A");
//		sql.append(" INNER JOIN USER_INFO@connectBH U ON A.id = U.id");
//		sql.append(" WHERE A.ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				rc_name = rs.getString("name");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return rc_name;
//	}
//
//	public String getRecipientNameJY(String rc_number) {
//		String rc_name = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT U.name FROM ").append("ACCOUNT@connectJY").append(" A");
//		sql.append(" INNER JOIN USER_INFO@connectJY U ON A.id = U.id");
//		sql.append(" WHERE A.ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				rc_name = rs.getString("name");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return rc_name;
//	}
//
//	public String getRecipientName(String rc_number) {
//		String rc_name = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT U.name FROM ").append("ACCOUNT").append(" A");
//		sql.append(" INNER JOIN USER_INFO U ON A.id = U.id");
//		sql.append(" WHERE A.ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, rc_number);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				rc_name = rs.getString("name");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return rc_name;
//	}
//
////	private String getTableNameByBankCode(String bank_cd) {
////		// 은행 코드에 따라 테이블 이름을 반환하는 맵
////		Map<String, String> tableNameMap = new HashMap<>();
////		tableNameMap.put("616", "ACCOUNT");
////		tableNameMap.put("159", "ACCOUNT@connectSH");
////		tableNameMap.put("111", "ACCOUNT@connectBH");
////		tableNameMap.put("204", "ACCOUNT@connectJY");
////		// 다른 은행 코드와 테이블 이름을 추가
////
////		return tableNameMap.get(bank_cd);
////	}
//
//	public String checkPassword(String ac_pw, String ac_number) {
//		String storedPassword = null;
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT ac_pw FROM account WHERE ac_number = ?");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//
//			pstmt.setString(1, ac_number); // 여기에 적절한 계좌 번호 필드를 사용해야 합니다.
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				storedPassword = rs.getString("ac_pw");
//			}
//
//			// 비밀번호 일치 여부 확인
//			if (storedPassword != null && storedPassword.equals(ac_pw)) {
//				return storedPassword; // 비밀번호 일치 시 해당 비밀번호 반환
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return null; // 비밀번호 불일치 시 null 반환
//	}
//
//	public void transferMoney(String senderAcNumber, String receiverAcNumber, String sendMoney) {
//		String senderSql = "UPDATE ACCOUNT SET AC_MONEY = AC_MONEY - ? WHERE AC_NUMBER = ? ";
//		String receiverSql = "UPDATE ACCOUNT SET AC_MONEY = AC_MONEY + ? WHERE AC_NUMBER = ?";
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement senderPstmt = conn.prepareStatement(senderSql);
//				PreparedStatement receiverPstmt = conn.prepareStatement(receiverSql);) {
//			conn.setAutoCommit(false);
//
//			senderPstmt.setString(1, sendMoney);
//			senderPstmt.setString(2, senderAcNumber);
//			// senderPstmt.setString(3, String.valueOf(accountPassword));
//			// senderPstmt.setInt(3, accountPassword);
//			senderPstmt.executeUpdate();
//
//			receiverPstmt.setString(1, sendMoney);
//			receiverPstmt.setString(2, receiverAcNumber);
//			receiverPstmt.executeUpdate();
//
//			conn.commit();
//			conn.setAutoCommit(true);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public void insertRecord(RecordVO vo) {
//
//		StringBuilder sql = new StringBuilder();
//
//		sql.append(
//				"INSERT INTO ac_record(RC_NO, RC_TYPE, RC_NAME, RC_MONEY, RC_TIME, RC_BALANCE, AC_NUMBER, ID, RC_NUMBER, RC_TEXT) ")
//				.append("VALUES(AC_RECORD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, vo.getRc_type());
//			pstmt.setString(2, vo.getRc_name());
//			pstmt.setString(3, vo.getRc_money());
//			LocalDate rcTime = vo.getRc_time();
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//			String rcTimeStr = rcTime.format(formatter);
//			pstmt.setString(4, rcTimeStr);
//			pstmt.setString(5, vo.getRc_balance());
//			pstmt.setString(6, vo.getAc_number());
//			pstmt.setString(7, vo.getId());
//			pstmt.setString(8, vo.getRc_number());
//			pstmt.setString(9, vo.getRc_text());
//
//			int r = pstmt.executeUpdate();
//			System.out.println(r);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//}
