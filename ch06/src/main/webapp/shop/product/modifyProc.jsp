<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String prodno = request.getParameter("prodno");
	String prodname = request.getParameter("prodname");
	String stock = request.getParameter("stock");
	String price = request.getParameter("price");
	String company = request.getParameter("company");
	
	String host = "jdbc:mysql://127.0.0.1:3306/shop";
	String user = "root";
	String pass = "1234";
	int result=0;
	//데이터베이스 처리
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 1단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		// 2단계 - SQL실행 객체 생성
		String sql = "update `product` set `prodName`=?, `stock`=?, `price`=?, `company`=? where `prodNo` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,prodname);
		psmt.setString(2,stock);
		psmt.setString(3,price);
		psmt.setString(4,company);
		psmt.setString(5,prodno);
		
		// 3단계 - SQL실행
		result = psmt.executeUpdate();
		// 4단계 - 결과처리(SELECT일 경우)
		// 5단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
	if(result ==1 ){
		response.sendRedirect("/ch06/shop/product/list.jsp?modify=success");
	}else{
		response.sendRedirect("/ch06/shop/product/list.jsp?modify=fail");
	}
	
%>