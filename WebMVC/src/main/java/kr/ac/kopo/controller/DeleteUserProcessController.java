package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.dao.RentalDAO;
import kr.ac.kopo.vo.BookVO;
import kr.ac.kopo.vo.MemberVO;

public class DeleteUserProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String pwcheck = request.getParameter("pwcheck");

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);

		MemberDAO dao = new MemberDAO();
		MemberVO user = dao.login(vo);

		RentalDAO rdao = new RentalDAO();
		List<BookVO> rvo = rdao.rentalBooksList(vo);

		String msg = "";
		String url = "";

		if (user != null && password.equals(pwcheck) && rvo.size() == 0) {
			dao.deleteUser(vo);
			HttpSession session = request.getSession();
			session.invalidate();
			msg = "탈퇴 완료";
			url = "/WebMVC/main.do";
		} else if (user != null && password.equals(pwcheck) && rvo.size() != 0) {
			msg = "대여중인 책이 있습니다.";
			url = "/WebMVC/returnbooklist.do";

		} else {

			msg = "비밀번호를 잘못 입력했습니다";
			url = "/WebMVC/deleteuser.do";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/include/refreshprocess.jsp";
	}

}