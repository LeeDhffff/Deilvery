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

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- Sheet JS -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script> -->
<!--FileSaver savaAs 이용 -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script> -->

    <!-- import print.js -->
    <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://printjs-4de6.kxcdn.com/print.min.css">
        
<style>
	#print_grayback{
		width: 100%;
		height: 100%;
		background : #80808082;
		position : absolute;
		transform : translate(-50%, -50%); 
		top : 50%;
		left: 50%;
		display: none;
	}
	#print_popup{
		width: 70%;
		height: 70%;
		background : white;
		position : absolute;
		transform : translate(-50%, -50%); 
		top : 50%;
		left: 50%;
		padding : 20px;
	}
	#print_header{
	    display: flex;
	    justify-content: space-between;
	}
	#print_button_header{
	    display: flex;
	}
	.print_X{
		width: 40px;
	    height: 40px;
	    color: white;
	    background: #FF5722;
	    font-size: xx-large;
	    cursor: pointer;
	}
	#print_div{
		width : 100%;
		height: 90%;
		margin: 0 auto;
		border: 1px solid black;    
		overflow-y: scroll;
		
	}
	.print_table{
		border: 2px solid black;
	    border-collapse: collapse;
	}
	.print_table > thead > tr > th, .print_table > tbody > tr > td{
		border: 1px solid black;
	}
	.printbutton{
		height: 30px;
		padding: 5px;
		border: 1px solid black;
		margin: 10px 10px 10px 0px;
	    cursor: pointer;
        min-width: 70px;
	}
	#print_excel{
		background: green;
	    color: white;
	    
	}
	#print_button{
	    color: white;
    	background: #ff5a5a;
	}
	#EXCEL_QR1 > img{
		margin : 0 auto;
	}
	
	@media print {
	* {
		-webkit-print-color-adjust: exact;
		print-color-adjust: exact;
    }
    html, body {
    margin:0;
    padding:0;
    page-break-after: avoid;
    page-break-before: avoid
  }
    .print_table { border:2px solid black; border-collapse: collapse;}
	.print_table > thead > tr > th, .print_table > tbody > tr > td {border:1px solid black; }
}
.printbuttonMove{
	width: 30px;
    height: 31px;
    margin-left: 5px;
    margin-right: 5px;
    color: white;
    background: brown;
}
.nextButton{
	margin: 10px 10px 10px 0px;
	display:flex;
}
.now_In_key{
	width: 105px;
    height: 29px;
    line-height: 30px;
    border: 1px solid #9b9b9b;
    padding-left: 5px;
    padding-right: 5px;
}
</style>

</head>

