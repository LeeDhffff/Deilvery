<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 물류접수</title>
    
    <!-- jQuery import -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
    
	<!-- qrCode.js import -->
    <script src="js/qrcode.js"></script>
    
    <!-- css import -->
    <link href="css/adminDeliverRegist/common.css" rel="stylesheet" type="text/css">
    <link href="css/adminDeliverRegist/style.css" rel="stylesheet" type="text/css">
    
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">

    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
    
    <!-- import print.js -->
    <script src="https://printjs-4de6.kxcdn.com/print.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://printjs-4de6.kxcdn.com/print.min.css">
  
        
</head>
<body>
    <div class="outWrap">
        <div class="outCon">
            <div class="outTitleWrap">
                <h3 class="outTitle" onclick="fnPrint();">출력하기</h3>	
                <h3 class="icon cancelout">
                    <a href="#">
                        <img src="images/delivery/pc_icon/cancel_black.svg" alt="#">
                    </a>
                </h3>
            </div>
            <div id="contentWrap">
            </div>
<!--             <div class="outHeader"> -->
<!--                 <div class="left" id="qrCode"> -->
<!--                     <img src="images/delivery/pc_icon/QR.svg" alt="#" style="width:62px; height: 62px;"> -->
<!--                 </div> -->
<!--                 <div class="right"> -->
<!--                     <div class="logo"> -->
<!--                         <img src="images/delivery/pc_icon/logo_color.svg" alt="#"> -->
<!--                     </div> -->
<!--                     <div class="bottom" style="display: flex;"> -->
<!--                         <div> -->
<!--                             <h5>라오스·한국물류</h5> -->
<!--                             <h5>라오스어샬라샬라</h5> -->
<!--                         </div> -->
<!--                         <div> -->
<!--                             <h5>카카오로고</h5> -->
<!--                             <h5>EKLAOS</h5> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--             <div class="outBody"> -->
<!--                 <p>접수번호 :<br> -->
<!--                    접수번호 : -->
<!--                 </p> -->
<!-- 			접수번호 동적 생성 설정 영역       -->
<!--                 <h1>EK</h1> -->
<!--             </div> -->
<!--             <div class="outFoot"> -->
<!--                 <div class="top"> -->
<!--             접수코드 동적 생성 설정 영역 -->
<!--                     <h5>No.EK18_231212-10</h5> -->
<!--                     <h5>No.EK18_231212-10</h5> -->
<!--                 </div> -->
<!--                 <div class="bottom"> -->
<!--                     <h5>Tel.020-1234-1234</h5> -->
<!--                     <h5>Tel.020-1234-1234</h5> -->
<!--                 </div>                   -->
<!--             </div>  -->
        </div>
    </div>

    <div class="container">
    <jsp:include page="../common.jsp"></jsp:include>
		 
        <section>        	
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                <c:choose>
					<c:when test="${result.inKey ne '' && not empty result.inKey }">
						<a href="#">물류접수-수정</a>
					</c:when>
					<c:otherwise>
						<a href="#">물류접수</a>               			
					</c:otherwise>
				</c:choose>
                </h1>
                <div class="conWrap">
                	<form id="formData" name="formData">
                	<input type="hidden" value="${result.inKey}" id="inKey" name="inKey" />
                	<input type="hidden" value="${result.memId}" id="memId" name="memId" />
                	<input type="hidden" value="${result.memId}" id="memId" name="memId" />
                    <div class="wrap">
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">신청일자<span>*</span></a></h5>
                            <input type="text" id="creDay" name="creDay" placeholder="날짜를 선택해주세요.">
                        </div>
                        <div class="double">
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">수령인<span>*</span></a></h5>
                                <input type="text" id="recNm" name="recNm" value="${result.recNm}" placeholder="라오스 수령인 성함을 입력해주세요">
                            </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">휴대폰 번호<span>*</span></a></h5>
                                <input type="text" id="recPhone" name="recPhone" value="${result.recPhone }" placeholder="라오스 수령인 전화번호를 입력해주세요" oninput="oninputPhone(this);">
                            </div>
                        </div> 
	                    <div class="inputWrap">
	                    	<h5 class="inputName"><a href="#">픽업지 선택<span>*</span></a></h5>
	                        <select name="recTarget" id="recTarget">
	                            <option value="1">본사</option>
	                            <option value="2">하우 창고</option>
	                            <option value="3">지방배송</option>
	                        </select>
	                    </div>
	                    <div class="double" id="target_1">
	                    	<div class="inputWrap">
		                    	 <h5 class="inputName"><a href="#">본사주소</a></h5>
                                <input type="text" value="Pakthang Villsge, Sikhot District T3, Dongnatong Vientiane, LAO P.D.R" readonly>
                            </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">하우 창고 주소</a></h5>
                                <input type="text" value="phonpapao village , Sisatttanak Dostrict,Vientiane" readonly>
                                <h5 class="inputAlarm"><a href="#">※하우창고에서 수령시 배출일 (9시~17시) 하루동안만 개봉되며 미수령시 본사로 이동됩니다.</a></h5>
	                    	</div>
	                    </div>
                        <div class="double" id="target_3">                            
                            <div class="inputWrap">
                            <h5 class="inputName"><a href="#">택배사<span>*</span></a></h5>                            
                            <select name="recAddr" id="recAddr">
                            	<c:forEach var="item" items="${shipComList }">
                            		<c:choose>
                            			<c:when test="${item.target eq result.recAddr }">
                            				<option value="${item.target }" selected>${item.tName }</option>
                            			</c:when>
                            			<c:otherwise>
                            				<option value="${item.target }">${item.tName }</option>                            			
                            			</c:otherwise>
                            		</c:choose>                            		
                            	</c:forEach>
                            </select>
                        </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">상세주소</a></h5>
                                <input type="text" name="recHou" id="recHou" value="${result.recHou}">
                            </div>
                        </div> 

                        <div class="double box">
                            <div class="inputWrap">
                                <div class="inputHeader" style="display: flex; justify-content: space-between;">
                                    <h5 class="inputName"><a href="#">박스크기<span>*</span></a></h5>
                                    <button class="boxSave" id="boxSaveBtn">저장하기</button>
                                </div>                                
                                <input type="text" id="width" class="boxSize" placeholder="가로" oninput="fnChkNum(this);">
                                <input type="text" id="length" class="boxSize" placeholder="세로" oninput="fnChkNum(this);">
                                <input type="text" id="height" class="boxSize" placeholder="높이" oninput="fnChkNum(this);">
                                <input type="text" id="weight" class="boxSize" placeholder="무게" oninput="fnChkNum(this);">
                            </div>
                            <div class="inputWrap">
                                <div class="inputHeader" style="display: flex;">
                                    <button class="boxInput" style="margin-left: 20px;" id="boxDel">삭제하기</button>
                                    <button class="boxInput" style="margin-left: 20px;" id="printBtn">출력하기</button>
                                </div>
                                <div class="tableWrap">
                                <input type="hidden" id="widthArr" name="widthArr" placeholder="가로">
                                <input type="hidden" id="lengthArr" name="lengthArr" placeholder="세로">
                                <input type="hidden" id="heightArr" name="heightArr" placeholder="높이">
                                <input type="hidden" id="weightArr" name="weightArr" placeholder="무게">
                                <input type="hidden" id="sjKeyArr" name="sjKeyArr" placeholder="sjKey">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <input type="checkbox" id="allChk">
                                                </th>
                                                <th>No</th>
                                                <th>박스크기</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tBody">
                                        <c:forEach var="item" items="${packInfo }" varStatus="status">
                                            <tr name="boxTr">                                            
                                                <td><input type="checkbox" id="box_${status.index }" name="boxIndex" ></td>
                                                <td class="boxIndex">${status.count }</td>
                                                <td>W*H*L(${item.width }cm *${item.height }cm * ${item.length }cm) / 무게:${item.weight }kg</td>
                                                <input type="hidden" name="width" value="${item.width }" />
                                                <input type="hidden" name="height" value="${item.height }" />
                                                <input type="hidden" name="length" value="${item.length }" />
                                                <input type="hidden" name="weight" value="${item.weight }" />
                                                <input type="hidden" name="sjKey" value="${item.sjKey }" />
                                            </tr>
										</c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

