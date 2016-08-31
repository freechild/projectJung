//align
jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}

function pop_hide(){
	$('.joinForm').empty();
	$('.joinForm').hide();
	$('#overlay').hide();
}

function showPopup(obj){
	$("#overlay").show("slow");
	$("#overlay").fadeTo(100, .3);
	$('.joinForm').show();
	$('.joinForm').center();
	if(obj == 'f_btn')
		loginForm("Welcome Passenger");
	else if(obj =='b_modi') 
		board_modi();
	else if(obj =='b_del') 
		board_del();
	else if(obj =='updateP')
		updateForm();
	else if(obj =='friendsP')
		friendsForm();
	else
		comment_del(obj);
}

