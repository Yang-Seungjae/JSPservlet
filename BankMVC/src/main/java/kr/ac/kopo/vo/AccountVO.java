package kr.ac.kopo.vo;

import java.time.LocalDate;

public class AccountVO {

	private String ac_number;
	private String id;
	private String ac_pw;
	private String ac_name;
	private int ac_money;
	private LocalDate ac_op_date;
	private LocalDate ac_ed_date;
	private String state;
	private int pd_number;
	private String pd_name;
	private String bank_cd;
	private String bank_name;
	private String name;

	public AccountVO(String ac_number, String id, String ac_pw, String ac_name, int ac_money, LocalDate ac_op_date,
			LocalDate ac_ed_date, String state, int pd_number, String pd_name, String bank_cd, String bank_name,
			String name) {
		super();
		this.ac_number = ac_number;
		this.id = id;
		this.ac_pw = ac_pw;
		this.ac_name = ac_name;
		this.ac_money = ac_money;
		this.ac_op_date = ac_op_date;
		this.ac_ed_date = ac_ed_date;
		this.state = state;
		this.pd_number = pd_number;
		this.pd_name = pd_name;
		this.bank_cd = bank_cd;
		this.bank_name = bank_name;
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public LocalDate getAc_op_date() {
		return ac_op_date;
	}

	public void setAc_op_date(LocalDate ac_op_date) {
		this.ac_op_date = ac_op_date;
	}

	public LocalDate getAc_ed_date() {
		return ac_ed_date;
	}

	public void setAc_ed_date(LocalDate ac_ed_date) {
		this.ac_ed_date = ac_ed_date;
	}

	public String getAc_number() {
		return ac_number;
	}

	public void setAc_number(String ac_number) {
		this.ac_number = ac_number;
	}

	public String getAc_pw() {
		return ac_pw;
	}

	public void setAc_pw(String ac_pw) {
		this.ac_pw = ac_pw;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAc_name() {
		return ac_name;
	}

	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}

	public int getAc_money() {
		return ac_money;
	}

	public void setAc_money(int ac_money) {
		this.ac_money = ac_money;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getPd_number() {
		return pd_number;
	}

	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}

	public String getBank_cd() {
		return bank_cd;
	}

	public void setBank_cd(String bank_cd) {
		this.bank_cd = bank_cd;
	}

	@Override
	public String toString() {
		return "AccountVO [ac_number=" + ac_number + ", id=" + id + ", ac_pw=" + ac_pw + ", ac_name=" + ac_name
				+ ", ac_money=" + ac_money + ", ac_op_date=" + ac_op_date + ", ac_ed_date=" + ac_ed_date + ", state="
				+ state + ", pd_number=" + pd_number + ", pd_name=" + pd_name + ", bank_cd=" + bank_cd + "]";
	}

	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
