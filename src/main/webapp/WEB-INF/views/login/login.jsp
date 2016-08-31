<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="kr">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
 <meta http-equiv="Content-Script-Type" content="text/javascript">
 <meta http-equiv="Content-Style-Type" content="text/css">
<link href="<c:url value='resources/css/login.css' />" rel="stylesheet">
<title>로그인</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="/resources/js/login.js"></script>
</head>
<body>
	<!-- Form-->
	<div class="form">
		<div class="form-toggle" ></div>
		<div class="form-panel one">
			<div class="form-header">
				<h1>로그인</h1>
			</div>
			<div class="form-content">
			<c:choose>
				<c:when test="${empty sessionScope.memberVO }">
					<form action ="javascript:loginDo()" method="post">
						<div class="form-group">
							<label for="username">아이디</label> 
							<input type="text" id="userId" name="userId" required="required" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input type="password"
								id="userPassword" name="userPw" required="required" />
						</div>
						<div class="form-group">
							<label class="form-remember"> <input type="checkbox" />아이디 저장&nbsp&nbsp&nbsp&nbsp
							<a href="/search.do" class="form-recovery">비밀번호 찾기</a>
							</label>
						</div>
						<div class="form-group">
							<button type="submit">로그인</button>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<div class="form-header">
						<h1>로그인완료</h1>
					</div>
					<div class="form-content">
							<label>${sessionScope.memberVO.userName} 님 로그인<br></label><br>
							<div class="form-group">
								<button onclick="location.href='/logout.do'">로그아웃</button>
							</div>
							<div class="form-group">
								<button onclick="location.href='/update.do'">회원정보수정</button>
							</div>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
		</div>
		<div class="form-panel two">
			<div class="form-header">
				<h1>회원가입</h1>
			</div>
				<form action="/registerOk.do" method="post" onsubmit="return formCheck(this)" name = "rform" id="rform">
					<div class="form-group">
					
						<input type="hidden" id="userIdCheck" value="false">
						<input type="hidden" id="userIdCheck1" value="ture">
						
						<label for="userid">아이디 &nbsp&nbsp&nbsp
							<span id = "idTest">
								<c:out value="${idTest }"></c:out>
							</span>
						</label>
						<input type="text" id="userId1" name="userId" required="required" />
					</div>
					<div class="form-group" align="left">
						<label for="password">비번</label> 
						<input type="password" id="ruserPassword" name="userPw" required="required" />
					</div>
					<div class="form-group">
						<label for="userPassword2">비번확인
						&nbsp&nbsp&nbsp
							<span id = "passwordTest">
								<c:out value="${passwordTest }"></c:out>
							</span>
						</label>
						<input type="password" id="ruserPassword2" name="userPassword2"
							required="required" />
					</div>
					<div class="form-group">
						<label for="username">사용자 이름</label> <input type="text"
							id="userName" name="userName" required="required" />
					</div>
					<div class="form-group">
						<label for="username">힌트</label> <input type="text"
							id="hint" name="hint" required="required" />
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="text"
							id="email" name="email" required="required" />
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
					<div class="form-group">
						<label for="address1">주소</label> <input type="text"
							id="address1" name="address1" required="required" />
					</div>
					<div class="form-group">
						<input type="text" id="address2" name="address2" required="required" />
					</div>
						<div class="form-group">
							<button type="submit">회원가입</button>
						</div>
						<br>
				</form>
		</div>
	</div>
</body>
</html>
