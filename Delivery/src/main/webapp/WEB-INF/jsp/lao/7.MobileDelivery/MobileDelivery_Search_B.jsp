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

<link rel="stylesheet" href="../css/Mobile/common.css">  
<link rel="stylesheet" href="../css/6.MobileDelivery/MDB_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="../js/pageChange.js"></script>
</head>

<body>
      <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="../images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">배송조회</div>
        </header>        
        <section>
                                   
            
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">수령인<span>*</span></a></h5>
                <input type="text" id="B_NM" placeholder="라오스 수령인 성함을 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">수령인 전화 번호<span>*</span></a></h5>
                <input type="text" id="B_PHONE" oninput="oninputPhone(this)" maxlength="13" placeholder="라오스 수령인 전화번호를 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">출항예정일<span>*</span></a></h5>
                <input type="text" id="B_OUT_DAY" placeholder="출항예정일을 입력해주세요">
            </div>
                                     
        </section>
        <footer>
            <button id="Search">배송 조회하기</button>
        </footer>
    </div> 
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	$(document).on('ready',function(){
		var width = window.outerWidth;
		
		
		$(".back").on("click",function(){
			history.back();
		})
		$('#B_OUT_DAY').datepicker(
				{
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
				    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
				    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
					dateFormat : 'yy-mm-dd',
				});
// 		$('#B_OUT_DAY').datepicker('setDate','today');
		
		$("#Search").on("click",function(){
			var BHW = {
					MEM_NM : $("#B_NM").val(),
					MEM_PHONE : $("#B_PHONE").val(),
			}

			$.ajax({
				type: "POST",
				url : "../Delivery_Select_B_CHK.do",
				data: BHW,
				async: false,
	            success: function(datas){
	            	console.log(datas);
	            	if(datas == 'Y'){
	            		location.href= "Mobile_Delivery_Search_B_CHK.do?nm=" + encodeURI(encodeURIComponent($("#B_NM").val())) + "&ph=" + $("#B_PHONE").val()+ "&od=" + $("#B_OUT_DAY").val();
	            	}
	            	else{
	            		alert("해당 정보로 신청한 배송정보가 없습니다.")
	            	}
	            }
			})
		})
		
	})
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
</html>