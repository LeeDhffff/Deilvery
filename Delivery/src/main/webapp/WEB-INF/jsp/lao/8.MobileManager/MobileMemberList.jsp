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
    <title>EK Logistics - 고객관리</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
	#pop2_con{
	    position: absolute;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%, -50%);
	}
	.popup_input_div{
		display:flex;
		margin: 15px;
	}
	.popup_input_div > h3{
		width: 100px;
		line-height: 40px;
	}
	.popup_input_div > h3 > span{
		color: red;
	}
	.popup_input{
		width: 70%;
	    border: 1px solid black;
	    padding: 5px;
	    height: 40px;
	}
	
	#Member_Table > thead > tr > th:last-child{
		width: 50px;
	}
	.modimode{
		width: 100%;
		height: 84%;
	    background: white;
	    border: 1px solid var(--sub-color);
	    border-radius: 5px;
	}
	.modimode:hover{
	    background: var(--sub-color);
	}
	.popbutton_modify{
		display:flex;
	}
	#M_create{
		background: #249900;
	}
	#M_modify{
		background: #2840ff;
	}
	#M_delete{
		background: red;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="../css/Mobile/common.css">  
<link rel="stylesheet" href="../css/8.MobileManager/MobileMemberList_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="../js/8.MobileManager/MemberList_index.js"></script>
<script src="../js/pageChange.js"></script>
</head>

<body>
   <div id="pop1" class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">고객관리 필터</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="../images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <h3 class="tabCon" id="count"><a href="#">이용 횟수</a></h3>     
                <h3 class="tabCon" id="totalcost"><a href="#">배송비 총 금액</a></h3>          
            </div>
            <button class="popButton">적용하기</button>            
        </div>        
    </div> 
   <div id="pop2" class="pop">
        <div class="popCon" id="pop2_con">
            <div class="popHeader">
                <div class="popTitle">고객정보 추가</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="../images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody" style="display:block;">
                <div class="popup_input_div">
						<h3>고객 ID<span>*</span></h3>
						<input type="text" class="popup_input" id="M_ID" placeholder="ID">
						<input type="hidden" class="popup_input" id="M_ID_CHK">
					</div>
					<div class="popup_input_div">
						<h3 class="pwh3">비밀번호<span>*</span></h3>
						<input type="password" class="popup_input" id="M_PASSWORD" placeholder="비밀번호">
					</div>
					<div class="popup_input_div">
						<h3>이름<span>*</span></h3>
						<input type="text" class="popup_input blik" id="M_NAME" placeholder="이름">
						<input type="hidden" class="popup_input blik" id="M_NAME_CHK">
					</div>
					<div class="popup_input_div">
						<h3>전화번호<span>*</span></h3>
						<input type="text" oninput="oninputPhone(this)" maxlength="13" class="popup_input blik" id="M_PHONE" placeholder="전화번호">
					</div>
					<div class="popup_input_div">
						<h3>이메일</h3>
						<input type="text" class="popup_input blik" id="M_EMAIL" placeholder="이메일">
					</div>
					<div class="popup_input_div">
						<h3>할인율(%)</h3>
						<input type="number" class="popup_input" id="M_DISCOUNT" placeholder="할인율">
					</div>
					<div class="popup_input_div">
						<h3>구분</h3>
						<select class="popup_input" id="M_LEVEL">
							<option value="1">일반회원</option>
							<option value="2">관리자</option>
							<option value="0">비회원</option>
						</select>
					</div>
					<div class="popup_input_div">
						<h3>비고</h3>
						<input type="text" class="popup_input" id="M_BIGO" placeholder="비고">
					</div>          
            </div>
            <div class="popbutton_modify">
	            <button class="popButton2" id="M_create">등록하기</button>
	            <button class="popButton2" id="M_modify">수정하기</button>
	            <button class="popButton2" id="M_delete">삭제하기</button>            
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
            <div class="m_headerTitle">고객관리</div>
        </header>        
        <section>  
            <div class="currentWrap">
                <h5 class="icon filter">
                    <img src="../images/m_icon/filter_orange.svg" alt="#">
                </h5>
                <div class="currentHeader">
                    <h5><a href="#">고객리스트</a></h5>
                </div>
                <div class="tableWrap">
                    <table id="Member_Table">
                        <thead>
                            <tr>
