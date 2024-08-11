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
    <title>로그인 페이지</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="../css/common.css">  
<link rel="stylesheet" href="../css/0.Login/style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    
    
</head>

    <div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">로그인</a>
                </h1>
                <div class="conWrap">
                    <h1 class="logo">
                        <a href="#">
                            <img src="../images/pc_icon/logo_color.svg" alt="logo">
                        </a>
                    </h1>
                    <div class="wrap">
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">아이디</a></h5>
                            <input type="text" id="login_ID">
                        </div>
                        <div class="inputWrap password">
                            <h5 class="inputName"><a href="#">비밀번호</a></h5>
                            <input type="password" id="login_PW">
                        </div>
                        <div class="inputWrap check">
                            <input type="checkbox" class="checkBox" id="idsave">
                            <h5 class="inputName"><a href="#" id="idsaveA">아이디 저장</a></h5>
                        </div>
                        <div class="inputWrap login">
                            <button class="login" id="loginbutton">로그인</button>
                        </div>
<!--                         <h5 class="join"><a href="JoinPage.do">회원가입하기</a></h5> -->
                        <hr style="border: 1px solid #e5e5ec; margin: 40px 0;">
                        <div class="inputWrap">
<!--                             <button class="loginSub" id="none_id">비회원으로 입장하기</button> -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
<body>
    
</body>

<script type="text/javascript">


		var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
		var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
		var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
		
		if(uid!="null" || uid2!="null"){ 
			if(level <= 1){
				   location.replace("Main.do");
			}
			else{
				   location.replace("Main_Manager.do");
			}
		}

	$(document).on('ready', function(){
		
		$("#idsaveA").on("click",function(){
			$('#idsave').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
		});
		
		$("#none_id").on('click',function(){
			location.href="LoginPage_B.do";
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
					url : "../Login.do",
					data: logindata,
					async: false,
		            success: function(datas){
		            	
		            	var result = JSON.parse(datas);
		            	
		            	if(result.RESULTMSG == 'ACCESS'){
			         	   location.href = "LoginPage.do";	
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
		

		$("#idpw_find").on("click",function(){
			$("#popup1").show();
			$(".pop_main").show();
			$(".pop_sub").hide();
			$(".pop_sub2").hide();
			$("#foundid").text("");
		})
		
		$("#url_idfind").on("click",function(){
			$(".pop_main").hide();
			$(".pop_sub.main").show();
			$(".pop_sub.result").hide();
			$(".pop_sub2").hide();
			
		})
		$("#url_pwfind").on("click",function(){
			$(".pop_main").hide();
			$(".pop_sub").hide();
			$(".pop_sub2.main").show();
			$(".pop_sub2.result").hide();
			
		})
		
		$("#find_submit").on("click",function(){
			if($("#idfind_NM").val() == ""){
				alert("이름을 입력해주세요.");
			}
			else if($("#idfind_EMAIL").val() == ""){
				alert("이메일을 입력해주세요.");
			}
			else{

				var finddata = {
						MEM_NM : $("#idfind_NM").val(),
						MEM_EMAIL : $("#idfind_EMAIL").val()		
				};
				$.ajax({
					type: "POST",
					url : "../find_id.do",
					data: finddata,
					async: false,
		            success: function(datas){
		            	if(datas == 'FAIL'){
		            		alert("일치하는 정보가 없습니다.");
		            	}
		            	else{
		            		$(".pop_sub.main").hide();
		        			$(".pop_sub.result").show();
		        			$("#foundid").text(datas);
		            	}
		            }
				})
			}
		})
		
		
		$("#findpw_submit").on("click",function(){
			if($("#pwfind_ID").val() == ""){
				alert("아이디를 입력해주세요.");
			}
			else if($("#pwfind_EMAIL").val() == ""){
				alert("이메일을 입력해주세요.");
			}
			else{

				var finddata = {
						MEM_ID : $("#pwfind_ID").val(),
						MEM_EMAIL : $("#pwfind_EMAIL").val()		
				};
				$.ajax({
					type: "POST",
					url : "../find_pw.do",
					data: finddata,
					async: false,
		            success: function(datas){
		            	if(datas == 'FAIL'){
		            		alert("일치하는 정보가 없습니다.");
		            	}
		            	else{
		            		$(".pop_sub2.main").hide();
		        			$(".pop_sub2.result").show();
		        			$("#pwChange_id").val($("#pwfind_ID").val());
		            	}
		            }
				})
			}
		})
		$("#pw_submit").on("click",function(){
			if($("#pwChange_1").val() != $("#pwChange_2").val() && $("#pwChange_1").val() != "" && $("#pwChange_2").val() != "" && $("#pwChange_id").val() != ""){
				alert("패스워드를 확인해주세요.");
			}
			else{

				var finddata = {
						MEM_ID : $("#pwChange_id").val(),
						MEM_PW : $("#pwChange_1").val()		
				};
				$.ajax({
					type: "POST",
					url : "../find_pw_change.do",
					data: finddata,
					async: false,
		            success: function(datas){
						alert(datas);
						$(".findinput").val("");
						$(".pwinput").val("");
						$("#foundid").text("");
						$(".pop_main").show();
						$(".pop_sub").hide();
						$(".pop_sub2").hide();
						$("#popup1").hide();
		            }
				})
			}
		})
		$(".popup_x").on("click",function(){
			$(".findinput").val("");
			$(".pwinput").val("");
			$("#foundid").text("");
			$(".pop_main").show();
			$(".pop_sub").hide();
			$(".pop_sub2").hide();
			$("#popup1").hide();
		})
	})
</script>
</html>