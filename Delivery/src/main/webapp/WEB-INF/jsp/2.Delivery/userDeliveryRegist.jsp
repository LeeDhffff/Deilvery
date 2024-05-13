<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송신청</title>
    
    <!-- jQuery import -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>    
    
    <!-- css import -->
    <link href="css/userDeliveryRegist/common.css" rel="stylesheet" type="text/css">
    <link href="css/userDeliveryRegist/userDeliveryRegistStyle.css" rel="stylesheet" type="text/css">
    
    <!-- import font-awesome, line-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">

    <!-- import pretendard font -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
        
</head>
<body>
	<div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">배송신청</a>
                </h1>
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">반갑습니다. <span class="customer">${memInfo[0].memNm }</span> 회원님</a>
                    </h3>    
                    <form id="formData" name="formData">
                   	<input type="hidden" id="memId" value="${memInfo[0].memId }" />
                   	<input type="hidden" id="memLv" value="${memInfo[0].memLv }" />
                    <div class="wrap">                        
                        <div class="double">
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">수령인<span>*</span></a></h5>
                                <input type="text" id="recNm" name="recNm" placeholder="라오스 수령인 성함을 입력해주세요">
                            </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">휴대폰 번호<span>*</span></a></h5>
                                <input type="text" id="recPhone" name="recPhone" placeholder="라오스 수령인 전화번호를 입력해주세요">
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

                        <div class="double">
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">본사주소</a></h5>
                                <input type="text" id="bon" placeholder="Pakthang Villsge, Sikhot District T3, Dongnatong Vientiane, LAO P.D.R" readonly>
                            </div>
                            <div class="inputWrap">
                                <h5 class="inputName"><a href="#">하우 창고 주소</a></h5>
                                <input type="text" id="hou" placeholder="Pphonpapao village , Sisatttanak Dostrict,Vientiane" readonly>
                                <h5 class="inputAlarm"><a href="#">※하우창고에서 수령시 배출일 (9시~17시) 하루동안만 개봉되며 미수령시 본사로 이동됩니다.</a></h5>
                            </div>
                        </div> 

                        <div class="inputWrap full">
                            <h5 class="inputName"><a href="#">배송제품 작성<span>*</span></a></h5>
                            <input type="text" id="recTxt" name="recTxt" placeholder="배송 제품에 관하여 간략하게 적어주세요. ex: 옷 1박스, TV, 에어컨">
                        </div>

                        <div class="inputWrap full">
                            <h5 class="inputName"><a href="#">배송서비스 신청하기</a></h5>
                            <input type="text" id="gooCoordinate" name="gooCoordinate" placeholder="구글 좌표를 입력해주세요.">
                            <h5 class="inputAlarm"><a href="#">※10 box 이상의 대량 물건, 냉장고, 세탁기 정도의 큰 물건 물건만 가능하며 소량물건은 배송 서비스가 거부될 수 있습니다.</a></h5>
                        </div>

                        <div class="noticeWrap">
                            <div class="noticeCon day">
                                <h3 class="noticeTitle">
                                    <a href="#">
                                        <span class="icon">
                                            <img src="images/delivery/pc_icon/time_black.svg" alt="#">
                                        </span>                                        
                                    </a>
                                    접수기간
                                </h3>                                
                                <hr style="border: 1px solid #e5e5ec; margin: 20px 0;">
                                <p>
                                    기간 : 매달 10일 ~31일<br>
                                    주소 : 경기도 시흥시 마전로330(EK물류)<br>
                                    한국접수처 : 나실장 010-6235-8005 / KaKao : EK2424
                                </p>
                            </div>
                            <div class="noticeCon calendar">
                                <h3 class="noticeTitle">
                                    <a href="#">
                                        <span class="icon">
                                            <img src="images/delivery/pc_icon/callendar.svg" alt="#">
                                        </span>                                       
                                    </a>
                                    해상물류일정
                                </h3>
                                <hr style="border: 1px solid #e5e5ec; margin: 20px 0;">
                                <p>
                                    출항 : 매달 5일경 컨테이너 출항<br>
                                    도착 : 매달 20일경 라오스 도착<br>
                                    라오스 사무소 : EK해상물류담당 020-5553-3327 / KaKao : eklaos
                                </p>
                            </div>
                        </div>

                        <div class="noticeWrap">
                            <div class="noticeCon notice">
                                <h3 class="noticeTitle">
                                    <a href="#">
                                        <span class="icon">
                                            <img src="images/delivery/pc_icon/notice_red.svg" alt="#">
                                        </span>                                       
                                    </a>
                                    필수사항
                                </h3>
                                <hr style="border: 1px solid #e5e5ec; margin: 20px 0;">
                                <p>
                                    고중량, 대량물건은 한국 사무소에<br> 
                                    필히 사전 상담 후 진행 바랍니다.
                                </p>
                            </div>
                            <div class="noticeCon cost">
                                <h3 class="noticeTitle">
                                    <a href="#">
                                        <span class="icon">
                                            <img src="images/delivery/pc_icon/card_black.svg" alt="#">
                                        </span>                                       
                                    </a>
                                    물류비용 ( 최소운임비용 $10)
                                </h3>
                                <hr style="border: 1px solid #e5e5ec; margin: 20px 0;">
                                <p>
                                    모든 품목 kg * $1.5 or 용적중량 * $1.5<br>
                                    [ 용적중량 = (가로*세로*높이*0.00022) ]
                                </p>
								<!-- creday 및 chk 추가 (수정자: 이동헌) -->
                            	<input type="hidden" id="creDay" name="creDay" value="">
                            	<input type="hidden" id="chk" name="chk" placeholder="" value="N">
                            </div>
                        </div>
                       	</form>
                        <button class="bottomButton" id="delRegistBtn">배송 신청하기</button>
                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
    
	
	<!-- script setting -->
    <script>

	
    $(document).ready(function(){
    	console.log("페이지초기화!");
    	
    	/* 배송신청 버튼 클릭 이벤트 설정 (JANG) */
    	$("#delRegistBtn").on("click", function(evt){
    		
    		evt.preventDefault();    		
    		
    		const formData = document.formData;
    		const recTarget = formData.recTarget.value; // 픽업지 선택 데이터
    		let regist = true;
    		
    		/* 필수값 유효성 검사 */
    		if($("#recTxt").val() == "" || $("#recTxt").val() == null){
    			const text = $("#recTxt").siblings(".inputName").children().text();
				console.log('text : ', text);
				alert(text+' 정보를 입력해주세요.');
				$("#recTxt").focus();
    			regist = false;
    		}else{
	    		$("#formData > .wrap > .double > .inputWrap > input").each(function(index){ 
	    			if(($(this).val() == null || $(this).val() == '') && $(this).attr("id") != "gooCoordinate" && $(this).attr("id") != "bon" && $(this).attr("id") != "hou"){
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
// 	    		console.log("formData : ", $("#formData").serialize());
				$.ajax({
					url : "userDelRegist.do",
					type : "POST",
					async : false,
					data : $("#formData").serialize(),
					success : function(result, status, xhr){
						console.log("result : ", result);
						alert(result);
	
						/* redirect될 경로 설정 필요!! */
						location.href = "userDeliveryRegistResult.do?memNm="+"${memInfo[0].memNm}"+"&memId="+$("#memId").val();
						
					},
					error : function(xhr, status, error){
						console.log("xhr : ", xhr, " // status : ", status, " // error : ", error);
						alert("배송신청에 실패했습니다. 관리자에게 문의해주세요.");
					}
				});    			
    		}
    		
    		
    	});
   	});	// document.ready end!!
    </script>
</body>
</html>