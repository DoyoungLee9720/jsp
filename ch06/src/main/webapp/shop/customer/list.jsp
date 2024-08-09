<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.CustomerVO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	List<CustomerVO> customers = new ArrayList<>();
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
		ResultSet rs = stmt.executeQuery("select * from customer");
		// 5단계 - 결과처리
		while(rs.next()){
			CustomerVO vo = new CustomerVO();
			vo.setCustid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAddr(rs.getString(4));
			vo.setRdate(rs.getString(5));
			customers.add(vo);
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
	<a href="/ch06/shop/customer/register.jsp">등록</a>
	<table border="1">
	
		<tr>
			<th>고객아이디</th>
			<th>고객명</th>
			<th>휴대폰</th>
			<th>주소</th>
			<th>가입일</th>
			<th>관리</th>
		</tr>
		<%for(CustomerVO vo : customers){ %>
		<tr>
			<td><%=vo.getCustid() %></td>
			<td><%=vo.getName() %></td>
			<td><%=vo.getHp() %></td>
			<td><%=vo.getAddr() %></td>
			<td><%=vo.getRdate() %></td>
			<td>
				<a href="/ch06/shop/customer/modify.jsp?custid=<%=vo.getCustid()%>">수정</a>
				<a href="/ch06/shop/customer/delete.jsp?custid=<%=vo.getCustid()%>" class="del">삭제</a>
			</td>
		</tr>
		<%} %>
	</table>
</body>
</html>