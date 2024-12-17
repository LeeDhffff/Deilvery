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
   
    <!-- import grid.js -->
    <script src="https://unpkg.com/gridjs/dist/gridjs.umd.js"></script>
    <link href="https://unpkg.com/gridjs/dist/theme/mermaid.min.css" rel="stylesheet" />
    
	<style>
		.search, .popSearch {
			margin-left : 10px;
			width : 30px;
			height : 30px;
			background : white;
			border : 1px solid var(--main-color);
			border-radius : 3px;
			background-image : url(./images/pc_icon/search_orange.svg);
			background-size : cover;
			cursor : pointer;
		}
		.search:hover, .popSearch:hover {
			background : var(--main-color);
			background-image : url(./images/pc_icon/search_white.svg);
		}
		.search > img, .popSearch > img { width : 100%; height : 100%};
		
		.pop_container{
			display:none;
			width: 100%;
			height: 100%;
			position: absolute;
		}
		.grey_pop{
			width: 100%;
			height: 100%;
			background: #5d5d5d9c;
			position: absolute;
		}
		.popup{
			width: 800px;
			height: 600px;
			background: white;
			position: fixed;
			transform: translate(-50%, -50%);
			left: 50%;
			top: 50%;
			padding: 20px;
		}
		.popup_X{
			width: 40px;
			height: 40px;
		    background: white;
		    font-size: 30px;
		    font-weight: bold;
		}
		.popup_head{
			display: flex;
		    justify-content: space-between;
		    border-bottom: 1px solid lightgray;
		}
		.popup_middle{
			padding: 10px;
		    width: 100%;
		    height: 100%;
		    box-sizing: border-box;
		}
		.selectBtn {
/* 			margin-left : 10px; */
			width : 30px;
			height : 30px;
			background : white;
			border : 1px solid var(--main-color);
			border-radius : 3px;
			background-image : url(./images/pc_icon/check_orange.svg);
			background-size : cover;
			cursor : pointer;
		}
		.selectBtn:hover {
			background : var(--main-color);
			background-image : url(./images/pc_icon/check_white.svg);
		}
		.selectBtn > img, .selectBtn:hover > img { width : 100%; height : 100%}
		
/* 		20241026 추가(이동헌) */
		.d_div{
			    display: flex;
			    width: 100%;
			    line-height: 50px;
		}
		#d_use{
				width : 30px;
		}
		#discount{
/* 				display : none; */
				margin-left: 10px;
			    width: 60%;
		}
	</style>
</head>
<body>
	<!-- 로딩이미지 추가 (JANG 240517) -->
	<div class="wrap-loading display-none">
		<div><img src="images/delivery/pc_icon/loading.gif" alt="loading..."/></div>
	</div>
	<!-- 수령인 검색 팝업 추가 (JANG 240605) -->
	<div class="pop_container">
		<div class="grey_pop">
			<div class="popup">
				<div class="popup_head">
				<h2 class="popup_h2">수령인 검색</h2>
				<button class="popup_X">X</button>
				</div>
				<div class="popup_middle">
					<div id="grid"></div>					
				</div>
			</div>
		</div>
	</div>
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
                    <div class="wrap">
                        <div class="double">
	                        <div class="inputWrap">
	                            <h5 class="inputName"><a href="#">신청일자<span>*</span></a></h5>
	                            <input type="text" id="creDay" name="creDay" placeholder="날짜를 선택해주세요.">
	                        </div>
	                        
	                        <div class="inputWrap">
	                            <h5 class="inputName"><a href="#">마감일 선택하기<span>*</span></a></h5>
	                            <input type="hidden" id="arrDay" name="arrDay" value="${result.arrDay }" placeholder="yyyy-mm-dd"> 
	                            <input type="hidden" id="outKey" name="outKey" value="${packInfo[0].outKey }"/>
	                            <select name="outDay" id="outDay">
	                            	<option value="N">마감일 선택</option>
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
                        </div>
                        <div class="double">
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">수령인<span>*</span><button class="search"></button></a></h5>                               
                               	<input type="text" class="chkVal" id="recNm" name="recNm" value="${result.recNm}" placeholder="라오스 수령인 성함을 입력해주세요"> 
                            </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">휴대폰 번호<span>*</span></a></h5>
                                <input type="text" class="chkVal" id="recPhone" name="recPhone" value="${result.recPhone }" placeholder="라오스 수령인 전화번호를 입력해주세요" oninput="oninputPhone(this);">
                            </div>
                        </div>
                        <div class="double">
		                    <div class="inputWrap">
		                    	<h5 class="inputName"><a href="#">픽업지 선택<span>*</span></a></h5>
		                        <select name="recTarget" id="recTarget">                        
