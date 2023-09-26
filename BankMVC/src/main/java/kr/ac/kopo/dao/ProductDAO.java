package kr.ac.kopo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import factory.ConnectionFactory;
import kr.ac.kopo.vo.ProductVO;

public class ProductDAO {

	public List<ProductVO> allProducts() {
		List<ProductVO> productlist = new ArrayList<>();
		ProductVO product = null;
		StringBuilder sql = new StringBuilder();
		sql.append("select * from products order by pd_number");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new ProductVO();
				product.setPd_number(rs.getInt("pd_number"));
				product.setPd_name(rs.getString("pd_name"));
				product.setInterest(rs.getInt("interest"));
				product.setPd_content(rs.getString("pd_content"));
				product.setPd_detail(rs.getString("pd_detail"));
				product.setPeriod(rs.getInt("period"));

				productlist.add(product);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return productlist;
	}

}
