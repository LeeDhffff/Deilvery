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
    <title>배송조회 - 관리자</title>
</head>

<style type="text/css">
	.tron{
		background: #ffecdb;
		border: 2px solid black;
	}
	.modify{
		background: white;
		width:40px;
		height:30px;
		border: 1px solid #ffaa40;
	    padding: 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	.modify:hover{
		background: #ffaa40;
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
	.link:hover{
		background: #ffaa40;
	}
	
	#Delivery_Table > tbody > tr{
  -webkit-user-select:none;
  -moz-user-select:none;
  -ms-user-select:none;
  user-select:none;
}
.totalh4{
	display:flex;
	margin-right:100px;
}
.totalh4 > h4{
	margin-left:10px;
	margin-right:10px;
    font-size: 20px;
    width: 130px;
}
.totalh4 > h4 > span{
	color: red;
}
.checkAllth{
    display: flex;
    justify-content: center;
}
input[type=checkbox]{
    width: 20px;
    height: 20px;
    accent-color: red;
}
#checkAll{

    margin-right: 5px;
}
.checkAll{
    font-weight: bold;
    background: none;
}
.searchButton{
	width: 35px;
    height: 35px;
    background: white;
    border: 1px solid var(--main-color);
    border-radius: 3px;
    background-image: url(./images/pc_icon/search_orange.svg);
    background-size: cover;
    cursor: pointer;
}
.searchButton:hover{
	background: var(--main-color);
    background-image: url(./images/pc_icon/search_white.svg);
}
.searchButton > img{
	width: 100%;
	height: 100%;
}
.outdayBox{
	position:absolute;
	width: 100%;
	height: 100px;
	background:white;
	border: 1px solid black;
 	display:none; 
	z-index: 1;
    overflow-y: scroll;
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
	width: 100%;
	text-align:center;
	height: 25px;
	line-height: 25px;
}
.outdays:hover{
	background:#ffe4c4;
}
.tdek{
	color: red;
/*     font-weight: bold; */
}
.target_zero{
	background: #ffc4c4;
}

.laoswrap{
	text-align: right;
}	
.laoswrap > label{
	font-size: 15px;
    position: relative;
    top: -4.5px;
}
#laos{
	margin: 10px 20px 0px 5px;
}
#mobile{
	margin: 10px 20px 0px 5px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/3.Manager/AppList_style.css">   

<!-- qrCode.js import -->
<script src="js/qrcode.js"></script>
    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/3.Manager/Deilivery_List_index.js"></script>

</head>

<body>
    <div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
		<jsp:include page="../print.jsp"></jsp:include>
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">배송조회</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">배송검색 필터</a>
                        <button class="searchButton">
<!--                         <img src="./images/pc_icon/search_orange.svg"> -->
                        </button>
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
                                <input type="text" class="Search days" id="S_Out_Day" placeholder="마감일을 입력해주세요" autocomplete="off" onkeyup="pressenters()">
                                <div class="outdayBox">
                                	<div class="outdayTitle">마감일 선택하기</div>
                                </div>
                            </div>
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Rec_Nm" placeholder="수령인을 입력해주세요" autocomplete="off" onkeyup="pressenters()">
                            </div>
                            <div class="inputWrap">
                                <input type="text" oninput="oninputPhone(this)" maxlength="13" class="Search" id="S_Rec_Phone" placeholder="전화번호를 입력해주세요" autocomplete="off" onkeyup="pressenters()">
                            </div>
                        </div>
                        <div class="triple">
                            <div class="inputWrap">
                                <select name="pickup" id="S_Pickup">
                                    <option value="">픽업지를 선택하세요</option>
                                    <option value="0">사용자 미선택</option>
                                    <option value="1">본사</option>
                                    <option value="2">하우창고</option>
                                    <option value="3">택배 서비스</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                                <select name="pickup" id="S_Service">
                                    <option value="">배송서비스 유무를 선택하세요</option>
                                    <option value="Y">신청</option>
                                    <option value="N">미신청</option>
                                </select>
                            </div>
                                                        
                        </div>
                    </div>

                    <h3 class="conMainTitle">
                        <a href="#">배송 리스트</a>
                        <div class="buttonWrap">
                        	<div class="totalh4">
                        	<h4>CBM : <span class="total_cbm"></span></h4>
                        	<h4>무게 : <span class="total_weight"></span></h4>
                        	<h4>총 박스 수 : <span class="total_box"></span></h4>
                            </div>
                            <button class="bill">
                                <a href="#">
                                    <img src="./images/pc_icon/calculator.svg" alt="영수증출력하기">
                                </a>
                            </button>
