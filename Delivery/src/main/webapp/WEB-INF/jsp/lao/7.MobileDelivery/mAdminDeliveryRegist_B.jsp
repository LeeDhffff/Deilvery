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
    <link href="css/adminDeliverRegist/mCommon.css" rel="stylesheet" type="text/css">
    <link href="css/adminDeliverRegist/mAdminDeliveryRegist_B_Style.css" rel="stylesheet" type="text/css">
    
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">

    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
        <script src="./js/pageChange.js"></script>
</head>
<body>
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow">
                <a href="#">
                    <img src="images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <c:choose>
				<c:when test="${inputMap.inKey ne '' && not empty inputMap.inKey }">
					<div class="m_headerTitle">물류접수-수정하기</div>
				</c:when>
				<c:otherwise>
					<div class="m_headerTitle">물류접수</div>                            			
				</c:otherwise>
			</c:choose>
        </header>        
        <section>
            <form name="fromData" id="formData" >            
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">박스크기<span>*</span></a></h5>
                <input type="text" id="width" class="boxSize" placeholder="가로" oninput="fnChkNum(this);">
                <input type="text" id="length" class="boxSize" placeholder="세로" oninput="fnChkNum(this);">
                <input type="text" id="height" class="boxSize" placeholder="높이" oninput="fnChkNum(this);">
                <input type="text" id="weight" class="boxSize" placeholder="무게" oninput="fnChkNum(this);">
            </div>
            <button class="boxSave" id="boxSaveBtn">저장하기</button>
                   
            <div class="boxInfoWrap">
			<input type="hidden" id="widthArr" name="widthArr" placeholder="가로">
			<input type="hidden" id="lengthArr" name="lengthArr" placeholder="세로">
			<input type="hidden" id="heightArr" name="heightArr" placeholder="높이">
			<input type="hidden" id="weightArr" name="weightArr" placeholder="무게">
			<input type="hidden" id="costArr" name="costArr" placeholder="금액">
                <div class="boxInfoHeader">
                    <h5><a href="#">물류접수내역</a></h5>
                </div>
                <c:forEach var="item" items="${packInfo }" varStatus="status">
	                <div class="boxInfoCon">
	                	<input type="checkbox" id="box_${status.index }" name="boxIndex" >
	                	<h5 class="boxinfo">W*L*H(${item.width }cm *${item.length }cm * ${item.height }cm) / 무게:${item.weight }kg</h5>
	                    <input type="hidden" name="width" value="${item.width }" />
						<input type="hidden" name="height" value="${item.height }" />
						<input type="hidden" name="length" value="${item.length }" />
						<input type="hidden" name="weight" value="${item.weight }" />
						<input type="hidden" name="indiCost" value="${item.cost }" />
						<input type="hidden" name="sjKey" value="${item.sjKey }" />
					</div>
                </c:forEach>
            </div>
            
            <!-- 파라메터 hidden 설정 -->
            <input type="hidden" id="recNm" name="recNm" value="${inputMap.recNm }"/>
            <input type="hidden" id="recPhone" name="recPhone" value="${inputMap.recPhone }"/>
            <input type="hidden" id="subPhone" name="subPhone" value="${inputMap.subPhone }"/>
            <input type="hidden" id="recTarget" name="recTarget" value="${inputMap.recTarget }"/>
            <input type="hidden" id="recAddr" name="recAddr" value="${inputMap.recAddr }"/>
            <input type="hidden" id="recHou" name="recHou" value="${inputMap.recHou }"/>
            <input type="hidden" id="inKey" name="inKey" value="${inputMap.inKey }"/>
            <input type="hidden" id="ik" name="ik" value="${inputMap.inKey }"/>
            <input type="hidden" id="creDay" name="creDay" value="${inputMap.creDay }"/>
            <input type="hidden" id="cost" name="cost" />
            <input type="hidden" id="outKey" name="outKey" value="${packInfo[0].outKey }"/>
            <input type="hidden" id="bigo" name="bigo" value="${inputMap.bigo }"/>
            <input type="hidden" id="recTxt" name="recTxt" value="${inputMap.recTxt }"/>
            <input type="hidden" id="gooCoordinate" name="gooCoordinate" value="${inputMap.gooCoordinate }"/>
            <input type="hidden" id="initSjKey" name="initSjKey" value="${inputMap.initSjKey }" />
            <input type="hidden" id="sn" name="sn" value="${packInfo[0].sn }" />
            </form>
        </section>
        <footer>
            <button class="delete" id="boxDel">삭제</button>
            <button class="next" id="nextBtn">다음</button>
        </footer>
    </div>    
	
	<!--	common Session jsp import	-->
	<jsp:include page="/js/7.MobileDelivery/mCommon.jsp"></jsp:include>
		
	<!-- script setting -->
    <script>
    $(document).ready(function(){
    	console.log("페이지초기화!");
    	console.log("[내부 B] uid : ", uid, " // udi2 : ", uid2, " // level : ", level);
    	chkAuth(uid, uid2, level);
    	
    	/* initSjKey 담기 (240531 JANG) */
		const initSjKey = new Array();
		$("input[name='sjKey']").each(function(index){
			initSjKey.push($(this).val());
		});
		if(initSjKey.length != 0){
			let arr = initSjKey[0].split("-");
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
			$("#cost").val(num);
		}
    	
    	// box데이터 수정하러 들어왔을 때 대비해서 boxIndex 활용 방안 체크 다시할 것!!
		let boxIndex = 0;
   		const chkIndex = $("input[class='boxSize']").length;
    	
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
	    		htmlStr += "<div class='boxInfoCon'>";
	    		htmlStr += "	<input type='checkbox' id='box_"+boxIndex+"' name='boxIndex'>";
	    		htmlStr += "	<h5 class='boxinfo'>W*L*H("+widthVal+"cm *"+lengthVal+"cm *"+heightVal+"cm)/무게:"+weightVal+"kg</h5>";
	    		htmlStr += "	<input type='hidden' name='width' value='"+widthVal+"'>";
	    		htmlStr += "	<input type='hidden' name='height' value='"+heightVal+"'>";
	    		htmlStr += "	<input type='hidden' name='length' value='"+lengthVal+"'>";
	    		htmlStr += "	<input type='hidden' name='weight' value='"+weightVal+"'>";
	    		htmlStr += "	<input type='hidden' name='indiCost' value='"+indiCost(heightVal, widthVal, lengthVal, weightVal)+"'>";
	    		htmlStr += "</div>";
	    		
	    		$(".boxInfoWrap").append(htmlStr);
	    		$("input[class='boxSize']").val("");
	    		cost();
    		}
    	});
    	
    	/* 입력된 박스 정보 삭제 설정 (JANG) */
    	$("#boxDel").on("click", function(evt){
    		evt.preventDefault();
    		// 박스정보 삭제
    		$("input[name=boxIndex]").each(function(index){
	    		if($(this).is(":checked")){
	    			$(this).parent().remove();
		    		cost();
	    		}
    		});
    	});
    	
    	
    	/* 다음버튼 클릭 이벤트 설정(JANG) */
   		$("#nextBtn").on("click", function(e){
   			const widthArr = new Array();
   			const heightArr = new Array();
   			const weightArr = new Array();
   			const lengthArr = new Array();
   			const costArr = new Array();
   			
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
    		$("#widthArr").val(widthArr);
    		$("#heightArr").val(heightArr);
    		$("#lengthArr").val(lengthArr);
    		$("#weightArr").val(weightArr);
    		$("#costArr").val(costArr);
    		
    		console.log("formData B : ", $("#formData").serialize());
    		    		
   			$.ajax({
   				url : "mAdminDeliveryRegistC.do",
   				type : "POST",
   				data : $("#formData").serialize(),
   				async : false,
   				success : function(result, status, xhr){
   					$(".m_container").empty();
   					$(".m_container").html(result);
   				},
   				error : function(xhr, status, error){
   					console.log("xhr : ", xhr, " // status : ", status, " // error : ", error);
   				}
   			});
    		
   		});
    	
   		/* 데이터 가지고 뒤로가기 설정 (JANG) */
    	$(".arrow").on("click", function(evt){  		
    		console.log("click!");
    		$.ajax({
				url : "mAdminDeliveryRegistMain.do",
				type : "POST",
				async : false,
				data : $("#formData").serialize(),
				success : function(result, status, xhr){
					$(".m_container").empty();
   					$(".m_container").html(result);					
				},
				error : function(xhr, status, error){
					console.log("xhr : ", xhr, " // status : ", status, " // error : ", error);
					alert("관리자에게 문의해주세요.");
				}
			});    		
    	});
    	
    	
   	});	// document.ready end!!
   	
   	function cost(){
    	var number = 0;
    	$(".boxInfoCon").each(function(){
    		var width = $(this).find("input[name=width]").val();
    		var height = $(this).find("input[name=height]").val();
    		var length = $(this).find("input[name=length]").val();
    		var weight = $(this).find("input[name=weight]").val();
    		
//			$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산)
// 			용적중량 : 가로*세로*높이*0.00022 
			
			var kgcost = weight * 1.5;
			var lncost = Math.round(width * height * length * 0.00022 * 1.5);
		
// 			console.log(kgcost,lncost);
			if(kgcost < 10 && lncost < 10){
				number += 10;
			}
			else if(kgcost >= lncost){
				number += kgcost;
			}
			else{
				number += lncost;
			}
    	});
    	
    	$("#cost").val(number.toFixed(5));
    }
   	
    // 개별 물류 비용 계산 function cost() 참고 (JANG)
    function indiCost(height, width, length, weight){
    	var number = 0;
    	var kgcost = weight * 1.5;
		var lncost = Math.round(width * height * length * 0.00022 * 1.5);
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
   	
 	// 숫자와 마침표만 입력 정규식 체크 (JANG)
    function fnChkNum(elem){    	
    	elem.value = elem.value.replace(/[^0-9.]+(.[^0-9]+)?/,'');
    }
 	
    </script>
</body>
</html>