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
<link rel="stylesheet" href="./css/6.MobileDelivery/MD_style.css">  
        
<style>
	section {
	    padding: 0;
	}
	#receipt_grayback{
		width: 100%;
		height: 100%;
		background : #80808082;
		position : absolute;
		transform : translate(-50%, -50%); 
		top : 50%;
		left: 50%;
		display: none;
		z-index: 4 !important;
	}
	#receipt_popup{
		width: 500px;    
		height: 70%;
		background : white;
		position : absolute;
		transform : translate(-50%, -50%); 
		top : 50%;
		left: 50%;
		padding : 20px;
/*  		overflow-y: hidden;  */
	}
	.printbuttonMove:hover{
	    background: #ff7272;
	}
	#receipt_header{
		display: flex;
		justify-content: space-between;
	}
	#receipt_button_header{
		display: flex;
		justify-content: space-between;
	}
	.receipt_X{
		width: 40px;
	    height: 40px;
	    color: white;
	    background: #FF5722;
	    font-size: xx-large;
	    cursor: pointer;
	}
	#section_date{
		width:auto;
		display:block;
		background: white;    
		padding-top: 0;
		min-height: calc(70vh - 90px);
		margin-bottom: 20px;
    	margin-top: 20px;
	}
	.infoWrap{
		height:828px;
	}
	.sectionMainTitle{
		margin-top:30px;
		font-size: 20px;
	}
	#receipt_print{
		width: 130px;
	    height: 30px;
		cursor: pointer;
		color:white;
		background:var(--main-color);
		border: 1px solid var(--main-color);
		margin-top: 10px;
	}
	#receipt_print:active{
		background:white;
		color: var(--main-color);
	}
	#all_receipt{
		width: 100px;
	    height: 30px;
		cursor: pointer;
		color:white;
		background:var(--sub-color);
		border: 1px solid var(--sub-color);
		margin-top: 10px;    
		margin-right: 20px;
	}
	#all_receipt:hover{
		background:white;
		color: var(--sub-color);
	}
	.m_container > hr{
	    width: 100%;
	    height: 1px;
	    background: var(--input-color);
	    margin: 30px 0 10px 0;
	}
	.signiture{
	    width: 100%;
	    border-collapse: collapse;
	    margin-bottom: 10px;
	}
	.signiture_in{
		width: 50%;
	    height: 120px;
	    text-align: center;
	    font-size: 20px;
	    font-weight: bold;
	    border: 2px solid black;
	    vertical-align : top;
	}

	.dateNotice.rec{
		background-color: white;
		border: 3px solid black;
	}
	.dateNotice.rec > .subTxt > a{color: black !important;}
	.dateNotice.rec > .dateTxt > a{color: black !important;}

	.infoCon > h5{
		font-size: 22px;
	}
	.infoCon > h1{
		font-size: 22px;
	}
	.tableCon{padding: 4px 4px 70px 10px}
	.tableCon > h3{font-size: 22px;}
	
	.infoCon .subTxt {
    	width: 200px;
    }
    .receipt_div{
    	overflow-y: scroll;
    	height: 90%;
    }
	/* .infoCon.indate.eks > h5{
		font-size: 30px;
	}
	.infoCon.indate.eks > h1{
		font-size: 30px;
	} */
</style>

</head>

