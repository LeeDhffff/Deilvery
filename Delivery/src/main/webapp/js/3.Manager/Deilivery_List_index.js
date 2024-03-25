$(function(){

// qrcode 
$('.qrHeader > .icon.cancelqr').click(function(){
    $('.qrWrap').css({'display':'none'});
});

$('button.qr').click(function(){
    $('.qrWrap').css({'display':'flex'});
});

// 배송내역확인
$('.historyHeader > .icon.cancelhistory').click(function(){
    $('.history').css({'display':'none'});
});

$('.historyCheck').click(function(){
    $('.history').css({'display':'flex'});
});

// 배송현황 누르면 현황나오게끔 하는것 
$('.currentClickOne').click(function(){
    $('.currentWrap').css({'display':'none'});
    $('.currentWrap.one').css({'display':'block'});
});

$('.currentClickTwo').click(function(){
    $('.currentWrap').css({'display':'none'});
    $('.currentWrap.two').css({'display':'block'});
});


});