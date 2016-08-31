

function board_modi(){
	$('.joinForm').html("<h1>Modify</h1>");
	$('.joinForm').append("<span id='img_tag'><a href='javascript:pop_hide()'><img src='/resources/Image/ic_clear.png'></a></span>");
	$('.joinForm').append("<hr>");
//	 modify from who writing something
	$.ajax({
		url : 'b_modi',
		data:{
			'mem_ref' : $('#scope_idx').val(),
			'idx' : $('#idx').val()
		}
	}).done(function(data){
		
		if(data == 'false')
			$('.joinForm').append('<label>잘못된 접근입니다.</label>');		
		else{
//			$.each(data,function(key, val) {
//				alert(val.key);
//	        });
			data = eval("("+data+")");
			$('.joinForm').append('<textarea rows="1" cols="60" id="b_modiTitle">'+data.title+'</textarea>');
			$('.joinForm').append('<textarea rows="8" cols="60" id="b_modiContent">'+data.content+'</textarea>');
			$('.joinForm').append('<span id="img_tag"><a href="javascript:b_modiView('+ $('#idx').val() +')"><img src="/resources/Image/ic_done.png"></a></span>');
		}
	});
}


function b_modiView(i){
	
	$.ajax({
		url: 'b_modiView',
		data:{
			'idx' : i,
			'title' : $('#b_modiTitle').val(),
			'content' : $('#b_modiContent').val()
		}	
	}).done(function(){
		location.reload();
//		popup_hide;
	});
}


function board_del(){
	$('.joinForm').html('<h1>Delete</h1>');
	$('.joinForm').append('<span id="img_tag"><a href="javascript:pop_hide()"><img src="/resources/Image/ic_clear.png"></a></span>');
	$('.joinForm').append('<hr>');	
	$.ajax({
		url : 'b_del',
		data:{
			'mem_ref' : $('#scope_idx').val(),
			'idx' : $('#idx').val()
		}
	}).done(function(data){
		if(data == 'false')
			$('.joinForm').append('<label>잘못된 접근입니다.</label>');		
		else{
			$('.joinForm').append('<label>삭제하겠습니까?</label>');
			$('.joinForm').append('<br><br><br>');
			$('.joinForm').append('<label class="findthing"><a href="javascript:b_del('+ $('#idx').val() +')"><img src="/resources/Image/ic_done_2x.png"></a></label>');
			$('.joinForm').append('<label class="findthing"><a href="javascript:pop_hide()"><img src="/resources/Image/ic_clear_2x.png"></a></label>');
		}	
	})
}
function b_del(i){
	$.ajax({
		url: 'b_delOk',
		data :{
			'idx' : i
		}
	}).done(function(data){
		$(location).attr('href','board');
	});
}


function comments(){
	
	$.ajax({
		url: '/b_comment',
		data :
		{
			'b_ref' : 	$('#idx').val(),
			'mem_ref' : $('#scope_idx').val(),
			'content' : $('.comment_W input[name="content"]').val()
		}
	}).done(function(data){		
		var url = data;    
		$(location).attr('href',url);
	});	
}

function comment_del(i){
	$.ajax({
		url : '/c_del',
		data:{
			'idx' : i,
			'mem_ref' : $('#scope_idx').val()
		}
	}).done(function(data){
		$('.joinForm').html('<h1>Delete</h1>');
		$('.joinForm').append('<span id="img_tag"><a href="javascript:pop_hide()"><img src="/resources/Image/ic_clear.png"></a></span>');
		$('.joinForm').append('<hr>');	
		if(data == 'true'){
			$('.joinForm').append('<label>처리중.......</label>');			
			location.reload();
		}
		else{
			$('.joinForm').append('<label>잘못된 접근입니다.</label>');
		}
			
	})
}

