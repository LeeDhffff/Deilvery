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
    <title>배송조회 - 관리자</title>
</head>

<style type="text/css">
	.tron{
		background: #ffecdb;
		border: 2px dotted red !important;
	}
	.modify{
		background: white;
		width:40px;
		height:30px;
		border: 1px solid #ffaa40;
	    padding: 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	.modify:hover{
		background: #ffaa40;
	}
	
	.link{
		background: white;
		width:40px;
		height:30px;
		border: 1px solid #ffaa40;
	    padding: 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	
	.link > img{
		height: 23px;
	}
	.link:hover{
		background: #ffaa40;
	}
	.link2{
		background: white;
		width:40px;
		height:30px;
		border: 1px solid #ff4040;
	    padding: 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	
	.link2 > img{
		height: 23px;
	}
	.link2:hover{
		background: #ff4040;
	}
	.link3{
		background: white;
		width:40px;
		height:30px;
		border: 1px solid #40c8ff;
	    padding: 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	
	.link3 > img{
		height: 23px;
	}
	.link3:hover{
		background: #40c8ff;
	}
	#Delivery_Table > tbody > tr{
   -webkit-user-select:none; 
   -moz-user-select:none; 
   -ms-user-select:none; 
   user-select:none; 
}
.totalh4{
	display:flex;
	margin-right:100px;
}
.totalh4 > h4{
	margin-left:10px;
	margin-right:10px;
    font-size: 20px;
    width: 130px;
}
.totalh4 > h4 > span{
	color: red;
}
.checkAllth{
    display: flex;
    justify-content: center;
}
input[type=checkbox]{
    width: 20px;
    height: 20px;
    accent-color: red;
}
#checkAll{

    margin-right: 5px;
}
.checkAll{
    font-weight: bold;
    background: none;
}
.searchButton{
	width: 35px;
    height: 35px;
    background: white;
    border: 1px solid var(--main-color);
    border-radius: 3px;
    background-image: url(./images/pc_icon/search_orange.svg);
    background-size: cover;
    cursor: pointer;
}
.searchButton:hover{
	background: var(--main-color);
    background-image: url(./images/pc_icon/search_white.svg);
}
.searchButton > img{
	width: 100%;
	height: 100%;
}
.outdayBox{
	position:absolute;
	width: 100%;
	height: 100px;
	background:white;
	border: 1px solid black;
 	display:none; 
	z-index: 1;
    overflow-y: scroll;
}
.outdayTitle{
	width: 100%;
	text-align:center;
	color: white;
    background: var(--main-color);
    height: 25px;
    line-height: 25px;
}
.outdays{
	width: 100%;
	text-align:center;
	height: 25px;
	line-height: 25px;
}
.outdays:hover{
	background:#ffe4c4;
}
.tdek{
	color: red;
/*     font-weight: bold; */
}
.target_zero{
	background: #ffc4c4;
}
.target_zero2{
	background: #d5c7ff;
}
.target_complete{
	background: #8ea0ff;
}

.laoswrap{
	text-align: right;
}	
.laoswrap > label{
	font-size: 15px;
    position: relative;
    top: -4.5px;
}
#laos{
	margin: 10px 20px 0px 5px;
}
#mobile{
	margin: 10px 20px 0px 5px;
}


#deadline_open{
	width: 150px;
    height: 40px;
    border-radius: 3px;
    border: 1px solid #E88100;
    background: #E88100;
    color: white;
    display:none;
    cursor: pointer;
}
#deadline_open:hover{
    background: white;
    color: black;
}
.a_phone{
	cursor: pointer;
}
.a_phone:hover{
	color: grey;
}
.alert_copy{
	width: 500px;
    height: 80px;
    background-color: rgba(255, 255, 255, .9);
    border: 1px solid var(--input-color);
    border-radius: 5px;
    position: fixed;
    bottom: 0;
    left: 50%;
    transform: translate(-50%, -50%); 
	display: none;
}
.alert_copy > span{
	position: absolute;
    transform: translate(-50%, -50%);
    left: 50%;
    top: 50%;
    display: inline-block;
    white-space: nowrap;
    font-size: 18px;
}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/3.Manager/AppList_style.css">   

<!-- qrCode.js import -->
<script src="js/qrcode.js"></script>
    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/3.Manager/Deilivery_List_index.js"></script>

</head>

<body>
    <div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
		<jsp:include page="../print.jsp"></jsp:include>
		<jsp:include page="../receipt.jsp"></jsp:include>
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">배송조회</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">배송검색 필터</a>
                        <button class="searchButton">
