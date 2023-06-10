package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.BookDAO;
import kr.ac.kopo.vo.BookVO;

public class InsertBookProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String bookTitle = request.getParameter("title");
		String bookWriter = request.getParameter("writer");
		String bookPublisher = request.getParameter("publisher");

		BookVO vo = new BookVO();
		vo.setTitle(bookTitle);
		vo.setWriter(bookWriter);
		vo.setPublisher(bookPublisher);

		BookDAO dao = new BookDAO();
		dao.insertBook(vo);
		return "/jsp/include/insertbook.jsp";
	}

}
