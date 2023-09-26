package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;

public class AccountDAO {

	public AccountVO getAccount(long Ac_number, String bank_cd) {
		AccountVO account = null;
		String query = "SELECT c.ac_number, c.id, ui.NAME, c.AC_NAME, c.AC_MONEY, c.AC_OP_DATE, c.AC_ED_DATE, c.bank_cd, c.bank_name, d.pd_name "
				+ "FROM ("
				+ " SELECT a.ac_number, a.id, a.AC_NAME, a.AC_MONEY, a.AC_OP_DATE, a.AC_ED_DATE, a.PD_NUMBER, a.bank_cd, b.bank_name "
				+ " FROM account a " + " JOIN bankinfo b ON b.bank_cd = a.bank_cd " + " ) c "
				+ "JOIN product d ON d.PD_NUMBER = c.PD_NUMBER " + "JOIN USER_INFO ui ON ui.ID = c.id "
				+ "WHERE c.ac_number = ? AND c.bank_cd = ?";

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setLong(1, Ac_number);
			pstmt.setString(2, bank_cd);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					account = new AccountVO();
					account.setAc_number(rs.getString("ac_number"));
					account.setId(rs.getString("id"));
					account.setAc_name(rs.getString("AC_NAME"));
					account.setAc_money(rs.getInt("AC_MONEY"));
					account.setAc_op_date(LocalDate.parse(rs.getString("ac_op_date")));
					account.setAc_ed_date(LocalDate.parse(rs.getString("ac_ed_date")));
					account.setBank_name(rs.getString("bank_name"));
					account.setPd_name(rs.getString("pd_name"));
					account.setName(rs.getString("name"));
					account.setBank_cd(rs.getString("bank_cd"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return account;
	}

	public AccountVO getAccount(long ac_number) {
		AccountVO account = null;
		StringBuilder sql = new StringBuilder();
		sql.append(
				"SELECT c.ac_number, c.id, ui.NAME, c.AC_NAME, c.AC_MONEY, c.AC_OP_DATE, c.AC_ED_DATE, c.bank_cd, c.bank_name, d.pd_name ")
				.append("FROM ( ")
				.append("  SELECT a.ac_number, a.id, a.AC_NAME, a.AC_MONEY, a.AC_OP_DATE, a.AC_ED_DATE, a.PD_NUMBER, a.bank_cd, b.bank_name ")
				.append("  FROM account a ").append("  JOIN bank_info b ON b.bank_cd = a.bank_cd ").append(") c ")
				.append("JOIN product d ON d.PD_NUMBER = c.PD_NUMBER ").append("JOIN USER_INFO ui ON ui.ID = c.id ")
				.append("WHERE c.ac_number = ?");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
			pstmt.setLong(1, ac_number);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					account = new AccountVO();
					account.setAc_number(rs.getString("ac_number"));
					account.setId(rs.getString("id"));
					account.setAc_name(rs.getString("AC_NAME"));
					account.setAc_money(rs.getInt("AC_MONEY"));
					account.setAc_op_date(LocalDate.parse(rs.getString("ac_op_date")));
					account.setAc_ed_date(LocalDate.parse(rs.getString("ac_ed_date")));
					account.setBank_name(rs.getString("bank_name"));
					account.setPd_name(rs.getString("pd_name"));
					account.setName(rs.getString("name"));
					account.setBank_cd(rs.getString("bank_cd"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return account;
	}

	public void insertAccount(AccountVO account) { // 계좌 등록
		StringBuilder sql = new StringBuilder();
		sql.append(
				"INSERT INTO ACCOUNT(ac_number, ac_pw, ac_name, ac_money, ac_op_date, ac_ed_date, state, pd_number, bank_cd, id) VALUES(?,?,?,?,?,?,?,?,?,?)");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, account.getAc_number());
			pstmt.setString(2, account.getAc_pw());
			pstmt.setString(3, account.getAc_name());
			pstmt.setInt(4, account.getAc_money());
			pstmt.setObject(5, account.getAc_op_date());
			pstmt.setObject(6, account.getAc_ed_date());
			pstmt.setString(7, account.getState());
			pstmt.setInt(8, account.getPd_number());
			pstmt.setString(9, account.getBank_cd());
			pstmt.setString(10, account.getId());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean checkDuplicateAccount(String accountNumber) {

		StringBuilder sql = new StringBuilder();
		String accountNumber1 = null;
		sql.append("select ac_number from account ");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				accountNumber1 = rs.getString("ac_number");
				if (accountNumber1.equals(accountNumber)) {
					return true;

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public List<AccountVO> allAccounts(MemberVO member) {

		List<AccountVO> accountList = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(
				"SELECT A.ac_number, A.ac_pw, A.ac_name, A.ac_money, TO_CHAR(A.ac_op_date, 'YYYY-MM-DD') as ac_op_date , TO_CHAR(A.ac_ed_date, 'YYYY-MM-DD') as ac_ed_date, A.state , A.bank_cd, A.id, P.pd_name");
		sql.append(" FROM ACCOUNT A");
		sql.append(" INNER JOIN PRODUCTS P ON A.PD_NUMBER = P.PD_NUMBER");
		sql.append(" WHERE A.ID = ?");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {

			pstmt.setString(1, member.getId());
			System.out.println("로그인한 ID DAO : " + member.getId());

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AccountVO account = new AccountVO();

				account.setAc_number(rs.getString("ac_number"));
				account.setAc_pw(rs.getString("ac_pw"));
				account.setAc_name(rs.getString("ac_name"));
				account.setAc_money(rs.getInt("ac_money"));
				account.setAc_op_date(LocalDate.parse(rs.getString("ac_op_date")));
				account.setAc_ed_date(LocalDate.parse(rs.getString("ac_ed_date")));
				account.setState(rs.getString("state"));
				account.setPd_name(rs.getString("pd_name"));
				account.setBank_cd(rs.getString("bank_cd"));
				account.setId(rs.getString("id"));

				accountList.add(account);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return accountList;
	}

}
