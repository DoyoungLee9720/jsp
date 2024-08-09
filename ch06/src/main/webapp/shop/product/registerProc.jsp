<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
	//데이터베이스 처리
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 1단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		// 2단계 - SQL실행 객체 생성
		String sql = "insert into `product` values(?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,prodno);
		psmt.setString(2,prodname);
		psmt.setString(3,stock);
		psmt.setString(4,price);
		psmt.setString(5,company);
		
		// 3단계 - SQL실행
		psmt.executeUpdate();
		// 4단계 - 결과처리(SELECT일 경우)
		// 5단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("/ch06/shop/product/list.jsp");
%>