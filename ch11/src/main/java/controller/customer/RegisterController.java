package controller.customer;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/customer/register.do")
public class RegisterController extends HttpServlet{

	private static final long serialVersionUID = 1654185732463498798L;
	
	//로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private CustomerService service = CustomerService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/register.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//데이터 수신
		String custid 	= req.getParameter("custid");
		String name 	= req.getParameter("name");
		String hp 		= req.getParameter("hp");
		String addr 	= req.getParameter("addr");
		String rdate 	= req.getParameter("rdate");
		
		logger.debug("custid : " + custid);
		logger.debug("name : " + name);
		logger.debug("rdate : " + rdate);
		
		//DTO 생성
		//서비스 실행
		CustomerDTO dto = new CustomerDTO();
		dto.setCustid(custid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAddr(addr);
		dto.setRdate(rdate);
		
		logger.info(dto.toString());
		
		//서비스 실행
		service.insertCustomer(dto);
		
		//라다이렉트
		resp.sendRedirect("/ch11/customer/list.do");
	}
}
