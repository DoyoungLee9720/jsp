<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>2.includeTag</title>
	<%--
			날짜 : 2024/08/07
			이름 : 이도영
			내용 : include 엑션태그 실습하기
		--%>
	<style type="text/css">
		header{
			border: 1px solid red;
		*}
		footer{
			border:1px solid blue;
		}
	</style>
</head>
<body>
	<h3>2.include 엑션태그</h3>
	
	<h4>include </h4>
	<%@ include file = "./inc/header.jsp" %>
	<%@ include file = "./inc/footer.jsp" %>
	<h4>include 메서드</h4>
	<%
		pageContext.include("./inc/header.jsp");
		pageContext.include("./inc/footer.jsp");
	%>
	<h4>include 태그</h4>
	<jsp:include page= "./inc/header.jsp"></jsp:include>
	<jsp:include page= "./inc/footer.jsp"></jsp:include>
</body>
</html>