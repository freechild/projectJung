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

$(document).ready(function() {
			var panelOne = $('.form-panel.two').height(), panelTwo = $('.form-panel.two')[0].scrollHeight;
			$('.form-panel.two').not('.form-panel.two.active')
						.on(
							'dblclick',
							function(e) {
								e.preventDefault();

								$('.form-toggle').addClass(
										'visible');
								$('.form-panel.one').addClass(
										'hidden');
								$('.form-panel.two').addClass(
										'active');
								$('.form').animate({
									'height' : panelTwo
								}, 200);
								
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
							 		})
								});
			
								$('#ruserPassword2').change(function(){
									var t2 = $('#ruserPassword2').val();
									var t3 = $('#ruserPassword').val();
									if(t2!=t3){
										$("#passwordTest").text("비밀번호가 일치하지 않습니다.");
									}else
										$("#passwordTest").text(" ");
								});
									
			$('.form-toggle').on('click', function(e) {
				e.preventDefault();
				$(this).removeClass('visible');
				$('.form-panel.one').removeClass('hidden');
				$('.form-panel.two').removeClass('active');
				$('.form').animate({
					'height' : panelOne
				}, 200);
			});
})
	
	function loginDo(){	
		 $.ajax({
			url : 'login.do',
			data :{
				"userId" : $('#userId').val(),
				"userPw" : $('#userPassword').val()
			}	
		}).done(function(data){
			if(data=="true"){
				var url = $('#userId').val();
				$(location).attr('href',url+"/main");
			}else if(data=="e"){
				var url = $('#userId').val();
				$(location).attr('href',url+"/main");
				alert('현재 접속중입니다. 강제 접속 종료후 접속합니다');
			}else
				alert(data);
		}) 
	}
	
	function formCheck(){
		var pw1 = document.rform.ruserPassword.value;
		var pw2 = document.rform.ruserPassword2.value;
		var userIdCheck = document.rform.userIdCheck.value;
		
		if(pw1!=pw2){
			alert("비밀번호를 확인해주세요");
			document.rform.ruserPassword.focus();
			return false;
		}
		if(userIdCheck == 'false'){
			alert("아이디 중복입니다.");
			document.rform.userId1.focus();
			return false;
		}else{
			alert("회원가입 완료");
		}
	}
