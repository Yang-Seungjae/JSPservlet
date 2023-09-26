package kr.ac.kopo.vo;

import java.time.LocalDate;

public class RecordVO {

	private int rc_no;
	private String rc_type;
	private String rc_name;
	private String rc_money;
	private LocalDate rc_time;
	private String rc_balance;
	private String ac_number;
	private String id;
	private String rc_number;
	private String rc_text;
	private String bank_cd;
	private String ac_pw;
	private String bank_name;

	public RecordVO(int rc_no, String rc_type, String rc_name, String rc_money, LocalDate rc_time, String rc_balance,
			String ac_number, String id, String rc_number, String rc_text, String bank_cd, String ac_pw,
			String bank_name) {
		super();
		this.rc_no = rc_no;
		this.rc_type = rc_type;
		this.rc_name = rc_name;
		this.rc_money = rc_money;
		this.rc_time = rc_time;
		this.rc_balance = rc_balance;
		this.ac_number = ac_number;
		this.id = id;
		this.rc_number = rc_number;
		this.rc_text = rc_text;
		this.bank_cd = bank_cd;
		this.ac_pw = ac_pw;
		this.bank_name = bank_name;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getRc_money() {
		return rc_money;
	}

	public void setRc_money(String rc_money) {
		this.rc_money = rc_money;
	}

	public LocalDate getRc_time() {
		return rc_time;
	}

	public void setRc_time(LocalDate rc_time) {
		this.rc_time = rc_time;
	}

	public String getAc_pw() {
		return ac_pw;
	}

	public void setAc_pw(String ac_pw) {
		this.ac_pw = ac_pw;
	}

	public String getBank_cd() {
		return bank_cd;
	}

	public void setBank_cd(String bank_cd) {
		this.bank_cd = bank_cd;
	}

	public int getRc_no() {
		return rc_no;
	}

	public void setRc_no(int rc_no) {
		this.rc_no = rc_no;
	}

	public String getRc_type() {
		return rc_type;
	}

	public void setRc_type(String rc_type) {
		this.rc_type = rc_type;
	}

	public String getRc_name() {
		return rc_name;
	}

	public void setRc_name(String rc_name) {
		this.rc_name = rc_name;
	}

	public String getRc_balance() {
		return rc_balance;
	}

	public void setRc_balance(String rc_balance) {
		this.rc_balance = rc_balance;
	}

	public String getAc_number() {
		return ac_number;
	}

	public void setAc_number(String ac_number) {
		this.ac_number = ac_number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRc_number() {
		return rc_number;
	}

	public void setRc_number(String rc_number) {
		this.rc_number = rc_number;
	}

	public String getRc_text() {
		return rc_text;
	}

	public void setRc_text(String rc_text) {
		this.rc_text = rc_text;
	}

	@Override
	public String toString() {
		return "RecordVO [rc_no=" + rc_no + ", rc_type=" + rc_type + ", rc_name=" + rc_name + ", rc_money=" + rc_money
				+ ", rc_time=" + rc_time + ", rc_balance=" + rc_balance + ", ac_number=" + ac_number + ", id=" + id
				+ ", rc_number=" + rc_number + ", rc_text=" + rc_text + ", bank_cd=" + bank_cd + ", ac_pw=" + ac_pw
				+ "]";
	}

	public RecordVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