<body>
	<div id="receipt_grayback">
        <div id="receipt_popup">
        	<div id="receipt_header"><h2 class="print_title">영수증 페이지</h2><button class="receipt_X">X</button></div>
        	<div id="receipt_button_header">
	        	<div class="nextButton receipt_page">
		        	<button class="printbuttonMove" id="receipt_before"><</button>
		        	<h4 class="now_In_key"></h4>
		        	<span class="now_num" style="display:none;">0</span>
		        	<button class="printbuttonMove" id="receipt_after">></button>
	        	</div>
       			<button class="receiptbutton" id="all_receipt">모든 영수증 표시</button>
       			<button class="receiptbutton" id="receipt_print">완료 & 출력하기</button>
        	</div>
        	<div class="receipt_div">
        		<div class="m_container">
			        
	        		<div class="m_container2" id="m_container2">
	        		</div>
			        <hr/>
			        <footer>
			        </footer>
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
	var A_table = [];
	var A_table_Detail = [];
	var A_in_keys = [];
	$(document).on('ready',function(){
			

		
		
		$(".receipt_X").on("click",function(){
			$("#receipt_grayback").hide();
		})
		
		
		
		
		$("#receipt_after").on("click",function(){
			var nowinkey = $(".receipt_page > .now_In_key").text();
			var nownum = Number($(".receipt_page > .now_num").text());
			var length = A_in_keys.length;
			if(nownum < length-1){
				PrintPageLoad2(A_in_keys[nownum + 1]);
				$(".receipt_page > .now_num").text(nownum + 1)
				$(".receipt_page > .now_In_key").text(A_in_keys[nownum + 1]);
			}
		})
		$("#receipt_before").on("click",function(){
			var nowinkey = $(".receipt_page > .now_In_key").text();
			var nownum = Number($(".receipt_page > .now_num").text());
			var length = A_in_keys.length;
			if(nownum > 0){
				PrintPageLoad2(A_in_keys[nownum - 1]);
				$(".receipt_page > .now_num").text(nownum - 1);
				$(".receipt_page > .now_In_key").text(A_in_keys[nownum - 1]);
			}
		})
		
		$("#receipt_print").on("click",function(){
			
			if(confirm("체크한 "+A_in_keys.length+"건의 배송건을 모두 완료처리하고\n해당 영수증들의 인쇄창을 표시합니다.\n계속하시겠습니까?")){
				
				for(let i=0; i<A_in_keys.length; i++){

					var receipt_data = {
						TYPE :'E',
						TARGET: A_in_keys[i],
						SUB_TARGET: '',
						PERCENT: A_table[A_in_keys[i]].DISCOUNT
					};
					$.ajax({
						type: "POST",
						url : "./discount_set.do",
						data: receipt_data,
						async: false,
			            success: function(datas){
			            }
					});
				}

            	alert("완료처리되었습니다. 인쇄창을 띄웁니다.");
				PrintPageLoadAll();
				startPrint2('m_container2');
			}
			
		})
		$("#all_receipt").on("click",function(){
			PrintPageLoadAll();
		})

		
	})
	
	window.addEventListener("keydown", (e) => {
		if($("#receipt_grayback").css("display") == 'block'){

			if(e.key == 'Enter'){ 
// 				startPrint('print_div');
			}
			else if(e.key == 'ArrowLeft'){
				$("#receipt_before").trigger("click");
			}
			else if(e.key == 'ArrowRight'){
				$("#receipt_after").trigger("click");
			}
		}
	});

	function PrintPageLoadAll(){

		$(".m_container2").empty();

		var tbodyData1 = "";
		for(let j=0; j<A_in_keys.length;j++){
		
		tbodyData1 += '<section id="section_date">';
		
		tbodyData1 += '<a href="logo">';
		tbodyData1 += '	<img src="./images/m_icon/logo_color.svg" alt="logo">';
		tbodyData1 += '</a>';

		tbodyData1 += '<div class="infoWrap">';

		tbodyData1 += '<table class="signiture">';
		tbodyData1 += '		<tr><th class="signiture_in">고객용/라오스';
		tbodyData1 += '		</th>';
		tbodyData1 += '		<th class="signiture_in">직원/라오스';
		tbodyData1 += '		</th></tr>';
		tbodyData1 += '</table>';
		tbodyData1 += '<div class="dateNotice rec">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">접수 마감일</a></h5>';
		tbodyData1 += '		<h1 class="dateTxt"><a href="#" id="r_arr_day">'+A_table[A_in_keys[j]].ARR_DAY+'</a></h1>';
		tbodyData1 += '	</div>	';
		tbodyData1 += '	<div class="infoCon indate eks">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">송장번호</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_ek">'+A_table[A_in_keys[j]].EK+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '<div class="infoCon people"> ';
		tbodyData1 += '	<h5 class="subTxt"><a href="#">수령인</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_rec_nm">'+A_table[A_in_keys[j]].REC_NM+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">박스수량</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_box_count">'+A_table[A_in_keys[j]].BOX_COUNT+'개</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon cost">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">물류비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_cost">$'+A_table[A_in_keys[j]].COST+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">할인</a></h5>';
		tbodyData1 += '	<h1 class="subTxt"><a href="#" id="r_discount">'+A_table[A_in_keys[j]].DISCOUNT+'%</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">할인적용비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_dis_cost1">$'+A_table[A_in_keys[j]].DIS_COST1+'</a></h1>';
		tbodyData1 += '	</div><br/>';
		if(A_table[A_in_keys[j]].FIRST_COST > 0){
			tbodyData1 += '	<div class="infoCon discount">';
			tbodyData1 += '		<h5 class="subTxt"><a href="#"><b>특별취급 물건</b></a></h5>';
			tbodyData1 += '	</div>';
			tbodyData1 += '	<div class="infoCon discount">';
			tbodyData1 += '		<h5 class="subTxt"><a href="#">특별취급 물건 비용</a></h5>';
			tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_first_cost">$'+A_table[A_in_keys[j]].FIRST_COST+'</a></h1>';
			tbodyData1 += '	</div>';
			tbodyData1 += '	<div class="infoCon discount">';
			tbodyData1 += '		<h5 class="subTxt"><a href="#">우선적용할인</a></h5>';
			tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_first_discount">'+A_table[A_in_keys[j]].FIRST_DISCOUNT+'%</a></h1>';
			tbodyData1 += '	</div>';
			tbodyData1 += '	<div class="infoCon discount">';
			tbodyData1 += '		<h5 class="subTxt"><a href="#">할인적용 비용</a></h5>';
			tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_dis_cost2">$'+A_table[A_in_keys[j]].DIS_COST2+'</a></h1>';
			tbodyData1 += '	</div><br/>';
		}
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">최종비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_total_cost">$'+A_table[A_in_keys[j]].TOTAL_COST+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '		<input type="hidden" class="R_IN_KEY" value="">';
		tbodyData1 += '</div>';
		tbodyData1 += '<h3 class="sectionMainTitle">';
		tbodyData1 += '    <a href="#">배송내역</a>';
		tbodyData1 += '</h3>';
		tbodyData1 += '<div class="table" Id="rable_0">';
		for(let i=0; i<A_table_Detail[A_in_keys[j]].length; i++ ){
			
			tbodyData1 += '<div class="tableCon">';
			tbodyData1 += '<h3 class="date"><a href="#">W*H*L('+A_table_Detail[A_in_keys[j]][i].WIDTH+'cm*'+A_table_Detail[A_in_keys[j]][i].HEIGHT+'cm*'+A_table_Detail[A_in_keys[j]][i].LENGTH+'cm) / 무게'+A_table_Detail[A_in_keys[j]][i].WEIGHT+'kg / 적용할인율 : '+A_table_Detail[A_in_keys[j]][i].USE_DISCOUNT+'%</a></h3>';
			tbodyData1 += '<h3 class="con"><a href="#">예상비용 : <span class="date">'+A_table_Detail[A_in_keys[j]][i].COST_TOTAL+'$</span></a></h3>';
			tbodyData1 += '</div>';
		}
		tbodyData1 += '</div>';
		tbodyData1 += '</section>';
		}
		$(".m_container2").append(tbodyData1);
	}
	function PrintPageLoad2(in_key){

		$(".m_container2").empty();
		var tbodyData1 = "";
		
		tbodyData1 += '<section id="section_date">';
		
		tbodyData1 += '<a href="logo">';
		tbodyData1 += '	<img src="./images/m_icon/logo_color.svg" alt="logo">';
		tbodyData1 += '</a>';

		tbodyData1 += '<div class="infoWrap">';

		tbodyData1 += '<table class="signiture">';
		tbodyData1 += '		<tr><th class="signiture_in">고객용/라오스';
		tbodyData1 += '		</th>';
		tbodyData1 += '		<th class="signiture_in">직원/라오스';
		tbodyData1 += '		</th></tr>';
		tbodyData1 += '</table>';
		tbodyData1 += '<div class="dateNotice rec">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">접수 마감일</a></h5>';
		tbodyData1 += '		<h1 class="dateTxt"><a href="#" id="r_arr_day">'+A_table[in_key].ARR_DAY+'</a></h1>';
		tbodyData1 += '	</div>	';
		tbodyData1 += '	<div class="infoCon indate eks">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">송장번호</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_ek">'+A_table[in_key].EK+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '<div class="infoCon people"> ';
		tbodyData1 += '	<h5 class="subTxt"><a href="#">수령인</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_rec_nm">'+A_table[in_key].REC_NM+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">박스수량</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_box_count">'+A_table[in_key].BOX_COUNT+'개</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon cost">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">물류비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_cost">$'+A_table[in_key].COST+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">할인</a></h5>';
		tbodyData1 += '	<h1 class="subTxt"><a href="#" id="r_discount">'+A_table[in_key].DISCOUNT+'%</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">할인적용비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_dis_cost1">$'+A_table[in_key].DIS_COST1+'</a></h1>';
		tbodyData1 += '	</div><br/>';
		if(A_table[in_key].FIRST_COST > 0){
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#"><b>특별취급 물건</b></a></h5>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">특별취급 물건 비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_first_cost">$'+A_table[in_key].FIRST_COST+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">우선적용할인</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_first_discount">'+A_table[in_key].FIRST_DISCOUNT+'%</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">할인적용 비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_dis_cost2">$'+A_table[in_key].DIS_COST2+'</a></h1>';
		tbodyData1 += '	</div><br/>';
		}
		tbodyData1 += '	<div class="infoCon discount">';
		tbodyData1 += '		<h5 class="subTxt"><a href="#">최종비용</a></h5>';
		tbodyData1 += '		<h1 class="subTxt"><a href="#" id="r_total_cost">$'+A_table[in_key].TOTAL_COST+'</a></h1>';
		tbodyData1 += '	</div>';
		tbodyData1 += '		<input type="hidden" class="R_IN_KEY" value="">';
		tbodyData1 += '</div>';
		tbodyData1 += '<h3 class="sectionMainTitle">';
		tbodyData1 += '    <a href="#">배송내역</a>';
		tbodyData1 += '</h3>';
		tbodyData1 += '<div class="table" Id="rable_0">';
		for(let i=0; i<A_table_Detail[in_key].length; i++ ){
			
			tbodyData1 += '<div class="tableCon">';
			tbodyData1 += '<h3 class="date"><a href="#">W*H*L('+A_table_Detail[in_key][i].WIDTH+'cm*'+A_table_Detail[in_key][i].HEIGHT+'cm*'+A_table_Detail[in_key][i].LENGTH+'cm) / 무게'+A_table_Detail[in_key][i].WEIGHT+'kg / 적용할인율 : '+A_table_Detail[in_key][i].USE_DISCOUNT+'%</a></h3>';
			tbodyData1 += '<h3 class="con"><a href="#">예상비용 : <span class="date">'+A_table_Detail[in_key][i].COST_TOTAL+'$</span></a></h3>';
			tbodyData1 += '</div>';
		}
		tbodyData1 += '</div>';
		tbodyData1 += '</section>';
			$(".m_container2").append(tbodyData1);
	}
	
	var contents;
	var retBody;
	
// 프린트하고 싶은 영역의 id 값을 통해 출력 시작
function startPrint2(div_id) {
// 	prtContent = document.getElementById(div_id);
// 	window.onbeforeprint = beforePrint;
// 	window.onafterprint = afterPrint;
// 	window.print();

	printJS({
		printable: div_id,
		type: 'html',
		css: "css/3.Manager/printstyle2.css",
    });
}


</script>
</html>