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
</style>

</head>

<body>
	<div id="print_grayback">
        <div id="print_popup">
        	<div id="print_header"><h2 class="print_title">인쇄 페이지</h2><button class="print_X">X</button></div>
        	<div id="print_button_header"><button class="printbutton" id="print_excel">엑셀로 받기</button><button class="printbutton" id="print_button">인쇄</button></div>
        	<div id="print_div">
        		<input type="hidden" id="EXCEL_IN_KEY">
        		<table class="print_table" id="print_table_1">
        			<tr style="text-align:center;"><th class="print_table_header" style="font-size:30px;" colspan="9">INVOICE</th></tr>
        			<tr style="text-align:center;"><td style="width:20%; font-weight:bold; " colspan="2" rowspan="2">NOY</td><td></td><td>ຕູ້ທີ່1 ເດືອນ11</td><td style="background: #d7d7d7; font-weight:bold;" colspan="5">EK Logistics</td></tr>
        			<tr style="text-align:center;"><td>고객님 귀하</td><td id="EXCEL_NAME"></td><td id="EXCEL_ADDRESS" colspan="5">Pakthang Village, Sikhotavong District Vientiane Captital, Lao P.D.R</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue; width:10%;">접수번호:<br />ລະຫັດ</td><td id="EXCEL_EK" style="background:bisque;font-weight:bold; width: 30%; font-size:20px;" colspan="3">EK01</td><td colspan="5">TEL: +856 2099118282(LAO) / +856 2055533327(KR) <br />+856 2054155374(LAO)</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">전화번호:ເບີໂທ</td><td id="EXCEL_PHONE" colspan="3">111-1111-1111</td><td rowspan="2" style="background:aliceblue; ">운임ລວມ</td><td id="EXCEL_TR_COST"  colspan="2" rowspan="2">10$</td><td style="background:bisque;font-weight:bold; " colspan="2">담당직원 서명 ຜູ້ສົ່ງເຄືອງ</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">이용연도:ປີ</td><td id="EXCEL_YEAR" colspan="3">2024</td><td style="color:darkgray; font-weight:bold; " colspan="2" rowspan="2">Signiture</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">물품수량:ຈ/ນແກັດ</td><td id="EXCEL_COUNT" colspan="3">111</td><td style="background:aliceblue; ">할인율ສ່ວນຫຼຸດ</td><td colspan="2">0%</td></tr>
        			<tr style="text-align:center;"><td style="background:aliceblue;">출항 월:ເດືອນ</td><td id="EXCEL_MONTH" style="background:bisque;" colspan="3">11</td><td style="background:aliceblue;">할인금액 ລວມສ່ວນຫຼຸດ</td><td style="color:cornflowerblue; " colspan="2">0$</td><td style="background:gold;font-weight:bold; " colspan="2">고객/수령인 서명 ຜູ້ຮັບເຄືອງ</td></tr>
        			<tr style="text-align:center;"><td colspan="4" rowspan="2">이용에 감사드립니다. 더 나은 서비스로 보답하겠습니다.</td><td style="font-weight:bold;" colspan="1" rowspan="2">청구액 ລວມຕ້ອງຈ່າຍ</td><td  id="EXCEL_COST" style="color:red; font-weight:bold;  " colspan="2" rowspan="2">111,111,111</td><td style="color:darkgray; font-weight:bold; " colspan="2" rowspan="2">Signiture</td></tr>
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
        				<tr><td>샘성</td><td>100</td><td>100</td><td>100</td><td>100</td><td>100</td><td>100</td><td>100</td><td>100</td></tr>
        			</tbody>
        		</table>
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

			
			var Ddatas = [];
			for(let i=0; i<$("#print_table_2 > tbody > tr").length; i++){
				var Ddata = {};
				$(".tr" + i + " > td").each(function(i){
					Ddata["CELL" + i] = $(this).text();
				});
				Ddatas.push(Ddata);
			}
			var deliverydata = {
					IN_KEY : 		$("#EXCEL_IN_KEY").val(),
					EXCEL_NAME : 	$("#EXCEL_NAME").text(),
					EXCEL_ADDRESS : $("#EXCEL_ADDRESS").text(),
					EXCEL_PHONE : 	$("#EXCEL_PHONE").text(),
					EXCEL_YEAR : 	$("#EXCEL_YEAR").text(),
					EXCEL_COUNT : 	$("#EXCEL_COUNT").text(),
					EXCEL_MONTH:	$("#EXCEL_MONTH").text(),
					EXCEL_TR_COST: 	$("#EXCEL_TR_COST").text(),
					EXCEL_COST:		$("#EXCEL_COST").text(),
					EXCEL_EK:		$("#EXCEL_EK").text(),
					EXCEL_COST:		$("#EXCEL_COST").text(),
					EXCEL_TABLE_NUM: $("#print_table_2 > tbody > tr").length,
					EXCEL_TABLE : Ddatas
			};
			console.log(deliverydata);
			
			$.ajax({
				type: "POST",
				url : "./Excel.do",
				data: deliverydata,
				async: false,
	            success: function(datas){
	            	alert(datas);
	            	console.log(datas);
	            }
			})

		})
		
		
		$("#print_button").on("click",function(){

			startPrint('print_div');
			
		})
	})
	