<!--                                 <th><input type="checkbox"></th> -->
                                <th>이름</th>
                                <th>전화번호</th>
                                <th>이용횟수</th>
                                <th>배송비 총금액</th>
                                <th>할인율(%)</th>
                                <th class="thmodify">수정하기</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div> 
            </div>
        </section>
        <footer>
            <button class="create">등록하기</button>
        </footer>        
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var auth = '${M_AUTH}';

	$(document).on('ready',function(){

		if(auth == 'R'){
			$(".thmodify").remove();
			$(".create").remove();
		}		
		else if(auth == 'D'){
			location.href = "Mobile_ManagerMain.do";
		}

		$(".back").on("click",function(){
			history.back();
		})
		
		$(".create").on("click",function(){
			reset('I');
		})
		
		$(".popButton").on("click",function(){
			selectList();
			$(".pop").hide();
		})


		$(document).on("click",".modimode",function(){

			$("#M_ID").val($(this).parents("tr").find(".tdid").val());
			$("#M_LEVEL").val($(this).parents("tr").find(".tdlevel").val());
			reset('M');
		});
		
		$("#M_ID").on("change",function(){
			$.ajax({
				type: "POST",
				url : "../id_chk.do",
				data: {CHK_ID : $("#M_ID").val()},
				async: false,
	            success: function(datas){
	                if(datas == 'Y'){
	               	   $("#M_ID_CHK").val($("#M_ID").val());
	               	   $("#M_ID").css("border","1px solid black");
	                }
	                else{
		               $("#M_ID_CHK").val("");
	               	   $("#M_ID").css("border","1px solid red");
	                }
	            }
				
			})	
		})
		
		$("#M_NAME").on("change",function(){
			chknm()
		})
		
		$("#M_PHONE").on("change",function(){
			chknm()
		})
		
		$("#M_create").on("click",function(){
	 		if($("#M_ID").val().length < 6){
				alert("아이디를 6자이상 입력해주세요");
				$("#M_ID").focus();
			}
			else if($("#M_ID").val() != $("#M_ID_CHK").val()){
				alert("아이디가 중복되었습니다.");
				$("#M_ID").focus();
			}
			else if($("#M_PASSWORD").val() == ''){
				alert("패스워드를 입력해주세요.");
				$("#M_PASSWORD").focus();
			}
			else if($("#M_NAME").val() == ''){
				alert("이름을 입력하세요.");
				$("#M_NAME").focus();
			}
			else if($("#M_PHONE").val() == ''){
				alert("전화번호를 입력해주세요.");
				$("#M_PHONE").focus();
			}
			else if($("#M_NAME_CHK").val() != 'Y'){
				alert("이름, 전화번호가 중복됩니다.");
				$("#M_NAME").focus();
			}
			else{
				
				var joindata = {
						MEM_ID : uid,	
						MEM_ID2 : $("#M_ID").val(),						
						MEM_PW : $("#M_PASSWORD").val(),
						MEM_NM : $("#M_NAME").val(),
						MEM_PHONE : $("#M_PHONE").val(),
						MEM_EMAIL : $("#M_EMAIL").val(),
						MEM_DISCOUNT : $("#M_DISCOUNT").val(),
						MEM_LEVEL : $("#M_LEVEL").val(),
						MEM_BIGO : $("#M_BIGO").val()
				};
				$.ajax({
					type: "POST",
					url : "../Join_M.do",
					data: joindata,
					async: false,
		            success: function(datas){
		            	
		            	alert(datas);
		    			reset('END');
		    			selectList()
		            }
					
				})	
				
			}
		})

		$("#M_modify").on("click",function(){
	 		if($("#M_ID").val().length < 6){
				alert("아이디를 6자이상 입력해주세요");
				$("#M_ID").focus();
			}
			else if($("#M_ID").val() != $("#M_ID_CHK").val()){
				alert("아이디가 중복되었습니다.");
				$("#M_ID").focus();
			}
			else if($("#M_NAME").val() == ''){
				alert("이름을 입력하세요.");
				$("#M_NAME").focus();
			}
			else if($("#M_PHONE").val() == ''){
				alert("전화번호를 입력해주세요.");
				$("#M_PHONE").focus();
			}
			else if($("#M_NAME_CHK").val() != 'Y'){
				alert("이름, 전화번호가 중복됩니다.");
				$("#M_NAME").focus();
			}
			else{
				
				var joindata = {
						MEM_NM : $("#M_NAME").val(),
						MEM_ID : $("#M_ID").val(),						
						MEM_PW : $("#M_PASSWORD").val(),
						MEM_PHONE : $("#M_PHONE").val(),
						MEM_EMAIL : $("#M_EMAIL").val(),
						MEM_ID2 : uid,	
						MEM_DISCOUNT : $("#M_DISCOUNT").val(),
						MEM_LEVEL : $("#M_LEVEL").val(),
						MEM_BIGO : $("#M_BIGO").val()
				};
				$.ajax({
					type: "POST",
					url : "../Member_Modify.do",
					data: joindata,
					async: false,
		            success: function(datas){
		            	
		            	alert(datas);
		    			reset('END');
		    			selectList()
		            }
					
				})	
				
			}
		})
		
		
		$("#M_delete").on("click",function(){
			if($("#pop2_con").find(".popTitle").text() == "고객정보 수정(본인)"){
				alert("자신의 데이터는 삭제할수 없습니다.");
			}
			else if(confirm("해당 회원을 삭제하시겠습니까?")){
				var joindata = {
						MAN_ID : uid,
						MEM_ID : $("#M_ID").val()
				};
				$.ajax({
					type: "POST",
					url : "../Member_Delete.do",
					data: joindata,
					async: false,
		            success: function(datas){
		            	
		            	alert(datas);
		    			reset('END');
		    			selectList();
		            }
					
				})	
			}
		})
		/* 테이블 클릭시 해당 회원 정보 열람 / 수정페이지로 이동 */
// 		$(document).on("click","#Member_Table > tbody > tr",function(){
			
// 			if($(this).find(".tdid").val() != '' && auth != 'R'){
				
// 				   location.href = "Mobile_Modify.do?id="+$(this).find(".tdid").val()+"&level="+$(this).find(".tdlevel").val();
// 			}
			
// 		});
		selectList();
	})
	
	/* 회원 리스트 불러오기 */
	function selectList(){
			var deliverydata = {
					MEM_ID : uid,
					COUNT : ($("#count").hasClass("on") == true) ? 'Y'
							: 'N',
					TOTALCOST : ($("#totalcost").hasClass("on") == true) ? 'Y'
							: 'N'
			};
			$.ajax({
				type: "POST",
				url : "../Member_Select.do",
				data: deliverydata,
				async: false,
	            success: function(datas){
					var result = JSON.parse(datas);

					$("#Member_Table > tbody").empty();
					var tbodyData = "";

					for(let i=0; i<result.length; i++ ){

						tbodyData += "<tr>";
						tbodyData += "<td class='tdnm'><input type='hidden' class='tdid' value='"+result[i].MEM_ID+"'>"+result[i].NAME+"</td>";
						tbodyData += "<td>"+result[i].PHONE+"</td>";
						tbodyData += "<td>"+result[i].USECOUNT+"</td>";
						tbodyData += "<td><input type='hidden' class='tdlevel' value='"+result[i].LEVEL+"'>$"+result[i].COST+"</td>";
						tbodyData += "<td>"+result[i].DISCOUNT+"</td>";
						if(auth != 'R'){
							tbodyData += "<td><button class='modimode'><img src='../images/pc_icon/modify_black.svg'></button></td>"
						}
						tbodyData += "</tr>";
					}

					$("#Member_Table > tbody").append(tbodyData);
					
	            }
				
			})	
	}
	
	function reset(mode){

		$(".popup").find(".blik").val("");
		$(".popup_input").css("border","1px solid black");
		$("#M_PASSWORD").val("");
		$("#pop2").show();
		if(mode == 'I'){
			$(".popup_input").val("");
			$("#M_DISCOUNT").val(0);
			$("#M_LEVEL").val("1");
			$("#M_create").show();
			$("#M_modify").hide();
			$("#M_delete").hide();
			$(".pwh3").html("비밀번호<span>*</span>");
			$("#pop2_con").find(".popTitle").text("고객정보 추가");
		}
		else if(mode == 'M'){
			$("#M_create").hide();
			$("#M_modify").show();
			$("#M_delete").show();
			$(".pwh3").html("비밀번호");
			if($("#M_ID").val() != uid){
				$("#pop2_con").find(".popTitle").text("고객정보 수정");	
				$("#M_LEVEL").prop("disabled",false);
			}
			else{
				$("#pop2_con").find(".popTitle").text("고객정보 수정(본인)");		
				$("#M_LEVEL").prop("disabled",true);
				$("#M_delete").hide();
			}
			
			
			var discount = {
					MEM_ID : $("#M_ID").val(),
					MEM_LEVEL : $("#M_LEVEL").val(),
			};
			$.ajax({
				type: "POST",
				url : "../Delivery_Mem_Info.do",
				data: discount,
				async: false,
	            success: function(datas){
	            	var result = JSON.parse(datas);
	            	
	            	$("#M_ID_CHK").val(result.MEM_ID);
	            	$("#M_NAME").val(result.NAME);
	            	$("#M_NAME_CHK").val("Y");
	            	$("#M_EMAIL").val(result.EMAIL);
	            	$("#M_PHONE").val(result.PHONE);
	            	$("#M_DISCOUNT").val(result.DISCOUNT);
	            	$("#M_LEVEL").val(result.LEVEL);
	            	$("#M_BIGO").val(result.BIGO);
	            }
			});
		}
		else if(mode == 'END'){

			$("#pop2").hide();
		}
	}
	function chknm(){
		if($("#M_NAME").val().length > 0 && $("#M_PHONE").val().length > 0){
			$.ajax({
				type: "POST",
				url : "../nm_chk.do",
				data: {MEM_NM : $("#M_NAME").val(),MEM_PHONE : $("#M_PHONE").val()},
				async: false,
	            success: function(datas){
	            	if(datas == 'Y'){
		               	   $("#M_NAME_CHK").val('Y');
		               	   $("#M_NAME").css("border","1px solid black");
		               	   $("#M_PHONE").css("border","1px solid black");
		                }
		                else{
			               $("#M_NAME_CHK").val("");
		               	   $("#M_NAME").css("border","1px solid red");
		               	   $("#M_PHONE").css("border","1px solid red");
		                }
	            }
				
			})	
		}
	}
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
</html>