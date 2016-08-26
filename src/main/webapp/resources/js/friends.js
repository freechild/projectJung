
function friendsForm(){
	$('#overlay').hide();
	$('.joinForm').css('height','400px');
	$('.joinForm').css('width','200px');
	$('.joinForm').html("<h1>친구목록</h1>");					
	$('.joinForm').append("<span id='img_tag'><a href='javascript:pop_hide()'><img src='/resources/Image/ic_clear.png'></a></span>");
	$('.joinForm').append("<hr>")
	$('.joinForm').append("<div class='test'>")
	$('.test').html('<a href="javascript:asd()">아이디</a>');
	

}

function asd(){
	$('.test').append('<a href="#">친구삭제</a><br>');
	$('.test').append('<a href="#">대화하기</a><br>');
	$('.test').append('<a href="#">메시지보내기</a><br>');
}