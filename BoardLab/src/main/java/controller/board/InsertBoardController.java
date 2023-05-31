package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class InsertBoardController implements Controller {

// 새로운 책 등록할때 사용하는 것
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		String title = request.getParameter("TITLE");
		String writer = request.getParameter("WRITER");
		String content = request.getParameter("CONTENT");

		BoardVO vo = new BoardVO();
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);

		BoardDAO dao = new BoardDAO();
		dao.insertBoard(vo);

		return "메인페이지로 이동하는 JSP 작성";
	}

}
