<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>elResult.jsp</title>
</head>
<body>
	<h4>request객체를 사용할 떄</h4>
	<%=request.getParameter("id") %><br>
	<%=request.getParameter("pw") %>
	<h4>el parameter를 사용할 떄</h4>
	${id = param.id }<br>
	${param.pw }<br>
	
	
</body>
</html>