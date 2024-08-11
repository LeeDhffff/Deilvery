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
    <title>메인페이지</title>
</head>
<style>
	#to_mobile{
		margin-right:10px;
	}

</style>
<jsp:include page="Loading.jsp"></jsp:include>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="../js/pageChange.js"></script>

</head>

<body>
	<header id="normal">
        <h1 class="logo">
            <a href="Main.do">
                <img src="../images/pc_icon/logo_color.svg" alt="logo">
            </a>
        </h1>
        <ul class="menu">
            <li>
                <a class="Delivery" href="#">배송신청</a>
            </li>
            <li>
                <a class="Delivery_Search" href="#">배송조회</a>
            </li>
        </ul>
        <ul class="header_option">
<!--         	<li id="to_mobile"><a href="#">모바일로 보기</a></li> -->
            <li id="id_status"><a href="LoginPage.do">로그인</a></li>
            <li class="language">
                <a href="#">
                    <span class="icon">
                        <img src="../images/pc_icon/global.svg" alt="language">
                    </span>
                    <select name="language" id="language">
                        <option value="kor">KOR</option>
                        <option value="lao" selected>LAO</option>
                    </select>
                </a>
            </li>
        </ul>
    </header>
<!--     <div class="main_container"> -->
<!--         <div class="main_div" id="common_div"> -->
<!--             <button class="logout">로그아웃</button> -->
<!--             <button class="Modify">회원정보 수정</button> -->
<!--         </div> -->
<!--     </div> -->
</body>

<script type="text/javascript">


	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	

	
	$(document).on('ready',function(){
		if(uid == 'null' && uid2== 'null'){
			$.ajax({
				type: "POST",
				url : "../AutoLogin.do",
				data: {},
				async: false,
		        success: function(datas){
				   var result = JSON.parse(datas);

		           if(result.MSG == 'Y'){
			     	   location.reload();   
		           }
		           else{
// 		        	   console.log("아님");
		           }
		        }
				
			})	
		}
		


		if(uid=="null" && uid2=="null"){ 
		}
		else{

			$("#id_status").html('<a href="#" class="logout">로그아웃</a>')
			if(level >= 2){
				var auth = [];
				$.ajax({
					type: "POST",
					url : "../Authority_Select.do",
					data: {MEM_ID : uid},
					async: false,
			        success: function(datas){
			        	var result = JSON.parse(datas);
			        	
			        	for(let i=0; i<result.length; i++){
			        		if(result[i].AUTH == 'D' || (result[i].PAGE == 'adminDeliveryRegistMain' && result[i].AUTH == 'R')){
					        	auth.push(result[i].PAGE);
			        		}
			        	}
			        }
				})
				var menubar = "";
				
				if(auth.indexOf('adminDeliveryRegistMain') < 0){
					menubar += "<li>";
					menubar += "	<a class='Delivery' href='#'>물류 접수</a>";
					menubar += "</li>";
				}
				if(auth.indexOf('M_Delivery_NC_List') < 0){
				menubar += "<li>";
				menubar += "	<a class='nc_delivery' href='#'>미완료 배송신청</a>";
				menubar += "</li>";
				}
				if(auth.indexOf('M_DeliveryList') < 0){
				menubar += "<li>";
				menubar += '    <a class="Delivery_Search" href="#">배송조회</a>';
				menubar += "</li>";
				}
				if(auth.indexOf('Outday_List') < 0){
				menubar += "<li>";
				menubar += '    <a class="Outday_Search" href="#">마감일 생성</a>';
				menubar += "</li>";
				}
				if(auth.indexOf('DeliveryCompanyList') < 0){
				menubar += "<li>";
				menubar += '    <a href="DeliveryCompanyList.do">택배사 관리</a>';
				menubar += "</li>";
				}
				if(auth.indexOf('MemberListPage') < 0){
				menubar += "<li>";
				menubar += '    <a href="MemberListPage.do">고객관리</a>';
				menubar += "</li>";
				}
				if(auth.indexOf('AuthorityPage') < 0){
				menubar += "<li>";
				menubar += '    <a href="AuthorityPage.do">권한관리</a>';
				menubar += "</li>";
				}
				$(".menu").html(menubar);
					  	
			}
		}
		

		$(".logout").on("click",function(){

				$.ajax({
					type: "POST",
					url : "../Logout.do",
					data: {},
					async: false,
		            success: function(datas){
// 		            	alert(datas);

		         	   location.href = "Main.do";
		            }
					
				})	
		})
		
		$(document).on("click",".Delivery",function(){
			if(uid=="null" && uid2=="null"){ 
			   alert("로그인이 필요한 서비스입니다.")
			}
			else if(uid != "null" && level == '2'){
				
		      	   location.href = "adminDeliveryRegistMain.do";
			}
			else if(level < '2'){
				
		      	   location.href = "userDeliveryRegistMain.do";
		      	   
			}
		})
		$(".Modify").on("click",function(){

         	   location.href = "MemberModifyPage.do";
		})
		$(".nc_delivery").on("click",function(){

         	   location.href = "M_Delivery_NC_List.do";
		})
		$(".Delivery_Search").on("click",function(){
			if(uid != "null"){
				if(level == 1){
					location.href="Delivery_Search.do";
				}
				else if(level == 2){
					location.href="M_DeliveryList.do";
				}
				
			}
			else if(uid2 != "null"){
				location.href="Delivery_Search_B.do";
			}
			else if(uid2 == "null"){
// 				alert("로그인이 필요한 서비스입니다.")
				location.href="Delivery_Search_B.do";
			}
		})
		$(".Outday_Search").on("click",function(){

      	   location.href = "Outday_List.do";
		})
		
		
		$("#to_mobile").on("click",function(){

         	   location.href = "Mobile_Main.do";
		})
	})
</script>
</html>