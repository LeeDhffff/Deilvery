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
                                <input type="text" id="recPhone" name="recPhone" value="${result.recPhone }" placeholder="라오스 수령인 전화번호를 입력해주세요">
                            </div>
                        </div> 

                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">픽업지 선택<span>*</span></a></h5>
                            <select name="recTarget" id="recTarget">
                                <option value="1">본사</option>
                                <option value="2">하우 창고</option>
                            </select>
                        </div>

                        <div class="double">
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">본사주소</a></h5>
                                <input type="text" id="bon" name="recAddr" id="recAddr" placeholder="Pakthang Villsge, Sikhot District T3, Dongnatong Vientiane, LAO P.D.R">
                            </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">하우 창고 주소</a></h5>
                                <input type="text" id="hou" name="recHou" id="recHou" placeholder="Pakthang Villsge, Sikhot District T3, Dongnatong Vientiane, LAO P.D.R">
                                <h5 class="inputAlarm"><a href="#">※하우창고에서 수령시 배출일 (9시~17시) 하루동안만 개봉되며 미수령시 본사로 이동됩니다.</a></h5>
                            </div>
                        </div> 

                        <div class="double box">
                            <div class="inputWrap">
                                <div class="inputHeader" style="display: flex; justify-content: space-between;">
                                    <h5 class="inputName"><a href="#">박스크기<span>*</span></a></h5>
                                    <button class="boxSave" id="boxSaveBtn">저장하기</button>
                                </div>                                
                                <input type="text" id="width" class="boxSize" placeholder="가로">
                                <input type="text" id="length" class="boxSize" placeholder="세로">
                                <input type="text" id="height" class="boxSize" placeholder="높이">
                                <input type="text" id="weight" class="boxSize" placeholder="무게">
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
                            			<c:when test="${item.outDay eq result.arrDay }">
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
    	
    	/* 신청일자 datePicker 설정 (JANG) */
    	$("#creDay").datepicker();
    	$("#creDay").datepicker("option", "dateFormat", "yy-mm-dd");
    	$("#creDay").datepicker("setDate", "${result.creDay}");
    	
    	/* 본사, 하우창고 선택 설정 (JANG) */
    	if("${result.recTarget}" != "" && "${result.recTarget}" != null){
	    	$("#recTarget").val("${result.recTarget}").prop("selected", true);
    	}
    	
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
    		$("#widthArr").val(widthArr);
    		$("#heightArr").val(heightArr);
    		$("#lengthArr").val(lengthArr);
    		$("#weightArr").val(weightArr);
    		
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
	    			if(($(this).val() == null || $(this).val() == '') && $(this).attr("id") != "bon" && $(this).attr("id") != "hou" && $(this).attr("id") != "width" && $(this).attr("id") != "length" && $(this).attr("id") != "height" && $(this).attr("id") != "weight" ){
	    				const text = $(this).siblings(".inputName").children().text();
	    				console.log('text : ', text);
	    				alert(text+' 정보를 입력해주세요.');
	    				$(this).focus();
	    				regist = false;
	    				return false;
	    			}
	    		}); 
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
						alert(result);
	
						/* redirect될 경로 설정 필요!! */
						$(".nc_delivery").trigger("click");
						
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
        	let recTarget = ($("#recTarget").val() == 1) ? "본사" : "하우창고";
        	let qrTxt = "";
        	
        	if($("input[name=sjKey]").length > 0){
	        	$("input[name=sjKey]").each(function(index){
	        		// QR Code 데이터 설정 영역
	        		sjKeyArr.push($("input[name=sjKey]").eq(index).val());
	        		let txt = sjKeyArr[index].split("-");
	        		qrTxt = "수령인 : "+$("#recNm").val()+"\n연락처 : "+$("#recPhone").val()+"\n픽업지 : "+recTarget+"\n박스번호 : "+txt[2];	        		
	        		qrInfoArr.push({qrText : qrTxt, qrId : "qrCode_"+index});
	        		
	        		// html영역
	        		htmlStr += '<div class="outHeader">';
	        		htmlStr += '	<div class="left" id="qrCode_'+index+'">';
	        		htmlStr += '	</div>'
	        		htmlStr += '	<div class="right">';
	        		htmlStr += '		<div class="logo">';
	        		htmlStr += '			<img src="images/delivery/pc_icon/logo_color.svg" alt="#">';
	        		htmlStr += '		</div>';
	        		htmlStr += '		<div class="bottom" style="display: flex;">';
	        		htmlStr += '			<div>';
	        		htmlStr += '				<h5>라오스·한국물류</h5>';
	        		htmlStr += '				<h5>라오스어 영역</h5>';
	        		htmlStr += '			</div>';
	        		htmlStr += '			<div>';
	        		htmlStr += '				<h5>카카오로고</h5>';
	        		htmlStr += '				<h5>EKLAOS</h5>';
	        		htmlStr += '			</div>';
	        		htmlStr += '		</div>';
	        		htmlStr += '	</div>';
	        		htmlStr += '</div>';
	        		htmlStr += '<div class="outBody">';
	        		htmlStr += '	<p> 접수번호 : <br></p>';
	        		htmlStr += '	<h1>'+txt[0]+'</h1>';
	        		htmlStr += '</div>';
	        		htmlStr += '<div class="outFoot">';
	        		htmlStr += '	<div class="top">';
	        		htmlStr += '		<h5>No.'+$("input[name=sjKey]").eq(index).val()+'</h5>';
	        		htmlStr += '	</div>';
	        		htmlStr += '	<div class="bottom">';
	        		htmlStr += '		<h5>Tel.020-1234-1234</h5>';
	        		htmlStr += '	</div>';
	        		htmlStr += '</div>'
	        		htmlStr += '<hr/>';
					// qrTxt 초기화 
	        		qrTxt = "";
	        	});
	        	
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
   		    width: 62,
   		    height: 62,
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
   	
    </script>
</body>
</html>