<!--                         <img src="./images/pc_icon/search_orange.svg"> -->
                        </button>
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
                                <input type="text" class="Search days" id="S_Out_Day" placeholder="마감일을 입력해주세요" autocomplete="off" onkeyup="pressenters()">
                                <div class="outdayBox">
                                	<div class="outdayTitle">마감일 선택하기</div>
                                </div>
                            </div>
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Rec_Nm" placeholder="수령인을 입력해주세요" autocomplete="off" onkeyup="pressenters()">
                            </div>
                            <div class="inputWrap">
                                <input type="text" oninput="oninputPhone(this)" maxlength="13" class="Search" id="S_Rec_Phone" placeholder="전화번호를 입력해주세요" autocomplete="off" onkeyup="pressenters()">
                            </div>
                        </div>
                        <div class="triple">
                            <div class="inputWrap">
                                <select name="pickup" id="S_Pickup">
                                    <option value="">픽업지를 선택하세요</option>
                                    <option value="0">사용자 미선택</option>
                                    <option value="1">본사</option>
                                    <option value="2">하우창고</option>
                                    <option value="3">택배 서비스</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                                <select name="pickup" id="S_Service">
                                    <option value="">배송서비스 유무를 선택하세요</option>
                                    <option value="Y">신청</option>
                                    <option value="N">미신청</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                            	<button id="deadline_open">마감하기</button>
                            </div>                     			       
                        </div>
                    </div>

                    <h3 class="conMainTitle">
                        <a href="#">배송 리스트</a>
                        <div class="buttonWrap">
                        	<div class="totalh4">
                        	<h4>CBM : <span class="total_cbm"></span></h4>
                        	<h4>무게 : <span class="total_weight"></span></h4>
                        	<h4>총 박스 수 : <span class="total_box"></span></h4>
                            </div>
                            <button class="bill">
                                <a href="#">
                                    <img src="./images/pc_icon/calculator.svg" title="Invoice 출력">
                                </a>
                            </button>
                            <button class="bill2">
                                <a href="#"	>
                                	<span title="영수증 출력">$</span>
<!--                                     <img src="./images/pc_icon/receipt.svg" title="영수증 출력"> -->
                                </a>
                            </button>
<!--                             <button class="excel"> -->
<!--                                 <a href="#"> -->
<!--                                     <img src="./images/pc_icon/down_black.svg" alt="영수증출력하기"> -->
<!--                                 </a> -->
<!--                             </button> -->
                        </div>                        
                    </h3>                                  
                    <div class="laoswrap">
                    <label for="laos">반대언어로 링크복사</label><input type="checkbox" name="laos" id="laos">    
<!--                     <label for="mobile">모바일로 링크복사</label><input type="checkbox" name="mobile" id="mobile">       -->
                    </div>                                
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id = "Delivery_Table">
                                <thead>
                                    <tr>
                                        <th>
                                        <div class="checkAllth">
                                        <input type="checkbox" id="checkAll" class="List_Check All">
                                        <label for="checkAll"><button class="checkAll">All</button></label>
                                        </div>
                                        </th>

										<th>접수번호</th>
                                        <th>수량</th>
                                        <th>수령인</th>
                                        <th>전화번호</th>
                                        <th>픽업지</th>
										<th>마감일</th>
                                        <!-- <th>배송현황</th> -->
                                        <th class="modifyth">수정하기</th>
                                        <th>기본정보</th>
                                        <th>주소정보</th>
                                        <th>링크복사</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                </tbody>
                            </table>
                        </div>
                        <input type="text" id="copy_link" style="display:none;">
                        <textarea id="copy_link2" style="display:none;"></textarea>
                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
    
   	<div class="alert_copy">
   		<span>알람입니다.</span>
   	</div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var auth = '${M_AUTH}';

// 	console.log(level);
 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
					location.href = "Main.do";
			   }
			}
		if(auth == 'R'){
			$(".modifyth").hide();
		}		
		else if(auth == 'D'){
			location.href = "Main.do";
		}

// 		$('#S_Out_Day').datepicker(
// 				{
// 					changeMonth : true,
// 					changeYear : true,
// 					showMonthAfterYear : true,
// 					dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
// 				    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
// 				    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
// 					dateFormat : 'yy-mm-dd',
// 				});
// 		$('#S_Out_Day').datepicker('setDate','today');
		
		outdaybox();


		// 체크박스 트리거
				
		$(".checkAll").on("click",function(){
			$(".List_Check.All").trigger("click");
		})
		
		

		

		/* 인쇄페이지 열기(팝업) */
		$(".bill").on("click",function(){
// 			startLoading(Excelpopup());
			Excelpopup();

// 			stopLoading();
		})
		
		/* 영수증페이지 열기(팝업) */
		$(".bill2").on("click",function(){
// 			startLoading(Excelpopup());
			Receiptpopup();

// 			stopLoading();
		})
		
