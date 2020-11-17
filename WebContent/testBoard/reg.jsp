<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reg.jsp</title>
</head>
<body>
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dto" class="testBoard.BoardDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	<jsp:useBean id="dao" class="testBoard.BoardDAO"></jsp:useBean>
	${dao.insert(dto) }
	<c:redirect url="list.jsp"></c:redirect>
</body>
</html>