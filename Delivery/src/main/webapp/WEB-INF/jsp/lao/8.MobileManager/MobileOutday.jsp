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
    <title>EK Logistics - 마감일 검색</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
	.currentcheck{
		display:none;
	}
	.qrbutton{
		display:flex;
	}
	.icon {
	    width: 28px;
	    height: 28px;
	    /* background-color: #FFD9AA; */
	    border: 1px solid var(--main-color);
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    border-radius: 4px;
	    margin-left: 12px;
	}
	.icon img {
	    width: 18px;
	    height: 18px;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="../css/Mobile/common.css">  
<link rel="stylesheet" href="../css/8.MobileManager/MobileOutday_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="../js/8.MobileManager/Outday_index.js"></script>
<script src="../js/pageChange.js"></script>
</head>

<body>
   <div class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">QR코드</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="../images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <img src="../images/m_icon/QR.svg" alt="">
            </div>
            
        </div>        
    </div>     
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="../images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">마감일관리</div>
        </header>        
        <section>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">마감일<span>*</span></a></h5>
                <input type="text" id="Out_Day" placeholder="마감일을 입력해주세요" maxlength="10" oninput="oninputDay(this);">
                <input type="hidden" id="Out_CHK" placeholder="">
                <input type="hidden" id="Out_Key" placeholder="">
            </div>
            <div class="inputWrap">
                <h5 class="inputName"><a href="#">비고</a></h5>
                <input type="text" id="Out_Txt" placeholder="비고">
            </div>
            <h3 class="sectionMainTitle">
                <a href="#">
                    배송 현황
                </a>
                <div class="qrbutton">
<!--                 	<div class="qr">QR코드</div> -->
                    <h5 class="icon delete">
                        <img src="../images/m_icon/delete_orange.svg" alt="#">
                    </h5>
                </div>
            </h3>
            <div class="stepWrap">
                <div class="stepCon current one on">
                    <h5 class="stepTxt"><a href="#">한국 창고</a></h5>
                    <input class="stepDate currentDay" type="text" placeholder="날짜">
                    <input class="stepDate currentMessage" type="text" placeholder="비고">
	          		<input type="hidden" class="currentSeq" placeholder="" value="1">
                    <input type="radio" name="radiooutkey" class="currentcheck">                     
                </div>
                <div class="stepCon current two">
                    <h5 class="stepTxt"><a href="#">인천항</a></h5>
                    <input class="stepDate currentDay" type="text" placeholder="날짜">
                    <input class="stepDate currentMessage" type="text" placeholder="비고">
	          		<input type="hidden" class="currentSeq" placeholder="" value="2">
                    <input type="radio" name="radiooutkey" class="currentcheck">   
                </div>
                <div class="stepCon current three">
                    <h5 class="stepTxt"><a href="#">배송중</a></h5>
                    <input class="stepDate currentDay" type="text" placeholder="날짜">
                    <input class="stepDate currentMessage" type="text" placeholder="비고">
	          		<input type="hidden" class="currentSeq" placeholder="" value="3">
                    <input type="radio" name="radiooutkey" class="currentcheck">   
                </div>
                <div class="stepCon current four">
                    <h5 class="stepTxt"><a href="#">태국항</a></h5>
                    <input class="stepDate currentDay" type="text" placeholder="날짜">
                    <input class="stepDate currentMessage" type="text" placeholder="비고">
	          		<input type="hidden" class="currentSeq" placeholder="" value="4">
                    <input type="radio" name="radiooutkey" class="currentcheck">   
                </div>
                <div class="stepCon current five">
                    <h5 class="stepTxt"><a href="#">라오스 창고</a></h5>
                    <input class="stepDate currentDay" type="text" placeholder="날짜">
                    <input class="stepDate currentMessage" type="text" placeholder="비고">
	          		<input type="hidden" class="currentSeq" placeholder="" value="5">
                    <input type="radio" name="radiooutkey" class="currentcheck">   
                </div>
                <div class="stepCon current six">
                    <h5 class="stepTxt"><a href="#">배출시작</a></h5>
                    <input class="stepDate currentDay" type="text" placeholder="날짜">
                    <input class="stepDate currentMessage" type="text" placeholder="비고">
	          		<input type="hidden" class="currentSeq" placeholder="" value="6">
                    <input type="radio" name="radiooutkey" class="currentcheck">   
                </div>
            </div>    
        </section>
        <footer>
            <button class="create">마감일 저장하기</button>
            <button class="modify">마감일 저장하기</button>
        </footer>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var auth = '${M_AUTH}';

	var outkey = window.location.search.replaceAll("?ok=","");
	
	$(document).on('ready',function(){

		if(auth == 'R'){
			$(".icon.delete").remove();
			$(".modify").remove();
		}		
		else if(auth == 'D'){
			location.href = "Mobile_ManagerMain.do";
		}

		$(".back").on("click",function(){
			history.back();
		})

		$('#Out_Day').datepicker(
				{
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
				    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
				    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
					dateFormat : 'yy-mm-dd',
				});
		$('#Out_Day').datepicker('setDate','today');

		$('.currentDay').datepicker(
				{
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
				    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
				    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
					dateFormat : 'yy-mm-dd',
				});
// 		$('.currentDay').datepicker('setDate','today');

		if(outkey != ''){
			searchOutDay(outkey);	
			$(".create").remove();
		}
		else{
			chkfileReset(0);
			$(".qrcode").remove();
			$(".modify").remove();
			$(".delete").remove();
		}
		
		$(".stepCon.current").on("click",function(e){
			if($(this).find(".currentcheck").prop("disabled") != true && $(e.target).hasClass("stepDate") == false){

				$(".currentDay").attr("disabled",true);
				$(".currentMessage").attr("disabled",true);
				$(".current").removeClass("on");

				$(this).addClass("on");
				$(this).find(".currentDay").attr("disabled",false);
				$(this).find(".currentMessage").attr("disabled",false);
			}
			
		})

		/* 마감일 생성 */
		$(".create").on("click",function(){
				if($("#Out_Day").val() == ''){
					alert("출항 예정일을 입력해주세요.")
				}
				else if($(".current.on").find(".currentDay").val() == ''){
					alert("최초 배송현황 날짜를 입력해주세요.")
				}
				else{
					var daydata = {
						MEM_ID  : uid,
						OUT_DAY : $("#Out_Day").val(),
						OUT_TXT : $("#Out_Txt").val()
					};
					$.ajax({
	    				type: "POST",
	    				url : "../Out_Day_Insert.do",
	    				data: daydata,
	    				async: false,
	    	            success: function(data){
	    	            	
	    	            	if(data == ''){
	    	            		alert("잘못된 접근입니다.");	
	    	            	}
	    	            	else if(data == '잘못된 접근입니다.' || data == '해당 날짜에 마감일이 이미 생성되어 있습니다.'){
	    	            		alert(data);
	    	            	}
	    	            	else{
	    	            		$("#Out_Key").val(data);
	    	            		
	    	            		var form ={//= new FormData();
	    	    						MEM_ID:		uid,
	    	    		     		 	OUT_SEQ:	$(".current.on").find(".currentSeq").val(),
	    	    		     		 	OUT_KEY:	$("#Out_Key").val(),
	    	    		     		 	OUT_DAY:	$("#Out_Day").val(),
	    	    		     		 	CHK:		$(".current.on").find(".currentSeq").val(),
	    	    		     		 	OUT_TXT:	$(".current.on").find(".currentDay").val(),
	    	    		     		 	OUT_TXT_SUB:$(".current.on").find(".currentMessage").val(),
	    	    		     		 	MODE:		"U"
	    		            		}
//	     		     		 	$("#Out_Day_Out_Image")[0].files[0]
	    		            	$.ajax({
	    		    				type: "POST",
	    		    				url : "../Out_Day_File_UD.do",
	    		    				data: form,
	    		    				async: false,
	    		    	            success: function(datas){
	    		    	            	alert(datas);
	    		    	    			location.href="Mobile_M_Outday.do?ok=" + data;
	    		    	            }
	    		    			});
	    	            	}
	    	            }
	    			});
		     		 	
				}
				
		});

		/* 마감일 수정 */
		/* 규칙: 반드시 활성화된 칸만 수정할 수 있음. */
		$(".modify").on("click",function(){
				if($(".current.on").find(".currentDay").val() == ''){
					alert("현재 날짜 텍스트를 입력해주세요.")
				}
				else{

					var daydata = {
						MEM_ID  : uid,
						OUT_KEY : $("#Out_Key").val(),
						OUT_TXT : $("#Out_Txt").val(),
						OUT_TXT_SUB : "",
						MODE : "U"
					};
					
					$.ajax({
	    				type: "POST",
	    				url : "../Out_Day_UD.do",
	    				data: daydata,
	    				async: false,
	    	            success: function(datas2){
							var form ={//= new FormData();
		    						MEM_ID:		uid,
		    		     		 	OUT_SEQ:	$(".current.on").find(".currentSeq").val(),
		    		     		 	OUT_KEY:	$("#Out_Key").val(),
		    		     		 	OUT_DAY:	$("#Out_Day").val(),
		    		     		 	CHK:		$(".current.on").find(".currentSeq").val(),
		    		     		 	OUT_TXT:	$(".current.on").find(".currentDay").val(),
		    		     		 	OUT_TXT_SUB:$(".current.on").find(".currentMessage").val(),
		    		     		 	MODE:		"U"
			            		}
		// 		     		 	$("#Out_Day_Out_Image")[0].files[0]
				            	$.ajax({
				    				type: "POST",
				    				url : "../Out_Day_File_UD.do",
				    				data: form,
				    				async: false,
				    	            success: function(datas){
				    	            	alert(datas);
				    	            	searchOutDay($("#Out_Key").val());
				    	            }
				    			});
	    	            }
					})
				}
				
		});

		/* 마감일 삭제 */
		/* 규칙 : 배송현황이 하나이상 존재할 경우, 배송현황만이 삭제. */
		/* 만약 배송현황이 하나도 없을때 클릭할 경우, 마감일 자체 삭제가능. */
		$(".delete").on("click",function(){

			var test = ["","one","two","three","four","five","six"]
			
			if($("#Out_CHK").val() == 0){
				if(confirm("현재 마감일을 삭제하시겠습니까?")){
					
					var daydata = {
						MEM_ID  : uid,
						OUT_KEY : $("#Out_Key").val(),
						OUT_TXT : "",
						MODE : "D"
					};
					
					$.ajax({
	    				type: "POST",
	    				url : "../Out_Day_UD.do",
	    				data: daydata,
	    				async: false,
	    	            success: function(datas){
	    	            	if(datas == '잘못된 접근입니다.'){
	    	            		alert(datas);
	    	            	}
	    	            	else{

		    	            	alert("삭제되었습니다. 마감일 목록으로 돌아갑니다.");
		    	    			location.href="Outday_List.do?";
	    	            	}
	    	            }
	    			});
				}
			}
			else if($("#Out_CHK").val() != 0 && $(".current." + test[$("#Out_CHK").val()]).hasClass("on") == false){
				alert("해당 항목은 삭제할수 없습니다.")
			}
			else if(confirm("해당 배송현황을 삭제하시겠습니까?")){
						var form ={//= new FormData();
								MEM_ID:		uid,
				     		 	OUT_SEQ:	$(".current.on").find(".currentSeq").val(),
				     		 	OUT_KEY:	$("#Out_Key").val(),
				     		 	OUT_DAY:	$("#Out_Day").val(),
				     		 	CHK:		$(".current.on").find(".currentSeq").val(),
				     		 	OUT_TXT:	$(".current.on").find(".currentDay").val(),
				     		 	OUT_TXT_SUB:$(".current.on").find(".currentMessage").val(),
				     		 	MODE:		"D"
		            		}
// 		     		 	$("#Out_Day_Out_Image")[0].files[0]
		            	$.ajax({
		    				type: "POST",
		    				url : "../Out_Day_File_UD.do",
		    				data: form,
		    				async: false,
		    	            success: function(datas){
		    	            	alert(datas);
		    	            	searchOutDay($("#Out_Key").val());
		    	            }
		    			});
			}
		});
	})

	/* 마감일 현황 불러오기 */
	function searchOutDay(out_key){
		var OutData = {
				MEM_ID : uid,
				OUT_KEY : out_key
		};
		

		$.ajax({
			type: "POST",
			url : "../Out_Day_Select.do",
			data: OutData,
			async: false,
            success: function(datas){
				var resultdata = JSON.parse(datas);

				$(".outday_input").val("");
				$(".outday_file").val("");
				
				$('#Out_Day').datepicker('setDate',resultdata.OUT_DAY);
				$('#Out_Day').attr('disabled',true);
				$("#Out_Key").val(resultdata.OUT_KEY);
				$("#Out_Txt").val(resultdata.OUT_TXT);
				var OutFileData = {
						MEM_ID : uid,
						OUT_KEY : resultdata.OUT_KEY
				};

				$.ajax({
					type: "POST",
					url : "../Out_Day_File_Select.do",
					data: OutFileData,
					async: false,
		            success: function(datas2){
						var filesdata = JSON.parse(datas2);
						
						chkfileReset(filesdata.length);	
						
						var setting = ["one","two","three","four","five","six"];
						
						for(let i=0; i<filesdata.length; i++){
							$(".current."+setting[i]).find(".currentDay").val(filesdata[i].OUT_TXT);
							$(".current."+setting[i]).find(".currentMessage").val(filesdata[i].OUT_TXT_SUB);
						}
						
						
		            }
				});
    		}
		})
		
	}

	/* 최신 데이터가 삽입된 칸과 이후에 새로 입력할수 있는 칸만 활성화. */
	function chkfileReset(chk){
		
		$("#Out_CHK").val(chk);
		

		$(".current").removeClass("on");
		$(".current").removeClass("off");
		$(".current").addClass("off");
		
		$(".currentDay").attr("disabled",true);
		$(".currentDay").val("");
		$(".currentMessage").attr("disabled",true);
		$(".currentMessage").val("");
		$(".currentcheck").attr("disabled",true);
		$(".currentcheck").prop("checked",false);
		
		var setting = ["one","two","three","four","five","six"];
		
		if(chk == 0){
			$(".current.one").removeClass("off");
			$(".current.one").addClass("on");
			$(".current.one").find(".currentDay").attr("disabled",false);
			$(".current.one").find(".currentMessage").attr("disabled",false);
			
			$(".current.one").find(".currentcheck").attr("disabled",false);
			$(".current.one").find(".currentcheck").prop("checked",true);
			
		}
		else if(chk > 0 && chk < 6){
				$(".current."+setting[chk]).removeClass("off");
				$(".current."+setting[chk]).addClass("on");
				$(".current."+setting[chk]).find(".currentDay").attr("disabled",false);
				$(".current."+setting[chk]).find(".currentMessage").attr("disabled",false);
				$(".current."+setting[chk-1]).find(".currentcheck").attr("disabled",false);
				$(".current."+setting[chk]).find(".currentcheck").attr("disabled",false);
				$(".current."+setting[chk]).find(".currentcheck").prop("checked",true);
				
		}
		else if(chk == 6){
			$(".current.six").removeClass("off");
			$(".current.six").addClass("on");
			$(".current.six").find(".currentDay").attr("disabled",false);
			$(".current.one").find(".currentMessage").attr("disabled",false);
			$(".current.six").find(".currentcheck").attr("disabled",false);
			$(".current.five").find(".currentcheck").attr("disabled",true);
			$(".current.six").find(".currentcheck").prop("checked",true);
			
		}
		
	}
	

	//============추가 (2024-10-20)===============//
	
	
	
	function oninputDay(target) {
        target.value = target.value
            .replace(/[^0-9]/g, '')
            .replace(/([0-9]{4})([0-9]{2})([0-9]{2})/g, "$1-$2-$3");
//             .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
    }
</script>
</html>