package service;

import java.util.List;

import dao.ProductDAO;
import dto.ProductDTO;

public enum ProductService {
	//열거타입으로 싱글톤 생성
		INSTANCE;
		
		private ProductDAO dao = ProductDAO.getInstance();
		
		public void insertCustomer(ProductDTO dto) {
			dao.insertCustomer(dto);
		}
		public ProductDTO selectCustomer(String prodno) {
			return dao.selectCustomer(prodno);
		}
		public List<ProductDTO> selectCustomers() {
			return dao.selectCustomers();
		}
		public void updateCustomer(ProductDTO dto) {
			dao.updateCustomer(dto);
		}
		public void deleteCustomer(String prodno) {
			dao.deleteCustomer(prodno);
		}
}
