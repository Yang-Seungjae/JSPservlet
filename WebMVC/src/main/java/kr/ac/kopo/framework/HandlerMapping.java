package kr.ac.kopo.framework;

import java.util.HashMap;
import java.util.Map;

import kr.ac.kopo.controller.Controller;
import kr.ac.kopo.controller.LoginController;
import kr.ac.kopo.controller.LoginProcessController;

public class HandlerMapping {

	private Map<String, Controller> mappings;
	
	public HandlerMapping() {
		mappings = new HashMap<>();
	
		mappings.put("/login.do", new LoginController());
		mappings.put("/loginProcess.do", new LoginProcessController());
	}

	public Controller getController(String uri) {
		return mappings.get(uri);
	}
}
