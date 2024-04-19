<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <jsp:forward page="/egovSampleList.do"/> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="kr">    
    <title>EK Logistics</title>
</head>

<style type="text/css">
	header.first{
		display: flex;
	}
	.first{
		display: block;
	}
	header.second{
		display: flex;
	}
	.second{
		display: none;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/4.MobileLogin/Join_style.css"> 
<link rel="stylesheet" href="./css/4.MobileLogin/Join2_style.css">   
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/5.MobileLogin/MJ_index.js"></script>

</head>

<body>
    <div class="pop">
        <div class="popCon first">
            <div class="popHeader">
                <div class="popTitle">이메일로 전송한 인증번호 6자리를 입력해주세요</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <div class="top">
                    <input type="text" id="join_EMAIL_NUM" maxlength="6" placeholder="">
                    <div class="count" id="timer"></div>
                    <input type="hidden" id="join_EMAIL_NUM_CHK" value="">
                </div>
                <div class="bottom">
                    <h5><a href="#">인증번호가 도착하지 않았다면?</a></h5>
                    <button id="emailcheck">인증번호 다시 받기</button>
                </div>
            </div>
            <div class="popFooter">
                <button id="Next_Join">인증하기</button>
            </div>
        </div>      
        <div class="popCon second">
            <div class="popHeader">
                <div class="popTitle">중복확인</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="../../images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <h3>
                    <a id="chk_id_text" href="#">
                        jaewonlee 아이디는<br> 사용 가능한 아이디입니다.
                    </a>
                </h3>
            </div>
            <div class="popFooter">
                <button>사용하기</button>
            </div>
        </div>   
    </div>
    <div class="m_container">
        <header class="m_header first">
            <h3 class="arrow">
                <a href="Mobile_Login.do">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">회원가입</div>
        </header>        
        <section class="first">
            <h3 class="sectionMainTitle">
                <a href="#">본인 확인을 해주세요</a>
            </h3>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">이름<span>*</span></a></h5>
                <input type="text" id="join_NM" placeholder="이름을 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">휴대폰 번호<span>*</span></a></h5>
                <input type="text" oninput="oninputPhone(this)" maxlength="13" id="join_PHONE"  placeholder="'-'구분없이 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">이메일<span>*</span></a></h5>
                <input type="text" id="join_EMAIL" placeholder="이메일">
            </div>                                           
        </section>
        <footer class="first">
            <button class="numResive" id="P_Number">인증번호 받기</button>
        </footer>
        
        <header class="m_header second" style="display:none;">
            <h3 class="arrow">
                <a id="back" href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">회원가입</div>
        </header>        
        <section class="second">
            <div class="inputWrap id">
                <h5 class="inputName"><a href="#">아이디<span>*</span></a></h5>
                <div>
                    <input type="text" id="join_ID" placeholder="아이디">
                    <input type="hidden" class="identify" id="join_ID_CHK">
                    <button class="check" id="chk_id">중복확인</button>
                </div>
                <p class="alarm">
                    영문 소문자와 숫자만 사용하여, 영문 소문자로 시작하는 4~12자의
                    아이디를 입력해주세요
                </p>
            </div>
            <div class="inputWrap password">
                <h5 class="inputName"><a href="#">비밀번호 번호<span>*</span></a></h5>
                <input type="password" class="join_pwd" id="join_PW" placeholder="비밀번호">
                <input type="password" class="join_pwd" id="join_PW_CHK" placeholder="'비밀번호 확인">
                <p class="alarm">
                    영문 대문자와 소문자, 숫자, 특수문자 중 2가지 이상을 조합하여
                    6~20자로 입력해주세요.
                </p>
            </div>                           
        </section>
        <footer class="second">
            <button class="join" id="join">가입 하기</button>
        </footer>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	$(document).on('ready',function(){
		var width = window.outerWidth;
		
// 		if(width <= 767){

// 		}
// 		else{
// 			location.href = "JoinPage.do";
// 		}
		
		
		$("#back").on("click",function(){
			$(".second").css("display","none");
			$(".first").css("display","block");
			$("header.first").css("display","flex");
		})
		
		$("#Next_Join").on("click",function(){
			$(".first").css("display","none");
			$(".second").css("display","block");
			$("header.second").css("display","flex");
		})
		

		$("#chk_id").on("click",function(){
			
			if($("#join_ID").val() != '' && $("#join_ID").val().length >= 6){
				$.ajax({
					type: "POST",
					url : "./id_chk.do",
					data: {CHK_ID : $("#join_ID").val()},
					async: false,
		            success: function(datas){
		                if(datas == 'Y'){
		                   $("#chk_id_text").text($("#join_ID").val()+" 아이디는\n 사용 가능한 아이디입니다.");
		               	   $("#join_ID_CHK").val($("#join_ID").val());
		                }
		                else{
		                   $("#chk_id_text").text("사용할 수 없는 아이디입니다.");
			               $("#join_ID_CHK").val("");
		                }

		            	$('.pop').css({'display':'flex'});
		            }
					
				})	
			}
			else{
				alert("아이디는 6자 이상 입력해주세요.");
			}
		});
		

		$(".inputWrap.password > .join_pwd").on('change',function(){
			if($("#join_PW").val().length < 6){
				$("#join_PW").css("border","2px solid red");
			}
			else if($("#join_PW").val().length >= 6){
				$("#join_PW").css("border","1px solid black");
			}
			
			if($("#join_PW").val() != '' && $("#join_PW").val() != $("#join_PW_CHK").val()){
				$("#join_PW_CHK").css("border","2px solid red");
			}
			else if($("#join_PW").val() != '' && $("#join_PW").val() == $("#join_PW_CHK").val()){
				$("#join_PW_CHK").css("border","1px solid black");
			}
		});
		
		var mmkey = "";
		$("#emailcheck").on("click",function(){
			
			var maildata = {
				EMAIL : $("#join_EMAIL").val()
			}

			$.ajax({
				type: "POST",
				url : "./Mail.do",
				data: maildata,
				async: false,
	            success: function(datas){
	            	var result = JSON.parse(datas);
	            	mmkey = result.code;
	            	

					$("#emailcodecheck").prop("disabled",false);
					$("#join_EMAIL_NUM").prop("disabled",false);
					var time = 180;
					var timer = setInterval(function() {
						time = time - 1;
						console.log(time,time / 60);
						
						var min = Math.floor(time/ 60);
						var sec = String(time % 60).padStart(2, "0");;
						$("#timer").text(min + ":" + sec);

						if(time < 0){
							mmkey = "";
							clearInterval(timer);
							$("#timer").text("");
						}
					}, 1000);
					
					

					$("#Next_Join").on("click",function(){
						if($("#join_EMAIL_NUM").val() == ""){
							alert("인증번호를 입력해주세요.");
						}
						else if(mmkey == ""){
							alert("이메일 인증버튼을 눌러주세요.");
						}
						else if($("#join_EMAIL_NUM").val().length < 6){
							alert("인증번호는 6자리입니다.")
						}
						else if($("#join_EMAIL_NUM").val() != mmkey){
							alert("인증번호가 일치하지 않습니다. 다시 이메일을 인증해주세요.");
							mmkey = "";
							time = 0;
						}
						else if($("#join_EMAIL_NUM").val() == mmkey){
							alert("인증되었습니다.");
							$("#join_EMAIL_NUM_CHK").val("Y");
							time = 0;
							$("#join_EMAIL").prop("disabled",true);
							$("#emailcheck").prop("disabled",true);
							$("#join_EMAIL_NUM").prop("disabled",true);
						}
					})
	            }
				
			})	
		})

		$("#join").on("click",function(){
			if($("#join_NM").val() == ''){
				alert("이름을 입력하세요.");
				$("#join_NM").focus();
			}
			else if($("#join_PHONE").val() == ''){
				alert("전화번호를 입력해주세요.");
				$("#join_PHONE").focus();
			}
			else if($("#join_ID").val() != $("#join_ID_CHK").val()){
				alert("아이디 중복체크를 해주세요.");
				$("#join_ID").focus();
			}
			else if($("#join_PW").val() == ''){
				alert("패스워드를 입력해주세요.");
				$("#join_PW").focus();
			}
			else if($("#join_PW").val() != $("#join_PW_CHK").val()){
				alert("패스워드가 일치하지 않습니다.");
				$("#join_PW_CHK").focus();
			}
			else if($("#join_EMAIL_NUM_CHK").val() != 'Y'){
				alert("휴대폰 인증을 진행해주세요.");
				$("#join_EMAIL_NUM_CHK").focus();
			}
			else if($("#join_EMAIL").val() == ''){
				alert("이메일을 입력해주세요.");
				$("#join_EMAIL").focus();
			}
			else{
				
				var joindata = {
						MEM_NM : $("#join_NM").val(),
						MEM_ID : $("#join_ID").val(),						
						MEM_PW : $("#join_PW").val(),
						MEM_PHONE : $("#join_PHONE").val(),
						MEM_EMAIL : $("#join_EMAIL").val()
				};
				$.ajax({
					type: "POST",
					url : "./Join.do",
					data: joindata,
					async: false,
		            success: function(datas){
		            	location.href="Mobile_JoinComplete.do?nm=" + encodeURI(encodeURIComponent($("#join_NM").val()));
		            }
					
				})	
				
			}
		
	})
})
	
	
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
}
</script>
</html>