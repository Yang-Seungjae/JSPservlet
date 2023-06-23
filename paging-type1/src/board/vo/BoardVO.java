package board.vo;

public class BoardVO {
	private int no;	
	private String title;	
	private String content;	
	private String writer;	
	private int viewCnt;
	private String regDate;
	
	public BoardVO() {
		super();
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}
	public String getTitl() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setTitl(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "BoardVO [no=" + no + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", viewCnt=" + viewCnt
				+ ", regDate=" + regDate + "]";
	}
	
}