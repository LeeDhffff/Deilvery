$(document).ready(function(){

    $(document).on("click",".infoCheck",function(){
        $('.pop').css({'display':'flex'});
    });

    $(document).on("click",'.cancel', function(){
        $('.pop').hide();
    });

    $(document).on("click",'.popFooter button' ,function(){
        $('.pop').hide();
    });

});