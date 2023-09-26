package kr.ac.kopo.framework;

import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.controller.AccountTransferController;
import kr.ac.kopo.controller.AccountTransferProcessController;
import kr.ac.kopo.controller.BeforeInsertUserController;
import kr.ac.kopo.controller.BoardMainController;
import kr.ac.kopo.controller.CheckDuplicateIdController;
import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.GetObAcListController;
import kr.ac.kopo.controller.InsertAccountController;
import kr.ac.kopo.controller.InsertAccountProcessController;
import kr.ac.kopo.controller.InsertUserController;
import kr.ac.kopo.controller.InsertUserProcessController;
import kr.ac.kopo.controller.LoginController;
import kr.ac.kopo.controller.LoginProcessController;
import kr.ac.kopo.controller.LogoutController;
import kr.ac.kopo.controller.MainController;
import kr.ac.kopo.controller.MyAccountListController;
import kr.ac.kopo.controller.OpenbankTransferController;
import kr.ac.kopo.controller.ProductListController;

public class HandlerMapping {

	private Map<String, Controller> mappings;

	public HandlerMapping() {
		mappings = new HashMap<>();

		mappings.put("/login.do", new LoginController());
		mappings.put("/loginprocess.do", new LoginProcessController());
		mappings.put("/main.do", new MainController());
		mappings.put("/beforeinsertUser.do", new BeforeInsertUserController());
		mappings.put("/insertUser.do", new InsertUserController());
		mappings.put("/insertaccount.do", new InsertAccountController());
		mappings.put("/insertaccountprocess.do", new InsertAccountProcessController());
		mappings.put("/transferprocess.do", new AccountTransferProcessController());
		mappings.put("/accounttransfer.do", new AccountTransferController());
		mappings.put("/productlist.do", new ProductListController());
		mappings.put("/boardmain.do", new BoardMainController());
		mappings.put("/insertUserProcess.do", new InsertUserProcessController());
		mappings.put("/logout.do", new LogoutController());
		mappings.put("/myaccount.do", new MyAccountListController());
		mappings.put("/openbanktransfer.do", new OpenbankTransferController());
		mappings.put("/oblist.do", new GetObAcListController());

		mappings.put("/checkduplicateid.do", new CheckDuplicateIdController());

	}

	public Controller getController(String uri) {
		return mappings.get(uri);
	}
}
