//package kr.ac.kopo.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import kr.ac.kopo.dao.MemberDAO;
//import kr.ac.kopo.dao.RecordDAO;
//import kr.ac.kopo.vo.MemberVO;
//import kr.ac.kopo.vo.RecordVO;
//
//public class RecordTransferController implements Controller {
//
//	@Override
//	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
//
//		HttpSession session = request.getSession();
//		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
//
//		if (loginUser != null) {
//
//			MemberDAO memberDAO = new MemberDAO();
//			MemberVO member = memberDAO.getUser(loginUser);
//			request.setAttribute("loginUser", member);
//
//			String rc_number = request.getParameter("rc_number");
//			System.out.println(rc_number);
//			RecordDAO dao = new RecordDAO();
//			List<RecordVO> recordList = dao.getAccountRecords(rc_number);
//			request.setAttribute("recordList", recordList);
//
//			for (RecordVO record : recordList) {
//				System.out.println("Record ID: " + record.getId());
//				System.out.println("Record Type: " + record.getRc_type());
//				System.out.println("Record Name: " + record.getRc_name());
//				// 다른 필드들도 필요에 따라 출력
//				System.out.println("---------------------------");
//			}
//
//		} else {
//
//			return "/login.jsp";
//		}
//
//		return "/record.jsp";
//	}
//
//}