<body>
	<div id="print_grayback">
        <div id="print_popup">
        	<div id="print_header"><h2 class="print_title">인쇄 페이지</h2><button class="print_X">X</button></div>
        	<div id="print_button_header">
	        	<button class="printbutton" id="print_excel">엑셀로 받기</button>
	        	<button class="printbutton" id="print_button">인쇄</button>
	        	<div class="nextButton">
		        	<button class="printbuttonMove" id="print_before"><</button>
		        	<h4 class="now_In_key"></h4>
		        	<span class="now_num" style="display:none;">0</span>
		        	<button class="printbuttonMove" id="print_after">></button>
	        	</div>
        	</div>
        	<div id="print_div">
        		<input type="hidden" id="EXCEL_IN_KEY">
        		<table class="print_table" id="print_table_1">
        			<tr style="text-align:center;"><th class="print_table_header" style="font-size:30px;" colspan="9">INVOICE</th></tr>
        			<tr style="text-align:center;"><td style="width:20%; font-weight:bold; " colspan="2" rowspan="2">NOY</td><td></td><td>ຕູ້ທີ່1 ເດືອນ11</td><td style="background: #d7d7d7; font-weight:bold;" colspan="5">EK Logistics</td></tr>
        			<tr style="text-align:center;"><td>고객님 귀하</td><td id="EXCEL_NAME"></td><td id="EXCEL_ADDRESS" colspan="5">Pakthang Village, Sikhotavong District Vientiane Captital, Lao P.D.R</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue; width:10%;">접수번호:<br />ລະຫັດ</td><td id="EXCEL_EK" style="background:bisque;font-weight:bold; width: 30%; font-size:20px;" colspan="3"></td><td colspan="5">TEL: +856 2099118282(LAO) / +856 2055533327(KR) <br />+856 2054155374(LAO)</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">전화번호:ເບີໂທ</td><td id="EXCEL_PHONE" colspan="3"></td><td rowspan="2" style="background:aliceblue; ">운임ລວມ</td><td id="EXCEL_TR_COST"  colspan="2" rowspan="2"></td><td style="background:bisque;font-weight:bold; " colspan="2">담당직원 서명 ຜູ້ສົ່ງເຄືອງ</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">이용연도:ປີ</td><td id="EXCEL_YEAR" colspan="3"></td><td style="color:darkgray; font-weight:bold; " colspan="2" rowspan="2">Signiture</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">물품수량:ຈ/ນແກັດ</td><td id="EXCEL_COUNT" colspan="3"></td><td style="background:aliceblue; ">할인율ສ່ວນຫຼຸດ</td><td colspan="2">0%</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">출항 월:ເດືອນ</td><td id="EXCEL_MONTH" style="background:bisque;" colspan="3"></td><td style="background:aliceblue;">할인금액 ລວມສ່ວນຫຼຸດ</td><td style="color:cornflowerblue; " colspan="2">0$</td><td style="background:gold;font-weight:bold; " colspan="2">고객/수령인 서명 ຜູ້ຮັບເຄືອງ</td></tr>
        			<tr style="text-align:center;"><td colspan="4" rowspan="2">이용에 감사드립니다. 더 나은 서비스로 보답하겠습니다.</td><td style="font-weight:bold;" colspan="1" rowspan="2">청구액 ລວມຕ້ອງຈ່າຍ</td><td  id="EXCEL_COST" style="color:red; font-weight:bold;  " colspan="2" rowspan="2"></td><td style="color:darkgray; font-weight:bold; " colspan="2" rowspan="2">Signiture</td></tr>
        			<tr></tr>
        			<tr style="text-align:center; height:150px;"><td colspan="4">
        				※이용약관에 따라 운임은 중량과 부피 기반 환산금액중 높은쪽으로 청구되며, 
        				최소 운임은 10$ 입니다.(소수점 단위 반올림)
						※ອີງຕາມຂໍ້ກຳນົດ ແລະເງື່ອນໄຂ, ຄ່າຂົນສົ່ງແມ່ນຄິດໄລ່ ຕາມຂະໜາດ ,ນ້ຳໜັກ,ແລະ ປະລິມານ ຂອງສີນຄ້າ , 
						ຄ່າຂົນສົ່ງຂັ້ນຕ່ຳແມ່ນ $10.
        			</td><td colspan="5">
        			<div id="EXCEL_QR1"></div>
