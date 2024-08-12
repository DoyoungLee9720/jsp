<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 	//폼 데이터 수신
	String sname = request.getParameter("sname");
	

	//데이터베이스 처리
	try{
		//1단계
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		
		
		//2단계
		Connection conn = ds.getConnection();
		
		
		
		/*
		//인덱스 no 가 필요한 이유는 PK 이기 때문이다 물론 sname 자체도 고유값이지만 no가 pk 를 이용하면 빠르게 접근 할수 있기 때문이다
		Connection conn = ds.getConnection();
		PreparedStatement psmt = conn.preparedStatement("select sname form filetest where 'no'=?");
		psmt.setString(1,no);
		Statement stmt = conn.createStatement();
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			sname = rs.getString(1);
		}
		*/
		//3단계
		String sql = "Delete from `fileTest` where `sname`=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1,sname);
		
		psmt.executeUpdate();
		
		
		
		psmt.close();
		conn.close();
		//4단계
		
		//5단계
		
		//6단계
		
	}catch(Exception e){
	}
	String fileDir = application.getRealPath("./uploads");
	File file = new File(fileDir+File.separator+sname);
	if(file.isFile()){
		file.delete();
		response.sendRedirect("../2.fileDownloadTest.jsp?delete=success");
	}else{
		response.sendRedirect("../2.fileDownloadTest.jsp?delete=fail");
	}
%>
