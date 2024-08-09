<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 장애</title>
</head>
<body>
	<h3>일시적으로 서버에 문제가 생겼습니다.</h3>
	<p>
		계속 장애 발생기. 고객센터로 문의하시기 바랍니다.
		장애 종류 : <%=exception.getClass().getName() %>
		<a href="../6.exception.jsp">뒤로가기</a>
	</p>
</body>
</html>