<!-- 		                        	<option>픽업지를 선택해주세요.</option> -->
		                        	<option value="0">고객 픽업지 미선택</option>
		                        	<option value="1">본사</option>
		                            <option value="2">하우 창고</option>
		                            <option value="3">택배 서비스</option>
		                        </select>
		                    </div>
		                    <div class="inputWrap">
	                            <h5 class="inputName"><a href="#">추가 휴대폰 번호</a></h5>
	                        	<input type="text" id="subPhone" name="subPhone" value="${result.subPhone }" placeholder="추가 전화번호를 입력해주세요" oninput="oninputPhone(this);">
	                        </div>
                        </div>
	                    <div class="double" id="target_1">
	                    	<div class="inputWrap">
		                    	 <h5 class="inputName"><a href="#">본사주소</a></h5>
                                <input type="text" id="bon" value="Pakthang Villsge, Sikhot District T3, Dongnatong Vientiane, LAO P.D.R" readonly>
                            </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">하우 창고 주소</a></h5>
                                <input type="text" id="hou" value="phonpapao village , Sisatttanak Dostrict,Vientiane" readonly>
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
                        
                        <div class="inputWrap full">
                            <h5 class="inputName"><a href="#">비고</a></h5>
                            <input type="text" id="bigo" name="bigo" value="${result.bigo}" placeholder="비고 사항을 입력해주세요." />
                        </div>
                        
                        <div class="inputWrap full">
                            <h5 class="inputName"><a href="#">배송제품 작성<span>*</span></a></h5>
                            <input type="text" class="chkVal" id="recTxt" name="recTxt" value="${result.recTxt}" placeholder="배송 제품에 관하여 간략하게 적어주세요. ex: 옷 1박스, TV, 에어컨">
                        </div>

                        <div class="inputWrap full">
                            <h5 class="inputName"><a href="#">배송서비스 신청하기</a></h5>
                            <input type="text" id="gooCoordinate" name="gooCoordinate" value="${result.gooCoordinate}" placeholder="구글 좌표를 입력해주세요.">
                            <h5 class="inputAlarm"><a href="#">※10 box 이상의 대량 물건, 냉장고, 세탁기 정도의 큰 물건 물건만 가능하며 소량물건은 배송 서비스가 거부될 수 있습니다.</a></h5>
                        </div>

                        <div class="double box">
                            <div class="inputWrap">
                                <div class="inputHeader" style="display: flex; justify-content: space-between;">
                                    <h5 class="inputName"><a href="#">박스크기<span>*</span></a></h5>
                                    <button class="boxSave" id="boxSaveBtn">저장하기</button>
                                </div>      
                                <div class="d_div">
	                                우선순위 할인 적용<input type="checkbox" id="d_use">
