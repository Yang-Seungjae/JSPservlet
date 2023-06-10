package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberVO login = new MemberVO(id, password);

		MemberDAO dao = new MemberDAO();
		MemberVO user = dao.login(login);
		HttpSession session = request.getSession();

		String msg = "";
		String url = "";
		System.out.println(user);
		if (user != null) {
			session.setAttribute("loginUser", user);
			msg = "로그인 성공";
			url = "/WebMVC/main.do"; // main.do 만들기
		} else {
			msg = "아이디 또는 패스워드가 잘못되었습니다";
			url = "/WebMVC/login.do";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/login/loginProcess.jsp";
	}

}
