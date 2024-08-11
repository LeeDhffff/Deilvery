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
<script src="./js/pageChange.js"></script>

</head>

<body>
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow">
                <a href="Mobile_Login.do">
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
                <input type="text" id="join_NM" placeholder="이름을 입력해주세요">
            </div>
            <div class="inputWrap">
                <input type="text" oninput="oninputPhone(this)" maxlength="13" id="join_PHONE" placeholder="전화번호를 입력해주세요">
            </div>
            <div class="inputWrap">
                <input type="text" id="join_EMAIL" placeholder="이메일을 입력해주세요">
            </div>
            <button class="login" id="B_Login">로그인</button>

            <div class="joinWrap">
                <h5><a href="#">아직도 회원이 아닌가요?</a></h5> 
                <h5><a href="JoinPage.do">회원가입하기</a></h5>
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
		
		$(document).on('ready', function(){

			var width = window.outerWidth;
			
			$("#none_id").on('click',function(){
				location.href="Mobile_Login_B.do";
			});
			
			$("#B_Login").on("click",function(){
				
				if($("#join_NM").val() == ''){
					alert("이름을 입력하세요.");
					$("#join_NM").focus();
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
							MEM_PHONE : $("#join_PHONE").val(),
							MEM_EMAIL : $("#join_EMAIL").val()
					};
					$.ajax({
						type: "POST",
						url : "./Login_B.do",
						data: joindata,
						async: false,
			            success: function(datas){
			            	var result = JSON.parse(datas);
			            	
			            	if(result.RESULTMSG == 'ACCESS'){
				            	alert("비회원으로 로그인되었습니다. 환영합니다." + result.NAME + "님.");	
				            	location.href="Mobile_Main.do";
			            	}
			            	else {
				            	alert("비회원으로 접근실패하였습니다.");	
			            	}
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