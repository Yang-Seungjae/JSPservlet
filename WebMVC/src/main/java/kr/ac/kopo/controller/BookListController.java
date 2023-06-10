package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.BookDAO;
import kr.ac.kopo.vo.BookVO;

public class BookListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		BookDAO dao = new BookDAO();
		List<BookVO> sbook = dao.allBooks();
		request.setAttribute("sbook", sbook);

		return "/jsp/include/booklist.jsp";
	}

}
