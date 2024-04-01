$(document).ready(function(){

    $('.icon.filter').click(function(){
        $('.pop').css({'display':'flex'});
    });

    $('.cancel').click(function(){
        $('.pop').hide();
    });

    $('.popButton').click(function(){
        $('.pop').hide();
    });

    //tab

    $('.tabCon').click(function(){
        $(this).addClass('on');
        $('.tabCon').not(this).removeClass('on');
    });
});