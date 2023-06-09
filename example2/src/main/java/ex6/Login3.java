package ex6;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login3") // 주소에 해당하는 URL 이름을 의미함
public class Login3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login3() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("id");
		String password = request.getParameter("password");

		boolean isAuthenticated = checkCredentials(username, password);

//		response.setContentType("text");
//		PrintWriter out = response.getWriter();
//		out.println("<html>");
//		out.println("<head><title>로그인 페이지</title></head>");
//		out.println("<body>");

		if (isAuthenticated) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", username);
			response.sendRedirect(
					"/example1/ex8-exam2/mainpage2.jsp");
		} else {
			response.sendRedirect("/example1/ex8-exam2/error2.jsp");
		}

//		out.println("</body></html>");
//		out.close();
	}

	private boolean checkCredentials(String username, String password) throws IOException {
		BufferedReader reader = new BufferedReader(
				new FileReader("C:/Users/User/eclipse-workspaceJSP/example1/src/main/webapp/ex8-exam2/IDPW.txt"));
		String line;
		while ((line = reader.readLine()) != null) {
			String[] parts = line.split(":");
			String storedUsername = parts[0];
			String storedPassword = parts[1];

			if (storedUsername.equals(username) && storedPassword.equals(password)) {
				reader.close();
				return true; // 인증 성공
			}
		}

		reader.close();
		return false; // 인증 실패
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}