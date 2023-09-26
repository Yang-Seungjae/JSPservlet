package kr.ac.kopo.vo;

public class ProductVO {

	private int pd_number;
	private String pd_name;
	private int interest;
	private int period;
	private String pd_content;
	private String pd_detail;

	public int getPd_number() {
		return pd_number;
	}

	public void setPd_number(int pd_number) {
		this.pd_number = pd_number;
	}

	public String getPd_name() {
		return pd_name;
	}

	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}

	public int getInterest() {
		return interest;
	}

	public void setInterest(int interest) {
		this.interest = interest;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getPd_content() {
		return pd_content;
	}

	public void setPd_content(String pd_content) {
		this.pd_content = pd_content;
	}

	public String getPd_detail() {
		return pd_detail;
	}

	public void setPd_detail(String pd_detail) {
		this.pd_detail = pd_detail;
	}

	@Override
	public String toString() {
		return "ProductVO [pd_number=" + pd_number + ", pd_name=" + pd_name + ", interest=" + interest + ", period="
				+ period + ", pd_content=" + pd_content + ", pd_detail=" + pd_detail + "]";
	}

	public ProductVO(int pd_number, String pd_name, int interest, int period, String pd_content, String pd_detail) {
		super();
		this.pd_number = pd_number;
		this.pd_name = pd_name;
		this.interest = interest;
		this.period = period;
		this.pd_content = pd_content;
		this.pd_detail = pd_detail;
	}

	public ProductVO() {
		super();
		// TODO Auto-generated constructor stub
	}

}