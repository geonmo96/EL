<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--<% String se[] = request.getParameterValues("se");	%> 이와 같이 사용했던것을 다음과 같이 수정 가능--%>
	 
	 <c:forEach var="s" items="${paramValues.se }">${s }<br></c:forEach>
	 <!-- %%주의 : param.name 형식으로 값을 전달받던 것을 paramValues.name으로 바꿔야한다 -->

</body>
</html>