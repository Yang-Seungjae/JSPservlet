package kr.ac.kopo.vo;

public class AccountVO {

	private int ac_number;
	private String id;
	private int ac_pw;
	private String ac_name;
	private int ac_money;
	private String ac_op_date;
	private String ac_ed_date;
	private String state;
	private int pd_number;
	private String bank_cd;

	public int getAc_number() {
		return ac_number;
	}

	public void setAc_number(int ac_number) {
		this.ac_number = ac_number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAc_pw() {
		return ac_pw;
	}

	public void setAc_pw(int ac_pw) {
		this.ac_pw = ac_pw;
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

	public String getAc_op_date() {
		return ac_op_date;
	}

	public void setAc_op_date(String ac_op_date) {
		this.ac_op_date = ac_op_date;
	}

	public String getAc_ed_date() {
		return ac_ed_date;
	}

	public void setAc_ed_date(String ac_ed_date) {
		this.ac_ed_date = ac_ed_date;
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
				+ state + ", pd_number=" + pd_number + ", bank_cd=" + bank_cd + "]";
	}

	public AccountVO(int ac_number, String id, int ac_pw, String ac_name, int ac_money, String ac_op_date,
			String ac_ed_date, String state, int pd_number, String bank_cd) {
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
		this.bank_cd = bank_cd;
	}

	public AccountVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}
