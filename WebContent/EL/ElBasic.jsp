<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<!-- El의 표기법은 달러로 표현한다 -->
	<!-- 어떤 형태이든 표현이 가능하다 -->
	<!-- null값의 print값이 다르다 -->
	<!-- 연산과 비교가 가능함 -->
	<!-- request.getParameter()와 같은 기능이 있다 > param.id -->
	/(div), %(mod), ==(eq), !=(ne), <(lt, >(gt), <=(le), >=(ge), ||(or), &&(and), !(not)로 사용 가능함<br>
	5 / 2 = ${5 / 2 }<br>
	5 div 2 = ${5 div 2 }<br>

<hr>
	5 + 2 = ${ 5 + 2 }<br>
	5 == 2 => ${5 == 2 }
	
	
<hr>
	정수형 : ${10 }<br>
	실수형 : ${10.123 }<br>
	논리형 : ${true }<br>
	null : ${null }<br>
	<% String s = null; %>
	<hr>
	jsp의 null => <%=s %><br>
	el의 null => ${s }<br>
	
	<hr>
	${ "el 표현" } 
	<br>
	
	<% out.print("스크립트릿 표현"); %>
	<%="표현식" %>
</body>
</html>