package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.BookDAO;
import kr.ac.kopo.vo.BookVO;

public class BookSearchProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String book = request.getParameter("title");
		HttpSession session = request.getSession();

		BookDAO dao = new BookDAO();
		List<BookVO> sbook = dao.selectByAll(book);

		String msg = "";
//		if(sbook != null) {
		request.setAttribute("sbook", sbook);
//			session.setAttribute("sbook", sbook);
		msg = "검색된 내역입니다.";
//			String url = "/webLib/book/booksearch.do";
//		} else {
//			msg = "검색된 책이 없습니다.";
//		}

		return "/jsp/include/booksearch.jsp";

	}

}