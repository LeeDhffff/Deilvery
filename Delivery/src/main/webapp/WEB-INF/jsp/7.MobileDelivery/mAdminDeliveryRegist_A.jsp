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
    <link href="css/adminDeliverRegist/mAdminDeliveryRegist_A_Style.css" rel="stylesheet" type="text/css">
    
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
            <h3 class="arrow" onclick="location.href='Mobile_Main.do';">
                <a href="#">
                    <img src="images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <c:choose>
				<c:when test="${result.inKey ne '' && not empty result.inKey }">
					<div class="m_headerTitle">물류접수-수정하기</div>
				</c:when>
				<c:otherwise>
					<div class="m_headerTitle">물류접수</div>                            			
				</c:otherwise>
			</c:choose>            
        </header>        
        <section>  
        	<form id="formData" name="formData">                              
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">신청일자<span>*</span></a></h5>
                <input type="text" id="creDay" name="creDay" placeholder="선택">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">수령인<span>*</span></a></h5>
                <input type="text" id="recNm" name="recNm" value="${result.recNm}" placeholder="라오스 수령인 성함을 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">휴대폰 번호<span>*</span></a></h5>
                <input type="text" id="recPhone" name="recPhone" value="${result.recPhone }" placeholder="라오스 수령인 전화번호를 입력해주세요">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">픽업지 선택<span>*</span></a></h5>
                <select name="recTarget" id="recTarget">
                    <option value="1">본사</option>
                    <option value="2">하우 창고</option>
                    <option value="3">지방배송</option>
                </select>
            </div>

            
            <div class="inputWrap address target_1">
                <h5 class="inputName"><a href="#">본사주소</a></h5>
                <div>Pakthang Villsge, Sikhot District T3, Dongnatong Vientiane, LAO P.D.R</div>
            </div>
            <div class="inputWrap address target_1">
                <h5 class="inputName"><a href="#">하우 창고 주소</a></h5>
                <div>phonpapao village ,  Sisatttanak Dostrict,Vientiane </div>
                <h5 class="inputAlarm"><a href="#">※하우창고에서 수령시 배출일 (9시~17시) 하루동안만 개봉되며 미수령시 본사로 이동됩니다.</a></h5>
            </div>
            
            <div class="inputWrap target_3">
                <h5 class="inputName"><a href="#">택배사</a></h5>
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
            <div class="inputWrap target_3">
                <h5 class="inputName"><a href="#">상세주소</a></h5>
                <input type="text" name="recHou" id="recHou" value="${result.recHou}">
            </div>
            
            <!-- 파라메터 hidden 설정 -->
            <input type="hidden" id="inKey" name="inKey" value="${inputMap.inKey }"/>
            <input type="hidden" id="arrDay" name="arrDay" value="${result.arrDay }"/>           
            <input type="hidden" id="memId" name="memId" />
            </form>                                   
        </section>
        <footer>
            <button id="nextBtn">다음</button>
        </footer>
    </div>
   	
	<!--	common Session jsp import	-->
	<jsp:include page="/js/7.MobileDelivery/mCommon.jsp"></jsp:include>
   	
   	<script>
   	$(document).ready(function(e){
   		$(".target_3").hide();
   		console.log("[내부 A] uid : ", uid, " // udi2 : ", uid2, " // level : ", level);
   		chkAuth(uid, uid2, level);
   		const initCreDay = "${result.creDay}";
   		const initRecTarget = "${result.recTarget}";
   		
   		/* 신청일자 datePicker 설정 (JANG) */
    	$("#creDay").datepicker();
    	$("#creDay").datepicker("option", "dateFormat", "yy-mm-dd");
    	if(initCreDay != ""){
	    	$("#creDay").datepicker("setDate", "${result.creDay}");
    	}
    	
    	/* 본사, 하우창고, 지방배송 선택 설정 (JANG) */
    	if(initRecTarget != ''){
	    	$("#recTarget").val("${result.recTarget}").prop("selected", true);
	    	if($("#recTarget").val() == 3){
	    		$(".target_1").hide();
    			$(".target_3").show();
	    	}
    	}
   		
    	/* 지방배송 선택 설정 (JANG) */
    	$("#recTarget").on("change", function(evt){
    		if($(this).val() == 1 || $(this).val() == 2){
    			$(".target_1").show();
    			$(".target_3").hide();
    		}else{
    			$(".target_1").hide();
    			$(".target_3").show();
    		}
    	});
    	
    	/* 다음버튼 클릭 이벤트 설정(JANG) */
   		$("#nextBtn").on("click", function(e){
   			let regist = true;
   			const creDayVal = $("#creDay").val();
   			const recNmVal = $("#recNm").val();
   			const recPhoneVal = $("#recPhone").val();
   			const recTargetVal = $("#recTarget").val();
   			
   			$("#formData > .inputWrap > input").each(function(index){    			    			
    			if(($(this).val() == null || $(this).val() == '') && $(this).attr("id") != "recHou"){
    				const text = $(this).siblings(".inputName").children().text();
    				console.log('text : ', text);
    				alert(text+' 정보를 입력해주세요.');
    				$(this).focus();
    				regist = false;
    				return false;
    			}
    		});
   			
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
   				console.log("formData A : ", $("#formData").serialize());
   				$.ajax({
   	   				url : "mAdminDeliveryRegistB.do",
   	   				type : "POST",
   	   				data : $("#formData").serialize(),
   	   				async : false,
   	   				success : function(result, status, xhr){   					
   	   					$(".m_container").html(result);
   	   				},
   	   				error : function(xhr, status, error){
   	   					console.log("xhr : ", xhr, " // status : ", status, " // error : ", error);
   	   				}
   	   			});
   			}
   		});
   		
   	});
   	
    </script>
</body>
</html>