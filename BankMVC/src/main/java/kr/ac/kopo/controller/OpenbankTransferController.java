package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.OpenbankDAO;

public class OpenbankTransferController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		long sendAc_number = Long.parseLong(request.getParameter("accountNumber"));
		long receivAc_number = Long.parseLong(request.getParameter("rc_number"));
		long transferAmount = Long.parseLong(request.getParameter("rc_money"));
		String sendBank_cd = "616";
		String receivBank_cd = request.getParameter("selectedBank");
		String rc_text = request.getParameter("rc_text");

		System.out.println("이게 되야하는데 : " + receivBank_cd);
		System.out.println("되는거야 마는거야 : " + receivAc_number);

		OpenbankDAO openbankDAO = new OpenbankDAO();
		int result = openbankDAO.transfer(sendAc_number, sendBank_cd, receivAc_number, receivBank_cd, transferAmount,
				rc_text);

		if (result > 0) {
			request.setAttribute("message", "Transfer successful!");
		} else {
			request.setAttribute("message", "Transfer failed!");
		}

		return "myaccount.jsp";
	}

}