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
    <title>배송조회</title>
</head>

<style type="text/css">
	
    body{
        width: 100%;
        height: 100%;
    }
    button{
        cursor:pointer;
    }
    .tron{
    	background:#ffecdb;
    }
    .out_txt{
    	color: red;
	    font-size: 17px;
	    margin-left: 15px;
    }
    .inputsection{
    	display:flex;    
    	margin-top: 10px;
    	margin-bottom: 10px;
    }
    .inputWrap > input{
    	width: 500px;
    	height:30px;
    	border: 1px solid black;
    }
    .inputWrap > select{
    	width: 150px;
    	height:30px;    
    	border: 1px solid black;
    }
    .inputWrap{
    	margin-right: 20px;
/*     	display:flex; */
    }
    .savebutton{
    	width: 100px;
    	height: 30px;
	    border-radius: 4px;
	    background: #00b700;
	    color: white;
	    margin-top: 22px;
    }
    .kakaotalkbutton{
    	width: 200px;
    	height: 30px;
	    border-radius: 4px;
	    background: #ffa100;
	    color: white;
	    margin-top: 22px;
	    line-height: 31px;
	    justify-content: center;    
	    padding-right: 8px;
	    display:none;
    }
    .kakaotalkbutton > img{
    	width: 30px;
    	height:30px;
    }
	#target_3{
		display: none;
	}
	.currentWrap{
		display: block !important;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/2.Delivery/Search_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/2.Delivery/Search_index.js"></script>
<script src="./js/pageChange.js"></script>
</head>

<body>  
    <div class="qrWrap">
        <div class="qrCon">
            <div class="qrHeader">
                <h3 class="qrTitle"><a href="#">배송정보</a></h3>
                <h3 class="icon cancelqr">
                    <a href="#">
                        <img src="./images/pc_icon/cancel_black.svg" alt="#">
                    </a>
                </h3>
            </div>
            
            <div class="qrBody">
                <div class="tableWrap">
                    <table id="Delivery_Information_Table">
                        <thead>
                            <tr>
                                <th>접수번호</th>
                                <th>박스수량</th>
                                <th>출항일</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div> 
            </div>
        </div>
    </div>

    <div class="history">
        <div class="historyCon">
            <div class="historyHeader">
                <h3 class="historyTitle"><a href="#">배송내역확인</a></h3>
                <h3 class="icon cancelhistory">
                    <a href="#">
                        <img src="./images/pc_icon/cancel_black.svg" alt="#">
                    </a>
                </h3>
            </div>
            <div class="historyBody">
                <div class="tableWrap">
                    <table id="Delivery_History_Table">
                        <thead>
                            <tr>
                                <th>수령인</th>
                                <th>물류예상비용</th>
                                <th>물품내역</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div> 
            </div>
        </div>
    </div>  

    <div class="container">
<%-- 		<jsp:include page="../common.jsp"></jsp:include> --%>
		 <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">배송조회</a>
                </h1>
                <div class="conWrap">
                    <h3 class="conMainTitle">
<!--                         <a href="#">반갑습니다. <span class="customer"></span> 회원님</a> -->
                    </h3>
                    <h5 class="conSubTitle">
                        <p>
<!--                             회원님의 운송장번호는 2024010845 입니다.<br> -->
                            <span id="status" style="color:var(--main-color); font-weight: 600;"></span>
                        </p>
                    </h5>    
                    
        <div class="inputsection">
                <div class="inputWrap">
	        	<h3 class="inputName"><a href="#">픽업지 선택</a></h3>
		        <select name="recTarget" id="recTarget">
		            <option value="0">픽업지 선택</option>
		            <option value="1">본사</option>
		            <option value="2">하우 창고</option>
		            <option value="3">택배 서비스</option>
		        </select>
	        </div>
	        <button class="savebutton">저장
	        </button>
	        <button onclick="kakao()" class="kakaotalkbutton"><img src="./images/delivery/pc_icon/kakao logo.svg">관리자에게 문의하기</button>
        </div>
            <div class="inputsection" id="target_3">
                <div class="inputWrap">
                <h3 class="inputName"><a href="#">택배사</a></h3>
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
                    <h3 class="inputName"><a href="#">상세주소</a></h3>
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
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id="Delivery_Table">
                                <thead>
                                    <tr>
                                        <th>송장번호</th>
                                        <th>마감일</th>
                                        <th>수령인</th>
                                        <th>접수일</th>
                                        <th>물류예상비용</th>
<!--                                         <th>배송현황</th> -->
                                        <th>배송내역확인</th>
                                    </tr>
                                </thead>
                                <tbody>
									<tr class="tron">
									<td>${Dlist.EK}</td>
									<td>${Dlist.ARR_DAY}</td>
									<td><input type='hidden' class='T_IN_KEY' id="${IN_KEY}" value="${IN_KEY}">${Dlist.REC_NM}</td>
									<td>${Dlist.CRE_DAY}</td>
									<td>${Dlist.COST}</td>
<!-- 									<td class="currentClickOne" style="cursor:pointer;">한국물류창고 (클릭)</td> -->
									<td class="historyCheck">확인하기</td>
									</tr>
                                </tbody>
                            </table>
                        </div> 

                        <div class="currentWrap one">
                            <h3 class="conMainTitle">
                                <a href="#">배송현황<span class="out_txt">${Dlist.OUT_TXT}</span></a>
<!--                                 <button class="qr">배송정보</button> -->
                            </h3>
                            <div class="currentCon">
                                <div class="current one on">
                                    <div class="condition on">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">한국창고</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>                                    
                                </div>
                                <div class="current two">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">인천항</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current three">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">배송중</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current four">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">태국항</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current five">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">라오스 창고</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current six">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">배출시작</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                            </div>
                        </div>  
                        
<!--                         <div class="currentWrap two"> -->
<!--                             <h3 class="conMainTitle"> -->
<!--                                 <a href="#">배송현황</a> -->
<!--                                 <button class="qr">QR코드</button> -->
<!--                             </h3> -->
<!--                             <div class="currentCon"> -->
<!--                                 <div class="current one on"> -->
<!--                                     <div class="condition on"> -->
<!--                                         <a href="#"> -->
<!--                                             <img src="./images/pc_icon/check_white.svg" alt="#"> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <h5 class="currentTitle"><a href="#">한국 물류창고</a></h5> -->
<!--                                     <h5 class="currentDay"><a href="#"></a></h5> -->
<!--                                     <h5 class="currentMessage"><a href="#"></a></h5>                                     -->
<!--                                 </div> -->
<!--                                 <div class="current two"> -->
<!--                                     <div class="condition"> -->
<!--                                         <a href="#"> -->
<!--                                             <img src="./images/pc_icon/check_white.svg" alt="#"> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <h5 class="currentTitle"><a href="#">출항시작</a></h5> -->
<!--                                     <h5 class="currentDay"><a href="#"></a></h5> -->
<!--                                     <h5 class="currentMessage"><a href="#"></a></h5> -->
<!--                                 </div> -->
<!--                                 <div class="current three"> -->
<!--                                     <div class="condition"> -->
<!--                                         <a href="#"> -->
<!--                                             <img src="./images/pc_icon/check_white.svg" alt="#"> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <h5 class="currentTitle"><a href="#">태국도착</a></h5> -->
<!--                                     <h5 class="currentDay"><a href="#"></a></h5> -->
<!--                                     <h5 class="currentMessage"><a href="#"></a></h5> -->
<!--                                 </div> -->
<!--                                 <div class="current four"> -->
<!--                                     <div class="condition"> -->
<!--                                         <a href="#"> -->
<!--                                             <img src="./images/pc_icon/check_white.svg" alt="#"> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <h5 class="currentTitle"><a href="#">라오스 출발</a></h5> -->
<!--                                     <h5 class="currentDay"><a href="#"></a></h5> -->
<!--                                     <h5 class="currentMessage"><a href="#"></a></h5> -->
<!--                                 </div> -->
<!--                                 <div class="current five"> -->
<!--                                     <div class="condition"> -->
<!--                                         <a href="#"> -->
<!--                                             <img src="./images/pc_icon/check_white.svg" alt="#"> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <h5 class="currentTitle"><a href="#">라오스 도착</a></h5> -->
<!--                                     <h5 class="currentDay"><a href="#"></a></h5> -->
<!--                                     <h5 class="currentMessage"><a href="#"></a></h5> -->
<!--                                 </div> -->
<!--                                 <div class="current six"> -->
<!--                                     <div class="condition"> -->
<!--                                         <a href="#"> -->
<!--                                             <img src="./images/pc_icon/check_white.svg" alt="#"> -->
<!--                                         </a> -->
<!--                                     </div> -->
<!--                                     <h5 class="currentTitle"><a href="#">배출 시작</a></h5> -->
<!--                                     <h5 class="currentDay"><a href="#"></a></h5> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div>  -->

                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
	</div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var name = '<%=(String)session.getAttribute("SESSION_MEM_NM")%>';
	
	if(uid=="null" && uid2=="null"){ 
// 	   location.replace("Main.do");
	}
	else if(level == 0){
// 	   location.replace("Delivery_Search_B.do");
	}

	var add = '${Dlist.REC_TARGET}';
 console.log(add);
	$(document).on('ready',function(){
// 		Delivery_Search();

// 		$(".currentClickOne").trigger("click");
		Delivery_Search_O($("#Delivery_Table > tbody > tr").find(".T_IN_KEY").val());
		
		$(".customer").text(name);
		
		
		$(document).on("click",".historyCheck",function(){
			Delivery_Search_D($(this).parents("tr").find(".T_IN_KEY").val());
		})
		
		$(document).on("click",".qr",function(){
			Delivery_Search_D($(".tron").find(".T_IN_KEY").val());
		})
		if(add == '3'){
	    	$("#target_3").css("display","flex");
	    }
	    if(add != '' && add != 'null' && add != '0'){
			$("#recTarget").val(add);
	    	$(".savebutton").remove();	
	    	$(".kakaotalkbutton").css("display","flex");
	    	$("#recTarget").prop("disabled",true);
	    	$("#recAddr").prop("disabled",true);
	    	$("#recHou").prop("disabled",true);
	    }
		$("#recTarget").on("change",function(){
		    if($("#recTarget").val() == '3'){
		    	$("#target_3").css("display","flex");
		    }
		    else{
		    	$("#target_3").hide();
		    }
		});

		$(".savebutton").on("click",function(){
			if($("#recTarget").val() == '0'){
				alert("픽업지를 선택해주세요.")
			}
			else if(confirm("한번 저장하면 수정이 불가합니다.\n픽업지를 저장하시겠습니까?")){
				Pickup_Insert($(".T_IN_KEY").val());		
			}
		});
		
		$(document).on("click",".currentClickOne",function(){
			Delivery_Search_O($(this).parents("tr").find(".T_IN_KEY").val());
			$('#Delivery_Table > tbody > tr').removeClass("tron");
			$(this).parents("tr").addClass("tron");
		})
		
		
	})
	
	
	function Delivery_Search(){
		var deliverydata = {
				MEM_ID : (uid != 'null') ? uid
						 : uid2
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);
				console.log(result);

				$("#Delivery_Table > tbody").empty();
				var tbodyData = "";
				var keytable = [];
				var number = 0;
				for(let i=0; i<result.length; i++ ){
					if(keytable.includes(result[i].IN_KEY) == false && i == 0){
						keytable.push(result[i].IN_KEY);	
						tbodyData += "<tr>";
						tbodyData += "<td>"+result[i].EK+"</td>";
						tbodyData += "<td>"+result[i].ARR_DAY+"</td>";
						tbodyData += "<td><input type='hidden' class='T_IN_KEY' id='"+result[i].IN_KEY+"' value='"+result[i].IN_KEY+"'>"+result[i].REC_NM+"</td>";
						tbodyData += "<td>"+result[i].CRE_DAY+"</td>";
					}
					else if(keytable.includes(result[i].IN_KEY) == false  && i > 0){
						tbodyData += "<td>$"+number+"</td>";
						tbodyData += '<td class="currentClickOne" style="cursor:pointer;">한국물류창고 (클릭)</td>';
						tbodyData += '<td class="historyCheck">확인하기</td>';
						
						number = 0;
						
						keytable.push(result[i].IN_KEY);	
						tbodyData += "<tr>";
						tbodyData += "<td>"+result[i].EK+"</td>";
						tbodyData += "<td>"+result[i].ARR_DAY+"</td>";
						tbodyData += "<td><input type='hidden' class='T_IN_KEY' id='"+result[i].IN_KEY+"' value='"+result[i].IN_KEY+"'>"+result[i].REC_NM+"</td>";
						tbodyData += "<td>"+result[i].CRE_DAY+"</td>";
					}
					

//	 				$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산)
//	 				용적중량 : 가로*세로*높이*0.00022 
// 					var kgcost = result[i].WEIGHT * 1.5;
// 					var lncost = result[i].WIDTH * result[i].HEIGHT * result[i].LENGTH * 0.00022;
					
// 					console.log(kgcost,lncost);
// 					if(kgcost >= lncost){
// 						number += kgcost;
// 					}
// 					else{
// 						number += lncost;
// 					}
						number = result[i].COST;
					if(i == result.length - 1){
						tbodyData += "<td>$"+number+"</td>";
						tbodyData += '<td class="currentClickOne" style="cursor:pointer;">한국물류창고 (클릭)</td>';
						tbodyData += '<td class="historyCheck">확인하기</td>';
						
						number = 0;
					}
					
				}

				$("#Delivery_Table > tbody").append(tbodyData);
				if(result.length <= 0){
					$("#status").text("회원님께서 배송신청한 물건이 없습니다.");
				}
				else{
// 					$("#status").text("해당 물건은 현재 한국물류창고에 접수되어 출항대기 상태입니다.");
				}
            }
			
		})	
		
		
	}

	function Delivery_Search_D(key){

		var deliverydata = {
				MEM_ID : (uid != 'null') ? uid
						 : uid2,
				IN_KEY : key
		};
		$.ajax({
			type: "POST",
			url : "./Delivery_Select_D.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);

				$("#Delivery_History_Table > tbody").empty();
				$("#Delivery_Information_Table > tbody").empty();
				var tbodyData2 = "";
				var tbodyData3 = "";

				for(let i=0; i<result.length; i++ ){
// 					var number = 0;
					if(result[i].SJ_KEY != ''){

//		 				$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산)
//		 				용적중량 : 가로*세로*높이*0.00022 
// 						var kgcost = result[i].WEIGHT * 1.5;
// 						var lncost =  Math.round(result[i].WIDTH * result[i].HEIGHT * result[i].LENGTH * 0.00022 * 1.5 * 100) / 100;
						
// 						console.log(kgcost,lncost);
// 						if(kgcost < 10 && lncost < 10){
// 							number += 10;
// 						}
// 						else if(kgcost >= lncost){
// 							number += kgcost;
// 						}
// 						else{
// 							number += lncost;
// 						}
						
// 						number = result[i].COST;
						
						tbodyData2 += "<tr>";
// 						tbodyData2 += "<td>"+result[i].ARR_DAY+"</td>";
						tbodyData2 += "<td><input type='hidden' id='"+result[i].IN_KEY+"' data='"+result[i].IN_KEY+"'>"+result[i].REC_NM+"</td>";
// 						tbodyData2 += "<td>"+result[i].CRE_DAY+"</td>";
						tbodyData2 += "<td>$"+result[i].COST+"</td>";
						tbodyData2 += "<td>W*H*L("+result[i].WIDTH+"cm*"+result[i].HEIGHT +"cm*" + result[i].LENGTH+"cm / 무게 "+ result[i].WEIGHT + "kg</td>";
					
						
					}
				}
				tbodyData3 += "<tr>";
				tbodyData3 += "<td>"+(result[0].SJ_KEY).split("-")[0]+"</td>";
				tbodyData3 += "<td>"+result.length+"</td>";
				tbodyData3 += "<td>"+result[0].ARR_DAY+"</td>";
				tbodyData3 += "</tr>";
				
				
				$("#Delivery_History_Table > tbody").append(tbodyData2);
				$("#Delivery_Information_Table > tbody").append(tbodyData3);	
            }
			
		})	
	}

	function Delivery_Search_O(key){

		var deliverydata = {
				MEM_ID : (uid != 'null') ? uid
						 : uid2,
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
				$(".current").removeClass("on");
				$(".condition").removeClass("on");
				$(".currentDay > a").text("미정");
				$(".currentMessage > a").text("");
				
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
					$($(".currentCon > .current")[i]).find(".currentDay > a").text(result[i].OUT_TXT);
					$($(".currentCon > .current")[i]).find(".currentMessage > a").text(result[i].OUT_TXT_SUB);
					
					if(result.length -1  == i){
						$($(".currentCon > .current")[i]).addClass("on");
						$($(".currentCon > .current")[i]).find(".condition").addClass("on");
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
    	    	$("#recTarget").prop("disabled",true);
    	    	$("#recAddr").prop("disabled",true);
    	    	$("#recHou").prop("disabled",true);
            }
		})
	}
	function kakao(){
// 		https://open.kakao.com/o/sc8L40Gf
		var win = window.open("//open.kakao.com/o/sc8L40Gf"); 
	}
</script>
</html>