// 		ChangeSearch();
		$(".searchButton").on("click",function(){
			ChangeSearch();
		})
		
		$(document).on("click",".outdays",function(){
			$("#S_Out_Day").val($(this).text());
	        daybox = 0;
	        $(".outdayBox").hide();
		})

		$(".List_Check.All").on("click",function(){
			if($(this).prop("checked") == true){
				$(".List_Check.sub").prop("checked",true);
				$("#Delivery_Table > tbody > tr").removeClass("tron");
				$("#Delivery_Table > tbody > tr").addClass("tron");
			}
			else{
				$(".List_Check.sub").prop("checked",false);	
				$("#Delivery_Table > tbody > tr").removeClass("tron");
			}
		});
		
		$(document).on("click","td.sub",function(event){
			if($(event.target).attr("class") != "List_Check sub"){
				$(this).find(".List_Check.sub").trigger("click");	
			}
		});
		
		$(document).on("click",".List_Check.sub",function(){
			if($(this).prop("checked") == true){
				if($("input:checkbox[name=List_Check]:checked").length == $("input:checkbox[name=List_Check]").length){
					$(".List_Check.All").prop("checked",true);
				}
				$(this).parents("tr").addClass("tron");
			}
			else{
				$(".List_Check.All").prop("checked",false);	
				$(this).parents("tr").removeClass("tron");	
			}
		});

		//마감하기 (본사로 처리, 사용자 확인 취급)
		$("#deadline_open").on("click",function(){
			if($("input:checkbox[name=List_Check]:checked").length == 0){
				alert("마감 할 항목을 선택해주세요.");
			}
			else if(confirm("선택한 항목을 마감하시겠습니까?")){
				var Inkey = "";
				var target = "";
				var addr = "";
				var hou = "";
				$("input:checkbox[name=List_Check]:checked").each(function(){
					Inkey += $(this).parents("tr").find(".in_key").val() + ",";
					if($(this).parents("tr").find("input[name='REC_TARGET2']").val() == 0){
						target += "1,";
					}
					else{
						target += $(this).parents("tr").find("input[name='REC_TARGET2']").val() + ",";
					}
					addr += $(this).parents("tr").find("input[name='REC_ADDR2']").val() + ",";
					hou += $(this).parents("tr").find("input[name='REC_HOU']").val() + ",";
				});
				//마지막 , 제거
				Inkey = Inkey.replace(/,$/, '');
				target = target.replace(/,$/, '');
				addr = addr.replace(/,$/, '');
				hou = hou.replace(/,$/, '');
				
				var pickup_data = {
						Inkey : Inkey,	
						Itarget : target,
						Iaddr : addr,
						Ihou : hou,
					};

					$.ajax({
						type: "POST",
						url : "./Pickup_Insert_deadline.do",
						data: pickup_data,
						async: false,
			            success: function(datas){
			            	alert(datas);
			            	ChangeSearch();
			            }
					})
			}
		});
		/* 테이블 목록 클릭시 */
		$(document).on("click","#Delivery_Table > tbody > tr",function(event){
			if($(event.target).attr("class") != "List_Check sub" && $(event.target).hasClass("sub") == false){
				if(event.shiftKey == true){
					var length = $(".tron").length;
					
					if(length<=0){
						var endnum = Number($(this).attr("cnum"));
						for(let i = 0; i <= endnum; i++){
							$(".tr" + i).addClass("tron");
							$(".tr" + i).find(".List_Check").prop("checked",true);
						}
					}
					else{
						if($($(".tron")[length-1]).attr("cnum") < $(this).attr("cnum")){
							
							var startnum = Number($($(".tron")[length-1]).attr("cnum"));
							var endnum = Number($(this).attr("cnum"));
							
							for(let i = startnum; i <= endnum; i++){
								$(".tr" + i).addClass("tron");
								$(".tr" + i).find(".List_Check").prop("checked",true);
							}
							
						}
						else if($($(".tron")[0]).attr("cnum") > $(this).attr("cnum")){
							
							var startnum = Number($(this).attr("cnum"));
							var endnum = Number($($(".tron")[0]).attr("cnum"));
	
							for(let i = startnum; i <= endnum; i++){
								$(".tr" + i).addClass("tron");
								$(".tr" + i).find(".List_Check").prop("checked",true);
							}
						}
					}
				}
				else if(event.ctrlKey == true){
	
					if($(this).find(".List_Check").prop("checked") == false){
						$(this).addClass("tron");
						$(this).find(".List_Check").prop("checked",true);
					}
					else{
						$(this).removeClass("tron");
						$(this).find(".List_Check").prop("checked",false);
					}
				}
				else{
					if($(this).find(".List_Check").prop("checked") == false){
						$("#Delivery_Table > tbody > tr").removeClass("tron");
						$("#Delivery_Table > tbody > tr").find(".List_Check").prop("checked",false);
						$(this).addClass("tron");
						$(this).find(".List_Check").prop("checked",true);
					}
					else{
						if($(".tron").length>=2){
							
							$("#Delivery_Table > tbody > tr").removeClass("tron");
							$("#Delivery_Table > tbody > tr").find(".List_Check").prop("checked",false);	
							$(this).addClass("tron");
							$(this).find(".List_Check").prop("checked",true);
							
						}
						else{
	
							$("#Delivery_Table > tbody > tr").removeClass("tron");
							$("#Delivery_Table > tbody > tr").find(".List_Check").prop("checked",false);	
							
						}
					}	
				}
				
				if($("input:checkbox[name=List_Check]:checked").length == $("input:checkbox[name=List_Check]").length){
					$(".List_Check.All").prop("checked",true);
				}
				else{
					$(".List_Check.All").prop("checked",false);
				}
			}
// 			cbmBox();
		})
		
		
		$(document).on("click",".modify",function(){

// 			if($(this).attr("class") != "checktd"){
			var nc = $(this).parents("tr").find(".in_key").val();
			

			/* 미완료 배송신청으로 이동 */
			location.href = "adminDeliveryRegistMain.do?ik=" +nc;
// 			}
		})
		$(document).on("click",".link",function(){
			$("#copy_link").show();
			var nc = $(this).parents("tr").find(".in_key").val();
			var nation = $(this).parents("tr").find("input[name='REC_NATION']").val();
			if(window.location.host == 'localhost:8080'){
				var laotxt = "";
				if($("#laos").prop("checked") == true){
					laotxt = (nation == "K") ? "lao/"
							 : "";
				}
				else{
					laotxt = (nation == "L") ? "lao/"
							 : "";
				}
				
				$("#copy_link").val("localhost:8080/Delivery/"+laotxt+"Mobile_Delivery_Search_A.do?ik="+nc);
				document.getElementById("copy_link").select();
				document.execCommand("copy");
			}
			else if(window.location.host == 'ek-logis.com'){

				var laotxt = "";
				if($("#laos").prop("checked") == true){
					laotxt = (nation == "K") ? "lao/"
							 : "";
				}
				else{
					laotxt = (nation == "L") ? "lao/"
							 : "";
				}
				$("#copy_link").val("ek-logis.com/"+laotxt+"Mobile_Delivery_Search_A.do?ik="+nc);
				document.getElementById("copy_link").select();
				document.execCommand("copy");
			}
// 			alert("클립보드로 해당 항목의 링크가 복사되었습니다.");
			alertcopy("클립보드로 해당 항목의 <span style='font-weight:bold;'>링크</span>가 복사되었습니다.");
			$("#copy_link").hide();
		})
		
		$(document).on("click",".link2",function(){
			$("#copy_link2").show();
			var IK = $(this).parents("tr").find(".in_key").val();
			var EK = $(this).parents("tr").find("input[name='EK']").val();
			var REC_NM = $(this).parents("tr").find("input[name='REC_NM']").val();
			var REC_PHONE = $(this).parents("tr").find("input[name='REC_PHONE']").val();
			var OUT_DAY = $(this).parents("tr").find("input[name='OUT_DAY']").val();
			var EK1 = $(this).parents("tr").find("input[name='EK1']").val();
			var REC_TARGET = $(this).parents("tr").find("input[name='REC_TARGET']").val();
			var REC_ADDR = $(this).parents("tr").find("input[name='REC_ADDR']").val();
			var REC_HOU = $(this).parents("tr").find("input[name='REC_HOU']").val();
			var nc = $(this).parents("tr").find(".in_key").val();
			var nation = $(this).parents("tr").find("input[name='REC_NATION']").val();
			var link = "";
			
			if(window.location.host == 'localhost:8080'){
				var laotxt = "";
				if($("#laos").prop("checked") == true){
					laotxt = (nation == "K") ? "lao/"
							 : "";
				}
				else{
					laotxt = (nation == "L") ? "lao/"
							 : "";
				}
				
				link = "localhost:8080/Delivery/"+laotxt+"Mobile_Delivery_Search_A.do?ik="+nc;
			}
			else if(window.location.host == 'ek-logis.com'){

				var laotxt = "";
				if($("#laos").prop("checked") == true){
					laotxt = (nation == "K") ? "lao/"
							 : "";
				}
				else{
					laotxt = (nation == "L") ? "lao/"
							 : "";
				}
				link = "ek-logis.com/"+laotxt+"Mobile_Delivery_Search_A.do?ik="+nc;
			}

// 			▪안녕하세요, (해당 마감일에 EK1번 수량인 이름고정)고객님 택배가 “한국본사”로 접수되었습니다.

// 			▪접수번호 : (#EK2)_접수번호

// 			▪문의전화 : 020-5553-3327

// 			▪👇아래링크를 통해 세부내역 조회 및 수령지 접수 부탁드립니다.

// 			#------------링크복사------------#

// 			▪수령지 미신청시 본사 수령으로 자동 접수됩니다.

// 			▪이용해 주셔서 감사합니다.
			var copyString = "[EK물류접수안내]\n\n"; 
			copyString += "▪안녕하세요, "+EK1+", 고객님 택배가 “한국본사”로 접수되었습니다.\n\n";
			copyString += "▪접수번호 : "+EK+" \n\n";
			copyString += "▪문의전화 : 020-5553-3327\n\n";
			copyString += "▪👇아래링크를 통해 세부내역 조회 및 수령지 접수 부탁드립니다.\n\n";
			copyString += link + "\n\n";
			copyString += "▪수령지 미신청시 본사 수령으로 자동 접수됩니다.\n\n";
			copyString += "▪이용해 주셔서 감사합니다.";
			
// 			copyString += "배송번호 : " + IK + "\n\n";
// 			copyString += "접수번호 : " + EK + "\n\n";
// 			copyString += "수령인 : " + REC_NM + "\n\n";
// 			copyString += "전화번호 : " + REC_PHONE + "\n\n";
// 			copyString += "마감일 : " + OUT_DAY + "\n\n";
			



			// 위에 양식그대로 라오스어로 번역했는데 요거도 번역해서 복사 가능할까요???
			// var copyString = "[ແຈ້ງລູກຄ້າຈາກEK]\n\n"; 
			// copyString += "▪ສະບາຍດີ, ເຄື່ອງລູກຄ້າທີ່ສົ່ງມາ"+EK1+" ໄດ້ສົ່ງຮອດ ”ສາງເກົາຫຼີ” ຂອງພວກເຮົາເປັນທີ່ຮຽບຮ້ອຍ";
			// copyString += "▪ລະຫັດເຄື່ອງ : "+EK+" \n\n";
			// copyString += "▪ສອບຖາມຂໍ້ມູນ : 020-5553-3327\n\n";
			// copyString += "▪👇ກະລຸນາຕິດຕາມການຈັດສົ່ງເຄື່ອງ ແລະ ເລືອກສະຖານທີ່ຮັບເຄື່ອງຜ່ານລິ້ງລຸ່ມນີ້ດ້ວຍ.\n\n";
			// copyString += link + "\n\n";
			// copyString += "▪ຂໍຂອບໃຈທີ່ໃຊ້ບໍລິການຂອງພວກເຮົາ🙏🙏";



			

			$("#copy_link2").val(copyString);
			document.getElementById("copy_link2").select();
			document.execCommand("copy");
			

// 			alert("클립보드로 해당 항목의 기본정보가 복사되었습니다.");
			alertcopy("클립보드로 해당 항목의 <span style='font-weight:bold;'>기본정보</span>가 복사되었습니다.");
			$("#copy_link2").hide();
		})
		
		$(document).on("click",".link3",function(){
			$("#copy_link2").show();
			var IK = $(this).parents("tr").find(".in_key").val();
			var REC_TARGET = $(this).parents("tr").find("input[name='REC_TARGET']").val();
			var REC_ADDR = $(this).parents("tr").find("input[name='REC_ADDR']").val();
			var REC_HOU = $(this).parents("tr").find("input[name='REC_HOU']").val();
			
			if(REC_TARGET == "본사"){
				REC_HOU = "Pakthang Village, Sikhot District T3, Dongnatong Vientiane, LAO P.D.R";
			}
			else if(REC_TARGET == "하우창고"){
				REC_HOU = "Phonpapao Village , Sisatttanak Dostrict,Vientiane";
			}
			
			var copyString = "배송번호 : " + IK + "\n\n";
			copyString += "픽업지 : " + REC_TARGET + "\n\n";
			copyString += "상세주소 : " + REC_HOU + "\n\n";

			$("#copy_link2").val(copyString);
			document.getElementById("copy_link2").select();
			document.execCommand("copy");
			

// 			alert("클립보드로 해당 항목의 주소정보가 복사되었습니다.");
			alertcopy("클립보드로 해당 항목의 <span style='font-weight:bold;'>주소정보</span>가 복사되었습니다.");
			$("#copy_link2").hide();
		})
		
		$(document).on("click",".a_phone",function(){
			$("#copy_link").show();
			var REC_PHONE = $(this).parents("tr").find("input[name='REC_PHONE']").val();
			

			$("#copy_link").val(REC_PHONE);
			document.getElementById("copy_link").select();
			document.execCommand("copy");
		
// 			alert("클립보드로 해당 항목의 전화번호가 복사되었습니다.");
			alertcopy("클립보드로 해당 항목의 <span style='font-weight:bold;'>전화번호</span>가 복사되었습니다.");
			$("#copy_link").hide();
		});
	})
	
	
	/* 배송신청 완료된거 불러오기 */
	function ChangeSearch(){
		var deliverydata = {
				MEM_ID : uid,
				OUT_DAY : $("#S_Out_Day").val(),
				REC_NM : $("#S_Rec_Nm").val(),
				REC_PHONE : $("#S_Rec_Phone").val(),
				REC_TARGET : $("#S_Pickup :selected").val(),
				REC_SERVICE : $("#S_Service :selected").val()
		};
		$.ajax({
			type: "POST",
			url : "./Deilvery_Now_List.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);
				$("#Delivery_Table > tbody").empty();
				var tbodyData = "";
				for(let i=0; i<result.length; i++ ){
					
					if(result[i].MCHK == 'N'){
						if(result[i].REC_TARGET2 == '0' || result[i].REC_TARGET2 == null){
							tbodyData += "<tr class='tr"+i+" target_zero' cnum = '"+i+"''>";		
						}
						else if(result[i].REC_TARGET2 > '0'){
								tbodyData += "<tr class='tr"+i+" target_zero2' cnum = '"+i+"''>";		
						}
					}
					else if(result[i].COMPLETE > 0){
						tbodyData += "<tr class='tr"+i+" target_complete' cnum = '"+i+"''>";
					
					}
					else{
						tbodyData += "<tr class='tr"+i+"' cnum = '"+i+"''>";
					}
					tbodyData += "<td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>";
					tbodyData += "<td class='tdek'>"+result[i].EK+"</td>";
					tbodyData += "<td>"+result[i].COUNT+"</td>";
					tbodyData += "<td>"+result[i].REC_NM+"</td>";
					tbodyData += "<td><span class='a_phone' href='#'>"+result[i].REC_PHONE+"</span></td>";
					tbodyData += "<td>"+result[i].REC_TARGET+"</td>";
					tbodyData += "<td><input type='hidden' class='in_key' value='"+result[i].IN_KEY+"'>"+result[i].OUT_DAY+"</td>";
					// tbodyData += "<td>"+result[i].NOW_DELIVERY+"</td>";
// 					tbodyData += "<td>"+result[i].MAXCHK+"</td>";
// 					tbodyData += "<td>"+result[i].SERVICE+"</td>";
					if(auth != 'R'){
						tbodyData += "<td><button class='modify'><img src='./images/pc_icon/modify_black.svg'></button></td>";
					}
					tbodyData += "<td><button class='link2'><img src='./images/pc_icon/Link.svg'></button></td>";
					tbodyData += "<td><button class='link3'><img src='./images/pc_icon/Link.svg'></button></td>";
					tbodyData += "<td><button class='link'><img src='./images/pc_icon/Link.svg'></button></td>";
					tbodyData += "<input type='hidden' class='tr_cbm' value='"+result[i].CBM+"' >";
					tbodyData += "<input type='hidden' class='tr_weight' value='"+result[i].WEIGHT+"' >";
					tbodyData += "<input type='hidden' class='tr_cost' value='"+result[i].COST+"' >";
					tbodyData += "<input type='hidden' class='tr_count' value='"+result[i].COUNT+"' >";
					
					tbodyData += "<input type='hidden' name='EK' value='"+result[i].EK+"' >";
					tbodyData += "<input type='hidden' name='REC_NM' value='"+result[i].REC_NM+"' >";
					tbodyData += "<input type='hidden' name='REC_PHONE' value='"+result[i].REC_PHONE+"' >";
					tbodyData += "<input type='hidden' name='REC_TARGET' value='"+result[i].REC_TARGET+"' >";
					tbodyData += "<input type='hidden' name='REC_TARGET2' value='"+result[i].REC_TARGET2+"' >";
					tbodyData += "<input type='hidden' name='REC_ADDR' value='"+result[i].REC_ADDR+"' >";
					tbodyData += "<input type='hidden' name='REC_ADDR2' value='"+result[i].REC_ADDR2+"' >";
					tbodyData += "<input type='hidden' name='REC_HOU' value='"+result[i].REC_HOU+"' >";
					tbodyData += "<input type='hidden' name='OUT_DAY' value='"+result[i].OUT_DAY+"' >";
					tbodyData += "<input type='hidden' name='REC_NATION' value='"+result[i].REC_NATION+"' >";
					tbodyData += "<input type='hidden' name='EK1' value='"+result[i].EK1+"' >";
					
					tbodyData += "</tr>";
				}

				$("#Delivery_Table > tbody").append(tbodyData);
				cbmBox();
				
				if($("#S_Pickup :selected").val() == "0" ){
					$("#deadline_open").show();
				}
				else{
					$("#deadline_open").hide();
				}
            }
		})
	}
	/* cbm, 총 박스 수 계산기 */
	function cbmBox(){
	 	// cbm계산 : 총가로 * 총세로 * 총높이 * 0.0000001
		let total_count = 0;
		let cbm = 0;
		let weight = 0;
		
		$("#Delivery_Table > tbody > tr").each(function(e){
			let total_weight = Number($(this).find(".tr_weight").val());
			let total_cbm = Number($(this).find(".tr_cbm").val());
			
			total_count += Number($(this).find(".tr_count").val());
			
// 			cbm += Math.round((total_width * total_height * total_length * 0.0000001) * 100)/100;
			cbm += total_cbm;
			weight += total_weight;
// 			console.log(cbm,total_cbm);
		})
		
		//선택한 데이터만 불러오기(미사용)
// 		for(let prt = 0; prt < $(".List_Check.sub:checked").length; prt++){

// 			let total_width = Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_width").val());
// 			let total_height = Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_height").val());
// 			let total_length = Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_length").val());
			
// 			total_count += Number($($(".List_Check.sub:checked")[prt]).parents("tr").find(".tr_count").val());
			
// 			cbm += Math.round((total_width * total_height * total_length * 0.000001) * 100)/100;
// 		}
		$(".total_cbm").text(Math.round( cbm* 100)/100);
		$(".total_box").text(total_count);
		$(".total_weight").text(Math.round( weight* 100)/100);

	}
	function Excelpopup(){
		if($(".List_Check.sub:checked").length <= 0){	
			alert("출력할 항목을 선택해주세요.")
		}
		else{
			$("#print_table_H1").empty();
			var StartIn_key = "";
			var checkNot = 0;
			var checkYes = 0;
			sub_table = {};
			main_table = {};
			in_keys = [];
			var group_sub_table = [];
			for(let prt = 0; prt < $(".List_Check.sub:checked").length; prt++){
				
				var deliverydata = {
						IN_KEY : $($(".List_Check.sub:checked")[prt]).parents("tr").find(".in_key").val(),
				};
				$.ajax({
					type: "POST",
					url : "./Delivery_receipt.do",
					data: deliverydata,
					async: false,
		            success: function(datas){
						
						$.ajax({
							type: "POST",
							url : "./Delivery_receipt_D.do",
							data: deliverydata,
							async: false,
				            success: function(datas2){
								var A_result = JSON.parse(datas);
								var D_result = JSON.parse(datas2);
								
								if(D_result.length > 0){
								
								var group_sub_table = [];
								var cost = 0;
								for(let i=0; i<D_result.length; i++){
									
									//용적중량(lncost)와 kgcost 비교해서 기준가(cost) 계산하기
// 									var cost = 0;
									var lncost = Math.round((D_result[i].WIDTH * D_result[i].LENGTH * D_result[i].HEIGHT * 0.00022) * 100) / 100;
// 									var kgcost = D_result[i].WEIGHT * 1.5;
// 									if(kgcost < 10 && lncost * 1.5 < 10){
// 										cost = 10;
// 									}
// 									else if(kgcost >= lncost * 1.5){
// 										cost = kgcost;
// 									}
// 									else{
// 										cost = Math.round(lncost * 1.5);
// 									}
									cost += D_result[i].COST;
									//서브테이블 값
									var dk = {
											IN_KEY:A_result[0].IN_KEY,
											REC_TXT:A_result[0].REC_TXT,
											WEIGHT:D_result[i].WEIGHT,
											WIDTH:D_result[i].WIDTH,
											LENGTH:D_result[i].LENGTH,
											HEIGHT:D_result[i].HEIGHT,
											LNCOST:lncost,
											COST: Math.round(D_result[i].COST * 100)/100,
											WEIGHT3:(lncost < D_result[i].WEIGHT) ? D_result[i].WEIGHT
													:lncost
											
									}
									group_sub_table.push(dk);
								};
								sub_table[A_result[0].IN_KEY] =group_sub_table;
								
								//qr 저장고
								var HiddenMain = "";
								HiddenMain += '<tr>';
								var qrTxt = "";
								
								// 메인 값
								var mk = {
										IN_KEY:			A_result[0].IN_KEY,
										REC_NM:			A_result[0].REC_NM,
										REC_ADDRESS:		A_result[0].REC_HOU,
										REC_PHONE:		A_result[0].REC_PHONE,
										YEAR:			A_result[0].CRE_DAY.substr(0,4),
										COUNT:			D_result.length,
										OUT_DAY:		A_result[0].ARR_DAY + "일 마감",
										MONTH:		A_result[0].ARR_DAY.substr(5,2),
										DISCOUNT: A_result[0].DISCOUNT + "%"
								}
								
								if(D_result.length > 0){
									cost = Math.round(cost * 100) / 100;
									const cn1 = cost.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
									const cn2 = (cn1.indexOf(",") > 0) ? cn1.replace(",","")
												:cn1;
									
									mk["COST"] ="$" + Math.round(cn1);
									
									if(Math.round((Number(cn2) - Math.round(Number(cn2) * A_result[0].DISCOUNT / 100))) >= 10){
										mk["DIS_COST"] = "$" + (Math.round(Number(cn2) * A_result[0].DISCOUNT / 100 ));
//	 									console.log(Number(cn1) - (Number(cn1) * A_result[0].DISCOUNT / 100));
										mk["TR_COST"] = "$" + (Math.round((Number(cn2) - Math.round(Number(cn2) * A_result[0].DISCOUNT / 100))));
									}
									else{
										mk["DIS_COST"] = (((Math.round(Number(cn2) * A_result[0].DISCOUNT / 100 ))-10) > 0) ? "$" + ((Math.round(Number(cn2) * A_result[0].DISCOUNT / 100 ))-10)
														:  "$0";
//	 									console.log(Number(cn1) - (Number(cn1) * A_result[0].DISCOUNT / 100));
										mk["TR_COST"] = "$10";
									}
									mk["EK"] = D_result[0].SJ_KEY.split("-")[0];
									
// 						        	const qrInfoArr = new Array();
// 					        		qrTxt = "수령인 : "+A_result[0].REC_NM+"\n연락처 : "+A_result[0].REC_PHONE+"\n픽업지 : "+A_result[0].REC_TARGET;	        		
// 					        		qrInfoArr.push({qrText : qrTxt, qrId : "qrCode_"+index});
// 									$("#EXCEL_QR1").empty();
// 					        		qrCreate("EXCEL_QR1", qrTxt);	      
								}
								else{
									mk["COST"] = "";
									mk["TR_COST"] = "";
									mk["DIS_COST"] = "";
									mk["EK"] = "";
								}
// 								HiddenMain += '<td class="qr" id="qr_'+A_result[0].IN_KEY+'"></td>';
								HiddenMain += '</tr>';
// 								mk["qrTxt"] = qrTxt;

								main_table[A_result[0].IN_KEY] =mk;
								in_keys.push(A_result[0].IN_KEY);
								
								$("#print_table_H1").append(HiddenMain);
// 								$("#qr_" + A_result[0].IN_KEY).empty();
// 								if(qrTxt != ""){
// 									qrCreate("qr_" + A_result[0].IN_KEY, qrTxt);	
// 								}
								if(StartIn_key == ""){
									StartIn_key = A_result[0].IN_KEY;
								}
									checkYes++;
								}
								else{
									checkNot++;
								}
								// 					        		qrCreate("EXCEL_QR1", qrTxt);
								

				            }
						});
		            },
				});
			}
		
			if(checkYes != 0){
				PrintPageLoad(StartIn_key);
				$(".print_page > .now_In_key").text(StartIn_key);
				$(".print_page > .now_num").text(0);
				
				if(checkNot > 0){
					alert(checkNot + "건의 배송건은 박스가 등록되지 않아 창에 나타나지 않습니다.")
				}
				$("#print_grayback").show();
			}
			else{
				alert("선택하신 " + checkNot + "건의 배송건은 박스가 등록되지 않아 엑셀 출력이 불가합니다.")
			}
		}
// 		stopLoading();
	}
	function Receiptpopup(){

		if($(".List_Check.sub:checked").length <= 0){	
			alert("출력할 항목을 선택해주세요.")
		}
		else{
			A_in_keys = [];
			A_table = [];
			A_table_Detail = [];
			var StartIn_key = "";
			var checkNot = 0;
			var checkYes = 0;
			for(let prt = 0; prt < $(".List_Check.sub:checked").length; prt++){
				
				var deliverydata = {
						MEM_ID : uid,
						IN_KEY : $($(".List_Check.sub:checked")[prt]).parents("tr").find(".in_key").val(),
				};

				$.ajax({
					type: "POST",
					url : "./Delivery_Select_A2.do",
					data: deliverydata,
					async: false,
		            success: function(datas){
						$.ajax({
							type: "POST",
							url : "./Delivery_Select_D.do",
							data: deliverydata,
							async: false,
				            success: function(datas2){
								var A_result = JSON.parse(datas);
								var D_result = JSON.parse(datas2);
								var details = [];
								var ek = {};
								var dk = [];
								console.log(prt, A_result ,D_result)
								if(D_result.length > 0 && A_result.BOX_COUNT > 0){
									for(let ds= 0; ds< D_result.length; ds++){
										var dk_data = {
											WIDTH :	 D_result[ds].WIDTH,
											HEIGHT : D_result[ds].HEIGHT,
											LENGTH : D_result[ds].LENGTH,
											WEIGHT : D_result[ds].WEIGHT,
											USE_DISCOUNT :	D_result[ds].USE_DISCOUNT,
											COST_TOTAL :	D_result[ds].COST_TOTAL
										}
										dk.push(dk_data);
									}
									A_table_Detail[A_result.IN_KEY] = dk;
									
									ek = {
										ARR_DAY 	: A_result.ARR_DAY,
										EK 			: A_result.EK,
										REC_NM 		: A_result.REC_NM,
										BOX_COUNT 	: A_result.BOX_COUNT,
										COST 		: A_result.COST,
										FN_COST 	: A_result.FN_COST,
										DISCOUNT 	: A_result.DISCOUNT,
										DIS_COST1 	: A_result.DIS_COST1,
										FIRST_COST 	: A_result.FIRST_COST,
										FIRST_DISCOUNT : A_result.FIRST_DISCOUNT,
										DIS_COST2 	: A_result.DIS_COST2,
										TOTAL_COST 	: A_result.TOTAL_COST
									};
									
									A_table[A_result.IN_KEY] = ek;
									A_in_keys.push(A_result.IN_KEY);
									

									if(StartIn_key == ""){
										StartIn_key = A_result.IN_KEY;
									}
									checkYes++;
								}
								else{
									checkNot++;
								}
									
								
				            }
						});
		            }
				});
			}
			
			if(checkYes != 0){
				PrintPageLoad2(StartIn_key);
// 				PrintPageLoadAll();
				$(".receipt_page > .now_In_key").text(StartIn_key);
				$(".receipt_page > .now_num").text(0);
				
				if(checkNot > 0){
					alert(checkNot + "건의 배송건은 박스가 등록되지 않아 창에 나타나지 않습니다.")
				}
				$("#receipt_grayback").show();
			}
			else{
				alert("선택하신 " + checkNot + "건의 배송건은 박스가 등록되지 않아 창에 나타나지 않습니다.")
			}
		}
		
	}
	
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
	}
	
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
	
	function pressenters(){
		if(window.event.keyCode==13){
			ChangeSearch();
		}
	}
	
	function alertcopy(msg){

		$(".alert_copy > span").html(msg);
		$(".alert_copy").fadeIn(1000,function(){
			setTimeout(function () { $(".alert_copy").fadeOut(1000);},2500);
			
		});
	}
	
	
	function outdaybox(){
		var deliverydata = {
				MEM_ID : uid,
				OUT_DAY : "",
		};
		$.ajax({
			type: "POST",
			url : "./Out_Day_List.do",
			data: deliverydata,
			async: false,
            success: function(datas){
            	var result = JSON.parse(datas);
            	
            	$(".outdays").remove();
            	for(let i=0; i<result.length; i++){
                	$(".outdayBox").append("<div class='outdays'>"+result[i].OUT_DAY+"</div>");
            	}
            }
		})
	}
	
	var dayes = document.querySelector("#S_Out_Day");
	var daybox = 0;
	dayes.onfocus = function(e){
		$(".outdayBox").show();
		daybox = 1;
	}
	
	document.querySelector("body").addEventListener("click", function (e) {
		if(daybox == 1){

			if(e.target.className == 'outdays' || e.target.className == 'outdayTitle' || e.target.className == 'Search days') {
// 		        console.log("correct")
		    } else {
		        daybox = 0;
		        $(".outdayBox").hide();
		    }
		}
	})
	
// 	dayes.onblur = function(e){

// 		console.log(e);
// 		$(".outdayBox").hide();
// 	}
</script>
</html>