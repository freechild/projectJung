<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<link href="<c:url value='/resources/css/login.css' />" rel="stylesheet">
<title>회원정보수정</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="/resources/js/updateUser.js"></script>

</head><div></div>
<body>
	<div class="form">
		<div class="form-panel one">
			<div class="form-header">
				<h1>회원정보수정</h1>
			</div>
				 <form action="/updateUser.do" method="post" onsubmit="return formCheck(this)" name = "rform" id="rform">
					<div class="form-group">
					
						<input type="hidden" id="userIdCheck" value="false">
						<input type="hidden" id="userIdCheck1" value="ture">
						
						<label for="userId">아이디 &nbsp&nbsp&nbsp</label>
						<input type="hidden" name="idx" value="${memberVO.idx }">
						<input type="text" id="userId1" name="userId" value="${sessionScope.userId }" readonly="readonly" />
						 
					</div>
											
					<div class="form-group" align="left">
						<label for="password">비번</label> 
						<input type="password" id="ruserPassword" name="userPw" required="required" />
					</div>
					
					<div class="form-group">
						<label for="userPassword2">비번확인	&nbsp&nbsp&nbsp
							<span id = "passwordTest">
								<c:out value="${passwordTest }"></c:out>
							</span>
						</label>
						<input type="password" id="ruserPassword2" name="userPassword2" required="required" />
					</div>
					<div class="form-content">
						<div class="form-input" align="right">
							<input type="button" onclick="execDaumPostcode()" value="우편번호검색" >
						</div>
					</div>
					<br>
						<div class="form-group">
						
							<label for="address1">우편번호</label>
							
							<input type="text" id="postcode" name="zipcode" required="required" />
						</div>
					<div class="form-group" >
						<label for="address1">주소</label>
						<input type="text" id="address1" name="address1" value="${memberVO.address1 }"  required="required" />
					</div>
					<div class="form-group">
						<input type="text" id="address2" name="address2" value="${memberVO.address2 }" required="required" />
					</div>
						<div class="form-group">
							<button type="submit">회원정보수정</button>
						</div>
						<div class="form-group">
							<button onclick="history.back();">돌아가기</button>
						</div><br>
				</form>
		</div> 
	</div>

</body>
</html>