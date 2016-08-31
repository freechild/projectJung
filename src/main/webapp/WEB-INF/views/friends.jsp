<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="index.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="kr">
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script src="/resources/js/front.js"></script>
<script src="/resources/js/updateUser.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Menu - Default functionality</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.0/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script>
	$(function() {
		$("#menu").menu();
	});
</script>
<style>
.ui-menu {
	width: 150px;
}
</style>
</head>
<body>
	<article>
		<ul id="menu" style="margin-left: 20px; margin-top: 20px">
			<li><div>admin</div>
				<ul>
					<li><div id = "test">친구삭제</div></li>
					<li><div>대화하기</div></li>
					<li><div>메세지보내기</div></li>
				</ul>
			</li>
			<li><div>realreng</div>
				<ul>
					<li><div>친구삭제</div></li>
					<li><div>대화하기</div></li>
					<li><div>메세지보내기</div></li>
				</ul>
			</li>
			<li><div>test</div>
				<ul>
					<li><div>친구삭제</div></li>
					<li><div>대화하기</div></li>
					<li><div>메세지보내기</div></li>
				</ul>
			</li>
		</ul>
	</article>
</body>
</html>