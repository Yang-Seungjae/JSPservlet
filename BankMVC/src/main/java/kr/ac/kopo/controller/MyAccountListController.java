package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;

public class MyAccountListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		System.out.println("!!!!" + loginUser);

		if (loginUser != null) {

			MemberDAO memberDAO = new MemberDAO();
			MemberVO member = memberDAO.getUser(loginUser);
			request.setAttribute("loginUser", member);

			AccountDAO dao = new AccountDAO();
			List<AccountVO> AccountList = dao.allAccounts(member);
			request.setAttribute("Accounts", AccountList);
		} else {

			return "/login.jsp";
		}

		return "/myaccount.jsp";
	}

}
