<%@page import="user4.User4VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 처리
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "root";
	String pass = "1234";
	
	List<User4VO> users = new ArrayList<>();
	
	try{
		// 1단계 - JDBC 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		// 2단계 - 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		// 3단계 - SQL실행 객체 생성
		Statement stmt = conn.createStatement();
		
		// 4단계 - SQL실행
		String sql = "select * from `user4`";
		ResultSet rs = stmt.executeQuery(sql);
		// 5단계 - 결과처리
		while(rs.next()){
			User4VO vo = new User4VO();
			vo.setUid(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setGender(rs.getString(3));
			vo.setAge(rs.getInt(4));
			vo.setHp(rs.getString(5));
			vo.setAddr(rs.getString(6));
			
			users.add(vo);
		}
		
		// 6단계 - 데이터베이스 종료
		rs.close();
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
	<title>user4::list</title>
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
	<h3>user4 목록</h3>
	<a href="/ch06/1.JDBCTest.jsp">처음으로</a>
	<a href="/ch06/user4/register.jsp">등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>나이</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<%for(User4VO oneuser : users)
		{%>
		<tr>
			<td><%=oneuser.getUid()%></td>
			<td><%=oneuser.getName()%></td>
			<td><%=oneuser.getGender()%></td>
			<td><%=oneuser.getAge()%></td>
			<td><%=oneuser.getHp()%></td>
			<td><%=oneuser.getAddr()%></td>
			<td>
				<a href="/ch06/user4/modify.jsp?uid=<%= oneuser.getUid()%>">수정</a>
				<a href="/ch06/user4/delete.jsp?uid=<%= oneuser.getUid()%>" class="del">삭제</a>
			</td>
		</tr>
		<%}%>
	</table>
</body>
</html>