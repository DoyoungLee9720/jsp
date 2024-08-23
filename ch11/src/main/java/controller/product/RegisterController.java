package controller.product;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.ProductDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ProductService;

public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = -3407267622597968059L;
	//로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private ProductService service = ProductService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/register.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		int prodno 		= Integer.parseInt(req.getParameter("prodno"));
		String prodName = req.getParameter("prodName");
		int stock 		= Integer.parseInt(req.getParameter("stock"));
		int price 		= Integer.parseInt(req.getParameter("price"));
		String company 	= req.getParameter("company");
		
		ProductDTO dto = new ProductDTO();
		dto.setProdNo(prodno);
		dto.setProdName(prodName);
		dto.setStock(stock);
		dto.setPrice(price);
		dto.setCompany(company);
		
		logger.info(dto.toString());
		
		//서비스 실행
		service.insertCustomer(dto);
		
		//리다이렉트
		resp.sendRedirect("/ch11/product/list.do");
	}
}
