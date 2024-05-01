$(document).ready(function(){

    $('.icon.filter').click(function(){
        $('#pop1').css({'display':'flex'});
    });

    $('.cancel').click(function(){
        $('.pop').hide();
    });

    $('.popButton').click(function(){
        $('.pop').hide();
    });

    //tab

    $('.tabCon').click(function(){
		if($(this).hasClass('on') == false){
		    $(this).addClass('on');
	        //$('.tabCon').not(this).removeClass('on');	
		}
		else{
			$(this).removeClass('on');
	        //$('.tabCon').not(this).removeClass('on');	
		}
    });
});