<!-- 	                                onchange="duse();"                          1-->
	                                <input type="text" id="discount" class="discount_Point" placeholder="할인율(%) 변경시 모든 할인율이 변경됩니다." oninput="fnChkNum(this);" value="${result.discount }" onchange="discount_changer(this.value);">
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
                                <input type="hidden" id="widthArr" name="widthArr" placeholder="가로" />
                                <input type="hidden" id="lengthArr" name="lengthArr" placeholder="세로" />
                                <input type="hidden" id="heightArr" name="heightArr" placeholder="높이" />
                                <input type="hidden" id="weightArr" name="weightArr" placeholder="무게" />
                                <input type="hidden" id="costArr" name="costArr" placeholder="금액" />
                                <input type="hidden" id="discountArr" name="discountArr" placeholder="할인율" />
                                <input type="hidden" id="sjKeyArr" name="sjKeyArr" placeholder="sjKey" />
                                <input type="hidden" id="initSjKey" name="initSjKey" placeholder="initSjKey" />
                                <input type="hidden" id="sn" name="sn" value="${packInfo[0].sn }" placeholder="sn" />
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>
                                                    <input type="checkbox" id="allChk">
                                                </th>
                                                <th>No</th>
                                                <th>박스크기</th>
                                                <th>할인율(%)</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tBody">
                                        <c:forEach var="item" items="${packInfo }" varStatus="status">
                                            <tr name="boxTr" class="duse${item.d_use }">                                            
                                                <td><input type="checkbox" id="box_${status.index }" name="boxIndex" ></td>
                                                <td class="boxIndex">${status.count }</td>
                                                <td>W*L*H(${item.width }cm *${item.length }cm * ${item.height }cm) / 무게:${item.weight }kg</td>
                                                <td class="duseTr${item.d_use }">${item.discount}</td>
                                                <input type="hidden" name="width" value="${item.width }" />
                                                <input type="hidden" name="height" value="${item.height }" />
                                                <input type="hidden" name="length" value="${item.length }" />
                                                <input type="hidden" name="weight" value="${item.weight }" />
                                                <input type="hidden" name="sjKey" value="${item.sjKey }" />                                                
                                                <input type="hidden" name="indiCost" value="${item.cost }" />                                           
                                                <input type="hidden" name="d_use" value="${item.d_use }" />                                              
                                                <input type="hidden" name="discount" value="${item.discount }" />                                                       
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
                            <input type="text" class="chkVal" id="cost" name="cost" placeholder="$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산) / 용적중량 : 가로*세로*높이*0.00022 ">
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
    	$(".pop_container").hide();
    	
    	/* 물류접수자 level 체크 */
    	const memLevel = "${chkLevel.memLevel}";
    	console.log("memLevel : ", memLevel);
    	
    	/* 물류접수-수정 진입시 출항일 변경 불가능 하도록 설정 (JANG) */
    	const resultArrDay = "${result.arrDay}";    	
    	if(resultArrDay != ""){
    		$("#outDay").attr("disabled", true);
    		$("#outKey").val(resultArrDay);    		
    	}
//     	fnCalCbm();
//     	$("#totBox").text($("input[name=boxIndex]").length);


		/* initSjKey 담기 (240531 JANG) */
		const initSjKey = new Array();
		$("input[name='sjKey']").each(function(index){
			initSjKey.push($(this).val());
		});
		if(initSjKey.length != 0){
			let arr = initSjKey[0].split("-");
			if(arr[0].indexOf("#") >= 0 ){
				arr[0] = arr[0].substr(0, arr[0].indexOf("#"));
			}
			let str = arr[0]+"-"+arr[1]+"-";
			$("#initSjKey").val(str);
		}
