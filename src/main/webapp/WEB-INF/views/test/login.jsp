<%@page import="member.service.MultiLoginPreventorListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인 중복방지 Test</title>
</head>
<body>
	<h1>중복로그인방지</h1>
	현재 로그인수 : <%=MultiLoginPreventorListener.getInstance().getTotalActiveSession() %>명<br>
	<%
		boolean isLogin = session.getAttribute("userid")!=null;
		if(isLogin){
	%>
		${sessionScope.userid }님 방가방가<br>
		<input type="button" value="로그아웃" onclick="location.href='logout.jsp';">
	<%	}else{ %>
		<form action="login_ok.jsp" method="post">
			사용자 아 이 디 : <input type="text" name="userid"><br>
			사용자 비밀번호 : <input type="password" name="password"><br>
			<input type="submit" value="로그인">
		</form>
	<%	} %>    
</body>
</html>