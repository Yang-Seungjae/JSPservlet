package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.BookDAO;
import kr.ac.kopo.vo.BookVO;

public class DeleteBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int bookNo = Integer.parseInt(request.getParameter("no"));

		// BookVO 객체 생성 및 bookNo 설정
		BookVO book = new BookVO();
		book.setNo(bookNo);

		BookDAO bookDAO = new BookDAO();
		bookDAO.deleteBook(book);

		String msg = "삭제 완료";
		String url = "/WebMVC/booklist.do";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/include/bookdeleteprocess.jsp";
	}
}