// 		console.log("initSjKey val : ", $("#initSjKey").val());

		/* 예상 물류 비용 입력 (240531 JANG) */
		const indiCostLen = $("input[name='indiCost']").length		
		if(indiCostLen > 0){
			let num = 0;		
			$("input[name='indiCost']").each(function(index){
				num += parseFloat($(this).val());				
			});			
			$("#cost").val(num.toFixed());
		}
    	
    	/* 신청일자 datePicker 설정 (JANG) */
    	$("#creDay").datepicker();
    	$("#creDay").datepicker("option", "dateFormat", "yy-mm-dd");
    	$("#creDay").datepicker("setDate", "${result.creDay}");
    	
    	/* 본사, 하우창고, 지방배송 선택 설정 (JANG) */
    	if("${result.recTarget}" != "" && "${result.recTarget}" != null){
			const targetVal = "${result.recTarget}";
			console.log("targetVal : ", targetVal);
		    $("#recTarget").val("${result.recTarget}").prop("selected", true);
// 			if(targetVal == "0"){
// 		    	$("#recTarget").val("1").prop("selected", true);
// 			}else{
// 		    	$("#recTarget").val("${result.recTarget}").prop("selected", true);
// 			}
	    	if($("#recTarget").val() == 3){
	    		$("#target_1").hide();
    			$("#target_3").show();
	    	}
    	}else{
    		console.log("target value is null !!");
    	}
    	
    	/* 지방배송 선택 설정 (JANG) */
    	$("#recTarget").on("change", function(evt){
    		if($(this).val() == 0 || $(this).val() == 1 || $(this).val() == 2){
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
			const inKeyValue = $("#inKey").val();
			
    		($("input[name='boxIndex']").length == "") ? boxIndex = 0 : boxIndex = $("input[name='boxIndex']").length;
    		const widthVal = $("#width").val();
    		const heightVal = $("#height").val();
    		const lengthVal = $("#length").val();
    		const weightVal = $("#weight").val();
    		const d_use = ($("#d_use").prop("checked") == true) ? 'Y'
    					   : 'N';
    		const discount = ($("#d_use").prop("checked") == false) ? 'N'
					   : $("#discount").val();
    		const outKey = $("#outKey").val();
    		let htmlStr = "";
	   		
// 	   		if(inKeyValue == "" || inKeyValue == null){
// 	   			alert("물류접수 정보를 먼저 등록해주세요.");
// 	   		}else 
	   		if(widthVal == "" || heightVal == "" || lengthVal == "" || weightVal == ""){
	   			alert("가로, 세로, 높이, 무게 항목을 모두 입력해주세요.");
	   		}
	   		else if(d_use == 'Y' && discount == ''){
	   			alert("할인율을 입력해주세요.");
	   		}
	   		else{
	   			
	    		htmlStr += "<tr class=duse"+d_use+">";
	    		htmlStr += "	<td><input type='checkbox' id='box_"+boxIndex+"' name='boxIndex'></td>";
	    		htmlStr += "	<td class='boxIndex'>"+(boxIndex+1)+"</td>";
	    		htmlStr += "	<td>W*L*H("+widthVal+"cm *"+lengthVal+"cm *"+heightVal+"cm)/무게:"+weightVal+"kg";
	    		htmlStr += "	<td class='duseTr"+d_use+"'>"+discount + "</td>";
	    		htmlStr += "	<input type='hidden' name='width' value='"+widthVal+"'>";
	    		htmlStr += "	<input type='hidden' name='height' value='"+heightVal+"'>";
	    		htmlStr += "	<input type='hidden' name='length' value='"+lengthVal+"'>";
	    		htmlStr += "	<input type='hidden' name='weight' value='"+weightVal+"'>";
	    		htmlStr += "	<input type='hidden' name='indiCost' value='"+indiCost(heightVal, widthVal, lengthVal, weightVal)+"'>";
	    		htmlStr += "	<input type='hidden' name='d_use' value='"+d_use+"'>";
	    		htmlStr += "	<input type='hidden' name='discount' value='"+discount+"'>";
	    		htmlStr += "</tr>";
	    		
	    		$("#tBody").prepend(htmlStr);
	    		console.log("chkIndex : ", chkIndex);
	    		$("input[class='boxSize']").val("");
	    		cost();
	    		
// 	    		fnCalCbm();
// 	    		$("#totBox").text($("input[name=boxIndex]").length);
	   		}

//     		if(widthVal == "" || heightVal == "" || lengthVal == "" || weightVal == ""){
//     			alert("가로, 세로, 높이, 무게 항목을 모두 입력해주세요.");
//     		}else{    			
	    		
//     		}
    	});
    	
    	/* 출항일(selectbox) change event 설정 (JANG) */
    	$("#outDay").on("change", function(evt){
    		$("#arrDay").val($("select[name=outDay]").val());
    		$("#outKey").val($("select[name=outDay]").val());
    	});
    	
    	/* 배송신청 버튼 클릭 이벤트 설정 (JANG) */
    	$("#adminDelRegBtn").on("click", function(evt){
    		evt.preventDefault();
	   		const widthArr = new Array();
	   		const heightArr = new Array();
	   		const weightArr = new Array();
	   		const lengthArr = new Array();
	   		const sjKeyArr = new Array();
	   		const costArr = new Array();
	   		const discountArr = new Array();
    		
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
    		$("input[name='indiCost']").each(function(index){
    			costArr.push($("input[name='indiCost']").eq(index).val());
    		});
    		$("input[name='discount']").each(function(index){
    			discountArr.push($("input[name='discount']").eq(index).val());
    		});
    		$("input[name='sjKey']").each(function(index){
    			sjKeyArr.push($("input[name='sjKey']").eq(index).val());
    		});
    		$("#widthArr").val(widthArr);
    		$("#heightArr").val(heightArr);
    		$("#lengthArr").val(lengthArr);
    		$("#weightArr").val(weightArr);
    		$("#widthArr").val(widthArr);
    		$("#costArr").val(costArr);
    		$("#discountArr").val(discountArr);
    		$("#sjKeyArr").val(sjKeyArr);
    		
    		/* 필수값 유효성 검사
    		   1차수정(240530) : 박스정보 저장 flow 변경으로 인한 '예상 물류 비용, 박스정보' 제거 */
    		let regist = true;
    		if($("#creDay").val() == "" || $("#creDay").val() == null){
    			alert("신청일자를 선택해주세요.");
    			$("#creDay").focus();
    			regist = false;
    		}
    		else if($("#recTarget").val() == "" || $("#recTarget").val() == null){
    			alert("픽업지를 선택해주세요.");
    			$("#recTarget").focus();
    			regist = false;
    		}
    		else if($("#cost").val() == "" || $("#cost").val() == null){
    			alert("예상 물류 비용을 입력해주세요.");
    			$("#cost").focus();
    			regist = false;
    		}else if($("input[name='boxIndex']").length == ""){
    			alert("박스정보를 입력해주세요.");
    			$("#width").focus();
    			regist = false;
    		}else if($("#outDay").val()=='N'){
    			alert("출항일을 선택해주세요.");
    			$("#outDay").focus();
				regist = false;
    		}else if($("#recNm").val()=='N'){
    			alert("수령인을 선택해주세요.");
    			$("#recNm").focus();
				regist = false;
    		}else{
    			$("#formData > .wrap > .double > .inputWrap > input.chkVal").each(function(index){ 
// 	    			if(($(this).val() == null || $(this).val() == '') && $(this).attr("id") != "width" && $(this).attr("id") != "length" && $(this).attr("id") != "height" && $(this).attr("id") != "weight" && $(this).attr("id") != "recHou" && $(this).attr("id") != "subPhone" && $(this).attr("id") != "bigo"){
	    			if(($(this).val() == null || $(this).val() == '')){
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
    		if($("#recTarget").val() == 1 || $("#recTarget").val() == "1"){
    			$("#recAddr").val("");
    			$("#recHou").val($("#bon").val());
    		}else if($("#recTarget").val() == 2 || $("#recTarget").val() == "2"){
    			$("#recAddr").val("");
    			$("#recHou").val($("#hou").val());
    		}else{
    			
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
					},
					beforeSend : function(){
						$(".wrap-loading").removeClass("display-none");
					},
					complete : function(){
						$(".wrap-loading").addClass("display-none");						
					},
					timeout : 100000
				});
    		}
    	});
    	
    	
    	/* 입력된 박스 정보 삭제 설정 (JANG) */
    	$("#boxDel").on("click", function(evt){
    		evt.preventDefault();
    		const len = $("input[name=boxIndex]").length;
    		
    		// 박스정보 삭제    		
    		if(len > 0){
	    		$("input[name=boxIndex]").each(function(index){    			
	    			if($("#allChk").is(":checked")){
	    				$("input[name=boxIndex]").parent().parent().remove();
	    			}
		    		if($(this).is(":checked")){
		    			$(this).parent().parent().remove();
		    		}
	    			
	    			$("#allChk").prop("checked", false);
	    		});    			
    		}else{
		    	alert("박스정보가 존재하지 않습니다.");
    		}
    		
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
        	const duseArr = new Array();
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
    	                htmlStr += '      <div class="right" style="width:50%; display:flex; flex-direction:column; justify-content:space-around; height:90%;">';
    	                htmlStr += '         <img src="images/delivery/pc_icon/qr_top.png" alt="#" style="width:100%; height:100%;">';
//     	                htmlStr += '         <img src="images/delivery/pc_icon/eklogis_N_Lao.svg" alt="#" style="width:100%; height:100%;">';
//     	                htmlStr += '		 <h5 style="height : 15%; text-wrap:nowrap; font-size:12px; text-align:center;">한국 -> 라오스 구매대행 서비스</h5>';
//     		            htmlStr += '         <img src="images/delivery/pc_icon/lao_long.svg" alt="#" style="width:100%; height:40%">';                 
    					htmlStr += '      </div>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outBody">';
    					htmlStr += '      <img src="images/delivery/pc_icon/inKey.png" alt="#" style="width:80px;">';
    					htmlStr += '      <h1>'+txt[0] +'</h1>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outFoot">';
    					htmlStr += '      <div class="top">';
    					htmlStr += '         <h4 style="height:30%;">No.'+$("input[name=sjKey]").eq(cntArr[i]).val()+'</h4>';
    					htmlStr += '         <h4 style="height:30%;">KOR Tel.010-6235-8005</h4>';
    					htmlStr += '         <h4 style="height:30%;">LAO Tel.020-5553-3327</h4>';
    					htmlStr += '      </div>';
    					htmlStr += '      <div class="bottom" style="width:50%">';
    					htmlStr += '         <h4 style="height:30%;"><img src="images/delivery/pc_icon/WWW-Icon.svg" alt="#" style="width:20px; height:20px;">www.eklaos.com</h4>';   
    					htmlStr += '         <h4 style="height:30%;"><img src="images/delivery/pc_icon/kakao logo.svg" alt="#" style="width:20px; height:20px;">EKLAOS</h4>';   
    					htmlStr += '         <h4 style="height:30%;"><img src="images/delivery/pc_icon/facebook_icon.svg" alt="#" style="width:20px; height:20px;">E-K MALL</h4>';   
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
        	            htmlStr += '      <div class="right" style="width:50%; display:flex; flex-direction:column; justify-content:space-around; height:90%;">';
    	                htmlStr += '         <img src="images/delivery/pc_icon/qr_top.png" alt="#" style="width:100%; height:100%;">';        	            
//     	                htmlStr += '         <img src="images/delivery/pc_icon/eklogis_N_Lao.svg" alt="#" style="width:100%; height:40%;">';
//     	                htmlStr += '		 <h5 style="height : 15%; text-wrap:nowrap; font-size:12px; text-align:center;">한국 -> 라오스 구매대행 서비스</h5>';
//     		            htmlStr += '         <img src="images/delivery/pc_icon/lao_long.svg" alt="#" style="width:100%; height:40%">';                 
    					htmlStr += '      </div>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outBody">';
    					htmlStr += '      <img src="images/delivery/pc_icon/inkeyNum.svg" alt="#" style="width:80px;">';
    					htmlStr += '      <h1>'+txt[0]+ '</h1>';
    					htmlStr += '   </div>';
    					htmlStr += '   <div class="outFoot">';
    					htmlStr += '      <div class="top">';
    					htmlStr += '         <h4 style="height:30%;">No.'+$("input[name=sjKey]").eq(index).val()+'</h4>';
    					htmlStr += '         <h4 style="height:30%;">KOR Tel.010-6235-8005</h4>';
    					htmlStr += '         <h4 style="height:30%;">LAO Tel.020-5553-3327</h4>';
    					htmlStr += '      </div>';
    					htmlStr += '      <div class="bottom" style="width:50%">';
    	                htmlStr += '         <img src="images/delivery/pc_icon/qr_bottom.png" alt="#" style="width:100%; height:100%;">';   
//     					htmlStr += '         <h4 style="height:30%;"><img src="images/delivery/pc_icon/WWW-Icon.svg" alt="#" style="width:20px; height:20px;">www.eklaos.com</h4>';   
//     					htmlStr += '         <h4 style="height:30%;"><img src="images/delivery/pc_icon/kakao logo.svg" alt="#" style="width:20px; height:20px;">EKLAOS</h4>';   
//     					htmlStr += '         <h4 style="height:30%;"><img src="images/delivery/pc_icon/facebook_icon.svg" alt="#" style="width:20px; height:20px;">E-K MALL</h4>';   
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
    	
    	/* 수령인 검색 기능 설정(JANG 240605) -- 요기 */
    	// 팝업창 열기 이벤트
    	$(".search").on("click", function(evt){
			evt.preventDefault();    	
    		console.log("수령인 검색 클릭!!!");
    		$(".pop_container").show();
    	});
    	
    	// 팝업창 닫기 이벤트
    	$(".popup_X").on("click", function(evt){
    		$(".pop_container").hide();
    	});
    	  	
    	// grid 생성
    	const memberList = ${memberList};    
    	if(memberList.length == null) memberList = new Array();
    	const grid = new gridjs.Grid({
    		columns : [
    			{ id : "memId", name : "ID", width : "10%" },    			
    			{ id : "memNm", name : "이름" },
    			{ id : "memPh", name : "연락처" },
    			{ 
    				name : "선택",
    				formatter : (cell, row) => {
    					return gridjs.h('button', {
    						className : "selectBtn",
    						onClick : () => {
    							console.log("row.cells : ", row.cells[0].data); 	
    							$("#recNm").val(row.cells[1].data);
    							$("#recPhone").val(row.cells[2].data);
    							
    							for(let i=0; i<memberList.length; i++){
    								
    								console.log(memberList[i].memId,row.cells[0].data)
    								if(memberList[i].memId == row.cells[0].data){
//     									if(memberList[i].memTg != null && memberList[i].memTg != ""){
//         	    							$("#recTarget").val(memberList[i].memTg).trigger("change");	
//     									}
//     	    							$("#recTarget");
    									if(memberList[i].memAd != null && memberList[i].memAd != ""){
        	    							$("#recAddr").val(memberList[i].memAd);
    									}
    									if(memberList[i].memHu != null && memberList[i].memHu != ""){
        	    							$("#recHou").val(memberList[i].memHu);
    									}
    								}
    							}
    							
    							$(".pop_container").hide();
    						}   
    					}, "");
    				}
    			}
    		],
    		data : memberList,
    		style : {
    			th : { "text-align" : "center" },
    			td : { "text-align" : "center" }
    		},
    		search : true,
    		pagination : {
    			limit : 7
    		},
    		language: {
    			'search': {
    		      'placeholder': '🔍 Search...'
    		    },
    		    'pagination': {
    		      'previous': '⬅️',
    		      'next': '➡️'
    		    }
    		},
    		height : "75%"
    	}).render(document.getElementById("grid"));

    	
    	/* 단축키 추가 설정 (JANG 240607) */
    	document.addEventListener('keydown', (evt) => {   		
    		// keyCode 확인하는 사이트 링크 ( https://www.toptal.com/developers/keycode )
    		
    		// 출력하기 : alt + shift + a
    		if (evt.keyCode === 65 && evt.shiftKey && evt.altKey) {
    			evt.preventDefault();
    			$("#printBtn").trigger("click");
				return false;
			// 수령인 검색 : alt + shift + q
			}else if(evt.keyCode === 81 && evt.shiftKey && evt.altKey){
				evt.preventDefault();
    			$(".search").trigger("click");
				return false;
			// 저장&수정하기 : alt + shift + e
			}else if(evt.keyCode === 69 && evt.shiftKey && evt.altKey){
				evt.preventDefault();
    			$("#adminDelRegBtn").trigger("click");
				return false;
			// 삭제하기 : alt + shift + w
			}else if(evt.keyCode === 87 && evt.shiftKey && evt.altKey){
				evt.preventDefault();
    			$("#boxDel").trigger("click");				
				return false;
			// 송장출력하기 : +(키패드)
			}else if(evt.keyCode === 107){
				evt.preventDefault();
				if($(".outWrap").css("display") == "flex"){
					fnPrint();
				}else{
					console.log("no date");
				}
			}
    	});
    	
    	/* boxsize input에서 엔터키 이벤트 (JANG 240607) */
    	$(".boxSize").on("keypress", function(evt){
    		if(evt.keyCode === 13){
	    		evt.preventDefault();
				$("#boxSaveBtn").trigger("click");
    		}
    	});    	
    	
    	
    	
   	});	// document.ready end!!
   	   	
   	
   	/* qrCode 생성 함수 (JANG) */
   	//QRCode.CorrectLevel은 L, M, Q ,H 로 나뉜다.
   	//H로 갈수록 오류복원의 효율이 증가하지만, 데이터 용량이 증가한다.
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
   	
    
    // 용적용량 자동계산기 (이동헌)
    // 수정 : 할인율 추가(이동헌)
    function cost(){
    	var number = 0;
    	$("#tBody > tr").each(function(){
    		var width = $(this).find("input[name=width]").val();
    		var height = $(this).find("input[name=height]").val();
    		var length = $(this).find("input[name=length]").val();
    		var weight = $(this).find("input[name=weight]").val();
    		var d_use = $(this).find("input[name=d_use]").val();
    		var discount = (d_use == 'Y') ? $(this).find("input[name=discount]").val() * 0.01
    					  : 0;
    		
//			$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산)
// 			용적중량 : 가로*세로*높이*0.00022 
			
			var kgcost = Math.round(weight * 1.5 * 100) / 100;
			var lncost = Math.round(width * height * length * 0.00022 * 1.5 * 100) / 100;
		
// 			console.log(kgcost,lncost);
			if(kgcost < 10 && lncost < 10){
				number += 10 -  (10 * discount);
			}
			else if(kgcost >= lncost){
				number += kgcost -  (kgcost * discount);
			}
			else{
				number += lncost -  (lncost * discount);
			}
    	});
    	
    	$("#cost").val(number.toFixed());
    }
    // 개별 물류 비용 계산 function cost() 참고 (JANG)
    function indiCost(height, width, length, weight){
    	var number = 0;
    	var kgcost = Math.round(weight * 1.5* 100) / 100;
		var lncost = Math.round(width * height * length * 0.00022 * 1.5* 100) / 100;
		if(kgcost < 10 && lncost < 10){
			number += 10;
		}
		else if(kgcost >= lncost){
			number += kgcost;
		}
		else{
			number += lncost;
		}
		return number.toFixed(5);
    }
    
    // Join.jsp 참고 (이동헌)
    function oninputPhone(target) {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/([0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
//             .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
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
    
    // input data 초기화 
	function boxInit(){
		$("#widthArr").val("");
		$("#lengthArr").val("");
		$("#heightArr").val("");
		$("#sjKeyArr").val("");
	}
	function discount_changer(discount){
		$(".duseY >input[name='discount']").val(discount);
		$(".duseTrY").text(discount);
	}
    
    //우선할인 여부 (추가자 : 이동헌)
//     function duse(){
//     	$("#discount").val("");
//     	if($("#d_use").prop("checked") == true){
//     		$("#discount").show();
//     	}
//     	else{
//     		$("#discount").hide();	
//     	}
    	
//     }
    
    </script>
</body>
</html>