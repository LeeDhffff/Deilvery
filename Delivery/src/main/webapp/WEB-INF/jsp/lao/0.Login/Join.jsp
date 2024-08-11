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
    <title>회원가입</title>
</head>

<style type="text/css">
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="../css/common.css">  
<link rel="stylesheet" href="../css/0.Login/style_Join.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>


</head>

<body>
	<div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
	
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">회원 가입</a>
                </h1>
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">회원가입 정보 입력</a>
                    </h3>                   
                    <div class="wrap">
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">아이디<span>*</span></a></h5>
                            <div>
                                <input type="text" id="join_ID" placeholder="아이디를 입력해주세요">
                                <input type="hidden" class="identify" id="join_ID_CHK">
                                <button class="check" id="chk_id">중복확인</button>
                            </div>
                        </div>
                        <div class="double">
                            <div class="inputWrap password">
                                <h5 class="inputName"><a href="#">비밀번호<span>*</span></a></h5>
                                <input type="password" class="join_pwd" id="join_PW" placeholder="비밀번호를 입력해주세요">
                            </div>
                            <div class="inputWrap password">
                                <h5 class="inputName"><a href="#">비밀번호 확인<span>*</span></a></h5>
                                <input type="password" class="join_pwd" id="join_PW_CHK"  placeholder="비밀번호를 다시한번 입력해주세요">
                            </div>
                        </div>                        
                        
                        <hr style="border: 1px solid #e5e5ec; margin: 60px 0;">
                        
                        <h3 class="conMainTitle">
                            <a href="#">회원정보 및 인증하기</a>
                        </h3> 
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">이름<span>*</span></a></h5>
                            <input type="text" id="join_NM" placeholder="이름을 입력해주세요">
                        </div>
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">휴대폰 번호<span>*</span></a></h5>
                                <input type="text" oninput="oninputPhone(this)" maxlength="13" id="join_PHONE" placeholder="휴대폰 번호를 입력해주세요">
                                
                        </div>
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">이메일<span>*</span></a></h5>
                            <div>
                            <input type="text" id="join_EMAIL" placeholder="이메일을 입력해주세요">
                            <button class="check" id="emailcheck">인증하기</button>
                            </div>
                        </div>
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">인증번호<span>*</span><span id="timer"></span></a></h5>
                            <div>
                            <input type="text" id="join_EMAIL_NUM" maxlength="6" placeholder="인증번호를 입력해주세요">
                            <input type="hidden" id="join_EMAIL_NUM_CHK" value="">
                            <button class="check" id="emailcodecheck">인증하기</button>
                            </div>
                        </div>
                        <button class="customerJoin" id="join">회원 가입하기</button>
                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>



<!--     <div class="main_container"> -->
<!--         <div class="main_div"> -->
<!--             <h2>회원가입</h2> -->
<!--             <input type="text" class="identify" id="join_NM" placeholder="이름"> -->
<!--             <input type="text" class="identify" id="join_ID" placeholder="아이디"><button class="chk_id" id="chk_id">중복확인</button> -->
<!--             <input type="hidden" class="identify" id="join_ID_CHK"> -->
<!--             <input type="password" class="identify pw" id="join_PW" placeholder="비밀번호"> -->
<!--             <input type="password" class="identify pw" id="join_PW_CHK" placeholder="비밀번호 확인"> -->
<!--             <div class="text_button_div"> -->
<!--             <select name="chk_phone" class="chk_phone"> -->
<!--             	<option value="KR">+82</option> -->
<!--             	<option value="RS">+856</option> -->
<!--             </select> -->
<!--             <input type="text" class="identify" id="join_PHONE" placeholder="전화번호"> -->
<!--             </div> -->
<!--             <input type="text" class="identify" id="join_EMAIL" placeholder="이메일"><button class="chk_Email" id="chk_Email">인증</button> -->
<!--             <div class="side"> -->
<!--                 <button class="sidebutton" id="join">회원가입</button> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
</body>

<script type="text/javascript">
	$(document).on('ready',function(){

		$("#chk_id").on("click",function(){
			
			if($("#join_ID").val() != '' && $("#join_ID").val().length >= 6){
				$.ajax({
					type: "POST",
					url : "../id_chk.do",
					data: {CHK_ID : $("#join_ID").val()},
					async: false,
		            success: function(datas){
		                if(datas == 'Y'){
		               	   alert("사용할 수 있는 아이디입니다.");
		               	   $("#join_ID_CHK").val($("#join_ID").val());
		                }
		                else{
			               alert("사용할 수 없는 아이디입니다.");
			               $("#join_ID_CHK").val("");
		                }
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
				url : "../Mail.do",
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
							$("#emailcodecheck").prop("disabled",true);
						}
					}, 1000);
					
					

					$("#emailcodecheck").on("click",function(){
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
			if($("#join_ID").val().length < 6){
				alert("아이디를 6자이상 입력해주세요");
				$("#join_ID").focus();
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
			else if($("#join_NM").val() == ''){
				alert("이름을 입력하세요.");
				$("#join_NM").focus();
			}
			else if($("#join_PHONE").val() == ''){
				alert("전화번호를 입력해주세요.");
				$("#join_PHONE").focus();
			}
			else if($("#join_EMAIL_NUM_CHK").val() != 'Y'){
				alert("휴대폰 인증을 진행해주세요.");
				$("#join_EMAIL_NUM").focus();
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
					url : "../Join.do",
					data: joindata,
					async: false,
		            success: function(datas){
		            	location.href="JoinComplete.do?nm=" + encodeURI(encodeURIComponent($("#join_NM").val()));
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