


	function updateForm(){
		var i = $('#scope').val();
		$('.joinForm').css('height','400px');
		$('.joinForm').html("<br><h1>회원정보수정</h1><br><br>");
		$('.joinForm').append('<input type="hidden" id="userIdCheck" value="false">');
		$('.joinForm').append('<input type="hidden" id="userIdCheck1" value="ture">');
		$('.joinForm').append('<label for="userId">아이디 &nbsp&nbsp&nbsp</label>');
		$('.joinForm').append('<input type="text" id="userId1" name="userId" value="'+i+'" readonly="readonly" />')
		$('.joinForm').append('<label for="password">비번 &nbsp&nbsp&nbsp</label> ');
		$('.joinForm').append('<input type="password" id="ruserPassword" name="userPw" required="required" />');
		$('.joinForm').append('<label for="userPassword2">비번확인	&nbsp&nbsp&nbsp');
		$('.joinForm').append('<span id = "passwordTest">');
		$('.joinForm').append('<c:out value="${passwordTest }"></c:out>');
		$('.joinForm').append('</span>');
		$('.joinForm').append('</label>');
		$('.joinForm').append('<input type="password" id="ruserPassword2" name="userPassword2" required="required" />');
		$('.joinForm').append('<button type="button" id="btn" onclick="update()">회원정보수정</button>');
	}	

	function update(){
		var pw1 = $('#ruserPassword').val();
		var pw2 = $('#ruserPassword2').val();
		if(pw1 == pw2){
			alert("수정 완료");
			pop_hide();
		}else{
			alert("비밀번호를 확인해주세요");
			return false;
		}
		$.ajax({
			url : 'updateUser.do',
			data :{
				"userPw" : $('#ruserPassword').val(), 
			}
		}).done(function(){
			pop_hide();
		})
	}


	
	
	