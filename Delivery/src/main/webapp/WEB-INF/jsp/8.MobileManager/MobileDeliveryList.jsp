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
	header.first{
		display: flex;
	}
	.first{
		display: block;
	}
	header.second{
		display: flex;
	}
	.second{
		display: none;
	}
	header.third{
		display: flex;
	}
	.third{
		display: none;
	}
	.ton{
		background: #e1e1e1;
	}
	
	.link{
		background: white;
		width:40px;
		height:30px;
		border: 1px solid #ffaa40;
	    padding: 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	
	.link > img{
		height: 23px;
	}
.totalh4{
	display:flex;
/* 	margin-right:100px; */
	float:left;
    width: 77%;
}
.totalh4 > h4{
	margin-left:10px;
	margin-right:10px;
/*     font-size: 20px; */
    width: 130px;
    
}
.totalh4 > h4 > span{
	color: red;
}

.outdays_div{
	position: relative;
}
.outdayBox{
	position:absolute;
	width: 100%;
	height: 150px;
	background:white;
	border: 1px solid black;
 	display:none; 
	z-index: 1;
    overflow-y: scroll;
    padding: 0px !important;
}
.outdayTitle{
	width: 100%;
	text-align:center;
	color: white;
    background: var(--main-color);
    height: 25px;
    line-height: 25px;
}
.outdays{
	width: 95%;
	text-align:center;
	height: 25px;
	line-height: 25px;
}
.outdays:hover{
	background:#ffe4c4;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/8.MobileManager/MobileDeliveryList_style.css">    
<link rel="stylesheet" href="./css/8.MobileManager/MobileDeliveryList_Filter_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/pageChange.js"></script>

</head>

<body>
        
    <div class="m_container first">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">배송조회</div>
        </header>        
        <section>
            <h3 class="sectionMainTitle"><a href="#">배송조회 필터</a></h3>                       
            <div class="inputWrap outdays_div">
                <h5 class="inputName"><a href="#">출항일<span>*</span></a></h5>
                <input type="text" class="Search days" id="S_Out_Day" autocomplete="off" placeholder="출항일을 입력해주세요">
            	<div class="outdayBox">
<!--                 	<div class="outdayTitle">출항일 선택하기</div> -->
                </div>
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">수령인<span>*</span></a></h5>
                <input type="text" id="S_Rec_Nm" autocomplete="off"  placeholder="수령인 성함을 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">전화번호<span>*</span></a></h5>
                <input type="text" oninput="oninputPhone(this)" autocomplete="off"  maxlength="13" id="S_Rec_Phone" placeholder="라오스 수령인 전화번호를 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">픽업지 선택<span>*</span></a></h5>
                <select name="pickup" id="S_Pickup">
                    <option value="">픽업지를 선택하세요</option>
                    <option value="1">본사</option>
                    <option value="2">하우 창고</option>
                    <option value="3">지방배송</option>
                </select>
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">배송서비스유무<span>*</span></a></h5>
                <select name="pickup" id="S_Service">
                    <option value="">배송서비스 유무를 선택하세요</option>
                    <option value="Y">신청</option>
                    <option value="N">미신청</option>
                </select>
            </div>         
            
                                                     
        </section>
        <footer>
            <button id="Next">다음</button>
        </footer>
    </div>
    <div class="m_container second">
        <header class="m_header">
            <h3 class="arrow">
                <a id="Before2" href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">배송조회</div>
        </header>        
        <section>  
            <div class="currentWrap">
            	<div class="totalh4">
                   	<h4>CBM : <span class="total_cbm"></span></h4>
                   	<h4>무게 : <span class="total_weight"></span></h4>    	
                    <h4>총 박스 수 : <span class="total_box"></span></h4>
                </div>
                <h5 class="icon filter">
                    <img src="./images/m_icon/filter_orange.svg" alt="#">
                </h5>
                <div class="currentHeader">
                    <h5><a href="#">배송리스트</a></h5>
                </div>
                <div class="tableWrap">
                    <table id="Delivery_Table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>송장번호</th>
                                <th>출항일</th>
                                <th>수령인</th>
                                <th>전화번호</th>
                                <th>픽업지</th>
                                <th>배송서비스</th>
                                <th>링크복사</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div> 
                <button class="modify">수정하기</button>  
                <input type="text" id="copy_link" style="display:none;">
            </div>
        </section>
        <footer>
            <button id="Before">이전</button>
        </footer>        
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var auth = '${M_AUTH}';

	$(document).on('ready',function(){

		if(auth == 'R'){
			$(".modify").remove();
		}		
		else if(auth == 'D'){
			location.href = "Mobile_ManagerMain.do";
		}
		
		$(".back").on("click",function(){
			history.back();
		})
		outdaybox();

// 		$('#S_Out_Day').datepicker(
// 				{
// 					changeMonth : true,
// 					changeYear : true,
// 					showMonthAfterYear : true,
// 					dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
// 				    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
// 				    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
// 					dateFormat : 'yy-mm-dd',
// 				});
// 		$('#S_Out_Day').datepicker('setDate','today');

		// 체크박스 트리거
		
// 		$(".List_Check.All").on("click",function(){
// 			if($(this).prop("checked") == true){
// 				$(".List_Check.sub").prop("checked",true);
// 			}
// 			else{
// 				$(".List_Check.sub").prop("checked",false);	
// 			}
// 		});
		

// 		$(document).on("click",".List_Check.sub",function(){
// 			if($(this).prop("checked") == true){
// 				if($("input:checkbox[name=List_Check]:checked").length == $("input:checkbox[name=List_Check]").length){
// 					$(".List_Check.All").prop("checked",true);
// 				}
// 			}
// 			else{
// 				$(".List_Check.All").prop("checked",false);		
// 			}
// 		});

		
		$("#Next").on("click",function(){
			ChangeSearch();
		})
		
		$(".filter").on("click",function(){
			$(".second").css("display","none");
			$(".first").css("display","block");
			$("header.first").css("display","flex");
		})
		
		$("#Before").on("click",function(){
			$(".second").css("display","none");
			$(".first").css("display","block");
			$("header.first").css("display","flex");
		})
		
		$("#Before2").on("click",function(){
			$(".second").css("display","none");
			$(".first").css("display","block");
			$("header.first").css("display","flex");
		})
		
		

		$(".modify").on("click",function(){
			var nc = $(".ton").find(".in_key").val();
			
			if(nc != null){
				/* 미완료 배송신청으로 이동 */
				location.href = "mAdminDeliveryRegistMain.do?ik=" +nc;
			}
		})
		
		$(document).on("click",".outdays",function(){
			$("#S_Out_Day").val($(this).text());
	        daybox = 0;
	        $(".outdayBox").hide();
		})

		
		/* 테이블 목록 클릭시 */
		$(document).on("click","#Delivery_Table > tbody > tr",function(){
			$(".ton").removeClass("ton");
			$(this).addClass("ton");
			
			$(".List_Check").prop("checked",false);
			$(this).find(".List_Check").prop("checked",true);
		})
		
		
		$(document).on("click",".link",function(){
			$("#copy_link").show();
			var nc = $(this).parents("tr").find(".in_key").val();
			if(window.location.host == 'localhost:8080'){
				$("#copy_link").val("localhost:8080/Delivery/Mobile_Delivery_Search_A.do?ik="+nc);
				document.getElementById("copy_link").select();
				document.execCommand("copy");
			}
			else if(window.location.host == 'eklogis.com'){
				$("#copy_link").val("https://eklogis.com/Mobile_Delivery_Search_A.do?ik="+nc);
				document.getElementById("copy_link").select();
				document.execCommand("copy");
			}
			alert("클립보드로 해당 항목의 링크가 복사되었습니다.");
			$("#copy_link").hide();
		})
	})
	
	
	/* 배송신청 완료된거 불러오기 */
	function ChangeSearch(){
		var deliverydata = {
				MEM_ID : uid,
				OUT_DAY : $("#S_Out_Day").val(),
				REC_NM : $("#S_Rec_Nm").val(),
				REC_PHONE : $("#S_Rec_Phone").val(),
				REC_TARGET : $("#S_Pickup :selected").val(),
				REC_SERVICE : $("#S_Service :selected").val()
		};
		$.ajax({
			type: "POST",
			url : "./Deilvery_Now_List.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);

				$("#Delivery_Table > tbody").empty();
				var tbodyData = "";

				for(let i=0; i<result.length; i++ ){

					tbodyData += "<tr><td><input type='radio' name='List_Check' class='List_Check sub'>";
					tbodyData += "<td>"+result[i].EK+"</td>";
					tbodyData += "<td><input type='hidden' class='in_key' value='"+result[i].IN_KEY+"'>"+result[i].OUT_DAY+"</td>";
					tbodyData += "<td>"+result[i].REC_NM+"</td>";
					tbodyData += "<td>"+result[i].REC_PHONE+"</td>";
					tbodyData += "<td>"+result[i].REC_TARGET+"</td>";
					tbodyData += "<td>"+result[i].SERVICE+"</td>";
					tbodyData += "<td><button class='link'><img src='./images/pc_icon/Link.svg'></button></td>";
					tbodyData += "<input type='hidden' class='tr_cbm' value='"+result[i].CBM+"' >";
					tbodyData += "<input type='hidden' class='tr_weight' value='"+result[i].WEIGHT+"' >";
					tbodyData += "<input type='hidden' class='tr_count' value='"+result[i].COUNT+"' >";
					tbodyData += "</tr>";
				}

				$("#Delivery_Table > tbody").append(tbodyData);

				$(".first").css("display","none");
				$(".second").css("display","block");
				$("header.second").css("display","flex");
				cbmBox();
            }
		})
	}
	
	/* 선택한 항목 cbm, 총 박스 수 계산기 */
	function cbmBox(){
		// cbm계산 : 총가로 * 총세로 * 총높이 * 0.0000001
		let total_count = 0;
		let cbm = 0;
		let weight = 0;
		
		$("#Delivery_Table > tbody > tr").each(function(e){
			let total_weight = Number($(this).find(".tr_weight").val());
			let total_cbm = Number($(this).find(".tr_cbm").val());
			
			total_count += Number($(this).find(".tr_count").val());
			
// 			cbm += Math.round((total_width * total_height * total_length * 0.0000001) * 100)/100;
			cbm += total_cbm;
			weight += total_weight;
		})
		
		//선택한 데이터만 불러오기(미사용)
// 		for(let prt = 0; prt < $(".List_Check.sub:checked").length; prt++){

// 			let total_width = Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_width").val());
// 			let total_height = Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_height").val());
// 			let total_length = Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_length").val());
			
// 			total_count += Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_count").val());
			
// 			cbm += Math.round((total_width * total_height * total_length * 0.000001) * 100)/100;
// 		}
		$(".total_cbm").text(Math.round( cbm* 100)/100);
		$(".total_box").text(total_count);
		$(".total_weight").text(Math.round( weight* 100)/100);

		
	}
	
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
	}
	

	function outdaybox(){
		var deliverydata = {
				MEM_ID : uid,
				OUT_DAY : "",
		};
		$.ajax({
			type: "POST",
			url : "./Out_Day_List.do",
			data: deliverydata,
			async: false,
            success: function(datas){
            	var result = JSON.parse(datas);
            	
            	$(".outdays").remove();
            	for(let i=0; i<result.length; i++){
                	$(".outdayBox").append("<div class='outdays'>"+result[i].OUT_DAY+"</div>");
            	}
            }
		})
	}
	
	var dayes = document.querySelector("#S_Out_Day");
	var daybox = 0;
	dayes.onfocus = function(e){
		$(".outdayBox").show();
		daybox = 1;
	}
	
	document.querySelector("body").addEventListener("click", function (e) {
		if(daybox == 1){

			if(e.target.className == 'outdays' || e.target.className == 'outdayTitle' || e.target.className == 'Search days') {
// 		        console.log("correct")
		    } else {
		        daybox = 0;
		        $(".outdayBox").hide();
		    }
		}
	})
</script>
</html>