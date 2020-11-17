<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
	<!-- 
	1 : 1~ 3
	2 : 4 ~ 6
	3 : 7~9
	 -->
	<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="testBoard.BoardDAO"></jsp:useBean>
	
	
	<c:set var="totalPage" value="${dao.getTotalPage() }"></c:set>
	
	<c:choose>
		<c:when test="${totalPage % 3 == 0 }">
			<fmt:parseNumber value="${totalPage / 3 }" var="totalNum" integerOnly="true"></fmt:parseNumber>
			<c:set var="totalPage" value="${totalNum}"></c:set>
		</c:when>
		<c:otherwise>
			<fmt:parseNumber value="${totalPage / 3 }" var="totalNum" integerOnly="true"></fmt:parseNumber>
			<c:set var="totalPage" value="${totalNum + 1 }"></c:set>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${param.start == null }">
			<c:set var="listDto" value="${dao.list(1) }"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="listDto" value="${dao.list(param.start) }"></c:set>
		</c:otherwise>
	</c:choose>
	
	<table border="1">
		<tr> <th>번호</th> <th>제목</th> <th>날짜</th> <th>조회수</th> </tr>
		<c:choose>
			<c:when test="${listDto.size() != 0 }">
				<c:forEach var="dto" items="${listDto }">
					<tr>
						<td>${dto.num }</td> 
						<td><a href="count.jsp?num=${dto.num }">${dto.title }</a></td> 
						<td>${dto.pdate }</td> 
						<td>${dto.count }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr> <th colspan="4">동록된 정보가 없습니다</th> </tr>
			</c:otherwise>
		</c:choose>
		<tr> <td colspan="4" align="right">
			<c:choose>
				<c:when test="${param.start == null }">
					<c:set var="start" value="1"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="start" value="${param.start }"></c:set>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${start > 1 }">
					<button type="button" onclick="location.href='list.jsp?start=${start-1}'">이전</button>
				</c:when>
				<c:otherwise>
					<button type="button" disabled>이전</button>
				</c:otherwise>
			</c:choose>
			
			<c:forEach begin="1" end="${totalPage }" step="1" var="cnt">
				<a href="list.jsp?start=${cnt }">[${cnt }]</a>
			</c:forEach>
			
			<c:choose>
				<c:when test="${start < totalPage }">
					<button type="button" onclick="location.href='list.jsp?start=${start+1}'">다음</button>
				</c:when>
				<c:otherwise>
					<button type="button" disabled>다음</button>
				</c:otherwise>
			</c:choose> 
			${start } / ${totalPage }
			
			
			<button type="button" onclick="location.href='regForm.jsp'">등록</button>
		</td> </tr>
	</table>
</body>
</html>