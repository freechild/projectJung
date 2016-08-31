<%@page import="member.service.MultiLoginPreventorListener"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! MultiLoginPreventorListener  preventorListener  = MultiLoginPreventorListener.getInstance(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 확인</title>
</head>
<body>
<%
	if(request.getMethod().equals("POST")){
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		if(userid!=null && userid.equals(password)){
			// 이미 로그인 되어있다면
			if(preventorListener.findByLoginId(userid)){
				out.println("<script>");
				out.println("alert('이미 로그인되어있습니다. 강제 종료하고 재접속합니다.');");
				out.println("</script>");
			}
			preventorListener.addUser(userid, session);
		}
	}
%>
<script type="text/javascript">location.href='login.jsp'</script>
</body>
</html>