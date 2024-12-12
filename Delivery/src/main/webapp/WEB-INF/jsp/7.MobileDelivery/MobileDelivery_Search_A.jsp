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
    <title>EK Logistics</title>
</head>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">

	
	.inputsection{
		display:flex;
		margin: 10px 30px 10px 30px;
	}
	.inputName{
	    width: 80px;
   	 	height: 30px;
	    line-height: 30px;
	    margin: 0 0 0 5px;
	}
	.inputName > a{
	    font-size: 17px;
	}

	.inputWrap{
		display:flex;    
		margin-top: 10px;
	}
	.savebutton{
		font-size: 20px;
		width: 80px;
	    height: 30px;
	    border-radius: 4px;
	    background: seagreen;
	    color: white;
        margin: 0px 0px 0px 10px;
	}
    .kakaotalkbutton{
    	font-size: 16px;
    	height: 30px;
	    border-radius: 4px;
	    background: #ffa100;
	    color: white;
	    margin-top: 15px;
	    line-height: 31px;x
	    justify-content: center;    
	    /* padding-right: 8px; */
	    display:none;
	    margin-left : 30px;
		width: 140px;
    }
    .kakaotalkbutton > img{
    	width: 30px;
    	height:30px;
    }
	#recTarget{
		width: 100px;
	    height: 30px;
	    border: 1px solid black;
		margin-left: 33px;
	}
	#recAddr{
		width: 100%;
	    height: 30px;
	    border: 1px solid black;
        margin-left: 18px;
	}
	#recHou{
		width: 100%;
	    height: 30px;
	    border: 1px solid black;
        margin-left: 18px;
	}
	#target_3{
		display: none;
	}
	
	.sectionMainTitle 
	{ 
	    font-size: 16px; 
	    margin-bottom: 8px;
	    font-weight: 500;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	}
	.sectionTxtTitle
	{
		color: red;
	    margin-bottom: 15px;
	    font-size: 18px;
	}
	
	.stepWrap
	{
	    margin-top: 24px;
		font-size: 22px;
	}
	
	.stepCon 
	{
	    height: 50px;
	    border: 1px solid var(--input-color); 
	    padding: 0 16px;
	    display: flex;
	    align-items: center;
	    justify-content: space-between;
	    background-color: #F7F7FB;
	    margin-bottom: 12px;
	}
	
	.stepCon:last-child
	{
	    margin-bottom: 0;
	}
	.stepCon > .stepDate > a, .stepCon  > .stepTxt > a{
		color : #bbb;
		font-weight:300;
	}
	.stepCon.on  > .stepDate > a, .stepCon.on  > .stepTxt > a{
		color : black;
		font-weight:bold;
	}
	.stepCon.on 
	{
	    border: 1px solid var(--main-color);
	    background-color: #fff;
	}


	.ek1 > .infoWrap > .dateNotice {
		text-align: center;
	}


	.ek1 > .infoWrap > .infoCheck {
		display: none !important;
	}

	.ek1 > .infoWrap > .infoCon.indate {
		display: none !important;
	}

	.ek1 > .infoWrap > .infoCon.indate {
		display: none !important;
	}
	
	.ek1 > .infoWrap > .infoCon.indate.eks {
		display: none !important;
	}

	.ek1 > .infoWrap > .infoCon.cost {
		display: none !important;
	}

	.ek1 > .infoWrap > .infoCon.people > h5 {
		display: none !important;
	}

	.ek1 > .infoWrap > .infoCon.discount > h1 {
		display: none !important;
	}
	.ek1 > .infoWrap > .infoCon.discount > h5 {
		display: none !important;
	}

	.ek1 > .infoWrap > .infoCon.discount {
		display: none !important;
	}

	.inputsection.ek1 {
		display: none !important;
	}


	.select_alert.ek1{
		display: none !important;
	}

	.ek1 > .infoWrap > .infoCon.people > h1 {
		margin-bottom: 16px;
		margin-top: 5px;
		width: 100%;
		text-align: center;
		font-size: 38px;
		font-weight: bold;
	}

	.ek1 > .infoWrap > .infoCon.people {
		padding: 30px 2px 0;
		
	}

	.select_alert.ek1{
		display: none !important;
	}


	.eks > h1{
	    font-size: 18px;
   		font-weight: bold;
	}
	.select_alert{
	    margin-left : 30px;
	    display:none;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/6.MobileDelivery/MD_style.css">  
<!-- <link rel="stylesheet" href="./css/6.MobileDelivery/MDD_style.css">       -->
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/6.MobileDelivery/MD_index.js"></script>
<!-- <script src="./js/pageChange.js"></script> -->

</head>

<body>
       
    <div class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">배송내역</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <div class="table">
                </div>
            </div>
            
        </div>        
    </div>   
    <div class="m_container">
        <!-- <header class="m_header"> -->
<!--             <h3 class="arrow back"> -->
<!--                 <a href="#"> -->
<!--                     <img src="./images/m_icon/header_arrow.svg" alt="#"> -->
<!--                 </a> -->
<!--             </h3> -->
            <!-- <div class="m_headerTitle">배송조회</div>
        </header>         -->
        <section id="section_date">                                   
            <h3 class="sectionMainTitle">
                <a href="#">
                </a>
            </h3>
            <h5 class="sectionSubTitle">
                <a href="#">
                </a>
            </h5>

			<a href="logo">
				<img src="./images/m_icon/logo_color.svg" alt="logo">
			</a>

			<div class="infoWrap">
					
				<div class="dateNotice">
					<h5 class="subTxt"><a href="#">접수 마감일</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ປິດຮັບເຄື່ອງ</a></h5> -->
					<h1 class="dateTxt"><a href="#">${Dlist.ARR_DAY}</a></h1>
				</div>	
				<div class="infoCon indate eks">
					<h5 class="subTxt"><a href="#">송장번호</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ລະຫັດເຄື່ອງ</a></h5> -->
					<h1 class="subTxt"><a href="#">${Dlist.EK}</a></h1>
				</div>
<!-- 				<div class="infoCon indate"> -->
<!-- 					<h5 class="subTxt"><a href="#">접수일</a></h5> -->
<!-- 					<h5 class="subTxt"><a href="#">ເຄື່ອງເຂົ້າສາງ</a></h5> -->
<!-- 					<h1 class="subTxt"><a href="#">${Dlist.CRE_DAY}</a></h1> --%>
 				</div> -->
				<div class="infoCon people"> 
					<h5 class="subTxt"><a href="#">수령인</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຊື່ຜູ້ຮັບເຄື່ອງ</a></h5> -->
					<h1 class="subTxt"><a href="#">${Dlist.REC_NM}</a></h1>
				</div>
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#">박스수량</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">${Dlist.BOX_COUNT}개</a></h1>
				</div>
				<div class="infoCon cost">
					<h5 class="subTxt"><a href="#">물류비용</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">$${Dlist.COST}</a></h1>
				</div>
				
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#">할인</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">${Dlist.DISCOUNT}%</a></h1>
				</div>
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#">할인적용비용</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">$${Dlist.DIS_COST1}</a></h1>
				</div><br/>
				<c:if test="${Dlist.FIRST_COST != '0'}" >
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#"><b>특별취급 물건</b></a></h5>
				</div>
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#">특별취급 물건 비용</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">$${Dlist.FIRST_COST}</a></h1>
				</div>
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#">우선적용할인</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">${Dlist.FIRST_DISCOUNT}%</a></h1>
				</div>
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#">할인적용 비용</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">$${Dlist.DIS_COST2}</a></h1>
				</div><br/>
				</c:if>
				<div class="infoCon discount">
					<h5 class="subTxt"><a href="#">최종비용</a></h5>
					<!-- <h5 class="subTxt"><a href="#">ຄ່າຂົນ(ໂດຍປະມານ)</a></h5> -->
					<h1 class="subTxt"><a href="#">$${Dlist.TOTAL_COST}</a></h1>
				</div>
					<input type="hidden" class="T_IN_KEY" id="${IN_KEY}" value="${IN_KEY}">
				<div class="infoCheck">배송내역 확인(클릭)</div>
				<!-- <div class="infoCheck">ກວດລາຍລະອຽດເຄື່ອງ</div> -->
			</div>

        </section>
        <div class="inputsection">
        	<h5 class="inputName"><a href="#">픽업지 선택</a></h5>
			<!-- <h5 class="inputName"><a href="#">ເລືອກສະຖານທີ່ຮັບເຄື່ອງ</a></h5> -->
	        <select name="recTarget" id="recTarget">
				<option value="0">픽업지 선택</option>
	            <option value="1">본사</option>
	            <option value="2">하우 창고</option>
	            <option value="3">택배 서비스</option>

				<!-- <option value="0">ເລືອກສະຖານທີ່ຮັບເຄື່ອງ</option>
				<option value="1">ສຳນັກງານໃຫຍ່(ປາກທ້າງ)</option>
	            <option value="2">ສາງຮາວ</option>
	            <option value="3">ບໍລິການສົ່ງ</option> -->

	        </select>
	        <button class="savebutton">저장</button>
			<!-- <button class="savebutton">ບັນທຶກ</button> -->
        </div>
            <div class="inputsection" id="target_3">
                <div class="inputWrap">
                <h5 class="inputName"><a href="#">택배사</a></h5>
				<!-- <h5 class="inputName"><a href="#">ບໍລິສັດຂົນສົ່ງ</a></h5> -->
                <select name="recAddr" id="recAddr">
                	<c:forEach var="item" items="${shipComList}">
                		<c:choose>
                			<c:when test="${item.target eq Dlist.REC_ADDR }">
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
					<!-- <h5 class="inputName"><a href="#">ລາຍລະອຽດ(ສາຂາ)</a></h5> -->
                    <c:choose>
                    	<c:when test="${Dlist.REC_TARGET == 3}">
                    		<input type="text" name="recHou" id="recHou" value="${Dlist.REC_HOU}">
                    	</c:when>
                    	<c:otherwise>
                    		<input type="text" name="recHou" id="recHou" value="">
                    	</c:otherwise>
                    </c:choose>
                </div>
            </div>
            	
                <c:choose>
                	<c:when test="${Dlist.REC_TARGET == 1}">
      					<h4 class="select_alert">본사가 선택되었습니다.</h4>
                	</c:when>
                	<c:when test="${Dlist.REC_TARGET == 2}">
      					<h4 class="select_alert">하우창고가 선택되었습니다.</h4>
                	</c:when>
                	<c:when test="${Dlist.REC_TARGET == 3}">
      					<h4 class="select_alert">택배 서비스가 선택되었습니다.</h4>
                	</c:when>
               	</c:choose>
	        	<button onclick="kakao()" class="kakaotalkbutton"><img src="./images/delivery/pc_icon/kakao logo.svg">카카오톡 문의</button>
				<!-- <button onclick="kakao()" class="kakaotalkbutton"><img src="./images/delivery/pc_icon/wslogo.svg">ສອບຖາມຂໍ້ມູນເພີ່ມເຕີມ</button> -->
        <section>
        
            <h3 class="sectionMainTitle">
                <a href="#">배송 현황</a>
				<!-- <a href="#">ສະຖານະການ ການຂົນສົ່ງ</a> -->
            </h3>
            <input type="hidden" id="memid" value="${Dlist.MEM_ID}">
            <input type="hidden" id="inkey" value="${Dlist.IN_KEY}">
            <div class="stepWrap">
            	<h4 class="sectionTxtTitle">
	                ${Dlist.OUT_TXT}
           		</h4>
                <div class="stepCon on">
                    <h5 class="stepTxt"><a href="#">한국창고</a></h5>
					<!-- <h5 class="stepTxt"><a href="#">ສາງເຄື່ອງຢູ່ເກົາຫຼີ</a></h5> -->
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <!-- <h5 class="stepCurrent"><a href="#"></a></h5> -->
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">인천항</a></h5>
					<!-- <h5 class="stepTxt"><a href="#">ສາຍເຮືອອິນຊອນ</a></h5> -->
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <!-- <h5 class="stepCurrent"><a href="#"></a></h5> -->
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">배송중</a></h5>
					<!-- <h5 class="stepTxt"><a href="#">ກຳລັງຈັດສົ່ງ</a></h5> -->
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <!-- <h5 class="stepCurrent"><a href="#"></a></h5> -->
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">태국항</a></h5>
					<!-- <h5 class="stepTxt"><a href="#">ສາຍເຮຶອໄທ</a></h5> -->
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <!-- <h5 class="stepCurrent"><a href="#"></a></h5> -->
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">라오스 창고</a></h5>
					<!-- <h5 class="stepTxt"><a href="#">ສາງເຄື່ອງຢູ່ລາວ</a></h5> -->
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <!-- <h5 class="stepCurrent"><a href="#"></a></h5> -->
                </div>
                <div class="stepCon">
                    <h5 class="stepTxt"><a href="#">불출시작</a></h5>
					<!-- <h5 class="stepTxt"><a href="#">ເລີ່ມກະຈາຍເຄື່ອງ</a></h5> -->
                    <h5 class="stepDate"><a href="#"></a></h5>
                    <!-- <h5 class="stepCurrent"><a href="#"></a></h5> -->
                </div>
            </div>    
        </section>
        <footer>
<!--             <button id="Search">배송 조회하기</button> -->
        </footer>
    </div>
</body>

<script type="text/javascript">


// 	var lok =  window.location.search.replaceAll("?nm=","").split("&ph=");

// 	var lok2 =  lok[1].split("&od=");
// 	lok[1] =  lok2[0];
// 	lok[2] =  lok2[1];
	var EKS = '${Dlist.EK}';
	var add = '${Dlist.REC_TARGET}';
	var mchk = '${Dlist.MCHK}';
	
// 	var name = decodeURI(decodeURIComponent(lok[0]));

	$(document).on('ready',function(){
		var width = window.outerWidth;
		
		$(".id").text(name);
// 		Delivery_Search();

		$(".back").on("click",function(){
			history.back();
		})
		$("#Search").on("click",function(){
			Delivery_Search();
		});
		

	    $(document).on("click",".infoCheck",function(){
			Delivery_Search_D($(this).parents(".infoWrap").find(".T_MEM_ID").val(),$(this).parents(".infoWrap").find(".T_IN_KEY").val());
	    });

	    $(document).on("click",".detail",function(){
			var inkey = $(this).parents(".infoWrap").find(".T_IN_KEY").val();
			var memid = $(this).parents(".infoWrap").find(".T_MEM_ID").val();
			location.href = "Mobile_Delivery_Detail.do?id="+memid+"&ik=" + inkey; 
	    });
	    
	    if(EKS == 'EK1'){
	    	$("#section_date").addClass("ek1");
	    	$(".inputsection").addClass("ek1");
	    	$(".kakaotalkbutton").addClass("ek1");
	    	$(".select_alert").addClass("ek1");
	    }

		$("#recTarget").on("change",function(){
		    if($("#recTarget").val() == '3'){
		    	$("#target_3").show();
		    }
		    else{
		    	$("#target_3").hide();
		    }
		});
// 		console.log(add);
	    if(add == '3'){
	    	$("#target_3").show();
	    }
	    
	    if(add != '' && add != 'null' && mchk == 'Y'){
			$("#recTarget").val(add);
	    	$(".savebutton").remove();	
	    	$(".kakaotalkbutton").css("display","flex");	
	    	$(".select_alert").show();	
	    	$("#recTarget").prop("disabled",true);
	    	$("#recAddr").prop("disabled",true);
	    	$("#recHou").prop("disabled",true);
	    }
	    

		Delivery_Search_O($("#memid").val(),$("#inkey").val());
		Delivery_Search_D2($("#inkey").val());
		
		$(".savebutton").on("click",function(){
			if($("#recTarget").val() == '0'){
				alert("픽업지를 선택해주세요.")
			}
			else if(confirm("한번 저장하면 수정이 불가합니다.\n픽업지를 저장하시겠습니까?")){
				Pickup_Insert($("#inkey").val());		
			}
		});
	})
	
	function Delivery_Search(){
		var deliverydata = {
				MEM_NM : name,
				MEM_PHONE : lok[1],
				OUT_DAY : lok[2]
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_B.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);
				
                
				$(".infoWrap").remove();
				var wrapString = "";
				
	            
				for(let i=0; i<result.length; i++ ){
					wrapString += ' <div class="infoWrap">';
					wrapString += '		<div class="dateNotice">';
					wrapString += '			<h5 class="subTxt"><a href="#">접수마감일</a></h5>';
					wrapString += '			<h1 class="dateTxt"><a href="#">'+result[i].ARR_DAY+'</a></h1>';
					wrapString += ' 	</div>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon indate">';
					wrapString += '     <h5 class="subTxt"><a href="#">송장번호</a></h5>';
					wrapString += '     <h1 class="subTxt"><a href="#">'+result[i].EK+'</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon people">';
					wrapString += '     <h5 class="subTxt"><a href="#">수령인</a></h5>';
					wrapString += '     <h1 class="subTxt"><a href="#">'+result[i].REC_NM+'</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon cost">';
					wrapString += ' 	<h5 class="subTxt"><a href="#">물류예상비용</a></h5>';
					wrapString += ' 	<h1 class="subTxt"><a href="#">$'+result[i].COST+'</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCon current">';
					wrapString += '     <h5 class="subTxt"><a href="#">배송현황</a></h5>';
					wrapString += ' 	<h1 class="subTxt hid"><input type="hidden" class="T_IN_KEY" value="'+result[i].IN_KEY+'">';
					wrapString += ' 	<input type="hidden" class="T_MEM_ID" value="'+result[i].MEM_ID+'"><a class="detail" href="#">배송현황확인하기(클릭)</a></h1>';
					wrapString += ' </div>';
					wrapString += ' <div class="infoCheck">배송내역 확인하기</div>';
					
					
					wrapString += ' </div>';
					
					
				}

				$("#section_date").append(wrapString);
				
            }
			
		})	
		
		
	}
	
	function Delivery_Search_D(uid,key){
		
		var deliverydata = {
				MEM_ID : uid,
				IN_KEY : key
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_D.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);

				$(".table").empty();
				var tbodyData2 = "";
				console.log(result);
				for(let i=0; i<result.length; i++ ){
					var number = 0;
					
					tbodyData2 += '<div class="tableCon">';
					tbodyData2 += '<h3 class="date"><a href="#">W*H*L('+result[i].WIDTH+'cm*'+result[i].HEIGHT+'cm*'+result[i].LENGTH+'cm) / 무게'+result[i].WEIGHT+'kg / 적용할인율 : '+result[i].USE_DISCOUNT+'%</a></h3>';
					tbodyData2 += '<h3 class="con"><a href="#">예상비용 : <span class="date">'+result[i].COST_TOTAL+'$</span></a></h3>';
					tbodyData2 += '</div>';
				}

				$(".table").append(tbodyData2);
				
            }
			
		})	
		
	}
	
	function Delivery_Search_D2(key){

		var deliverydata = {
				MEM_ID : "",
				IN_KEY : key
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_D.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);


				$("#Delivery_Information_Table > tbody").empty();
				var tbodyData3 = "";

				tbodyData3 += "<tr>";
				tbodyData3 += "<td>"+(result[0].SJ_KEY).split("-")[0]+"</td>";
				tbodyData3 += "<td>"+result.length+"</td>";
				tbodyData3 += "<td>"+result[0].ARR_DAY+"</td>";
				tbodyData3 += "</tr>";
				
				$("#Delivery_Information_Table > tbody").append(tbodyData3);	
				
            }
			
		})	
	}
	
	function Delivery_Search_O(uid,key){

		var deliverydata = {
				MEM_ID : uid,
				IN_KEY : key
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_O.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);

				var tbodyData2 = "";
				$(".stepCon").removeClass("on");
				$(".stepCon").removeClass("off");
				$(".stepCon").addClass("off");
				$(".stepDate > a").text("미정");

				if(result[0].SJ_KEY != null){
					var sj = result[0].SJ_KEY.split("-");
					var sjkey = sj[0] + '-' + sj[1] + '-' + sj[2] + '-' + sj[3];
					$("#qr_number").text(sjkey);
				}
				else{
					$("#qr_number").text("미접수");
				}
				
				$("#qr_box").text(result[0].CNTBOX);
				$("#qr_outday").text(result[0].ARR_DAY);
				
				for(let i=0; i<result.length; i++ ){
					$($(".stepCon")[i]).removeClass("off");
					$($(".stepCon")[i]).find(".stepDate > a").text(result[i].OUT_TXT);
					$($(".stepCon")[i]).find(".stepCurrent > a").text(result[i].OUT_TXT_SUB);
					
					if(result.length -1  == i){
						$($(".stepCon")[i]).addClass("on");
					}
				}
				
            }
			
		})	
	}
	
	function Pickup_Insert(inkey){
		
		var pickup_data = {
			IN_KEY : inkey,	
			TARGET : $("#recTarget").val(),
			ADDR : $("#recAddr").val(),
			HOU : $("#recHou").val(),
		};

		$.ajax({
			type: "POST",
			url : "./Pickup_Insert.do",
			data: pickup_data,
			async: false,
            success: function(datas){
          		alert(datas);  	
    	    	$(".savebutton").remove();		
    	    	$(".kakaotalkbutton").css("display","flex");
    	    	$(".select_alert").show();
    	    	$("#recTarget").prop("disabled",true);
    	    	$("#recAddr").prop("disabled",true);
    	    	$("#recHou").prop("disabled",true);
            }
		})
	}
	function kakao(){
// 		https://open.kakao.com/o/sEA1t8Vg
		var win = window.open("//open.kakao.com/o/sEA1t8Vg"); 
	}
</script>
</html>