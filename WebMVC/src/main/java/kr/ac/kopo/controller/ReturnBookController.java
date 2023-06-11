package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.RentalDAO;
import kr.ac.kopo.vo.BookVO;
import kr.ac.kopo.vo.MemberVO;

public class ReturnBookController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		RentalDAO dao = new RentalDAO();
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("loginUser");

		String id = member.getId();

		MemberVO vo = new MemberVO(id);

		List<BookVO> sbook = dao.rentalBooksList(vo);

		request.setAttribute("sbook", sbook);

		return "/jsp/include/returnbooklist.jsp";
	}

}
