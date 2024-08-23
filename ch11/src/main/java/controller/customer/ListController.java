package controller.customer;

import java.io.IOException;
import java.util.List;

import org.slf4j.LoggerFactory;

import ch.qos.logback.classic.Logger;
import dto.CustomerDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CustomerService;

@WebServlet("/customer/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1654185732463498798L;
	private CustomerService service = CustomerService.INSTANCE;
	
	//로거생성
	private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 조회
		List<CustomerDTO> customers = service.selectCustomers();
		
		//시스템 출력(실제 개발과정에서는 사용가능하지만 배포했을 경우에는 제거해야 됨)
		//Ststem.out.println(customers);
		logger.debug("customer - "+customers);
		
		req.setAttribute("customers", customers);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/customer/list.jsp");
		dispatcher.forward(req, resp);
	}
}
