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
	<!-- 
		설치 방법
		http://archive.apache.org/dist/jakarta/taglibs/standard/binaries/ > 크기가 933k인 파일( jakarta-taglibs-standard-1.1.2.zip )다운\
		압축 풀고 lib안에 있는 jar파일(jstl.jar, standard.jar) webContent > WEB-INF > lib 에 복붙
		<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>를 추가해줘야함(맨위)
	 -->
	 <c:out value="hi"></c:out> <!-- value에 있는 내용 출력 --><Br>
	 <c:set var="num" value="hello"></c:set><!-- 변수 설정 -->
	 <!-- 변수 타입에 대한 값이 없음 > 뭐든지 설정 가능함 -->
	 num : ${num }<br>
	 num : <c:out value="${num }"></c:out><br>
	 	 <hr>
	 <%
	 	// <%= num 
	 	// jsp의 변수로는 사용할 수 없다(반대로는 가능) > 너무 혼용하면 주의해야함
	 	String s = "hello";
	 %>
	 <c:set var="num01" value="<%=s %>"></c:set>
	 <c:if test="${num01 == 'hello' }">
	 	두 값은 같다
	 </c:if>
	 <hr>
	 
	 <% String[] str = {"111", "222", "333", "444"};%>
	 <c:set var="str" value="<%=str %>"></c:set>
	 <c:forEach var="s" items="${str }">
	 	${s }<br>
	 </c:forEach>
	 
	 
	 
</body>
</html>