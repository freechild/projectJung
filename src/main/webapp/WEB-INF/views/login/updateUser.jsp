<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<link href="<c:url value='resources/css/login.css' />" rel="stylesheet">
<title>회원정보수정</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
	function formCheck(){
		var pw1 = document.rform.ruserPassword.value;
		var pw2 = document.rform.ruserPassword2.value;
		var userIdCheck = document.rform.userIdCheck.value;
		
		if(pw1!=pw2){
			alert("비밀번호를 확인해주세요");
			document.rform.ruserPassword.focus();
			return false;
		}
	}

	function execDaumPostcode(){
	    //load함수를 이용하여 core스크립트의 로딩이 완료된 후, 우편번호 서비스를 실행합니다.
	    daum.postcode.load(function(){
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullAddr = ''; // 최종 주소 변수
	                var extraAddr = ''; // 조합형 주소 변수

	                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    fullAddr = data.roadAddress;

	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    fullAddr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	                if(data.userSelectedType === 'R'){
	                    //법정동명이 있을 경우 추가한다.
	                    if(data.bname !== ''){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있을 경우 추가한다.
	                    if(data.buildingName !== ''){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address1').value = fullAddr;

	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById('address2').focus();
	            }
	        }).open();
	    });
	}
</script>
</head>
<body>
	<div class="form">
		<div class="form-panel one">
			<div class="form-header">
				<h1>회원가입</h1>
			</div>
				<form action="/updateUser.do" method="post" onsubmit="return formCheck(this)" name = "rform" id="rform">
					<div class="form-group">
					
						<input type="hidden" id="userIdCheck" value="false">
						<input type="hidden" id="userIdCheck1" value="ture">
						
						<label for="userId">아이디 &nbsp&nbsp&nbsp</label>
					
						<input type="hidden" name="idx" value="${memberVO.idx }">
						<input type="text" id="userId1" name="userId" value="${memberVO.userId }" readonly="readonly" />
						 
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
						<input type="password" id="ruserPassword2" name="userPassword2"
							required="required" />
					</div>
					
					<div class="form-group">
						<label for="username">사용자 이름</label> <input type="text"
							id="userName" name="userName" value="${memberVO.userName }" readonly="readonly" />
					</div>
					
					<div class="form-group">
						<label for="email">Email</label> <input type="text"
							id="email" name="email" value="${memberVO.email }"  readonly="readonly" />
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
							id="address1" name="address1" value="${memberVO.address1 }"  required="required" />
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
									 $('#userId1').change(function(){
											var t1 = $('#userId1').val();
											$.ajax({
												url:"/idCheck.do",
												data:{
													"userId1":t1
												},
												success:function(data){
													if(data!="true"){
														$("#idTest").text("아이디 중복이염");
														$("#userIdCheck").val("false");
														
													}
													else{
														$("#idTest").text("사용 가능여");
														$("#userIdCheck").val("true");
													}
												}
											});
								 		});
				
									$('#ruserPassword2').change(function(){
										var t2 = $('#ruserPassword2').val();
										var t3 = $('#ruserPassword').val();
										if(t2!=t3){
											$("#passwordTest").text("비밀번호가 일치하지 않습니다.");
										}else
											$("#passwordTest").text(" ");
									});
								})
	</script>
</body>
</html>