<!--                             <button class="excel"> -->
<!--                                 <a href="#"> -->
<!--                                     <img src="./images/pc_icon/down_black.svg" alt="영수증출력하기"> -->
<!--                                 </a> -->
<!--                             </button> -->
                        </div>                        
                    </h3>                                  
                    <div class="laoswrap">
                    <label for="laos">라오스어로 링크복사</label><input type="checkbox" name="laos" id="laos">    
                    <label for="mobile">모바일로 링크복사</label><input type="checkbox" name="mobile" id="mobile">      
                    </div>                                
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id = "Delivery_Table">
                                <thead>
                                    <tr>
                                        <th>
                                        <div class="checkAllth">
                                        <input type="checkbox" id="checkAll" class="List_Check All">
                                        <label for="checkAll"><button class="checkAll">All</button></label>
                                        </div>
                                        </th>
                                        <th>송장번호</th>
                                        <th>마감일</th>
                                        <th>수령인</th>
                                        <th>픽업지</th>
                                        <th>배송현황</th>
                                        <th>배송완료 여부</th>
                                        <th>배송서비스</th>
                                        <th class="modifyth">수정하기</th>
                                        <th>링크복사</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                        <input type="text" id="copy_link" style="display:none;">
                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
    
   	
   	
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var auth = '${M_AUTH}';

// 	console.log(level);
 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
					location.href = "Main.do";
			   }
			}
		if(auth == 'R'){
			$(".modifyth").hide();
		}		
		else if(auth == 'D'){
			location.href = "Main.do";
		}

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
		
		outdaybox();


		// 체크박스 트리거
				
		$(".checkAll").on("click",function(){
			$(".List_Check.All").trigger("click");
		})
		
		

		

		/* 인쇄페이지 열기(팝업) */
		$(".bill").on("click",function(){
// 			startLoading(Excelpopup());
			Excelpopup();

// 			stopLoading();
		})
		
