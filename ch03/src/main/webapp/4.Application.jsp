<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Application</title>
	<%--
		날짜 : 2024/08/06
		이름 : 이도영
		내용 : Application 내장객체 실습하기
	--%>
</head>
<body>
	<h3>4.Application 내장객체</h3>
	<h4>서버 정보</h4>
	<%=application.getServerInfo() %>
	<h4>파라미터 정보</h4>
	<%
		String param1 = application.getInitParameter("param1");
		String param2 = application.getInitParameter("param2");
	%>
	<p>
		param1 : <%= param1 %><br>
		param2 : <%= param2 %><br>
	</p>
	<h4>지원 정보</h4>
	<%= application.getRealPath("./4.Application.jsp") %>
</body>
</html>