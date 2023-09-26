package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.MemberVO;

public class AccountTransferController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		if (loginUser != null) {

			MemberDAO memberDAO = new MemberDAO();
			MemberVO member = memberDAO.getUser(loginUser);
			request.setAttribute("loginUser", member);

			AccountDAO dao = new AccountDAO();
			List<AccountVO> AccountList = dao.allAccounts(member);
			request.setAttribute("Accounts", AccountList);

			// AccountList의 값을 출력
			for (AccountVO account : AccountList) {
				System.out.println("Account Number: " + account.getAc_number());
				System.out.println("Account Name: " + account.getPd_name());
				System.out.println("Account Balance: " + account.getAc_money());
				// 필요한 다른 속성들도 필요에 따라 출력 가능
				System.out.println("-----------------------------");
			}

		} else {

			return "/login.jsp";
		}

		return "/accounttransfer.jsp";
	}

}