// 		ChangeSearch();
		$(".searchButton").on("click",function(){
			ChangeSearch();
		})
		
		$(document).on("click",".outdays",function(){
			$("#S_Out_Day").val($(this).text());
	        daybox = 0;
	        $(".outdayBox").hide();
		})

		$(".List_Check.All").on("click",function(){
			if($(this).prop("checked") == true){
				$(".List_Check.sub").prop("checked",true);
				$("#Delivery_Table > tbody > tr").removeClass("tron");
				$("#Delivery_Table > tbody > tr").addClass("tron");
			}
			else{
				$(".List_Check.sub").prop("checked",false);	
				$("#Delivery_Table > tbody > tr").removeClass("tron");
			}
		});
		
		$(document).on("click","td.sub",function(event){
			if($(event.target).attr("class") != "List_Check sub"){
				$(this).find(".List_Check.sub").trigger("click");	
			}
		});
		
		$(document).on("click",".List_Check.sub",function(){
			if($(this).prop("checked") == true){
				if($("input:checkbox[name=List_Check]:checked").length == $("input:checkbox[name=List_Check]").length){
					$(".List_Check.All").prop("checked",true);
				}
				$(this).parents("tr").addClass("tron");
			}
			else{
				$(".List_Check.All").prop("checked",false);	
				$(this).parents("tr").removeClass("tron");	
			}
		});
		
		/* 테이블 목록 클릭시 */
		$(document).on("click","#Delivery_Table > tbody > tr",function(event){
			if($(event.target).attr("class") != "List_Check sub" && $(event.target).hasClass("sub") == false){
				if(event.shiftKey == true){
					var length = $(".tron").length;
					
					if(length<=0){
						var endnum = Number($(this).attr("cnum"));
						for(let i = 0; i <= endnum; i++){
							$(".tr" + i).addClass("tron");
							$(".tr" + i).find(".List_Check").prop("checked",true);
						}
					}
					else{
						if($($(".tron")[length-1]).attr("cnum") < $(this).attr("cnum")){
							
							var startnum = Number($($(".tron")[length-1]).attr("cnum"));
							var endnum = Number($(this).attr("cnum"));
							
							for(let i = startnum; i <= endnum; i++){
								$(".tr" + i).addClass("tron");
								$(".tr" + i).find(".List_Check").prop("checked",true);
							}
							
						}
						else if($($(".tron")[0]).attr("cnum") > $(this).attr("cnum")){
							
							var startnum = Number($(this).attr("cnum"));
							var endnum = Number($($(".tron")[0]).attr("cnum"));
	
							for(let i = startnum; i <= endnum; i++){
								$(".tr" + i).addClass("tron");
								$(".tr" + i).find(".List_Check").prop("checked",true);
							}
						}
					}
				}
				else if(event.ctrlKey == true){
	
					if($(this).find(".List_Check").prop("checked") == false){
						$(this).addClass("tron");
						$(this).find(".List_Check").prop("checked",true);
					}
					else{
						$(this).removeClass("tron");
						$(this).find(".List_Check").prop("checked",false);
					}
				}
				else{
					if($(this).find(".List_Check").prop("checked") == false){
						$("#Delivery_Table > tbody > tr").removeClass("tron");
						$("#Delivery_Table > tbody > tr").find(".List_Check").prop("checked",false);
						$(this).addClass("tron");
						$(this).find(".List_Check").prop("checked",true);
					}
					else{
						if($(".tron").length>=2){
							
							$("#Delivery_Table > tbody > tr").removeClass("tron");
							$("#Delivery_Table > tbody > tr").find(".List_Check").prop("checked",false);	
							$(this).addClass("tron");
							$(this).find(".List_Check").prop("checked",true);
							
						}
						else{
	
							$("#Delivery_Table > tbody > tr").removeClass("tron");
							$("#Delivery_Table > tbody > tr").find(".List_Check").prop("checked",false);	
							
						}
					}	
				}
				
				if($("input:checkbox[name=List_Check]:checked").length == $("input:checkbox[name=List_Check]").length){
					$(".List_Check.All").prop("checked",true);
				}
				else{
					$(".List_Check.All").prop("checked",false);
				}
			}
// 			cbmBox();
		})
		
		
		$(document).on("click",".modify",function(){

// 			if($(this).attr("class") != "checktd"){
			var nc = $(this).parents("tr").find(".in_key").val();
			

			/* 미완료 배송신청으로 이동 */
			location.href = "adminDeliveryRegistMain.do?ik=" +nc;
// 			}
		})
		$(document).on("click",".link",function(){
			$("#copy_link").show();
			var nc = $(this).parents("tr").find(".in_key").val();
			if(window.location.host == 'localhost:8080'){
				if($("#laos").prop("checked") == true){
					if($("#mobile").prop("checked") == false){
						$("#copy_link").val("localhost:8080/Delivery/lao/Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
					else{
						$("#copy_link").val("localhost:8080/Delivery/lao/Mobile_Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
				}
				else{
					if($("#mobile").prop("checked") == false){
						$("#copy_link").val("localhost:8080/Delivery/Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
					else{
						$("#copy_link").val("localhost:8080/Delivery/Mobile_Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
				}
			}
			else if(window.location.host == 'ek-logis.com'){

				if($("#laos").prop("checked") == true){
					if($("#mobile").prop("checked") == false){
						$("#copy_link").val("ek-logis.com/lao/Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
					else{
						$("#copy_link").val("ek-logis.com/lao/Mobile_Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
				}
				else{
					if($("#mobile").prop("checked") == false){
						$("#copy_link").val("ek-logis.com/Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
					else{
						$("#copy_link").val("ek-logis.com/Mobile_Delivery_Search_A.do?ik="+nc);
						document.getElementById("copy_link").select();
						document.execCommand("copy");
					}
				}
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
					
					if(result[i].REC_TARGET2 == '0'){
						tbodyData += "<tr class='tr"+i+" target_zero' cnum = '"+i+"''>";
					}
					else{
						tbodyData += "<tr class='tr"+i+"' cnum = '"+i+"''>";
					}
					tbodyData += "<td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>";
					tbodyData += "<td class='tdek'>"+result[i].EK+"</td>";
					tbodyData += "<td><input type='hidden' class='in_key' value='"+result[i].IN_KEY+"'>"+result[i].OUT_DAY+"</td>";
					tbodyData += "<td>"+result[i].REC_NM+"</td>";
					tbodyData += "<td>"+result[i].REC_TARGET+"</td>";
					tbodyData += "<td>"+result[i].NOW_DELIVERY+"</td>";
					tbodyData += "<td>"+result[i].MAXCHK+"</td>";
					tbodyData += "<td>"+result[i].SERVICE+"</td>";
					if(auth != 'R'){
						tbodyData += "<td><button class='modify'><img src='./images/pc_icon/modify_black.svg'></button></td>";
					}
					tbodyData += "<td><button class='link'><img src='./images/pc_icon/Link.svg'></button></td>";
					tbodyData += "<input type='hidden' class='tr_cbm' value='"+result[i].CBM+"' >";
					tbodyData += "<input type='hidden' class='tr_weight' value='"+result[i].WEIGHT+"' >";
					tbodyData += "<input type='hidden' class='tr_cost' value='"+result[i].COST+"' >";
					tbodyData += "<input type='hidden' class='tr_count' value='"+result[i].COUNT+"' >";
					
					tbodyData += "</tr>";
				}

				$("#Delivery_Table > tbody").append(tbodyData);
				cbmBox();
            }
		})
	}
	/* cbm, 총 박스 수 계산기 */
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
// 			console.log(cbm,total_cbm);
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
	function Excelpopup(){
		if($(".List_Check.sub:checked").length <= 0){	
			alert("출력할 항목을 선택해주세요.")
		}
		else{
			$("#print_table_H1").empty();
			var StartIn_key = "";
			var checkNot = 0;
			var checkYes = 0;
			sub_table = {};
			main_table = {};
			in_keys = [];
			var group_sub_table = [];
			for(let prt = 0; prt < $(".List_Check.sub:checked").length; prt++){
				
				var deliverydata = {
						IN_KEY : $($(".List_Check.sub:checked")[prt]).parents("tr").find(".in_key").val(),
				};
				$.ajax({
					type: "POST",
					url : "./Delivery_receipt.do",
					data: deliverydata,
					async: false,
		            success: function(datas){
						
						$.ajax({
							type: "POST",
							url : "./Delivery_receipt_D.do",
							data: deliverydata,
							async: false,
				            success: function(datas2){
								var A_result = JSON.parse(datas);
								var D_result = JSON.parse(datas2);
								
								if(D_result.length > 0){
								
								var group_sub_table = [];
								var cost = 0;
								for(let i=0; i<D_result.length; i++){
									
									//용적중량(lncost)와 kgcost 비교해서 기준가(cost) 계산하기
// 									var cost = 0;
									var lncost = Math.round((D_result[i].WIDTH * D_result[i].LENGTH * D_result[i].HEIGHT * 0.00022) * 100) / 100;
// 									var kgcost = D_result[i].WEIGHT * 1.5;
// 									if(kgcost < 10 && lncost * 1.5 < 10){
// 										cost = 10;
// 									}
// 									else if(kgcost >= lncost * 1.5){
// 										cost = kgcost;
// 									}
// 									else{
// 										cost = Math.round(lncost * 1.5);
// 									}
									cost += Math.round(D_result[i].COST);
									//서브테이블 값
									var dk = {
											IN_KEY:A_result[0].IN_KEY,
											REC_TXT:A_result[0].REC_TXT,
											WEIGHT:D_result[i].WEIGHT,
											WIDTH:D_result[i].WIDTH,
											LENGTH:D_result[i].LENGTH,
											HEIGHT:D_result[i].HEIGHT,
											LNCOST:lncost,
											COST: Math.round(D_result[i].COST),
											WEIGHT3:(lncost < D_result[i].WEIGHT) ? D_result[i].WEIGHT
													:lncost
											
									}
									group_sub_table.push(dk);
								};
								sub_table[A_result[0].IN_KEY] =group_sub_table;
								
								//qr 저장고
								var HiddenMain = "";
								HiddenMain += '<tr>';
								var qrTxt = "";
								
								// 메인 값
								var mk = {
										IN_KEY:			A_result[0].IN_KEY,
										REC_NM:			A_result[0].REC_NM,
										REC_ADDRESS:		A_result[0].REC_HOU,
										REC_PHONE:		A_result[0].REC_PHONE,
										YEAR:			A_result[0].CRE_DAY.substr(0,4),
										COUNT:			D_result.length,
										OUT_DAY:		A_result[0].ARR_DAY + "일 마감",
										MONTH:		A_result[0].ARR_DAY.substr(5,2),
										DISCOUNT: A_result[0].DISCOUNT + "%"
								}
								
								if(D_result.length > 0){
									cost = Math.round(cost * 100) / 100;
									const cn1 = cost.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
									const cn2 = (cn1.indexOf(",") > 0) ? cn1.replace(",","")
												:cn1;
									
									mk["COST"] ="$" + cn1;
									
									if(Math.round((Number(cn2) - Math.round(Number(cn2) * A_result[0].DISCOUNT / 100))) >= 10){
										mk["DIS_COST"] = "$" + (Math.round(Number(cn2) * A_result[0].DISCOUNT / 100 ));
//	 									console.log(Number(cn1) - (Number(cn1) * A_result[0].DISCOUNT / 100));
										mk["TR_COST"] = "$" + (Math.round((Number(cn2) - Math.round(Number(cn2) * A_result[0].DISCOUNT / 100))));
									}
									else{
										mk["DIS_COST"] = (((Math.round(Number(cn2) * A_result[0].DISCOUNT / 100 ))-10) > 0) ? "$" + ((Math.round(Number(cn2) * A_result[0].DISCOUNT / 100 ))-10)
														:  "$0";
//	 									console.log(Number(cn1) - (Number(cn1) * A_result[0].DISCOUNT / 100));
										mk["TR_COST"] = "$10";
									}
									mk["EK"] = D_result[0].SJ_KEY.split("-")[0];
									
// 						        	const qrInfoArr = new Array();
// 					        		qrTxt = "수령인 : "+A_result[0].REC_NM+"\n연락처 : "+A_result[0].REC_PHONE+"\n픽업지 : "+A_result[0].REC_TARGET;	        		
// 					        		qrInfoArr.push({qrText : qrTxt, qrId : "qrCode_"+index});
// 									$("#EXCEL_QR1").empty();
// 					        		qrCreate("EXCEL_QR1", qrTxt);	      
								}
								else{
									mk["COST"] = "";
									mk["TR_COST"] = "";
									mk["DIS_COST"] = "";
									mk["EK"] = "";
								}
// 								HiddenMain += '<td class="qr" id="qr_'+A_result[0].IN_KEY+'"></td>';
								HiddenMain += '</tr>';
// 								mk["qrTxt"] = qrTxt;

								main_table[A_result[0].IN_KEY] =mk;
								in_keys.push(A_result[0].IN_KEY);
								
								$("#print_table_H1").append(HiddenMain);
// 								$("#qr_" + A_result[0].IN_KEY).empty();
// 								if(qrTxt != ""){
// 									qrCreate("qr_" + A_result[0].IN_KEY, qrTxt);	
// 								}
								if(StartIn_key == ""){
									StartIn_key = A_result[0].IN_KEY;
								}
									checkYes++;
								}
								else{
									checkNot++;
								}
								// 					        		qrCreate("EXCEL_QR1", qrTxt);
								

				            }
						});
		            },
				});
			}
		
			if(checkYes != 0){
				PrintPageLoad(StartIn_key);
				$(".now_In_key").text(StartIn_key);
				$(".now_num").text(0);
				
				if(checkNot > 0){
					alert(checkNot + "건의 배송건은 박스가 등록되지 않아 창에 나타나지 않습니다.")
				}
				$("#print_grayback").show();
			}
			else{
				alert("선택하신 " + checkNot + "건의 배송건은 박스가 등록되지 않아 엑셀 출력이 불가합니다.")
			}
		}
// 		stopLoading();
	}
	
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	/* qrCode 생성 함수 (JANG) */
   	function qrCreate(id, txt){ 
   		var qrcode = new QRCode(id, {
   		    text: txt,
   		    width: 100,
   		    height: 100,
   		    colorDark : "#000000",
   		    colorLight : "#ffffff",
   		    correctLevel : QRCode.CorrectLevel.H
   		});
   	}
	
	function pressenters(){
		if(window.event.keyCode==13){
			ChangeSearch();
		}
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
	
// 	dayes.onblur = function(e){

// 		console.log(e);
// 		$(".outdayBox").hide();
// 	}
</script>
</html>