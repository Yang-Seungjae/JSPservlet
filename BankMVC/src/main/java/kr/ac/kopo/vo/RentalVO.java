package kr.ac.kopo.vo;

public class RentalVO {
	private int rntNo;
	private String id;
	private int no;
	private String rntDate;

	public RentalVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RentalVO(int rntNo, String id, int no, String rntDate) {
		super();
		this.rntNo = rntNo;
		this.id = id;
		this.no = no;
		this.rntDate = rntDate;
	}

	@Override
	public String toString() {
		return "RentalVO [rntNo=" + rntNo + ", id=" + id + ", no=" + no + ", rntDate=" + rntDate + "]";
	}

	public int getRntNo() {
		return rntNo;
	}

	public void setRntNo(int rntNo) {
		this.rntNo = rntNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getRntDate() {
		return rntDate;
	}

	public void setRntDate(String rntDate) {
		this.rntDate = rntDate;
	}

}
