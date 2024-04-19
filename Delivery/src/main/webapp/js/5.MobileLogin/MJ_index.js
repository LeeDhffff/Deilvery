$(document).ready(function(){

    $('.numResive').click(function(){
		if($('#join_NM').val().length <= 0){
			alert("이름을 입력해주세요.");
		}
		else if($('#join_PHONE').val().length <= 0){
			alert("전화번호를 입력해주세요.");
		}
		else if($('#join_EMAIL').val().length <= 0){
			alert("이메일을 입력해주세요.");
		}
		else{
			if($("#join_EMAIL_NUM_CHK").val() == ""){
	        	$('.pop').css({'display':'flex'});
				$("#emailcheck").trigger("click");
			}
			else{
				$(".first").css("display","none");
				$(".second").css("display","block");
				$("header.second").css("display","flex");
			}
		}
    });


    $('.cancel').click(function(){
        $('.pop').hide();
    });

    $('.popFooter button').click(function(){
        $('.pop').hide();
    });


});