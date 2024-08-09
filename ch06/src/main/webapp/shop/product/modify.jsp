<%@page import="shop.ProductVO"%>
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
	ProductVO vo = null;
	String prodno = request.getParameter("prodno");
	try{
		
	//1단계
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	//2단계
	Connection conn = DriverManager.getConnection(host,user, pass);
	
	//3단계
	String sql = "select * from `product` where `prodNo`=?";
	PreparedStatement psmt = conn.prepareStatement(sql);
	psmt.setString(1, prodno);
	//4단계
	ResultSet rs = psmt.executeQuery();
	
	//5단계
	if(rs.next()){
		vo = new ProductVO();
		vo.setProdNo(rs.getInt(1));
		vo.setProdName(rs.getString(2));
		vo.setStock(rs.getInt(3));
		vo.setPrice(rs.getInt(4));
		vo.setCompany(rs.getString(5));
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
	<a href="/ch06/shop/product/list.jsp">목록</a>
	
	<form action="/ch06/shop/product/modifyProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type="number" name="prodno" value="<%=vo.getProdNo() %>"></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="prodname" value="<%=vo.getProdName() %>"></td>
			</tr>
			<tr>
				<td>제고량</td>
				<td><input type="number" name="stock" value="<%=vo.getStock() %>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="price" value="<%=vo.getPrice() %>"></td>
			</tr>
			<tr>
				<td>제조회사</td>
				<td><input type="text" name="company" value="<%=vo.getCompany() %>"></td>
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