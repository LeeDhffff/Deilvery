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
    
    <!-- css import -->
    <link href="css/adminDeliverRegist/mCommon.css" rel="stylesheet" type="text/css">
    <link href="css/adminDeliverRegist/mAdminDeliveryRegist_C_Style.css" rel="stylesheet" type="text/css">
    
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
        	<form id="formData" name="formData">
            <div class="inputWrap cost">
                <h5 class="inputName"><a href="#">예상물류비용</a></h5>
                <input type="text" id="cost" name="cost" value="${inputMap.cost }" placeholder="$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산) ※용적중량 : 가로*세로*높이*0.00022"/>
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">비고</a></h5>
                <input type="text" id="bigo" name="bigo" value="${inputMap.bigo }" placeholder="비고 사항을 입력해주세요."/>
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">출항일선택하기<span>*</span></a></h5>
                <input type="hidden" id="arrDay" name="arrDay" value="${inputMap.arrDay }" placeholder="yyyy-mm-dd"> 
				<input type="hidden" id="outKey" name="outKey" value="${inputMap.outKey }"/>
				<select name="outDay" id="outDay">
					<option value="N">출항일 선택</option>
					<c:forEach var="item" items="${outDayList }">
						<c:choose>
							<c:when test="${item.outKey eq inputMap.outKey }">
								<option value="${item.outKey }" selected>${item.outDay }</option>
							</c:when>
                            <c:otherwise>
								<option value="${item.outKey }">${item.outDay }</option>                            			
							</c:otherwise>
						</c:choose>                            		
					</c:forEach>
				</select>     
            </div>
            
            <!-- 파라메터 hidden 설정 -->
            <input type="hidden" id="recNm" name="recNm" value="${inputMap.recNm }"/>
            <input type="hidden" id="recPhone" name="recPhone" value="${inputMap.recPhone }"/>
            <input type="hidden" id="subPhone" name="subPhone" value="${inputMap.subPhone }"/>
            <input type="hidden" id="recTarget" name="recTarget" value="${inputMap.recTarget }"/>
			<input type="hidden" id="recAddr" name="recAddr" value="${inputMap.recAddr }"/>
            <input type="hidden" id="recHou" name="recHou" value="${inputMap.recHou }"/>
            <input type="hidden" id="inKey" name="inKey" value="${inputMap.inKey }"/>
            <input type="hidden" id="creDay" name="creDay" value="${inputMap.creDay }"/>
            <input type="hidden" id="widthArr" name="widthArr" value="${inputMap.widthArr }">
			<input type="hidden" id="lengthArr" name="lengthArr" value="${inputMap.lengthArr }">
			<input type="hidden" id="heightArr" name="heightArr" value="${inputMap.heightArr }">
			<input type="hidden" id="weightArr" name="weightArr" value="${inputMap.weightArr }">
			<input type="hidden" id="costArr" name="costArr" value="${inputMap.costArr }">
			<input type="hidden" id="recTxt" name="recTxt" value="${inputMap.recTxt }"/>
            <input type="hidden" id="gooCoordinate" name="gooCoordinate" value="${inputMap.gooCoordinate }"/>
            <input type="hidden" id="initSjKey" name="initSjKey" value="${inputMap.initSjKey }" />
            <input type="hidden" id="sn" name="sn" value="${inputMap.sn }" />
            </form>
        </section>
        <footer>   
            <button id="returnBtn" onclick="location.href='Mobile_M_DeliveryList.do';">미완료건으로 이동</button>
            <button id="adminDelRegBtn">저장 하기</button>
        </footer>
    </div>
    
	<!--	common Session jsp import	-->
<!-- 	동일한 화면에서 html만 바뀌기 때문에 include 필요 없음 -->
<%-- 	<jsp:include page="/js/7.MobileDelivery/mCommon.jsp"></jsp:include> --%>
	    
	<!-- script setting -->
    <script>
    $(document).ready(function(){
    	console.log("페이지초기화C");
    	console.log("[내부 C] uid : ", uid, " // udi2 : ", uid2, " // level : ", level);
    	chkAuth(uid, uid2, level);
    	
    	/* 출항일(selectbox) change event 설정 (JANG) */    	
    	$(document).on("change", "#outDay", function(evt){
    		$("#arrDay").val($("select[name=outDay]").val());
    		$("#outKey").val($("select[name=outDay]").val());
    	});
    	
    	/* 물류접수-수정 진입시 출항일 변경 불가능 하도록 설정 (JANG) */
    	const resultArrDay = "${inputMap.outKey}";    	
    	if(resultArrDay != ""){
    		console.log("진입!!");
    		$("#outDay").attr("disabled", true);
    		$("#outKey").val(resultArrDay);
    	}
    	
    	/* 배송신청 버튼 클릭 이벤트 설정 (JANG) */   	
    	$("#adminDelRegBtn").on("click", function(evt){
    		
    		evt.preventDefault();
    		let regist = true;
    		if($("#outDay").val()=='N'){
    			alert("출항일을 선택해주세요.");
    			$("#outDay").focus();
    			regist = false;
    		}
    		
    		$("#arrDay").val($("select[name=outDay]").val());
    		$("#outKey").val($("select[name=outDay]").val());
    		
    		console.log("formData : ", $("#formData").serialize());

    		if(regist){
				$.ajax({
					url : "mAdminDelRegist.do",
					type : "POST",
					async : false,
					data : $("#formData").serialize(),
					success : function(result, status, xhr){
						console.log("result : ", result);
						let resultMsg = result.split("=");
						alert(resultMsg[1]);
	
						/* redirect될 경로 설정 필요!! */
						location.href = "Mobile_M_DeliveryList.do";
						
					},
					error : function(xhr, status, error){
						console.log("xhr : ", xhr, " // status : ", status, " // error : ", error);
						alert("배송신청에 실패했습니다. 관리자에게 문의해주세요.");
					}
				});
    		}
    	});
    	
    	/* 미확인 배송신청으로 돌아가기 (JANG) */
    	$("#returnBtn").on("click", function(evt){
    		evt.preventDefault();
    		location.href = "Mobile_M_DeliveryList.do";
    	});
    	
    	/* 데이터 가지고 뒤로가기 설정 (JANG) */
    	$(".arrow").on("click", function(evt){  		
    		console.log("click!");
    		$.ajax({
				url : "mAdminDeliveryRegistB.do",
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
   	
    </script>
</body>
</html>