<!--                         <div class="double"> -->
<!--                             <div class="inputWrap"> -->
<!--                                 <h5 class="inputName">CBM : <span id="cbm"></span></h5>                                 -->
<!--                             </div> -->
<!--                             <div class="inputWrap"> -->
<!--                                 <h5 class="inputName">총박스 수 : <span id="totBox"></span></h5>                                 -->
<!--                             </div> -->
<!--                         </div>  -->
                        
                        <div class="inputWrap full">
                            <h5 class="inputName"><a href="#">예상 물류 비용<span>*</span></a></h5>
                            <input type="text" id="cost" name="cost" value="${packInfo[0].cost }" placeholder="$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산) / 용적중량 : 가로*세로*높이*0.00022 ">
                        </div>

                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">출항일 선택하기<span>*</span></a></h5>
                            <input type="hidden" id="arrDay" name="arrDay" value="${result.arrDay }" placeholder="yyyy-mm-dd"> 
                            <input type="hidden" id="outKey" name="outKey" value="${packInfo[0].outKey }"/>
                            <select name="outDay" id="outDay">
                            	<c:forEach var="item" items="${outDayList }">
                            		<c:choose>
                            			<c:when test="${item.outKey eq result.arrDay }">
                            				<option value="${item.outKey }" selected>${item.outDay }</option>
                            			</c:when>
                            			<c:otherwise>
                            				<option value="${item.outKey }">${item.outDay }</option>                            			
                            			</c:otherwise>
                            		</c:choose>
                            	</c:forEach>
                            </select>                            
                        </div>
                        <div class="bottomButtonWrap">
	                        <button class="bottomButton" id="returnBtn">미완료 배송신청으로 돌아가기</button>
	                        <c:choose>
								<c:when test="${result.inKey ne '' && not empty result.inKey }">
			                        <button class="bottomButton" id="adminDelRegBtn">수정 하기</button>									
								</c:when>
								<c:otherwise>
									<button class="bottomButton" id="adminDelRegBtn">저장 하기</button>
								</c:otherwise>
							</c:choose>     
	                    </div>
                    </div> <!-- wrap -->
                </form>
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
    
	
	<!-- script setting -->
    <script>
    $(document).ready(function(){
    	console.log("페이지초기화!");
    	$("#target_3").hide();
//     	fnCalCbm();
//     	$("#totBox").text($("input[name=boxIndex]").length);
    	
    	/* 신청일자 datePicker 설정 (JANG) */
    	$("#creDay").datepicker();
    	$("#creDay").datepicker("option", "dateFormat", "yy-mm-dd");
    	$("#creDay").datepicker("setDate", "${result.creDay}");
    	
    	/* 본사, 하우창고, 지방배송 선택 설정 (JANG) */
    	if("${result.recTarget}" != "" && "${result.recTarget}" != null){
	    	$("#recTarget").val("${result.recTarget}").prop("selected", true);
	    	if($("#recTarget").val() == 3){
	    		$("#target_1").hide();
    			$("#target_3").show();
	    	}
    	}
    	
    	/* 지방배송 선택 설정 (JANG) */
    	$("#recTarget").on("change", function(evt){
    		if($(this).val() == 1 || $(this).val() == 2){
    			$("#target_1").show();
    			$("#target_3").hide();
    		}else{
    			$("#target_1").hide();
    			$("#target_3").show();
    		}
    	});
    	
    	// box데이터 수정하러 들어왔을 때 대비해서 boxIndex 활용 방안 체크 다시할 것!!
		let boxIndex = 0;
   		const chkIndex = $("input[class='boxSize']").length;
    	const creDayVal = "${result.creDay}";
    	
    	/* 박스저장하기 버튼 클릭 이벤트 설정 (JANG) */
    	$("#boxSaveBtn").on("click", function(evt){

    		evt.preventDefault();
    		($("input[name='boxIndex']").length == "") ? boxIndex = 0 : boxIndex = $("input[name='boxIndex']").length;
    		const widthVal = $("#width").val();
    		const heightVal = $("#height").val();
    		const lengthVal = $("#length").val();
    		const weightVal = $("#weight").val();
    		let htmlStr = "";
    		
    		if(widthVal == "" || heightVal == "" || lengthVal == "" || weightVal == ""){
    			alert("가로, 세로, 높이, 무게 항목을 모두 입력해주세요.");
    		}else{    			
	    		htmlStr += "<tr>";
	    		htmlStr += "	<td><input type='checkbox' id='box_"+boxIndex+"' name='boxIndex'></td>";
	    		htmlStr += "	<td class='boxIndex'>"+(boxIndex+1)+"</td>";
	    		htmlStr += "	<td>W*H*L("+widthVal+"cm *"+heightVal+"cm *"+lengthVal+"cm)/무게:"+weightVal+"kg";
	    		htmlStr += "	<input type='hidden' name='width' value='"+widthVal+"'>";
	    		htmlStr += "	<input type='hidden' name='height' value='"+heightVal+"'>";
	    		htmlStr += "	<input type='hidden' name='length' value='"+lengthVal+"'>";
	    		htmlStr += "	<input type='hidden' name='weight' value='"+weightVal+"'>";
	    		htmlStr += "</tr>";
	    		
	    		$("#tBody").append(htmlStr);
	    		console.log("chkIndex : ", chkIndex);
	    		$("input[class='boxSize']").val("");
	    		cost();
// 	    		fnCalCbm();
// 	    		$("#totBox").text($("input[name=boxIndex]").length);   		
	    		
    		}
    	});
    	
    	/* 출항일(selectbox) change event 설정 (JANG) */    	
    	$("#outDay").on("change", function(evt){
    		$("#arrDay").val($("select[name=outDay]").val());
    		$("#outKey").val($("select[name=outDay]").val());
    	});
    	
    	/* 배송신청 버튼 클릭 이벤트 설정 (JANG) */
   		const widthArr = new Array();
   		const heightArr = new Array();
   		const weightArr = new Array();
   		const lengthArr = new Array();
   		const sjKeyArr = new Array();
    	$("#adminDelRegBtn").on("click", function(evt){
    		
    		evt.preventDefault();
    		
    		$("#arrDay").val($("select[name=outDay]").val());
    		$("#outKey").val($("select[name=outDay]").val());
    		
    		$("input[name='width']").each(function(index){
    			widthArr.push($("input[name='width']").eq(index).val());				
    		});
    		$("input[name='height']").each(function(index){
    			heightArr.push($("input[name='height']").eq(index).val());
    		});
    		$("input[name='length']").each(function(index){
    			lengthArr.push($("input[name='length']").eq(index).val());
    		});
    		$("input[name='weight']").each(function(index){
    			weightArr.push($("input[name='weight']").eq(index).val());
    		});
    		$("input[name='sjKey']").each(function(index){
    			sjKeyArr.push($("input[name='sjKey']").eq(index).val());
    		});
    		$("#widthArr").val(widthArr);
    		$("#heightArr").val(heightArr);
    		$("#lengthArr").val(lengthArr);
    		$("#weightArr").val(weightArr);
    		$("#sjKeyArr").val(sjKeyArr);
    		
    		/* 필수값 유효성 검사 */
    		let regist = true;
    		if($("#creDay").val() == "" || $("#creDay").val() == null){
    			alert("신청일자를 선택해주세요.");
    			$("#creDay").focus();
    			regist = false;
    		}else if($("#cost").val() == "" || $("#cost").val() == null){
    			alert("예상 물류 비용을 입력해주세요.");
    			$("#cost").focus();
    			regist = false;
    		}else if($("input[name='boxIndex']").length == ""){
    			alert("박스정보를 입력해주세요.");
    			$("#width").focus();
    			regist = false;
    		}else{
    			$("#formData > .wrap > .double > .inputWrap > input").each(function(index){ 
	    			if(($(this).val() == null || $(this).val() == '') && $(this).attr("id") != "width" && $(this).attr("id") != "length" && $(this).attr("id") != "height" && $(this).attr("id") != "weight" && $(this).attr("id") != "recHou"){
	    				const text = $(this).siblings(".inputName").children().text();
	    				console.log('text : ', text);
	    				alert(text+' 정보를 입력해주세요.');
	    				$(this).focus();
	    				regist = false;
	    				return false;
	    			}
	    		}); 
    		}
    		
    		/* memId 추가 (240429 장연우) */
    		if($("#memId").val() == '' || $("#memId").val() == null){
    			$("#memId").val(uid);
    		}
    		
    		/* 지방, 하우 선택하는 경우 택배사, 상세주소 값 초기화 (240501 JANG) */
    		if($("#recTarget").val() == 1 || $("#recTarget").val() == 2){
    			$("#recAddr").val("");
    			$("#recHou").val("");
    		}
    		
    		if(regist){
	    		console.log("formData : ", $("#formData").serialize());
				$.ajax({
					url : "adminDelRegist.do",
					type : "POST",
					async : false,
					data : $("#formData").serialize(),					
					success : function(result, status, xhr){
						console.log("result : ", result);
						let resultMsg = result.split("=");
						alert(resultMsg[1]);
						
 						location.href = "adminDeliveryRegistMain.do?ik="+resultMsg[0];
						
					},
					error : function(xhr, status, error){
						console.log("xhr : ", xhr, " // status : ", status, " // error : ", error);
						alert("배송신청에 실패했습니다. 관리자에게 문의해주세요.");
					}
				});    			
    		}
    	});
    	
    	
    	/* 입력된 박스 정보 삭제 설정 (JANG) */
    	$("#boxDel").on("click", function(evt){
    		evt.preventDefault();    		
    		// 박스정보 삭제
    		$("input[name=boxIndex]").each(function(index){    			
    			if($("#allChk").is(":checked")){
    				$("input[name=boxIndex]").parent().parent().remove();
    			}
	    		if($(this).is(":checked")){
	    			$(this).parent().parent().remove();
	    		}
    			
    			$("#allChk").prop("checked", false);
    		});
    		
    		// No 초기화
    		$("input[name=boxIndex]").each(function(index){
    			$(this).parent().siblings(".boxIndex").text(index+1);
    		});
    		cost();
//     		fnCalCbm();
//     		$("#totBox").text($("input[name=boxIndex]").length);
    	});    	

    	
    	// 박스 출력버튼 연계 (이재원)
        $('.outTitleWrap > .icon.cancelout').click(function(){
//         	$(".outFoot > .top > h5").remove();
//         	$("#qrCode > img").remove();
			$("#contentWrap").empty();
            $('.outWrap').css({'display':'none'});
        });
        
    	/* 출력하기 버튼 설정 (JANG) */
        $("#printBtn").on("click", function(evt){
        	evt.preventDefault();
        	const sjKeyArr = new Array();
        	const qrInfoArr = new Array();
        	let sjNum = "";
        	let htmlStr = "";
        	let recTarget = $("#recTarget").val();
        	let qrTxt = "";
        	let cntArr = new Array();
        	// 선택된 체크박스확인 (240509 추가 JANG)
    		$("input[name=boxIndex]").each(function(index){
    			if($("input[name=boxIndex]").eq(index).is(":checked")){
    				cntArr.push(index);
    			}
    		});
        	
        	// QR코드 수령지 정보 설정 추가 (240501 JANG)
        	if(recTarget == 1){
        		recTarget = "본사";
        	}else if(recTarget ==2){
        		recTarget = "하우창고";
        	}else{
        		recTarget = $("#recAddr option:checked").text() + " / " + $("#recHou").val();
        	}        	
        	
        	// 프린트 영역 생성 - checkbox 선택한 경우, 선택하지 않은 경우 구분 추가 (240509 JANG)
        	if($("input[name=sjKey]").length > 0){	        		
       			if(cntArr.length > 0){
       				for(let i=0; i<cntArr.length; i++){
       					// QR Code 데이터 설정 영역
    					sjKeyArr.push($("input[name=sjKey]").eq(cntArr[i]).val());
    	        		let txt = sjKeyArr[i].split("-");
//     	        		qrTxt = "수령인 : "+$("#recNm").val()+"\n연락처 : "+$("#recPhone").val()+"\n픽업지 : "+recTarget+"\n박스번호 : "+txt[2];	      
    					qrTxt = $("#recNm").val()+" / "+$("#recPhone").val()+" / "+recTarget+" / "+txt[2];
    	        		qrInfoArr.push({qrText : qrTxt, qrId : "qrCode_"+cntArr[i]});
    	        		
    	        		// html영역
    	                htmlStr += '<div class="outContent" id="printable" style="page-break-before:always">';
    	                htmlStr += '   <div class="outHeader">';
    	                htmlStr += '      <div class="left" id="qrCode_'+cntArr[i]+'" style="width:30%;">';
    	                htmlStr += '      </div>'
    	                htmlStr += '      <div class="right" style="width:50%">';
    	                htmlStr += '         <div class="logo">';
    	                htmlStr += '            <img src="images/delivery/pc_icon/logo.png" alt="#" style="width:240px; height:70px;">';
    	                htmlStr += '         </div>';
    	                htmlStr += '         <div class="bottom" style="display: flex;">';
    	                htmlStr += '            <div style="width:50%;">';
    		            htmlStr += '               <img src="images/delivery/pc_icon/krText.png" alt="#" style="width:100%;">';                 
    		            htmlStr += '            </div>';              
    					htmlStr += '            <div style="width:50%;">';
    					htmlStr += '               <img src="images/delivery/pc_icon/kakaoEklaosWhite.png" alt="#" style="width:100%;">';                 
    					htmlStr += '            </div>';              
    					htmlStr += '         </div>';
    					htmlStr += '      </div>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outBody">';
    					htmlStr += '      <img src="images/delivery/pc_icon/inKey.png" alt="#" style="width:80px;">';
    					htmlStr += '      <h1>'+txt[0]+'</h1>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outFoot">';
    					htmlStr += '      <div class="top">';
    					htmlStr += '         <h5>No.'+$("input[name=sjKey]").eq(cntArr[i]).val()+'</h5>';
    					htmlStr += '         <h5>Tel.020-5553-3327</h5>';
    					htmlStr += '      </div>';
    					htmlStr += '      <div class="bottom">';
    					htmlStr += '         <img src="images/delivery/pc_icon/laosText.png" alt="#" style="width:200px; height:70px;">';   
    					htmlStr += '      </div>';
    					htmlStr += '   </div>'
    					htmlStr += '</div>';
    					// qrTxt 초기화 
    					qrTxt = "";
       				}
       			}else{
       				$("input[name=sjKey]").each(function(index){
    	        		// QR Code 데이터 설정 영역
    					sjKeyArr.push($("input[name=sjKey]").eq(index).val());
    	        		let txt = sjKeyArr[index].split("-");
//     	        		qrTxt = "수령인 : "+$("#recNm").val()+"\n연락처 : "+$("#recPhone").val()+"\n픽업지 : "+recTarget+"\n박스번호 : "+txt[2];	      
    					qrTxt = $("#recNm").val()+" / "+$("#recPhone").val()+" / "+recTarget+" / "+txt[2];
    	        		qrInfoArr.push({qrText : qrTxt, qrId : "qrCode_"+index});
    	        		
    	        		// html영역
    	                htmlStr += '<div class="outContent" id="printable" style="page-break-before:always">';
    	                htmlStr += '   <div class="outHeader">';
    	                htmlStr += '      <div class="left" id="qrCode_'+index+'" style="width:30%;">';
    	                htmlStr += '      </div>'
    	                htmlStr += '      <div class="right" style="width:50%">';
    	                htmlStr += '         <div class="logo">';
    	                htmlStr += '            <img src="images/delivery/pc_icon/logo.png" alt="#" style="width:240px; height:70px;">';
    	                htmlStr += '         </div>';
    	                htmlStr += '         <div class="bottom" style="display: flex;">';
    	                htmlStr += '            <div style="width:50%;">';
    		            htmlStr += '               <img src="images/delivery/pc_icon/krText.png" alt="#" style="width:100%;">';                 
    		            htmlStr += '            </div>';              
    					htmlStr += '            <div style="width:50%;">';
    					htmlStr += '               <img src="images/delivery/pc_icon/kakaoEklaosWhite.png" alt="#" style="width:100%;">';                 
    					htmlStr += '            </div>';              
    					htmlStr += '         </div>';
    					htmlStr += '      </div>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outBody">';
    					htmlStr += '      <img src="images/delivery/pc_icon/inKey.png" alt="#" style="width:80px;">';
    					htmlStr += '      <h1>'+txt[0]+'</h1>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outFoot">';
    					htmlStr += '      <div class="top">';
    					htmlStr += '         <h5>No.'+$("input[name=sjKey]").eq(index).val()+'</h5>';
    					htmlStr += '         <h5>Tel.020-5553-3327</h5>';
    					htmlStr += '      </div>';
    					htmlStr += '      <div class="bottom">';
    					htmlStr += '         <img src="images/delivery/pc_icon/laosText.png" alt="#" style="width:200px; height:70px;">';   
    					htmlStr += '      </div>';
    					htmlStr += '   </div>'
    					htmlStr += '</div>';
    					// qrTxt 초기화 
    					qrTxt = "";
    				});
       			}				
		        	
		        $("#contentWrap").append(htmlStr);
		        	
		        // qrCode 동적 생성
		        for(let i=0; i<qrInfoArr.length; i++){
		        	qrCreate(qrInfoArr[i].qrId, qrInfoArr[i].qrText);	        		
		        }
				
		        $('.outWrap').css({'display':'flex'});
			}else{
	       		alert("배송신청 저장 후 다시 시도해주세요.");
			}       		
    
        });
    	
    	/* 전체체크박스(allChk) 이벤트 설정 */
    	$("#allChk").on("change", function(evt){
    		console.log("changed : ", $(this).is(":checked"));
    		if($(this).is(":checked")){
    			$("input[name=boxIndex]").prop("checked", true);
    		}else{
    			$("input[name=boxIndex]").prop("checked", false);
    		}
    	
    	});
    	
    	
    	/* 미확인 배송신청으로 돌아가기 (JANG) */
    	$("#returnBtn").on("click", function(evt){
    		evt.preventDefault();
    		$(".nc_delivery").trigger("click");
    	});    	
    	
   	});	// document.ready end!!
   	   	
   	
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
   	
   	
    function fnPrint() {
    	console.log("print 시작");    	
// 		const style = '@page { margin-top: 20px } @media print { h1 { color: blue } }'

		printJS({
			printable: "contentWrap",
			type: 'html',
			css: "css/adminDeliverRegist/style.css",
// 			style: style,
// 			scanStyles: true
        });
	}
   	
    
    // 용적용량 자동계산기
    function cost(){
    	var number = 0;
    	$("#tBody > tr").each(function(){
    		var width = $(this).find("input[name=width]").val();
    		var height = $(this).find("input[name=height]").val();
    		var length = $(this).find("input[name=length]").val();
    		var weight = $(this).find("input[name=weight]").val();
    		
//			$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산)
// 			용적중량 : 가로*세로*높이*0.00022 
			
			var kgcost = weight * 1.5;
			var lncost = Math.round(width * height * length * 0.00022 * 1.5 * 100) / 100;
		
// 			console.log(kgcost,lncost);
			if(kgcost >= lncost){
				number += kgcost;
			}
			else{
				number += lncost;
			}
    	});
    	
    	$("#cost").val(number.toFixed(5));
    }
    
    // Join.jsp 참고 (이동헌)
    function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
    }
    
 	// 숫자와 마침표만 입력 정규식 체크 (JANG)
    function fnChkNum(elem){    	
    	elem.value = elem.value.replace(/[^0-9.]+(.[^0-9]+)?/,'');
    }
 	
 	// cbm계산 : 총가로 * 총세로 * 총높이 * 0.000001 (JANG) - 사용X(240508)
 	function fnCalCbm(){
 		console.log("func start!!");
 		let totWidth = 0;
 		let totHeight = 0;
 		let totLength = 0;
 		
 		$(".boxIndex").each(function(index){
 			totWidth += parseFloat($("input[name='width']").eq(index).val());
 			totHeight += parseFloat($("input[name='height']").eq(index).val());
 			totLength += parseFloat($("input[name='length']").eq(index).val());
//  			console.log("width[",index,"] : ", $("input[name='width']").eq(index).val());
//  			console.log("height[",index,"] : ", $("input[name='height']").eq(index).val());
//  			console.log("length[",index,"] : ", $("input[name='length']").eq(index).val());
//  			console.log("totWidth : ", totWidth, " // totHeight : ", totHeight, " // totLength : ", totLength);
 		});
 		
 		cbm = totWidth * totHeight * totLength * 0.000001;
 		console.log("cbm : ", cbm);
 		$("#cbm").text(cbm.toFixed(6));
 	}

    </script>
</body>
</html>