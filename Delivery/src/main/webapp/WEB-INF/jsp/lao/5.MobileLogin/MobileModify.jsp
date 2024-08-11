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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<!-- <script src="./js/5.MobileLogin/MJ_index.js"></script> -->
<script src="./js/pageChange.js"></script>

</head>

<body>
    <div class="pop">
        <div class="popCon first">
            <div class="popHeader">
                <div class="popTitle">인증번호 4자리를 입력해주세요</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <div class="top">
                    <input type="text" placeholder="">
                    <div class="count"></div>
                </div>
                <div class="bottom">
                    <h5><a href="#">인증번호가 도착하지 않았다면?</a></h5>
                    <button>인증번호 다시 받기</button>
                    <input type="hidden" id="join_PHONE_NUM_CHK" value="Y">
                </div>
            </div>
            <div class="popFooter">
                <button id="">인증하기</button>
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
                         아이디는<br> 사용 가능한 아이디입니다.
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
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">회원정보 수정</div>
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
        </section>
        <footer class="first">
            <button class="numResive" id="Next_Join">다음</button>
        </footer>
        
        <header class="m_header second" style="display:none;">
            <h3 class="arrow">
                <a id="back" href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">회원정보 수정</div>
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
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">이메일<span>*</span></a></h5>
                <input type="text" id="join_EMAIL" placeholder="이메일">
            </div>                                  
        </section>
        <footer class="second">
            <button class="join" id="join">회원정보 수정하기</button>
        </footer>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	var chk_mods = window.location.search.replaceAll("?id=","").split("&level=");
	
	$(document).on('ready',function(){
		

		$(".back").on("click",function(){
			history.back();
		})
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
		var modidata = {};
		
		if(chk_mods != null && chk_mods != ""){

			modidata = {MEM_ID : chk_mods[0], MEM_LEVEL : chk_mods[1]};
		}
		else{
			modidata = {MEM_ID : uid, MEM_LEVEL : level};
		}

		$.ajax({
			type: "POST",
			url : "./Delivery_Mem_Info.do",
			data: modidata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);
				
				$("#join_NM").val(result.NAME);
				$("#join_ID").val(result.MEM_ID);
				var phone = "";
				if(result.PHONE.indexOf("KR")>=0){
					$(".chk_phone").val("KR");
					phone = result.PHONE.replaceAll("KR_","");
				}
				else if(result.PHONE.indexOf("RS")>=0){
					$(".chk_phone").val("RS");
					phone = result.PHONE.replaceAll("RS_","");
				}
				else{
					$(".chk_phone").val("RS");
					phone = result.PHONE;
				}
				$("#join_PHONE").val(phone);
				$("#join_EMAIL").val(result.EMAIL);
				
            }
			
		})	
	
		$("#join_PW_ORG").on('change',function(){
			
			var memdata ={
					MEM_ID : $("#join_ID").val(),
					MEM_PW : $("#join_PW_ORG").val(),
			}
			$.ajax({
				type: "POST",
				url : "./Mem_Pw_Chk.do",
				data: memdata,
				async: false,
	            success: function(datas){
	          		console.log(datas);
	            	if(datas == 'Y'){
	            		$("#join_PW_HIDDEN").val("Y");
	            	}
	            	else{
	            		$("#join_PW_HIDDEN").val("");
	            	}
	            }
			})
		})
		
		$(".identify.pw").on('change',function(){
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
		
		
		$("#join").on("click",function(){
			if($("#join_NM").val() == ''){
				alert("이름을 입력하세요.");
				$("#join_NM").focus();
			}
			else if($("#join_ID").val().length < 6){
				alert("아이디를 6자이상 입력해주세요");
				$("#join_ID").focus();
			}
// 			else if($("#join_PW_ORG").val() == ''){
// 				alert("현재 비밀번호를 입력해주세요.");
// 				$("#join_PW_ORG").focus();
// 			}
// 			else if($("#join_PW_HIDDEN").val() != 'Y'){
// 				alert("현재 비밀번호가 틀렸습니다.");
// 				$("#join_PW_ORG").focus();
// 			}
			else if($("#join_PW").val() != '' && $("#join_PW_CHK").val() != $("#join_PW").val()){
				alert("변경할 패스워드가  일치하지 않습니다.");
				$("#join_PW_CHK").focus();
			}
			else if($("#join_PW").val() == '' && $("#join_PW_CHK").val() != $("#join_PW").val()){
				alert("변경할 패스워드가  일치하지 않습니다.");
				$("#join_PW").focus();
			}
			else if($("#join_PHONE").val() == ''){
				alert("전화번호를 입력해주세요.");
				$("#join_PHONE").focus();
			}
			else if($("#join_EMAIL").val() == ''){
				alert("이메일을 입력해주세요.");
				$("#join_EMAIL").focus();
			}
			else{
				
				var joindata = {
						MEM_NM : $("#join_NM").val(),
						MEM_ID : $("#join_ID").val(),						
						MEM_PW : ($("#join_PW").val() == '') ? $("#join_PW_ORG").val()
								 : $("#join_PW").val(),
						MEM_PHONE : $("#join_PHONE").val(),
						MEM_EMAIL : $("#join_EMAIL").val(),
						MEM_ID2 : uid,		
						MEM_LEVEL : level
				};
				$.ajax({
					type: "POST",
					url : "./Member_Modify.do",
					data: joindata,
					async: false,
		            success: function(datas){
		            	alert(datas);
		            	location.href="Mobile_M_MemberList.do"
		            }
					
				})	
				
			}
			
		})
	})
	
	
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
}
</script>
</html>