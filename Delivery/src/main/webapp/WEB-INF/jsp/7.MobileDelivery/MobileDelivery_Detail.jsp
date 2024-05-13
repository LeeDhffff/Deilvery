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

:root 
{
    --main-color: #E88100;
    --sub-color: #006EBD;
    --background-gray:#F1F1F1;
    --color-dark: #222;
    --color-white: #fff;
    --input-color: #E5E5EC;    
    --table-head: #F7F7FB;
}
.tableWrap{
	width: 100%;
}
table 
{
    width: 100%;
    border: 0;
    box-sizing: border-box;
    margin-bottom: 40px;
}

table thead 
{
    height: 50px;
    background-color: var(--table-head);
    color: #222;
    font-weight: 500;
}

table tbody 
{
    background-color: #fff;
    text-align: center;
}

table tbody tr td 
{
    height: 100px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/6.MobileDelivery/MDD_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/6.MobileDelivery/MDD_index.js"></script>
<script src="./js/pageChange.js"></script>

</head>

<body>
       
    <div class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">배송정보</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody qrBody">
                <div class="tableWrap">
                    <table id="Delivery_Information_Table">
                        <thead>
                            <tr>
                                <th>접수번호</th>
                                <th>박스수량</th>
                                <th>출항일</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>        
    </div>     
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">배송조회</div>
        </header>        
        <section>
            <h3 class="sectionMainTitle">
                <a href="#">
                    배송 현황
                </a>
                <div class="qr">배송정보</div>
            </h3>
            <input type="hidden" id="memid" value="${memid}">
            <input type="hidden" id="inkey" value="${inkey}">
            <div class="stepWrap">
                <div class="stepCon on">
                    <h5 class="stepTxt"><a href="#">한국물류창고</a></h5>
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <h5 class="stepCurrent"><a href="#"></a></h5>
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">출항시작(미정)</a></h5>
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <h5 class="stepCurrent"><a href="#"></a></h5>
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">태국도착</a></h5>
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <h5 class="stepCurrent"><a href="#"></a></h5>
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">라오스출발</a></h5>
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <h5 class="stepCurrent"><a href="#"></a></h5>
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">라오스도착</a></h5>
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <h5 class="stepCurrent"><a href="#"></a></h5>
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">배출시작</a></h5>
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <h5 class="stepCurrent"><a href="#"></a></h5>
                </div>
            </div>    
        </section>
    </div>
</body>

<script type="text/javascript">

<%-- 	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>'; --%>
<%-- 	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>'; --%>
<%-- 	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>'; --%>

	$(document).on('ready',function(){
		var width = window.outerWidth;
		
		
		$(".back").on("click",function(){
			history.back();
		})
		
		Delivery_Search_O($("#memid").val(),$("#inkey").val());
		Delivery_Search_D($("#inkey").val());
	})
	
	function Delivery_Search_D(key){

		var deliverydata = {
				MEM_ID : "",
				IN_KEY : key
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_D.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);


				$("#Delivery_Information_Table > tbody").empty();
				var tbodyData3 = "";

				tbodyData3 += "<tr>";
				tbodyData3 += "<td>"+(result[0].SJ_KEY).split("-")[0]+"</td>";
				tbodyData3 += "<td>"+result.length+"</td>";
				tbodyData3 += "<td>"+result[0].ARR_DAY+"</td>";
				tbodyData3 += "</tr>";
				
				$("#Delivery_Information_Table > tbody").append(tbodyData3);	
				
            }
			
		})	
	}
	
	function Delivery_Search_O(uid,key){

		var deliverydata = {
				MEM_ID : uid,
				IN_KEY : key
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_O.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);

				var tbodyData2 = "";
				$(".stepCon").removeClass("on");
				$(".stepDate > a").text("미정");

				if(result[0].SJ_KEY != null){
					var sj = result[0].SJ_KEY.split("-");
					var sjkey = sj[0] + '-' + sj[1] + '-' + sj[2] + '-' + sj[3];
					$("#qr_number").text(sjkey);
				}
				else{
					$("#qr_number").text("미접수");
				}
				
				$("#qr_box").text(result[0].CNTBOX);
				$("#qr_outday").text(result[0].ARR_DAY);
				
				for(let i=0; i<result.length; i++ ){
					$($(".stepCon")[i]).find(".stepDate > a").text(result[i].OUT_TXT);
					$($(".stepCon")[i]).find(".stepCurrent > a").text(result[i].OUT_TXT_SUB);
					
					if(result.length -1  == i){
						$($(".stepCon")[i]).addClass("on");
					}
				}
				
            }
			
		})	
	}
</script>
</html>