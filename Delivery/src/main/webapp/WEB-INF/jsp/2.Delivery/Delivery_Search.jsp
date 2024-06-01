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
                                <th>출항예정일</th>
                                <th>수령인</th>
                                <th>접수일</th>
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
		<jsp:include page="../common.jsp"></jsp:include>
		 <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">배송조회</a>
                </h1>
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">반갑습니다. <span class="customer"></span> 회원님</a>
                    </h3>
                    <h5 class="conSubTitle">
                        <p>
<!--                             회원님의 운송장번호는 2024010845 입니다.<br> -->
                            <span id="status" style="color:var(--main-color); font-weight: 600;"></span>
                        </p>
                    </h5>                   
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id="Delivery_Table">
                                <thead>
                                    <tr>
                                        <th>EK</th>
                                        <th>출항예정일</th>
                                        <th>수령인</th>
                                        <th>접수일</th>
                                        <th>물류예상비용</th>
                                        <th>배송현황</th>
                                        <th>배송내역확인</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div> 

                        <div class="currentWrap one">
                            <h3 class="conMainTitle">
                                <a href="#">배송현황</a>
                                <button class="qr">배송정보</button>
                            </h3>
                            <div class="currentCon">
                                <div class="current one on">
                                    <div class="condition on">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">한국 물류창고</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>                                    
                                </div>
                                <div class="current two">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">출항시작(미정)</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current three">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">태국도착</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current four">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">라오스 출발</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current five">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">라오스 도착</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current six">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">배출 시작</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                            </div>
                        </div>  
                        
                        <div class="currentWrap two">
                            <h3 class="conMainTitle">
                                <a href="#">배송현황</a>
                                <button class="qr">QR코드</button>
                            </h3>
                            <div class="currentCon">
                                <div class="current one on">
                                    <div class="condition on">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">한국 물류창고</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>                                    
                                </div>
                                <div class="current two on">
                                    <div class="condition ">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">출항시작(미정)</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current three">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">태국도착</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current four">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">라오스 출발</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current five">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">라오스 도착</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                    <h5 class="currentMessage"><a href="#"></a></h5>
                                </div>
                                <div class="current six">
                                    <div class="condition">
                                        <a href="#">
                                            <img src="./images/pc_icon/check_white.svg" alt="#">
                                        </a>
                                    </div>
                                    <h5 class="currentTitle"><a href="#">배출 시작</a></h5>
                                    <h5 class="currentDay"><a href="#"></a></h5>
                                </div>
                            </div>
                        </div> 

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
 
	console.log(level);
 
	$(document).on('ready',function(){
		Delivery_Search();
		$(".customer").text(name);
		
		
		$(document).on("click",".historyCheck",function(){
			Delivery_Search_D($(this).parents("tr").find(".T_IN_KEY").val());
		})
		
		$(document).on("click",".qr",function(){
			Delivery_Search_D($(".tron").find(".T_IN_KEY").val());
		})
		
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
					if(result[i].SJ_KEY != ''){

// //		 				$500 (kg*$1.5 or 용적중량 *$1.5 중 비싼 비용으로 계산)
// //		 				용적중량 : 가로*세로*높이*0.00022 
// 						var kgcost = result[i].WEIGHT * 1.5;
// 						var lncost =  Math.round(result[i].WIDTH * result[i].HEIGHT * result[i].LENGTH * 0.00022 * 1.5 * 100) / 100;
						
// // 						console.log(kgcost,lncost);
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
						tbodyData2 += "<td>"+result[i].ARR_DAY+"</td>";
						tbodyData2 += "<td><input type='hidden' id='"+result[i].IN_KEY+"' data='"+result[i].IN_KEY+"'>"+result[i].REC_NM+"</td>";
						tbodyData2 += "<td>"+result[i].CRE_DAY+"</td>";
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
</script>
</html>