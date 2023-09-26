package kr.ac.kopo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.MemberDAO;
import kr.ac.kopo.vo.MemberVO;

public class InsertUserProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String usercode = request.getParameter("usercode");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		String extraAddress = request.getParameter("extraAddress");
		String postcode = request.getParameter("postcode");
		String usertype = request.getParameter("usertype");

		String fullAddress = address + " " + detailAddress + " " + extraAddress;

		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPassword(password);
		vo.setName(name);
		vo.setEmail(email);
		vo.setUsercode(usercode);
		vo.setPhone(phone);
		vo.setAddress(fullAddress);
		vo.setPostcode(postcode);
		vo.setUser_type(usertype);

		MemberDAO dao = new MemberDAO();
		dao.insertUser(vo);

		return "/login.jsp";
	}

}