<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 수신
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	int result=0;
	//데이터베이스 처리
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 1단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		// 2단계 - SQL실행 객체 생성
		String sql = "update `user1` set `name`=?, `birth`=?, `hp`=?, `age`=? where `uid` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,name);
		psmt.setString(2,birth);
		psmt.setString(3,hp);
		psmt.setString(4,age);
		psmt.setString(5,uid);
		
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
		response.sendRedirect("/ch06/user1/list.jsp?modify=success");
	}else{
		response.sendRedirect("/ch06/user1/list.jsp?modify=fail");
	}
	
%>