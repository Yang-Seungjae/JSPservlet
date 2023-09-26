package kr.ac.kopo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.kopo.dao.ProductDAO;
import kr.ac.kopo.vo.ProductVO;

public class ProductListController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {

		ProductDAO dao = new ProductDAO();
		List<ProductVO> productlist = dao.allProducts();
		request.setAttribute("products", productlist);

		return "/product.jsp";
	}

}
