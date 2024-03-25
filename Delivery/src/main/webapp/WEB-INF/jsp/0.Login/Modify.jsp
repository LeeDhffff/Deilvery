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
    <title>회원 정보 수정</title>
</head>

<style type="text/css">

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 
<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/0.Login/style_Join.css">   
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
                    <a href="#">회원 정보</a>
                </h1>
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">회원 정보 수정</a>
                    </h3>                   
                    <div class="wrap">
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">아이디<span>*</span></a></h5>
                            <div>
                                <input type="text" id="join_ID" placeholder="아이디를 입력해주세요" disabled>
                                <input type="hidden" class="identify" id="join_ID_CHK">
<!--                                 <button class="check" id="chk_id">중복확인</button> -->
                            </div>
                        </div>
                        <div class="double">
                            <div class="inputWrap password">
                                <h5 class="inputName"><a href="#">현재 비밀번호<span>*</span></a></h5>
                                <input type="password" class="join_pwd" id="join_PW_ORG" placeholder="현재 비밀번호를 입력해주세요">
                            <input type="hidden" id="join_PW_HIDDEN" value="">
                            </div>
                            <div class="inputWrap password">
                                <h5 class="inputName"><a href="#">변경 비밀번호<span>*</span></a></h5>
                                <input type="password" class="join_pwd" id="join_PW" placeholder="변경비밀번호를 입력해주세요">
                            </div>
                            <div class="inputWrap password">
                                <h5 class="inputName"><a href="#">변경 비밀번호 확인<span>*</span></a></h5>
                                <input type="password" class="join_pwd" id="join_PW_CHK"  placeholder="변경비밀번호를 다시한번 입력해주세요">
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
                            <div>
                                <input type="text" id="join_PHONE" placeholder="휴대폰 번호를 입력해주세요">
                                <button class="check">인증하기</button>
                            </div>
                        </div>
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">인증번호<span>*</span></a></h5>
                            <input type="text" placeholder="인증번호를 입력해주세요">
                            <input type="hidden" id="join_PHONE_NUM_CHK" value="Y">
                        </div>
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">이메일<span>*</span></a></h5>
                            <input type="text" id="join_EMAIL" placeholder="이메일을 입력해주세요">
                        </div>
                        <button class="customerJoin" id="join">정보 수정하기</button>
                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	var chk_mods = window.location.search.replaceAll("?id=","").split("&level=");
	
	
	$(document).on('ready',function(){
			var modidata = {};
		
		if(chk_mods != null && chk_mods != ""){

			modidata = {MEM_ID : chk_mods[0], MEM_LEVEL : chk_mods[1]};
		}
		else{
			modidata = {MEM_ID : uid, MEM_LEVEL : level};
		}
		console.log(chk_mods, modidata);
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
			else if($("#join_PW_ORG").val() == ''){
				alert("현재 비밀번호를 입력해주세요.");
				$("#join_PW_ORG").focus();
			}
			else if($("#join_PW_HIDDEN").val() != 'Y'){
				alert("현재 비밀번호가 틀렸습니다.");
				$("#join_PW_ORG").focus();
			}
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
		            	location.href="MemberListPage.do"
		            }
					
				})	
				
			}
			
		})
	})
</script>
</html>