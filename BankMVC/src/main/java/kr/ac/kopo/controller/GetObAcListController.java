package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.OpenbankDAO;
import kr.ac.kopo.vo.MemberVO;
import kr.ac.kopo.vo.OpenbankVO;

public class GetObAcListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		MemberVO user = (MemberVO) session.getAttribute("loginUser");

		OpenbankVO vo = new OpenbankVO();
		vo.setId(user.getId());
		System.out.println("타행계좌 조회 : " + user);
		OpenbankDAO dao = new OpenbankDAO();
		List<OpenbankVO> nsAcList = dao.nsAcList(vo);
		List<OpenbankVO> bhAcList = dao.bhAcList(vo);
		List<OpenbankVO> plAcList = dao.plAcList(vo);

		request.setAttribute("nsAcList", nsAcList);
		request.setAttribute("bhAcList", bhAcList);
		request.setAttribute("plAcList", plAcList);

		return "/oblist.jsp";
	}

}