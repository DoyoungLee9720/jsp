<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<form action="/ch06/shop/customer/registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="custid"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td><input type="date" name="rdate"></td>
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