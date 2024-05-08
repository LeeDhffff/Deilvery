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
	tr{
  -webkit-user-select:none;
  -moz-user-select:none;
  -ms-user-select:none;
  user-select:none;
}
출처: https://fresh-mint.tistory.com/entry/css-드래그-방지 [민트코딩:티스토리]
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
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Out_Day" onchange="ChangeSearch();" placeholder="출항일을 입력해주세요">
                            </div>
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Rec_Nm" onchange="ChangeSearch();" placeholder="수령인을 입력해주세요">
                            </div>
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Rec_Phone" onchange="ChangeSearch();" placeholder="전화번호를 입력해주세요">
                            </div>
                        </div>
                        <div class="triple">
                            <div class="inputWrap">
                                <select name="pickup" onchange="ChangeSearch();" id="S_Pickup">
                                    <option value="">픽업지를 선택하세요</option>
                                    <option value="1">본사</option>
                                    <option value="2">하우창고</option>
                                    <option value="3">지방배송</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                                <select name="pickup" onchange="ChangeSearch();" id="S_Service">
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
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id = "Delivery_Table">
                                <thead>
                                    <tr>
<!--                                         <th> -->
<!--                                         <input type="checkbox" class="List_Check All"> -->
<!--                                         </th> -->
                                        <th>출항일</th>
                                        <th>수령인</th>
                                        <th>픽업지</th>
                                        <th>배송현황</th>
                                        <th>배송완료 여부</th>
                                        <th>배송서비스</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
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

	console.log(level);
 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
					location.href = "Main.do";
			   }
			}
		

		$('#S_Out_Day').datepicker(
				{
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
				    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
				    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
					dateFormat : 'yy-mm-dd',
				});
