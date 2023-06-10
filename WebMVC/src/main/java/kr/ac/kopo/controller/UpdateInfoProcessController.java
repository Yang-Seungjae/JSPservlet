package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;

public class UpdateInfoProcessController implements Controller {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setName(name);

		MemberDAO dao = new MemberDAO();
		dao.updateInfo(vo);

		String msg = "수정 완료";
		String url = "/WebMVC/myinfo.do";

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);

		return "/jsp/include/refreshprocess.jsp";
	}
}
