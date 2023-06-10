package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.MemberDAO;
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

		String msg = "";
		String url = "";

		if (user != null && password.equals(pwcheck)) {
			dao.deleteUser(vo);
			HttpSession session = request.getSession();
			session.invalidate();
			msg = "탈퇴 완료";
			url = "/WebMVC/main.do";
		} else {
			msg = "비밀번호를 잘못 입력했습니다";
			url = "/WebMVC/login/deleteuser.do";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/include/refreshprocess.jsp";
	}

}