package ex2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class requestTest
 */
@WebServlet("/requestTest")
public class RequestTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getMethod();
		String query = request.getQueryString();
		String uri = request.getRequestURI();
		String url = request.getRequestURL().toString();
		
		PrintWriter out = response.getWriter();
		out.println("<h1>RequestTest</h1>");
		out.println("method = " + method + "<br/>");
		out.println("query = " + query + "<br/>");
		out.println("uri = " + uri + "<br/>");
		out.println("url = " + url + "<br/>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