<!--         			(USD)    -->
        			(KIP)</td></tr>
        			<tr style="text-align:center;"><td rowspan="2" colspan="4">원화결제 →하나은행 : 윤병인 369-810087-61207<br />ບັນຊີ ຢູ່ ເກົາຫຼີ </td><td colspan="5">BCEL BANK : MR HOUMPHAN SIHAPANYA</td></tr>
        			<tr style="text-align:center;"><td colspan="3">010-12-01-01761708-001 (USD)</td><td colspan="2">010-12-0001761708-001 (KIP)</td></tr>
        		</table>
        		<table class="print_table" id="print_table_2">
        			<thead>
        				<tr style="background:aliceblue;"><th>내품</th><th>중량</th><th>장</th><th>폭</th><th>고</th><th>용적중량</th><th>기준가</th><th>청구중량</th><th>청구운임</th></tr>
        			</thead>
        			<tbody>
        			</tbody>
        		</table>
        		
        		<div>
        		<table class="print_table" id="print_table_H1" style="display:none;">
        			<tbody>
        			</tbody>
        		</table>
        		<table class="print_table" id="print_table_H2" style="display:none;">
        		</table>
        		</div>
        	</div>
        </div>
    </div>
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
			

		if(uid=="null" && uid2=="null"){ 
		   
		}
		else{

		}
		
		
		$(".print_X").on("click",function(){
			$("#print_grayback").hide();
		})
		
		$("#print_excel").on("click",function(){
// 			fnExcelDownload("print_table_1","print_table_2","테스트");


			var tbody_length = $("#print_table_H2 > tbody").length;
			var deliverydata = [];
			for(let j=0; j<tbody_length; j++){

				var now_inkey  = $($("#print_table_H2 > tbody")[j]).attr("class");
				const imageData = ($("#qr_" + now_inkey).find("canvas")[0] != null) ? $("#qr_" + now_inkey).find("canvas")[0].toDataURL("image/png", 0.5)
								: "";
				console.log(imageData);
				
				var Ddatas = [];
				var sub_length = $("#print_table_H2 > ." + now_inkey + " > tr").length
				for(let k=0; k<sub_length; k++){
					var sol = $("#print_table_H2 > ." + now_inkey + " > tr")[k];
					var Ddata = {};
					Ddata["CELL0"] = $(sol).find(".rec_txt").text();
					Ddata["CELL1"] = $(sol).find(".weight").text();
					Ddata["CELL2"] = $(sol).find(".width").text();
					Ddata["CELL3"] = $(sol).find(".length").text();
					Ddata["CELL4"] = $(sol).find(".height").text();
					Ddata["CELL5"] = $(sol).find(".weight2").text();
					Ddata["CELL6"] = $(sol).find(".cost").text();
					Ddata["CELL7"] = $(sol).find(".weight3").text();
					Ddata["CELL8"] = "10$";
					
					Ddatas.push(Ddata);
				}
				
				var d_data = {
					IN_KEY : 		$("#print_table_H1 > tbody > " + "." + now_inkey + " > .in_key").text(),
					EXCEL_NAME : 	$("#print_table_H1 > tbody > " + "." + now_inkey + " > .rec_nm").text(),
					EXCEL_ADDRESS : $("#print_table_H1 > tbody > " + "." + now_inkey + " > .rec_hou").text(),
					EXCEL_PHONE : 	$("#print_table_H1 > tbody > " + "." + now_inkey + " > .rec_phone").text(),
					EXCEL_YEAR : 	$("#print_table_H1 > tbody > " + "." + now_inkey + " > .cre_day").text(),
					EXCEL_COUNT : 	$("#print_table_H1 > tbody > " + "." + now_inkey + " > .count").text(),
					EXCEL_MONTH:	$("#print_table_H1 > tbody > " + "." + now_inkey + " > .arr_day").text(),
					EXCEL_TR_COST: 	$("#print_table_H1 > tbody > " + "." + now_inkey + " > .tr_cost").text(),
					EXCEL_COST:		$("#print_table_H1 > tbody > " + "." + now_inkey + " > .cost").text(),
					EXCEL_EK:		$("#print_table_H1 > tbody > " + "." + now_inkey + " > .ek").text(),
					EXCEL_TABLE_NUM: $("." + now_inkey + " > tr").length,
					EXCEL_QR : imageData,
					EXCEL_TABLE : Ddatas
				}
				deliverydata.push(d_data);
			}
			
			
			
			
			
			
			
			console.log(deliverydata);
			var parsing = "";
			for(let i=0; i<deliverydata.length; i++){
				
				parsing += deliverydata[i].IN_KEY;
				parsing += "_,_"+ deliverydata[i].EXCEL_NAME;
				parsing += "_,_"+ deliverydata[i].EXCEL_ADDRESS;
				parsing += "_,_"+ deliverydata[i].EXCEL_PHONE;
				parsing += "_,_"+ deliverydata[i].EXCEL_YEAR;
				parsing += "_,_"+ deliverydata[i].EXCEL_COUNT;
				parsing += "_,_"+ deliverydata[i].EXCEL_MONTH;
				parsing += "_,_"+ deliverydata[i].EXCEL_TR_COST;
				parsing += "_,_"+ deliverydata[i].EXCEL_COST;
				parsing += "_,_"+ deliverydata[i].EXCEL_EK;
				parsing += "_,_"+ deliverydata[i].EXCEL_TABLE_NUM;
				parsing += "_,_";
					
				for(let j=0; j<deliverydata[i].EXCEL_TABLE.length; j++){
						for(let m=0; m<9; m++){
							parsing +=  deliverydata[i].EXCEL_TABLE[j]["CELL" + m];
							if(m != 8){
								parsing += "_";
							}
						}
					if(j != deliverydata[i].EXCEL_TABLE.length - 1){
						parsing += "]"
					}
						
				}
				parsing += "_,_"+ deliverydata[i].EXCEL_QR;
// 				if(i != deliverydata.length - 1){
					parsing += "|"
// 				}
				
			}

			var parsingdeliverydata = {
				EXCELDATAS : parsing
			};
			$.ajax({
				type: "POST",
				url : "./Excel.do",
				data: parsingdeliverydata,
				async: false,
	            success: function(datas){
// 	            	alert(datas);
// 	            	console.log(datas);
					if(datas != "엑셀 파일을 다운로드 하는데 문제가 발생하였습니다"){
		            	location.href="Excel2.do?fileNm="+encodeURI(datas);
					}
					else{
						alert(datas);
					}
	            }
			})

		})
		
		
		$("#print_after").on("click",function(){
			var nowinkey = $(".now_In_key").text();
			var nownum = Number($(".now_num").text());
			var length = $("#print_table_H2 > tbody").length;
			if(nownum < length-1){
				PrintPageLoad($($("#print_table_H2 > tbody")[nownum + 1]).attr("class"));
				$(".now_num").text(nownum + 1)
				$(".now_In_key").text($($("#print_table_H2 > tbody")[nownum + 1]).attr("class"))
			}
		})
		$("#print_before").on("click",function(){
			var nowinkey = $(".now_In_key").text();
			var nownum = Number($(".now_num").text());
			var length = $("#print_table_H2 > tbody").length;
			if(nownum > 0){
				PrintPageLoad($($("#print_table_H2 > tbody")[nownum - 1]).attr("class"));
				$(".now_num").text(nownum - 1)
				$(".now_In_key").text($($("#print_table_H2 > tbody")[nownum - 1]).attr("class"))
			}
		})
		
		$("#print_button").on("click",function(){

			startPrint('print_div');
			
		})
	})
	
	function PrintPageLoad(in_key){
		
		
			$("#EXCEL_NAME").text($("#print_table_H1 > tbody > " + "." + in_key + " > .rec_nm").text());
			$("#EXCEL_ADDRESS").text($("#print_table_H1 > tbody > " + "." + in_key + " > .rec_hou").text());
			$("#EXCEL_PHONE").text($("#print_table_H1 > tbody > " + "." + in_key + " > .rec_phone").text());
			$("#EXCEL_YEAR").text($("#print_table_H1 > tbody > " + "." + in_key + " > .cre_day").text());
			$("#EXCEL_COUNT").text($("#print_table_H1 > tbody > " + "." + in_key + " > .count").text());
			$("#EXCEL_MONTH").text($("#print_table_H1 > tbody > " + "." + in_key + " > .arr_day").text());
			$("#EXCEL_IN_KEY").val($("#print_table_H1 > tbody > " + "." + in_key + " > .in_key").text());
			$("#EXCEL_EK").text($("#print_table_H1 > tbody > " + "." + in_key + " > .ek").text());
		
			$("#EXCEL_TR_COST").text($("#print_table_H1 > tbody > " + "." + in_key + " > .tr_cost").text());
			$("#EXCEL_COST").text($("#print_table_H1 > tbody > " + "." + in_key + " > .cost").text());
			
			$("#EXCEL_QR1").empty();
    		qrCreate("EXCEL_QR1", $("#print_table_H1 > tbody > " + "." + in_key + " > .qrTxt").text());	     
			
		
			$("#print_table_2 > tbody").empty();
			var PrintString = '';

			console.log($("#print_table_H2 > ." + in_key + " > tr").length);
			
			for(let i=0; i<$("#print_table_H2 > ." + in_key + " > tr").length; i++){
				var sol = $("#print_table_H2 > ." + in_key + " > tr")[i];
				PrintString += '<tr class="tr'+i+'">';
				PrintString += '<td>'+$(sol).find(".rec_txt").text()+'</td>';
				PrintString += '<td>'+$(sol).find(".weight").text()+'</td>';
				PrintString += '<td>'+$(sol).find(".width").text()+'</td>';
				PrintString += '<td>'+$(sol).find(".length").text()+'</td>';
				PrintString += '<td>'+$(sol).find(".height").text()+'</td>';
				PrintString += '<td>'+$(sol).find(".weight2").text()+'</td>';
				PrintString += '<td>'+$(sol).find(".cost").text()+'</td>';
				PrintString += '<td>'+$(sol).find(".weight3").text()+'</td>';
				PrintString += '<td>10$</td>';
				PrintString += '</tr>';
			
			};
			$("#print_table_2 > tbody").append(PrintString);
	}
	
	
	
// 프린트하고 싶은 영역의 id 값을 통해 출력 시작
function startPrint (div_id) {
// 	prtContent = document.getElementById(div_id);
// 	window.onbeforeprint = beforePrint;
// 	window.onafterprint = afterPrint;
// 	window.print();

	printJS({
		printable: div_id,
		type: 'html',
		css: "css/3.Manager/printstyle.css",
		imageStyle : "width:100%; height:100%;"
// 		style: '',
// 		scanStyles: true
    });
}

// // 웹페이지 body 내용을 프린트하고 싶은 내용으로 교체
// function beforePrint(){
// 	initBody = document.body.innerHTML;
// 	document.body.innerHTML = prtContent.innerHTML;
// }

// // 프린트 후, 웹페이지 body 복구
// function afterPrint(){
// 	document.body.innerHTML = initBody;
// }
</script>
</html>