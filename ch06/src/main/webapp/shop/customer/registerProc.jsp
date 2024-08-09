<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String custid = request.getParameter("custid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	String rdate = request.getParameter("rdate");
	
	String host = "jdbc:mysql://127.0.0.1:3306/shop";
	String user = "root";
	String pass = "1234";
	//데이터베이스 처리
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 1단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		// 2단계 - SQL실행 객체 생성
		String sql = "insert into `customer` values(?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1,custid);
		psmt.setString(2,name);
		psmt.setString(3,hp);
		psmt.setString(4,addr);
		psmt.setString(5,rdate);
		
		// 3단계 - SQL실행
		psmt.executeUpdate();
		// 4단계 - 결과처리(SELECT일 경우)
		// 5단계 - 데이터베이스 종료
		psmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("/ch06/shop/customer/list.jsp");
%>