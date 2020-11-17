<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		pageContext.setAttribute("name", "page man");
		request.setAttribute("name", "request man");
		session.setAttribute("name", "session man");
		application.setAttribute("name", "application man");
	%>
	name : ${name }<br> <!-- 현재 있는 값에서 가장 작은 값이 우선순위이다. -->
	<!-- page < request < session < application -->
	page : ${pageScope.name }<Br>
	request : ${requestScope.name }<br>
	session : ${sessionScope.name }<br>
	application : ${applicationScope.name }<br>
	<a href="elScopeTest.jsp">이동</a>

</body>
</html>