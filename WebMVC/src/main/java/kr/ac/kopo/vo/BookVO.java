package kr.ac.kopo.vo;

public class BookVO {

	private int no;
	private String title;
	private String writer;
	private String publisher;
	private int rented_book;

	public BookVO(int no, String title, String writer, String publisher, int rented_book) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.publisher = publisher;
		this.rented_book = rented_book;
	}

	@Override
	public String toString() {
		return "BookVO [no=" + no + ", title=" + title + ", writer=" + writer + ", publisher=" + publisher
				+ ", rented_book=" + rented_book + "]";
	}

	public BookVO() {

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

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getRented_book() {
		return rented_book;
	}

	public void setRented_book(int rented_book) {
		this.rented_book = rented_book;
	}

}
