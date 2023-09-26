package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.dao.RecordDAO;
import kr.ac.kopo.vo.AccountVO;
import kr.ac.kopo.vo.RecordVO;

public class AccountTransferProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		long ac_number = Long.parseLong(request.getParameter("ac_number"));
		System.out.println("조회에서 계좌번호 클릭시  : " + ac_number);
		AccountDAO accountDao = new AccountDAO();
		AccountVO account = accountDao.getAccount(ac_number);

		request.setAttribute("account", account);

		RecordDAO dao = new RecordDAO();

		List<RecordVO> recordList = dao.getAc_recordList(ac_number);

		request.setAttribute("ac_number", ac_number);
		request.setAttribute("recordList", recordList);

		return "/record.jsp";
	}

}