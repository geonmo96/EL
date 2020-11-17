<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	name : ${name }<br>
	page : ${pageScope.name }<Br>
	request : ${requestScope.name }<br>
	session : ${sessionScope.name }<br>
	application : ${applicationScope.name }<br>
</body>
</html>