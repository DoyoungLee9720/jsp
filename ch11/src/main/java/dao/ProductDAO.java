package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ProductDTO;
import util.DBHelper;


public class ProductDAO extends DBHelper{
	private static ProductDAO instance = new ProductDAO();
	public static ProductDAO getInstance() {
		return instance;
	}
	//로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ProductDAO() {}
	public void insertCustomer(ProductDTO dto) {
		String sql = "insert into product values (?,?,?,?,?)";
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,dto.getProdNo());
			psmt.setString(2,dto.getProdName());
			psmt.setInt(3,dto.getStock());
			psmt.setInt(4,dto.getPrice());
			psmt.setString(5,dto.getCompany());
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	public ProductDTO selectCustomer(String custid) {
		ProductDTO user = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `product` where `prodno`=?");
			psmt.setString(1, custid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				user = new ProductDTO();
				user.setProdNo(rs.getInt(1));
				user.setProdName(rs.getString(2));
				user.setStock(rs.getInt(3));
				user.setPrice(rs.getInt(4));
				user.setCompany(rs.getString(5));
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return user;
	}
	public List<ProductDTO> selectCustomers() {
		List<ProductDTO> users = new ArrayList<ProductDTO>();
		String sql = "select * from `product`";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO user = new ProductDTO();
				user.setProdNo(rs.getInt(1));
				user.setProdName(rs.getString(2));
				user.setStock(rs.getInt(3));
				user.setPrice(rs.getInt(4));
				user.setCompany(rs.getString(5));
				users.add(user);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return users;
	}
	public void updateCustomer(ProductDTO dto) {
		
	}
	public void deleteCustomer(String custId) {
		
	}
	
}