// 	const excelDownload = document.querySelector('#print_excel');

// 	document.addEventListener('DOMContentLoaded', ()=>{
// 	    excelDownload.addEventListener('click', exportExcel);
// 	});
// 	function exportExcel(){ 
// 	  // step 1. workbook 생성
// 	  var wb = XLSX.utils.book_new();
	
// 	  // step 2. 시트 만들기 
// 	  var newWorksheet = excelHandler.getWorksheet();
	
// 	  // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.  
// 	  XLSX.utils.book_append_sheet(wb, newWorksheet, excelHandler.getSheetName());
	
// 	  // step 4. 엑셀 파일 만들기 
// 	  var wbout = XLSX.write(wb, {bookType:'xlsx',  type: 'binary'});
	
// 	  // step 5. 엑셀 파일 내보내기 
// 	  saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
// }

// var excelHandler = {
//     getExcelFileName : function(){
//         return 'table-test.xlsx';	//파일명
//     },
//     getSheetName : function(){
//         return 'Table Test Sheet';	//시트명
//     },
//     getExcelData : function(){
//         return document.getElementById('print_table_1'); 	//TABLE id
//     },
//     getWorksheet : function(){
//         return XLSX.utils.table_to_sheet(this.getExcelData());
//     }
// }

// function s2ab(s) { 
//   var buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
//   var view = new Uint8Array(buf);  //create uint8array as viewer
//   for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
//   return buf;    
// }

// 엑셀 다운로드
function fnExcelDownload(id,id2, title) {
    var tab_text = '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
    tab_text += '<head><meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
    tab_text += '<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>'
    tab_text += '<x:Name>invoice</x:Name>';
    tab_text += '<x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions></x:ExcelWorksheet>';
    tab_text += '</x:ExcelWorksheets></x:ExcelWorkbook></xml></head><body>';
    tab_text += "<table border='1px'>";
    var exportTable = $('#' + id).clone();
    var exportTable2 = $('#' + id2).clone();
    exportTable.find('input').each(function (index, elem) { $(elem).remove(); });
    tab_text += exportTable.html();

    tab_text += '</table><br />';
    tab_text += "<table border='1px'>";
    exportTable2.find('input').each(function (index, elem) { $(elem).remove(); });
    tab_text += exportTable2.html();
    tab_text += '</table></body></html>';
    var data_type = 'data:application/vnd.ms-excel';
    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");
    var fileName = title + '.xls';

    // IE 환경에서 다운로드
    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) {
    if (window.navigator.msSaveBlob) {
    var blob = new Blob([tab_text], {
    type: "application/csv;charset=utf-8;"
    });
    navigator.msSaveBlob(blob, fileName);
    }
    } else {
    var blob2 = new Blob([tab_text], {
    type: "application/csv;charset=utf-8;"
    });
    var filename = fileName;
    var elem = window.document.createElement('a');
    elem.href = window.URL.createObjectURL(blob2);
    elem.download = filename;
    document.body.appendChild(elem);
    elem.click();
    document.body.removeChild(elem);
    }

};

// var prtContent; // 프린트 하고 싶은 영역
// var initBody;  // body 내용 원본

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