// 		$('#S_Out_Day').datepicker('setDate','today');

		// 체크박스 트리거
		
		$(".List_Check.All").on("click",function(){
			if($(this).prop("checked") == true){
				$(".List_Check.sub").prop("checked",true);
			}
			else{
				$(".List_Check.sub").prop("checked",false);	
			}
		});
		

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

		

		/* 인쇄페이지 열기(팝업) */
		$(".bill").on("click",function(){
			
			if($(".List_Check.sub:checked").length <= 0){	
				alert("출력할 항목을 선택해주세요.")
			}
			else{
				$("#print_table_H1").empty();
				$("#print_table_H2").empty();
				var StartIn_key = "";
				var checkNot = 0;
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
										
									var HiddenPrint = "";
									HiddenPrint += '<tbody class="'+A_result[0].IN_KEY+'">';
									for(let i=0; i<D_result.length; i++){
										
										var cost = 0;
										var lncost = Math.round((D_result[i].WIDTH * D_result[i].LENGTH * D_result[i].HEIGHT * 0.00022) * 100) / 100;
										var kgcost = D_result[i].WEIGHT * 1.5;
										if(kgcost >= lncost * 1.5){
											cost = kgcost;
										}
										else{
											cost = Math.round(lncost * 1.5);
										}
										
										HiddenPrint += '<tr>';
										HiddenPrint += '<td class="rec_txt">'+A_result[0].REC_TXT+'</td>';
										HiddenPrint += '<td class="weight">'+D_result[i].WEIGHT+'</td>';
										HiddenPrint += '<td class="width">'+D_result[i].WIDTH+'</td>';
										HiddenPrint += '<td class="length">'+D_result[i].LENGTH+'</td>';
										HiddenPrint += '<td class="height">'+D_result[i].HEIGHT+'</td>';
										HiddenPrint += '<td class="weight2">'+lncost+'</td>';
										HiddenPrint += '<td class="cost">'+cost+'</td>';
										HiddenPrint += '<td class="weight3">'+D_result[i].WEIGHT+'</td>';
										HiddenPrint += '<td>10$</td>';
										HiddenPrint += '</tr>';
									};
									HiddenPrint += '</tbody>';
									$("#print_table_H2").append(HiddenPrint);

									var HiddenMain = "";
									HiddenMain += '<tr class="'+A_result[0].IN_KEY+'">';
									HiddenMain += '<td class="rec_nm">'+A_result[0].REC_NM+'</td>';
									HiddenMain += '<td class="rec_hou">'+A_result[0].REC_HOU+'</td>';
									HiddenMain += '<td class="rec_phone">'+A_result[0].REC_PHONE+'</td>';
									HiddenMain += '<td class="cre_day">'+A_result[0].CRE_DAY.substr(0,4)+'</td>';
									HiddenMain += '<td class="count">'+D_result.length+'</td>';
									HiddenMain += '<td class="arr_day">'+A_result[0].ARR_DAY.substr(5,2)+'</td>';
									HiddenMain += '<td class="in_key">'+A_result[0].IN_KEY+'</td>';
									HiddenMain += '<td class="tr_cost">'+D_result.length * 10 + '$</td>';
									var qrTxt = "";
									if(D_result.length > 0){

										const cn1 = D_result[0].COST.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
										HiddenMain += '<td class="cost">'+cn1+'</td>';
										HiddenMain += '<td class="ek">'+D_result[0].SJ_KEY.substring(0,3)+'</td>';

//	 						        	const qrInfoArr = new Array();
						        		qrTxt = "수령인 : "+A_result[0].REC_NM+"\n연락처 : "+A_result[0].REC_PHONE+"\n픽업지 : "+A_result[0].REC_TARGET;	        		
//	 					        		qrInfoArr.push({qrText : qrTxt, qrId : "qrCode_"+index});
	// 									$("#EXCEL_QR1").empty();
	// 					        		qrCreate("EXCEL_QR1", qrTxt);	      
									}
									else{
										qrTxt = "";
										HiddenMain += '<td class="cost"></td>';
										HiddenMain += '<td class="ek"></td>';
									}
									HiddenMain += '<td class="qrTxt">'+qrTxt+'</td>';
									HiddenMain += '<td class="qr" id="qr_'+A_result[0].IN_KEY+'"></td>';
									HiddenMain += '</tr>';
									
									$("#print_table_H1").append(HiddenMain);
									$("#qr_" + A_result[0].IN_KEY).empty();
									if(qrTxt != ""){
										qrCreate("qr_" + A_result[0].IN_KEY, qrTxt);	
									}
									if(StartIn_key == ""){
										StartIn_key = A_result[0].IN_KEY;
									}

									}
									else{
										checkNot++;
									}
									// 					        		qrCreate("EXCEL_QR1", qrTxt);
									

					            }
							});
			            }
					});
				}
			
				
				PrintPageLoad(StartIn_key);
				$(".now_In_key").text(StartIn_key);
				$(".now_num").text(0);
				
				if(checkNot > 0){
					alert(checkNot + "건의 배송건은 박스를 입력되지 않아 창에 나타나지 않습니다.")
				}
				$("#print_grayback").show();
			}
			
		})
		
		ChangeSearch();
		

		/* 테이블 목록 클릭시 */
		$(document).on("click","#Delivery_Table > tbody > tr",function(event){
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
					console.log($(".tron").length);
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
			
		})
		
		
		$(document).on("click",".modify",function(){

// 			if($(this).attr("class") != "checktd"){
			var nc = $(this).parents("tr").find(".in_key").val();
			

			/* 미완료 배송신청으로 이동 */
			location.href = "adminDeliveryRegistMain.do?ik=" +nc;
// 			}
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

					tbodyData += "<tr class='tr"+i+"' cnum = '"+i+"''>";
					tbodyData += "<td><input type='hidden' class='in_key' value='"+result[i].IN_KEY+"'>"+result[i].OUT_DAY+"</td>";
					tbodyData += "<td>"+result[i].REC_NM+"</td>";
					tbodyData += "<td>"+result[i].REC_TARGET+"</td>";
					tbodyData += "<td>"+result[i].NOW_DELIVERY+"</td>";
					tbodyData += "<td>"+result[i].MAXCHK+"</td>";
					tbodyData += "<td>"+result[i].SERVICE+"</td>";
					tbodyData += "<td><input type='checkbox' name='List_Check' class='List_Check sub' style='display:none;'><button class='modify'><img src='./images/pc_icon/modify_black.svg'></button></td>";
					
					tbodyData += "</tr>";
				}

				$("#Delivery_Table > tbody").append(tbodyData);
				
            }
		})
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
</script>
</html>