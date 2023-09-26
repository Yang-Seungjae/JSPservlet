package kr.ac.kopo.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.AccountDAO;
import kr.ac.kopo.framework.AccountNumberGenerator;
import kr.ac.kopo.vo.AccountVO;

public class InsertAccountController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String ac_number = AccountNumberGenerator.generateAccountNumber();
//		long ac_number = Long.parseLong(ac_number_string);
		String id = request.getParameter("id");
		System.out.println(id);
		String accountname = request.getParameter("accountName");
		System.out.println(accountname);
		String accountpassword = request.getParameter("accountPassword");
		System.out.println(accountpassword);
		String productNumberString = request.getParameter("productNumber");
		int productNumber = Integer.parseInt(productNumberString);
		int ac_money = 0;
		String bank_cd = "616";
		LocalDate currentTime = LocalDate.now();
		LocalDate endTime = currentTime.plusYears(1);
		String state = "A";

		AccountVO vo = new AccountVO();
		vo.setAc_number(ac_number);
		vo.setAc_name(accountname);
		vo.setAc_pw(accountpassword);
		vo.setAc_money(ac_money);
		vo.setAc_op_date(currentTime);
		vo.setAc_ed_date(endTime);
		vo.setState(state);
		vo.setPd_number(productNumber);
		vo.setBank_cd(bank_cd);
		vo.setId(id);

		AccountDAO dao = new AccountDAO();
		dao.insertAccount(vo);

		return "/index.jsp";
	}

}
