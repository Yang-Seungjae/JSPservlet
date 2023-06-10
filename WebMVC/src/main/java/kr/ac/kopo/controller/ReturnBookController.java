package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.BookDAO;
import kr.ac.kopo.dao.RentalDAO;

public class ReturnBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		int no = Integer.parseInt(request.getParameter("no"));

		BookDAO bdao = new BookDAO();
		bdao.returnCheck(no);

		RentalDAO dao = new RentalDAO();
		dao.returnBook(no);

		String msg = "반납 완료";
		String url = "/WebMVC/booklist.do";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/include/refreshprocess.jsp";
	}

}
