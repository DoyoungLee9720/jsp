<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.ProductVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	List<ProductVO> products = new ArrayList<>();
	try{
		// 1단계 - JNDI 서비스 객체 생성
		Context initCtx = new InitialContext();
		Context ctx = (Context)initCtx.lookup("java:comp/env");//JNDI 기본 환경 이름
		
		// 2단계 - 커넥션 풀에서 커넥션 객체 가져오기
		DataSource ds =	(DataSource)ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		// 3단계 - SQL실행 객체 생성
		Statement stmt = conn.createStatement();
		// 4단계 - SQL실행
		ResultSet rs = stmt.executeQuery("select * from product");
		// 5단계 - 결과처리
		while(rs.next()){
			ProductVO vo = new ProductVO();
			vo.setProdNo(rs.getInt(1));
			vo.setProdName(rs.getString(2));
			vo.setStock(rs.getInt(3));
			vo.setPrice(rs.getInt(4));
			vo.setCompany(rs.getString(5));
			products.add(vo);
		}
		// 6단계 - 커넥션 반납
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>customer::list</title>
	<script>
			window.onload = function(){
				const del = document.querySelectorAll('.del');
				//리스트에 '삭제' 링크가 여러개이기 때문에 문서객체 리스트를 순회하면서 이벤트 처리
				// 고전 문서객체 선택함수(getElement~)는 forEach 지원 안함
				del.forEach(function(item){
					item.onclick = function(e){
						const result = confirm('정말 삭제 하시겠습니까?');
						
						if(!result) e.preventDefault();
						
					}
				});
				
			}
	</script>
</head>
<body>
	<h3>고객목록</h3>
	<a href="/ch06/2.DBCPtest.jsp">처음으로</a>
	<a href="/ch06/shop/product/register.jsp">등록</a>
	<table border="1">
	
		<tr>
			<th>제품번호</th>
			<th>제품명</th>
			<th>제고량</th>
			<th>가격</th>
			<th>제조회사</th>
		</tr>
		<%for(ProductVO vo : products){ %>
		<tr>
			<td><%=vo.getProdNo() %></td>
			<td><%=vo.getProdName() %></td>
			<td><%=vo.getStock() %></td>
			<td><%=vo.getPrice() %></td>
			<td><%=vo.getCompany() %></td>
			<td>
				<a href="/ch06/shop/product/modify.jsp?prodno=<%=vo.getProdNo()%>">수정</a>
				<a href="/ch06/shop/product/delete.jsp?prodno=<%=vo.getProdNo()%>" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>