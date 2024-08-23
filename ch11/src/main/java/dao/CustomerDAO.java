package dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import util.DBHelper;

public class CustomerDAO extends DBHelper{
	private static CustomerDAO instance = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return instance;
	}
	private CustomerDAO() {}
	
	//로거 생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public void insertCustomer(CustomerDTO dto) {
		String sql = "insert into customer values (?,?,?,?,?)";
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,dto.getCustid());
			psmt.setString(2,dto.getName());
			psmt.setString(3,dto.getHp());
			psmt.setString(4,dto.getAddr());
			psmt.setString(5,dto.getRdate());
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
	public CustomerDTO selectCustomer(String custid) {
		CustomerDTO user = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement("select * from `customer` where `custid`=?");
			psmt.setString(1, custid);
			rs = psmt.executeQuery();
			if(rs.next()) {
				user = new CustomerDTO();
				user.setCustid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setAddr(rs.getString(4));
				user.setRdate(rs.getString(5));
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return user;
	}
	public List<CustomerDTO> selectCustomers() {
		List<CustomerDTO> users = new ArrayList<CustomerDTO>();
		String sql = "select * from `customer`";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CustomerDTO user = new CustomerDTO();
				user.setCustid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setAddr(rs.getString(4));
				user.setRdate(rs.getString(5));
				users.add(user);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return users;
	}
	public void updateCustomer(CustomerDTO dto) {
		
	}
	public void deleteCustomer(String custId) {
		
	}
	
}
