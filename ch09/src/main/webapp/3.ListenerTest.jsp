<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.ListenerTest</title>
	<%--
		날짜 : 2024/08/14
		이름 : 이도영
		내용 : 리스너 실습하기
	--%>
</head>
<body>
	<h3>3.ListenerTest</h3>
	<%
		String sessUser = (String) session.getAttribute("sessUser");
		if(sessUser == null){ 
	%>
	<form action="/ch09/login.do" method="post">
		<input type="text" name="uid"><br>
		<input type="password" name="pass"><br>
		<input type="submit" name="로그인"><br>
	</form>
	<%
		}else{ 
	%>
		<p>
			<%= sessUser %>님 반갑습니다.
			<a href="/ch09/logout.do">로그아웃</a>
		</p>
	<%} %>
</body>
</html>