//팝업창 호출
function msgPopup(){
	$('.joinForm').show();
	$('.joinForm').center();
}
//메시지 보내기 //보낼상대 고르기
function sendMsg(){
	msgPopup();
	$('.joinForm').html("<h1>Send Message</h1>");					
	$('.joinForm').append("<span id='img_tag'><a href='javascript:pop_hide()'><img src='/resources/Image/ic_clear.png'></a></span>");
	$('.joinForm').append("<hr>");
	$('.joinForm').append('<label>수취인</label><input type="search" id="search" onkeyup="search()">');
	$('.joinForm').append('<br>');
	$('.joinForm').append('<div class="searchFriend">');	
}

//비동기화식 상대고르기
function search(){
	if($('#search').val().length>1){
		$.ajax({
    		url :'/searchFriend',
    		data:{
    			'idx' : $('#scope_idx').val(),
    			'search' : $('#search').val()
    		}	
    	}).done(function(data){
    		$('.searchFriend').empty();
    		$('.searchFriend').append("<p>해당 이름 클릭!</p>");
    		if(data=="false"){
    			$('.searchFriend').append("<label>존재하지않는 유저</label>");
    			
    		}
    		else{		
	    		data = eval("(" + data + ")");
	    		val = data.friendList;
	    		$.each(data.friendList,function(index,value){
	    			var i = value.idx+"/"+value.userName;
	    			$('.searchFriend').append("<label><a href='javascript:choose(\""+i+ "\")'>" + value.userName + "</a></label>")
	    			
	    		})
    		}
    	})
	}
}

//상대 선택
function choose(i){
	var substr=i.split('/');
	$('.joinForm').html("<h1>Send Message</h1>");					
	$('.joinForm').append("<span id='img_tag'><a href='javascript:pop_hide()'><img src='/resources/Image/ic_clear.png'></a></span>");
	$('.joinForm').append("<hr>");
	$('.joinForm').append('<label>수취인</label><input type="text" id="name" value='+ substr[1]+' readonly="readonly">');
	$('.joinForm').append('<br>');
	$('.joinForm').append('<textarea rows="8" cols="63" id="send_msg"></textarea>');
	$('.joinForm').append("<span id='img_tag'><a href='javascript:sendMsgOk(\""+substr[0]+"\")'><img src='/resources/Image/ic_done.png'></a></span>");
	
}
// 메시지 보내기
function sendMsgOk(i){
	$.ajax({
		url:'/sendMsg',
		data:{
			"recipient_idx" : i,
			"sender_idx" : $('#scope_idx').val(),
			"message" : $('#send_msg').val()
		}
	}).done(function(){
		location.reload();
		pop_hide();
	})
}

//메세지 읽기
function msgDetail(i){
	
	msgPopup();
	$('.joinForm').html("<h1>Detail</h1>");					
	$('.joinForm').append("<span id='img_tag'><a href='javascript:pop_hide()'><img src='/resources/Image/ic_clear.png'></a></span>");
	
	$.ajax({
		url:"/msgDetail",
		data:{
			"idx":i
		}
	}).done(function(data){
		data = eval("(" + data + ")");
		
			
		$('.joinForm').append("<p>"+data.sender +"님이 보내신 글</p>");
		$('.joinForm').append('<textarea rows="8" cols="60" onfocus="javascrpt:blur()">'+data.message+'</textarea>');
		if(data.add_status==1){
			$('.joinForm').append("<br>");
			$('.joinForm').append("<label class='addFriend'><a href='javascript:status(\"add/"+data.idx+"\")'><img src='/resources/Image/ic_done_2x.png'></a><span class='small'>ADD Friend</span></label>");
			$('.joinForm').append("<label class='addFriend'><a href='javascript:status(\"delete/"+data.idx+"\")'><img src='/resources/Image/ic_clear_2x.png'></a><span class='small'>Deny</span></label>");				
		}
		else{
			var i = data.sender_idx+"/"+data.sender;
			$('.joinForm').append("<br>");
			$('.joinForm').append("<label class='addFriend'><a href='javascript:choose(\""+i+"\")'><img src='/resources/Image/ic_done_2x.png'></a><span class='small'>Reply</span></label>");
			$('.joinForm').append("<label class='addFriend'><a href='javascript:status(\"delete/"+data.idx+"\")'><img src='/resources/Image/ic_clear_2x.png'></a><span class='small'>Delete</span></label>");
		}
	})
}
//읽기 다음행동
function status(i){
	var substr=i.split('/');	
	$.ajax({
		url: "/status_friend",
		data:{
			"status" :substr[0],
			"idx" : substr[1]
		}
	}).done(function(){
		location.reload();
		pop_hide();
	})
}

