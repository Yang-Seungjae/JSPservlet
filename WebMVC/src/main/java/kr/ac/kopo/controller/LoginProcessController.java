package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;

public class LoginProcessController implements Controller {

	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);

		MemberDAO dao = new MemberDAO();
		MemberVO user = dao.login(vo);
		System.out.println("user : " + user);

		String msg = "";
		String url = "";
		if (user != null) {
			session.setAttribute("loginUser", user);
			msg = user.getName() + "님 환영합니다";
			url = "/WebMVC/main.do";
		} else {

			msg = "아이디와 패스워드를 확인해주세요";
			url = "/WebMVC/login.do";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/include/refreshprocess.jsp";
	}

}
