package kr.ac.kopo.controller;
//package kr.ac.kopo.controller;
//
//import java.time.LocalDate;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import kr.ac.kopo.dao.RecordDAO3;
//import kr.ac.kopo.vo.MemberVO;
//import kr.ac.kopo.vo.RecordVO;
//
//public class AccountTransferProcessController3 implements Controller {
//
//	@Override
//	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
//		try {
//			request.setCharacterEncoding("UTF-8");
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		// JSP에서 전달된 파라미터를 받아옵니다.
//		HttpSession session = request.getSession();
//		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//		String name = loginUser.getName();
//
//		// loginUser 객체에서 id 값 가져오기
//		String id = loginUser.getId();
//		String accountNumber = request.getParameter("accountNumber");
//		LocalDate currentTime = LocalDate.now();
//		String accountMoney = request.getParameter("accountMoney");
//		String rc_money = request.getParameter("rc_money");
//		int balance = Integer.parseInt(accountMoney) - Integer.parseInt(rc_money);
//
//		// balance 값을 문자열로 형변환하여 rc_balance 변수에 할당
//		String rc_balance = String.valueOf(balance);
//		String rc_number = request.getParameter("rc_number");
//		String ac_pw = request.getParameter("ac_pw");
//		RecordDAO3 rdao = new RecordDAO3();
//		String checkpw = rdao.checkPassword(ac_pw, accountNumber);
//		String rc_text = request.getParameter("rc_text");
//		String rc_type = request.getParameter("rc_type");
//		String rc_type2 = "입금";
//		String bank_cd = request.getParameter("selectedBank");
//		String rc_name;
//		switch (bank_cd) {
//		case "616":
//			rc_name = rdao.getRecipientName(rc_number);
//			break;
//		case "159":
//			rc_name = rdao.getRecipientNameSH(rc_number);
//			break;
//		case "111":
//			rc_name = rdao.getRecipientNameBH(rc_number);
//			break;
//		case "204":
//			rc_name = rdao.getRecipientNameJY(rc_number);
//			break;
//		// 다른 은행 코드에 따른 함수 추가
//		default:
//			rc_name = null; // 적절한 처리를 추가해야합니다. 예를 들어 기본값 설정 또는 예외 처리 등.
//		}
//
//		String receiverMoney;
//		switch (bank_cd) {
//		case "616":
//			receiverMoney = rdao.getRecipientName(rc_number);
//			break;
//		case "159":
//			receiverMoney = rdao.getRecipientNameSH(rc_number);
//			break;
//		case "111":
//			receiverMoney = rdao.getRecipientNameBH(rc_number);
//			break;
//		case "204":
//			receiverMoney = rdao.getRecipientNameJY(rc_number);
//			break;
//		// 다른 은행 코드에 따른 함수 추가
//		default:
//			receiverMoney = null; // 적절한 처리를 추가해야합니다. 예를 들어 기본값 설정 또는 예외 처리 등.
//		}
//
//		String recipientId;
//		switch (bank_cd) {
//		case "616":
//			recipientId = rdao.getRecipientId(accountNumber);
//			break;
//		case "159":
//			recipientId = rdao.getRecipientIdSH(accountNumber);
//			break;
//		case "111":
//			recipientId = rdao.getRecipientIdBH(accountNumber);
//			break;
//		case "204":
//			recipientId = rdao.getRecipientIdJY(accountNumber);
//			break;
//		// 다른 은행 코드에 따른 함수 추가
//		default:
//			recipientId = null; // 적절한 처리를 추가해야합니다. 예를 들어 기본값 설정 또는 예외 처리 등.
//		}
//
//		int receiverbalance = Integer.parseInt(receiverMoney) + Integer.parseInt(rc_money);
//		String receiverbalance2 = String.valueOf(receiverbalance);
//		RecordVO vo = new RecordVO();
//		vo.setAc_number(rc_number);
//		vo.setRc_type(rc_type);
//		vo.setRc_name(rc_name);
//		vo.setRc_money(rc_money);
//		vo.setRc_time(currentTime);
//		vo.setRc_balance(rc_balance);
//		vo.setId(id);
//		vo.setRc_number(accountNumber);
//		vo.setRc_text(rc_text);
//		vo.setBank_cd(bank_cd);
//		vo.setAc_pw(checkpw);// 맞는지 확인 필요
//
//		RecordVO vo2 = new RecordVO();
//		vo.setAc_number(accountNumber);
//		vo.setRc_type(rc_type2);
//		vo.setRc_name(name);
//		vo.setRc_money(rc_money);
//		vo.setRc_time(currentTime);
//		vo.setRc_balance(receiverbalance2);
//		vo.setId(recipientId);
//		vo.setRc_number(rc_number);
//		vo.setRc_text(rc_text);
//		vo.setBank_cd(bank_cd);
//		vo.setAc_pw(checkpw);// 맞는지 확인 필요
//
//		rdao.insertRecord(vo);
//		rdao.insertRecord(vo2);
//		rdao.transferMoney(accountNumber, rc_number, rc_money);
//
//		return "/index.jsp";
//	}
//}
