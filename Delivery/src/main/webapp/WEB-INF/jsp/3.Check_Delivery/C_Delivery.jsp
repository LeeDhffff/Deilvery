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
    <title>배송확인</title>
</head>

<jsp:include page="../common.jsp"></jsp:include>
<style type="text/css">
	
    body{
        width: 100%;
        height: 100%;
    }
    button{
        cursor:pointer;
    }
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
    <div class="main_container">
        <div class="main_div">
            <div class="main_test">
            	<h2 class="Member_name"></h2>
            	<h3 class="title">배송신청하기</h3>
            	<h4>수령인</h4><input type="text" class="Deli_input" id="Deli_Name">
            	<h4>휴대폰</h4><input type="text" class="Deli_input" id="Deli_Phone">
            	<h4>픽업지</h4>
            	<select type="text" id="Deli_Name">
            		<option value="Company">본사</option>
            		<option value="Hau">하우창고</option>
            	</select>
            	<h4>수령주소</h4><input type="text" class="Deli_input" id="Deli_Address">
            	<input type="text" class="Deli_Message" id="Deli_Message">
            	<input type="text" class="Deli_Message" id="Deli_Message2">
            	<input type="text" class="Deli_Message" id="Deli_Message3">
            	
            	<button class="Delvery_Go">배송신청하기</button>
            </div>
            
        </div>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	if(uid=="null" && level != 1){ 
	   location.replace("Main.do");
	}
 
	console.log(level);
 
	$(document).on('ready',function(){
		
		if(uid != "null"){ 
			   if(level == '1'){
				   var memberdata = {
						   MEM_ID : uid,
						   MEM_LEVEL : level
				   }
				   $.ajax({
						type: "POST",
						url : "./Delivery_Mem_Info.do",
						data: memberdata,
						async: false,
			            success: function(datas){
			            	var result = JSON.parse(datas);
			            	
			            	$(".Member_name").text(result.NAME);
			            	$("#Deli_Name").val(result.NAME);
			            	$("#Deli_Phone").val(result.PHONE);
			            	
			            }
						
					})	
			   }
			}
		
	})
</script>
</html>