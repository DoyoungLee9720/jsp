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
	<a href="/ch06/shop/product/list.jsp">목록</a>
	
	<form action="/ch06/shop/product/registerProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>제품번호</td>
				<td><input type="number" name="prodno"></td>
			</tr>
			<tr>
				<td>제품명</td>
				<td><input type="text" name="prodname"></td>
			</tr>
			<tr>
				<td>제고량</td>
				<td><input type="number" name="stock"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="number" name="price"></td>
			</tr>
			<tr>
				<td>제조회사</td>
				<td><input type="text" name="company"></td>
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