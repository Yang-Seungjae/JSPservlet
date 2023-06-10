package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.MemberDAO;

public class CheckDuplicateIdController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 중복 아이디 확인 로직을 구현하여 DB에서 조회하고 결과를 반환하는 부분
		String id = request.getParameter("id");
		MemberDAO dao = new MemberDAO();
		boolean isDuplicate = dao.checkDuplicateId(id);

		String msg = "";
		if (isDuplicate) {
			msg = "duplicate";
		} else {
			msg = "success";
		}

		request.setAttribute("msg", msg);
		return "/jsp/include/duplicateMsg.jsp";
	}

}
