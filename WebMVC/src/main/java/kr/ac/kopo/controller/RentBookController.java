package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.BookDAO;
import kr.ac.kopo.dao.RentalDAO;
import kr.ac.kopo.vo.RentalVO;

public class RentBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));

		BookDAO dao = new BookDAO();
		dao.rentCheck(no);

		RentalVO book = new RentalVO();
		book.setNo(no);
		book.setId(id);

		RentalDAO rdao = new RentalDAO();
		rdao.rentBook(book);
		String msg = "대출 완료";
		String url = "/WebMVC/booklist.do";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/include/rentbookprocess.jsp";
	}

}
