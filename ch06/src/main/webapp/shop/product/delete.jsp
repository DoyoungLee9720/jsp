<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String prodno = request.getParameter("prodno");
	
	String host = "jdbc:mysql://127.0.0.1:3306/shop";
	String user = "root";
	String pass = "1234";
	int result=0;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		String sql = "Delete from `product` where `prodNo`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,prodno);
		result = psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	if(result == 1 ){
		response.sendRedirect("/ch06/shop/product/list.jsp?delete=success");
	}else{
		response.sendRedirect("/ch06/shop/product/list.jsp?delete=fail");
	}
%>