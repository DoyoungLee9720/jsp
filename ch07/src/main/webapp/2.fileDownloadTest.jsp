<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="file.fileVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<fileVO> files = new ArrayList<>();
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/studydb");
		Connection conn = ds.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "select * from filetest";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
			fileVO vo = new fileVO();
			vo.setNo(rs.getInt(1));
			vo.setUid(rs.getString(2));
			vo.setName(rs.getString(3));
			vo.setOname(rs.getString(4));
			vo.setSname(rs.getString(5));
			vo.setRdate(rs.getString(6));
			files.add(vo);
		}
		
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2.fileDownloadTest</title>
	<%--
		날짜 : 2024/08/12
		이름 : 이도영
		내용 : 파일 다운로드 실습하기
	--%>
</head>
<body>
	<h3>2.파일 다운로드</h3>
	<table border="1">
		<tr>
			<th>파일번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>원본파일명</th>
			<th>저장파일명</th>
			<th>등록일</th>
			<th>다운로드</th>
		</tr>
		<%for(fileVO vo : files){ %>
		<tr>
			<td><%= vo.getNo() %></td>
			<td><%= vo.getUid() %></td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getOname() %></td>
			<td><%= vo.getSname() %></td>
			<td><%= vo.getRdate() %></td>
			<td>
				<a href="./proc/fileDelete.jsp?sname=<%=vo.getSname()%>">삭제</a>
				<a href="./proc/fileDownload.jsp?no=<%=vo.getNo()%>">다운로드</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>