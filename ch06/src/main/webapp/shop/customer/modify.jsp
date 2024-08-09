<%@page import="shop.CustomerVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/shop";
	String user = "root";
	String pass = "1234";
	CustomerVO vo = null;
	String uid = request.getParameter("custid");
	try{
		
	//1단계
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//2단계
	Connection conn = DriverManager.getConnection(host,user, pass);
	
	//3단계
	String sql = "select * from `customer` where `custid`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, uid);
	//4단계
	ResultSet rs = psmt.executeQuery();
	
	//5단계
	if(rs.next()){
		vo = new CustomerVO();
		vo.setCustid(rs.getString(1));
		vo.setName(rs.getString(2));
		vo.setHp(rs.getString(3));
		vo.setAddr(rs.getString(4));
		vo.setRdate(rs.getString(5));
	}
	//6단계
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>shop::register</title>
</head>
<body>
	<h3>shop 목록</h3>
	<a href="/ch06/2.DBCPtest.jsp">처음으로</a>
	<a href="/ch06/shop/customer/list.jsp">목록</a>
	
	<form action="/ch06/shop/customer/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="custid" value="<%=vo.getCustid() %>"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=vo.getName() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="<%=vo.getHp() %>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="<%=vo.getAddr() %>"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="date" name="rdate" value="<%=vo.getRdate() %>"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록하기"/>
				</td>
				
			</tr>
		</table>
	</form>
</body>
</html>