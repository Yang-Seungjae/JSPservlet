package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.BookDAO;
import kr.ac.kopo.vo.BookVO;

public class BookSearchProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();

		String searchBy = request.getParameter("searchBy");
		System.out.println(searchBy);
		String str = request.getParameter("sckeyword");
		System.out.println(str);

		BookDAO dao = new BookDAO();
		List<BookVO> sbook = null;
		switch (searchBy) {
		case "total":
			sbook = dao.searchBooks(1, str);
			break;
		case "title":
			sbook = dao.searchBooks(2, str);
			break;
		case "writer":
			sbook = dao.searchBooks(3, str);
			break;
		case "publisher":
			sbook = dao.searchBooks(4, str);
			break;
		}

		request.setAttribute("sbook", sbook);

		return "/jsp/include/booksearch.jsp";

	}

}