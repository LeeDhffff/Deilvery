$(function(){

// qrcode 
$('.qrHeader > .icon.cancelqr').click(function(){
    $('.qrWrap').css({'display':'none'});
});

$('button.qr').click(function(){
    $('.qrWrap').css({'display':'flex'});
});

// 배송내역확인
$(document).on("click",'.historyHeader > .icon.cancelhistory', function(){
    $('.history').css({'display':'none'});
});

$(document).on("click",'.historyCheck',function(){
    $('.history').css({'display':'flex'});
});

// 배송현황 누르면 현황나오게끔 하는것 
$(document).on("click",'.currentClickOne',function(){
    $('.currentWrap').css({'display':'none'});
    $('.currentWrap.one').css({'display':'block'});
});

$(document).on("click",'.currentClickTwo', function(){
    $('.currentWrap').css({'display':'none'});
    $('.currentWrap.two').css({'display':'block'});
});


});