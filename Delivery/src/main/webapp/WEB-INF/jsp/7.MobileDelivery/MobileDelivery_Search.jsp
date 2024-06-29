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
<link rel="stylesheet" href="./css/6.MobileDelivery/MD_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/6.MobileDelivery/MD_index.js"></script>
<script src="./js/pageChange.js"></script>
</head>

<body>
       
    <div class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">배송내역</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <div class="table">
                </div>
            </div>
            
        </div>        
    </div>   
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow">
                <a href="Mobile_Main.do">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">배송조회</div>
        </header>        
        <section id="section_date">                                   
            <h3 class="sectionMainTitle">
                <a href="#">
                    반갑습니다 <span class="id"></span> 회원님
                </a>
            </h3>
            <h5 class="sectionSubTitle">
                <a href="#">
<!--                     회원님의 운송장 번호는 <span class="num">2024010845</span> 입니다. -->
                </a>
            </h5>


        </section>
        <footer>
<!--             <button id="Search">배송 조회하기</button> -->
        </footer>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var name = '<%=(String)session.getAttribute("SESSION_MEM_NM")%>';

	$(document).on('ready',function(){
		var width = window.outerWidth;
		
		
		$(".id").text(name);
		Delivery_Search();
		
		$("#Search").on("click",function(){
			Delivery_Search();
		});
		

	    $(document).on("click",".infoCheck",function(){
			Delivery_Search_D($(this).parents(".infoWrap").find(".T_IN_KEY").val());
	    });

	    $(document).on("click",".detail",function(){
			var inkey = $(this).parents(".infoWrap").find(".T_IN_KEY").val();
			var memid = $(this).parents(".infoWrap").find(".T_MEM_ID").val();
			location.href = "Mobile_Delivery_Detail.do?id="+memid+"&ik=" + inkey; 
	    });
	})
	
	function Delivery_Search(){
		var deliverydata = {
				MEM_ID : (uid != 'null') ? uid
						 : uid2
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);
				
                
				$(".infoWrap").remove();
				var wrapString = "";
				
	            
				for(let i=0; i<result.length; i++ ){
					wrapString += ' <div class="infoWrap">';
					wrapString += '		<div class="dateNotice">';
					wrapString += '			<h5 class="subTxt"><a href="#">접수 마감일</a></h5>';
					wrapString += '			<h1 class="dateTxt"><a href="#">'+result[i].ARR_DAY+'</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon indate">';
					wrapString += '     <h5 class="subTxt"><a href="#">송장번호</a></h5>';
					wrapString += '     <h1 class="subTxt"><a href="#">'+result[i].EK+'</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon people">';
					wrapString += '     <h5 class="subTxt"><a href="#">수령인</a></h5>';
					wrapString += '     <h1 class="subTxt"><a href="#">'+result[i].REC_NM+'</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon cost">';
					wrapString += ' 	<h5 class="subTxt"><a href="#">물류예상비용</a></h5>';
					wrapString += ' 	<h1 class="subTxt"><a href="#">$'+result[i].COST+'</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon current">';
					wrapString += '     <h5 class="subTxt"><a href="#">배송현황</a></h5>';
					wrapString += ' 	<h1 class="subTxt hid"><input type="hidden" class="T_MEM_ID" value="'+result[i].MEM_ID+'"><input type="hidden" class="T_IN_KEY" value="'+result[i].IN_KEY+'"><a class="detail" href="#">배송현황확인하기(클릭)</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCheck">배송내역 확인하기</div>';
					
					
					wrapString += ' </div>';
					
					
				}

				$("#section_date").append(wrapString);
				
            }
			
		})	
		
		
	}
	
	function Delivery_Search_D(key){
		
		var deliverydata = {
				MEM_ID : (uid != 'null') ? uid
						 : uid2,
				IN_KEY : key
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_D.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);

				$(".table").empty();
				var tbodyData2 = "";

				for(let i=0; i<result.length; i++ ){
					var number = 0;
					
					tbodyData2 += '<div class="tableCon">';
					tbodyData2 += '<h3 class="date"><a href="#">접수일 : <span class="date">'+result[i].CRE_DAY+'</span></a></h3>';
					tbodyData2 += '<h3 class="con"><a href="#">W*H*L('+result[i].WIDTH+'cm*'+result[i].HEIGHT+'cm*'+result[i].LENGTH+'cm)/무게'+result[i].WEIGHT+'kg</a></h3>';
					tbodyData2 += '</div>';
				}

				$(".table").append(tbodyData2);
				
            }
			
		})	
		
	}
</script>
</html>