package kr.ac.kopo.framework;

import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.controller.BookListController;
import kr.ac.kopo.controller.BookSearchController;
import kr.ac.kopo.controller.BookSearchProcessController;
import kr.ac.kopo.controller.CheckDuplicateIdController;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.DeleteBookController;
import kr.ac.kopo.controller.DeleteUserController;
import kr.ac.kopo.controller.DeleteUserProcessController;
import kr.ac.kopo.controller.InsertBookController;
import kr.ac.kopo.controller.InsertBookProcessController;
import kr.ac.kopo.controller.InsertUserController;
import kr.ac.kopo.controller.InsertUserProcessController;
import kr.ac.kopo.controller.LoginController;
import kr.ac.kopo.controller.LoginProcessController;
import kr.ac.kopo.controller.LogoutController;
import kr.ac.kopo.controller.MainController;
import kr.ac.kopo.controller.MyInfoController;
import kr.ac.kopo.controller.RentBookController;
import kr.ac.kopo.controller.ReturnBookController;
import kr.ac.kopo.controller.UpdateInfoController;
import kr.ac.kopo.controller.UpdateInfoProcessController;

public class HandlerMapping {

	private Map<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<>();

		mappings.put("/login.do", new LoginController());
		mappings.put("/loginProcess.do", new LoginProcessController());
		mappings.put("/main.do", new MainController());
		mappings.put("/insertUser.do", new InsertUserController());
		mappings.put("/insertUserProcess.do", new InsertUserProcessController());
		mappings.put("/logout.do", new LogoutController());
		mappings.put("/booksearch.do", new BookSearchController());
		mappings.put("/booksearchprocess.do", new BookSearchProcessController());
		mappings.put("/insertbook.do", new InsertBookController());
		mappings.put("/insertbookprocess.do", new InsertBookProcessController());
		mappings.put("/booklist.do", new BookListController());
		mappings.put("/rentbook.do", new RentBookController());
		mappings.put("/returnbook.do", new ReturnBookController());
		mappings.put("/deletebook.do", new DeleteBookController());
		mappings.put("/checkduplicateid.do", new CheckDuplicateIdController());
		mappings.put("/myinfo.do", new MyInfoController());
		mappings.put("/updateinfo.do", new UpdateInfoController());
		mappings.put("/updateuserinfo.do", new UpdateInfoProcessController());
		mappings.put("/deleteuser.do", new DeleteUserController());
		mappings.put("/deleteuserprocess.do", new DeleteUserProcessController());

	}

	public Controller getController(String uri) {
		return mappings.get(uri);
	}
}
