<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--<%request.setCharacterEncoding("utf-8"); %> --%>
	<fmt:requestEncoding value="utf-8"/>
	el id : ${param.id }<br>
	el pw : ${param.pwd }
	<hr>
	<jsp:useBean id="dao" class="test.TestDAO"></jsp:useBean>
	<c:set var="result" value="${dao.userChk(param.id, param.pwd) }"></c:set>
	<c:if test="${result == 0 }">
		인증 성공
	</c:if>
	
	<h3>개인 정보</h3>
	<c:set var="dto" value="${dao.getUser(param.id) }"></c:set>
	이름 : ${dto.name }<br>
	주소 : ${dto.addr }<br>
	<hr>
	<h3>정보 리스트</h3>
	<table border="1">
		<tr><th>이름</th><th>주소</th></tr>
		<c:forEach var="dto" items="${dao.list() }">
			<tr>
				<td>${dto.name }</td>
				<td>${dto.addr }</td>
			</tr>
		</c:forEach>
	</table>
	
	<c:import url="login_el(setEncoding).jsp"></c:import>
	
	<%--<c:redirect url="login_el.jsp"></c:redirect> --%>
	
	<c:set var="name" value="홍길동" scope="session"></c:set> <!-- session 설정 -->
	${sessionScope.name }<br> <!-- 세션 확인 -->
	
	<c:remove var="name"/> <!-- 세션 삭제 -->
	
	<c:set var="name" value="김개똥"></c:set>
	
	<c:choose>
		<c:when test="${name == '홍길동' }">홍길동임 - if</c:when>
		<c:otherwise>홍길동 아님</c:otherwise>
	</c:choose>
	
	
	<hr>
		<form action="test.jsp">
			<input type="checkbox" name="se" value="spring">봄
			<input type="checkbox" name="se" value="summer">여름
			<input type="checkbox" name="se" value="fall">가을
			<input type="checkbox" name="se" value="winter">겨울
			<input type="submit">
	</form>
</body>
</html>