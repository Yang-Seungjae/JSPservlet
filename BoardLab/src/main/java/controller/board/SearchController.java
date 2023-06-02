package controller.board;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.board.BoardDAO;
import biz.board.BoardVO;
import controller.Controller;

public class SearchController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}

		String writer = request.getParameter("writer"); // 요청 파라미터로 작성자 이름 받아오기

		BoardDAO boardDAO = new BoardDAO();
		List<BoardVO> boardList = boardDAO.searchBoard(writer); // 작성자로 게시물 목록 가져오기

		request.setAttribute("boardList", boardList); // JSP에서 사용할 수 있도록 속성 설정

		return "getBoardList.jsp"; // 게시물 목록을 표시할 JSP 페이지로 이동
	}
}
