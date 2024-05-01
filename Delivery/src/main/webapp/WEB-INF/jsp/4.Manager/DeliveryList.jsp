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
				$("#print_grayback").show();
				
				var deliverydata = {
						IN_KEY : $($(".List_Check.sub:checked")[0]).parents("tr").find(".in_key").val(),
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
								console.log(A_result,D_result);
				            	
								$("#EXCEL_NAME").text(A_result[0].REC_NM);
								$("#EXCEL_ADDRESS").text(A_result[0].REC_HOU);
								$("#EXCEL_PHONE").text(A_result[0].REC_PHONE);
								$("#EXCEL_YEAR").text(A_result[0].CRE_DAY.substr(0,4));
								$("#EXCEL_COUNT").text(D_result.length);
								$("#EXCEL_MONTH").text(A_result[0].ARR_DAY.substr(5,2));
								$("#EXCEL_IN_KEY").val(A_result[0].IN_KEY);
								
								$("#EXCEL_TR_COST").text(D_result.length * 10 + "$");
								
								if(D_result.length > 0){

									const cn1 = D_result[0].COST.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
									$("#EXCEL_COST").text(cn1);
									$("#EXCEL_EK").text(D_result[0].SJ_KEY.substring(0,3));

// 						        	const qrInfoArr = new Array();
					        		var qrTxt = "수령인 : "+A_result[0].REC_NM+"\n연락처 : "+A_result[0].REC_PHONE+"\n픽업지 : "+A_result[0].REC_TARGET;	        		
// 					        		qrInfoArr.push({qrText : qrTxt, qrId : "qrCode_"+index});
									$("#EXCEL_QR1").empty();
					        		qrCreate("EXCEL_QR1", qrTxt);	      
								}
								else{
									$("#EXCEL_COST").text("");
									$("#EXCEL_EK").text("");
								}
								
								$("#print_table_2 > tbody").empty();
								var PrintString = '';
								
								for(let i=0; i<D_result.length; i++){
									PrintString += '<tr class="tr'+i+'">';
									PrintString += '<td>'+A_result[0].REC_TXT+'</td>';
									PrintString += '<td>'+D_result[i].WEIGHT+'</td>';
									PrintString += '<td>'+D_result[i].WIDTH+'</td>';
									PrintString += '<td>'+D_result[i].LENGTH+'</td>';
									PrintString += '<td>'+D_result[i].HEIGHT+'</td>';
									PrintString += '<td>'+D_result[i].WEIGHT+'</td>';
									PrintString += '<td>'+D_result[i].COST+'</td>';
									PrintString += '<td>'+D_result[i].WEIGHT+'</td>';
									PrintString += '<td>10$</td>';
									PrintString += '</tr>';
									
								};
								$("#print_table_2 > tbody").append(PrintString);
				            }
						});
		            }
				});
			}
			
		})
		
		ChangeSearch();
		

		/* 테이블 목록 클릭시 */
		$(document).on("click","#Delivery_Table > tbody > tr",function(){
			if($(this).find(".List_Check").prop("checked") == false){
				$("#Delivery_Table > tbody > tr").removeClass("tron");
				$(this).addClass("tron");
				$(this).find(".List_Check").prop("checked",true);
			}
			else{
				$("#Delivery_Table > tbody > tr").removeClass("tron");
				$(this).find(".List_Check").prop("checked",false);	
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

					tbodyData += "<tr>";
					tbodyData += "<td><input type='hidden' class='in_key' value='"+result[i].IN_KEY+"'>"+result[i].OUT_DAY+"</td>";
					tbodyData += "<td>"+result[i].REC_NM+"</td>";
					tbodyData += "<td>"+result[i].REC_TARGET+"</td>";
					tbodyData += "<td>"+result[i].NOW_DELIVERY+"</td>";
					tbodyData += "<td>"+result[i].MAXCHK+"</td>";
					tbodyData += "<td>"+result[i].SERVICE+"</td>";
					tbodyData += "<td><input type='radio' name='List_Check' class='List_Check sub' style='display:none;'><button class='modify'><img src='./images/pc_icon/modify_black.svg'></button></td>";
					
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