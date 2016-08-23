<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<link href="<c:url value='resources/css/login.css' />" rel="stylesheet">
<title>로그인</title>
</head>
<body>
<div class="form">
	<div class="form-panel one">
		<div class="form-header">
			<h1>비밀번호 찾기</h1>
		</div>
		<form action="/sendpw.do" name="pwsearch" method="post" >
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userId" id="userId"/>
			</div>
			<div class="form-group">
				<label>email</label>
				<input type="text" name="email" id="email"/>
			</div>
			<div class="form-group">
				<button type="submit">비밀번호 찾기</button>
			</div>
			<div class="form-group">
				<button onclick="location.href='history.back()'">돌아가기</button>
			</div>
		</form>
	</div>
</div> 
</body>
</html>