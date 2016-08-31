
	function updateForm(){
		var id = $('#scope').val();
		
		$('.joinForm').css('height','500px');
		$('.joinForm').html("<h1>회원정보수정</h1>");					
		$('.joinForm').append("<span id='img_tag'><a href='javascript:pop_hide()'><img src='/resources/Image/ic_clear.png'></a></span>");
		$('.joinForm').append("<hr><br><br>")
		$('.joinForm').append('<div><label for="userId">아이디 &nbsp&nbsp&nbsp</label>');
		$('.joinForm').append('<input type="text" id="userId1" name="userId" value="'+id+'" readonly="readonly" />')
		$('.joinForm').append('<label for="password">비번 &nbsp&nbsp&nbsp</label> ');
		$('.joinForm').append('<input type="password" id="ruserPassword" name="userPw" required="required" />');
		$('.joinForm').append('<label for="userPassword2">비번확인	&nbsp&nbsp&nbsp</label>');
		$('.joinForm').append('<input type="password" id="ruserPassword2" name="userPassword2" required="required" /></div>');
		
		$('.joinForm').append('<button type ="button" onclick="execDaumPostcode()">우편번호검색</button><br><br>');
		$('.joinForm').append('<label>우편번호</label><input type="text" id="postcode" name="zipcode" />');
		$('.joinForm').append('<label>주소 &nbsp&nbsp&nbsp</label>');
		$('.joinForm').append('<input type="text" id="address1" name="address1" />');
		$('.joinForm').append('<label>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp </label><input type="text" id="address2" name="address2" />');
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
				"zipcode" : $('#postcode').val(),
				"address1" : $('#address1').val(),
				"address2" : $('#address2').val(),
			}
		}).done(function(){
			pop_hide();
		})
	}


	
	
	