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
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/4.MobileLogin/Login_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
</head>

<body>
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">로그인</div>
        </header>        
        <section>
            <h1 class="logo">
                <a href="logo">
                    <img src="./images/m_icon/logo_color.svg" alt="logo">
                </a>
            </h1>
            
            <div class="inputWrap">
                <input type="text" id="login_ID" placeholder="아이디를 입력해주세요">
            </div>
            <div class="inputWrap">
                <input type="password" id="login_PW" placeholder="비밀번호를 입력해주세요">
            </div>
            <div class="inputWrap check">
                <input type="checkbox" id="idsave">
                <h5><a href="#" id="idsaveA">자동 로그인</a></h5>
            </div>
            <button class="login" id="loginbutton">로그인</button>
            <button class="uncustomer" id="none_id">비회원으로 입장하기</button>

            <div class="joinWrap">
                <h5><a href="#">아직도 회원이 아닌가요?</a></h5> 
                <h5><a href="Mobile_Join.do">회원가입하기</a></h5>
            </div>
            
        </section>
    </div>
</body>

<script type="text/javascript">


		var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
		var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
		var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
		
		if(uid!="null" || uid2!="null"){ 
			if(level <= 1){
				   location.replace("Mobile_Main.do");
			}
			else{
				   location.replace("Mobile_ManagerMain.do");
			}
		}

		$("#idsaveA").on("click",function(){
			$('#idsave').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
		});
		
		$(".back").on("click",function(){
			history.back();
		})
		$(document).on('ready', function(){

			var width = window.outerWidth;
			
// 			if(width > 767){
// 				location.replace("LoginPage.do");
// 			}
		
			$("#none_id").on('click',function(){
				location.href="Mobile_Login_B.do";
			});
			
			
			$("#loginbutton").on("click",function(){
			
				if($("#login_ID").val() == ''){
					alert("아이디를 입력해주세요.");
					$("#login_ID").focus();
				}
				else if($("#login_PW").val() == ''){
					alert("패스워드를 입력해주세요.");
					$("#login_PW").focus();
				}
				else{
					
					var logindata = {
							MEM_ID : $("#login_ID").val(),
							MEM_PW : $("#login_PW").val(),
							CHK : ($("#idsave").prop("checked") == true) ? "Y"
									: "N"
					};
					$.ajax({
						type: "POST",
						url : "./Login.do",
						data: logindata,
						async: false,
			            success: function(datas){
			            	
			            	var result = JSON.parse(datas);
			            	
			            	if(result.RESULTMSG == 'ACCESS'){
				         	   location.href = "Mobile_Main.do";	
			            	}
			            	else if(result.RESULTMSG == 'ID_ERROR'){
				         	  	alert("등록되지 않은 ID입니다.");	
			            	}
			            	else if(result.RESULTMSG == 'PW_ERROR'){
				         	  	alert("비밀번호가 틀렸습니다.");	
			            	}
			            }
						
					})	
					
				}
		});
		
	})
</script>
</html>