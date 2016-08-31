function msgPopup(){
	$('.joinForm').show();
	$('.joinForm').center();
}

function sendMsg(){
	msgPopup();
	$('.joinForm').html("<h1>Send Message</h1>");					
	$('.joinForm').append("<span id='img_tag'><a href='javascript:pop_hide()'><img src='/resources/Image/ic_clear.png'></a></span>");
	$('.joinForm').append("<hr>");
	$('.joinForm').append('<label>수취인</label><input type="search" id="search" onkeyup="search()">');
	$('.joinForm').append('<br>');
	$('.joinForm').append('<div class="searchFriend"></div>');	
}


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
	    			$('.searchFriend').append("<label><a href='#'>" + value.userName + "</a></label>")
	    			
	    		})
    		}
    	})
	}
}


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
		var i = $('#scope_idx').val()
			
		$('.joinForm').append("<p>"+data.sender +"님이 보내신 글</p>");
		$('.joinForm').append('<textarea rows="8" cols="60" onfocus="javascrpt:blur()">'+data.message+'</textarea>');
		if(data.add_status==1){
			if(data.sender_idx == i){
				$('.joinForm').append("<br>");				
				$('.joinForm').append("<label class='addFriend'><a href='javascript:status(\"deny/"+data.idx+"\")'><img src='/resources/Image/ic_clear_2x.png'></a><span class='small'>Deny Friend</span></label>");				
			}
			else{
			$('.joinForm').append("<br>");
			$('.joinForm').append("<label class='addFriend'><a href='javascript:status(\"add/"+data.idx+"\")'><img src='/resources/Image/ic_done_2x.png'></a><span class='small'>ADD Friend</span></label>");
			$('.joinForm').append("<label class='addFriend'><a href='javascript:status(\"deny/"+data.idx+"\")'><img src='/resources/Image/ic_clear_2x.png'></a><span class='small'>Deny Friend</span></label>");				
			}
		}
		
	})
}

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

