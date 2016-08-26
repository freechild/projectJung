<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Menu - Default functionality</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
</head>

<body>
<a href="javascript:test()">아이디</a>
<div id="moreMenu2">
	<a href="#">친구삭제</a><br>
	<a href="#">대화하기</a><br>
	<a href="#">메시지보내기</a><br>
</div>
<script type="text/javascript">

	function test(){
        $('#moreMenu2').toggle(); // #moreMenu2를 알아서 토.글!
	}



</script>
</body>
</html>