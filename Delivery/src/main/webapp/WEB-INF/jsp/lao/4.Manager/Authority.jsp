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
    <title>권한 관리 페이지</title>
</head>

<style type="text/css">
	
	button{
		cursor: pointer;
	}
	button:disabled{
		cursor: default;
	}
	#Authority_Table > tbody > tr{
	  -webkit-user-select:none;
	  -moz-user-select:none;
	  -ms-user-select:none;
	  user-select:none;
	}
	.tron{
		background: #ffecdb !important;
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
	.sidebutton{
	    width: 30%;
	    height: 35px;
	    color: white;
	    border-radius: 3px;
	}
	option{
		height:30px;
	}
	#ATH_WR{
		background: #28ca28;
	}
	#ATH_R{
		background: #299bf6;
	}
	#ATH_D{
		background: red;
	}
	.sidebutton:disabled{
		background: #9d9d9d !important;
	}
	#ATH_INSERT{
	    width: 150px;
	    height: 40px;
	    background: var(--main-color);
        float: right;
	}
	#Authority_Table > tbody{
		display:none;
	}
	.firstth{
		width: 100px;
	}
	.lastth{
		width: 200px;
	}
	.auth_status{
		color: green;
	}
	.auth_status.td_R{
		color: blue;
	}
	.auth_status.td_D{
		color: red;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<link rel="stylesheet" href="../css/common.css">  
<link rel="stylesheet" href="../css/3.Manager/MemberList_style.css">   
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
                    <a href="#">관리자 권한관리</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">권한 버튼</a>
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
<!--                             	<input type="text" class="search" id="A_ID" placeholder="관리자 선택"> -->
                                <select class="search" name="" id="A_ID">
                                	<option value="">관리자 선택</option>
                                	<c:forEach var="List" items="${M_List}">
                                		<option value="${List.MEM_ID}">${List.NAME}</option>
                                	</c:forEach>
                                </select>
                            </div>
                            <div class="inputWrap" style="width: 40%;">
                                <button class="sidebutton" id="ATH_WR" onclick="runAuth('W');" disabled>쓰기/읽기</button>
                                <button class="sidebutton" id="ATH_R" onclick="runAuth('R');" disabled>읽기</button>
                                <button class="sidebutton" id="ATH_D" onclick="runAuth('D');" disabled>접근불가</button>
                            </div>
                            <div class="inputWrap" style="width: 30%;">
                                <button class="sidebutton" id="ATH_INSERT" onclick="AuthInsert();" disabled>등록하기</button>
                            </div>
                        </div>
                    </div>

                    <h3 class="conMainTitle">
                        <a href="#">페이지 리스트</a>                           
                    </h3>                                       
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id="Authority_Table">
                                <thead>
                                    <tr>
                                        <th class="firstth">
	                                        <div class="checkAllth">
		                                        <input type="checkbox" id="checkAll" class="List_Check All">
		                                        <label for="checkAll"><button class="checkAll"></button></label>
	                                        </div>
                                        </th>
                                        <th>페이지</th>
                                        <th class="lastth">권한</th>
                                    </tr>
                                </thead>
                                <tbody>
                                     <tr class='tr0' cnum="0" id="adminDeliveryRegistMain">
                                        <td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>
                                        <td>물류접수</td>
                                        <td class="auth_status">쓰기/읽기</td>
                                        <input type="hidden" class="auth" value="W">
                                        <input type="hidden" class="page" value="adminDeliveryRegistMain">
                                        <input type="hidden" class="mpage" value="mAdminDeliveryRegistMain">
                                    </tr>
                                     <tr class='tr1' cnum="1" id="M_Delivery_NC_List">
                                        <td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>
                                        <td>미완료 배송신청</td>
                                        <td class="auth_status">쓰기/읽기</td>
                                        <input type="hidden" class="auth" value="W">
                                        <input type="hidden" class="page" value="M_Delivery_NC_List">
                                        <input type="hidden" class="mpage" value="Mobile_M_Delivery_NC_List">
                                    </tr>
                                     <tr class='tr2' cnum="2" id="M_DeliveryList">
                                        <td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>
                                        <td>배송조회</td>
                                        <td class="auth_status">쓰기/읽기</td>
                                        <input type="hidden" class="auth" value="W">
                                        <input type="hidden" class="page" value="M_DeliveryList">
                                        <input type="hidden" class="mpage" value="Mobile_M_DeliveryList">
                                    </tr>
                                     <tr class='tr3' cnum="3" id="Outday_List">
                                        <td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>
                                        <td>출항일 생성</td>
                                        <td class="auth_status">쓰기/읽기</td>
                                        <input type="hidden" class="auth" value="W">
                                        <input type="hidden" class="page" value="Outday_List">
                                        <input type="hidden" class="mpage" value="Mobile_M_OutdayList">
                                    </tr>
                                     <tr class='tr4' cnum="4" id="DeliveryCompanyList">
                                        <td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>
                                        <td>택배사 관리</td>
                                        <td class="auth_status">쓰기/읽기</td>
                                        <input type="hidden" class="auth" value="W">
                                        <input type="hidden" class="page" value="DeliveryCompanyList">
                                        <input type="hidden" class="mpage" value="Mobile_DeliveryCompanyList">
                                    </tr>
                                     <tr class='tr5' cnum="5" id="MemberListPage">
                                        <td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>
                                        <td>고객관리</td>
                                        <td class="auth_status">쓰기/읽기</td>
                                        <input type="hidden" class="auth" value="W">
                                        <input type="hidden" class="page" value="MemberListPage">
                                        <input type="hidden" class="mpage" value="Mobile_M_MemberList">
                                    </tr>
                                     <tr class='tr6' cnum="6" id="AuthorityPage">
                                        <td class='sub'><input type='checkbox' name='List_Check' class='List_Check sub' style=''></td>
                                        <td>권한관리</td>
                                        <td class="auth_status">쓰기/읽기</td>
                                        <input type="hidden" class="auth" value="W">
                                        <input type="hidden" class="page" value="AuthorityPage">
                                        <input type="hidden" class="mpage" value="AuthorityPage">
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';
	var auth = '${M_AUTH}';

	console.log(level);
 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
				   location.href = "Main.do";
			   }
			}

		if(auth == 'R'){
			$(".sidebutton").remove();
		}		
		else if(auth == 'D'){
			location.href = "Main.do";
		}


// 		/* 테이블 클릭시 해당 회원 정보 열람 / 수정페이지로 이동 */
// 		$(document).on("click","#Company_Table > tbody > tr",function(){
			
// 			$("#Company_Table > tbody > tr").removeClass("tron");
// 			$(this).addClass("tron");
			
// 		});
		
		
		// 체크박스 트리거
				
		$(".checkAll").on("click",function(){
			$(".List_Check.All").trigger("click");
		})

		$(".List_Check.All").on("click",function(){
			if($(this).prop("checked") == true){
				$(".List_Check.sub").prop("checked",true);
				$("#Authority_Table > tbody > tr").removeClass("tron");
				$("#Authority_Table > tbody > tr").addClass("tron");
			}
			else{
				$(".List_Check.sub").prop("checked",false);	
				$("#Authority_Table > tbody > tr").removeClass("tron");
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
		
		/* 테이블 목록 클릭시 */
		$(document).on("click","#Authority_Table > tbody > tr",function(event){
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
						$("#Authority_Table > tbody > tr").removeClass("tron");
						$("#Authority_Table > tbody > tr").find(".List_Check").prop("checked",false);
						$(this).addClass("tron");
						$(this).find(".List_Check").prop("checked",true);
					}
					else{
						if($(".tron").length>=2){
							
							$("#Authority_Table > tbody > tr").removeClass("tron");
							$("#Authority_Table > tbody > tr").find(".List_Check").prop("checked",false);	
							$(this).addClass("tron");
							$(this).find(".List_Check").prop("checked",true);
							
						}
						else{
	
							$("#Authority_Table > tbody > tr").removeClass("tron");
							$("#Authority_Table > tbody > tr").find(".List_Check").prop("checked",false);	
							
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
		
		
		
		$("#A_ID").on("change",function(){
			if($(this).val() == ''){
				reset('D');
			}
			else{
				reset();
			}
		});
		

		
	})
	
	
	function reset(mode){

		$(".auth").val("W");
		$(".auth_status").text("쓰기/읽기");
		$(".auth_status").removeClass("td_R");
		$(".auth_status").removeClass("td_D");
		if(mode == 'D'){
			$("#Authority_Table > tbody").hide();
			$(".sidebutton").prop("disabled",true);
		}
		else{
			$("#Authority_Table > tbody").show();
			$(".sidebutton").prop("disabled",false);
			
			var authList = {
					MEM_ID : $("#A_ID").val()
			}

			if($("#A_ID").val() == uid){
				$(".tr6").hide();
			}
			else{
				$(".tr6").show();	
			}
			$.ajax({
				type: "POST",
				url : "../Authority_Select.do",
				data: authList,
				async: false,
	            success: function(datas){
	            	var result = JSON.parse(datas);
	            	
	            	for(let i=0; i<result.length; i++){
	            		$("#" + result[i].PAGE).find(".auth").val(result[i].AUTH);
	            		$("#" + result[i].PAGE).find(".auth_status").text(result[i].AUTH_NM);
	            		$("#" + result[i].PAGE).find(".auth_status").addClass("td_" + result[i].AUTH);
	            	}
	            	
	            }
			})
		}
	}
	
	function runAuth(mode){
		if($("input:checkbox[name=List_Check]:checked").length <= 0){
			alert("권한을 변경할 페이지를 선택해주세요.")
		}
		else{
			var authtext = (mode == 'W') ? '쓰기/읽기'
						   :(mode == 'R') ? '읽기'
						   : '접근불가';
			
			$("input:checkbox[name=List_Check]:checked").each(function(){
				$(this).parents("tr").find(".auth").val(mode);
				$(this).parents("tr").find(".auth_status").text(authtext);			
				$(this).parents("tr").find(".auth_status").removeClass("td_R");
				$(this).parents("tr").find(".auth_status").removeClass("td_D");
				if(mode != 'W'){
					$(this).parents("tr").find(".auth_status").addClass("td_" + mode);	
				}			
			});
		}
		
	}
	
	function AuthInsert(){

		var authList = {
				MEM_ID : $("#A_ID").val()
		}


		$.ajax({
			type: "POST",
			url : "../Authority_Delete.do",
			data: authList,
			async: false,
            success: function(datas){
            	var success = 0;
            	if(datas == 'Y'){
					
            		for(let i=0; i<$("#Authority_Table > tbody > tr").length; i++){
            			if($(".tr" + i).find(".auth").val() != 'W'){
            				if(i < 6){
								var authPage={
									MEM_ID : $("#A_ID").val(),
									PAGE : $(".tr" + i).find(".page").val(),
									M_PAGE : $(".tr" + i).find(".mpage").val(),
									AUTH : $(".tr" + i).find(".auth").val()
								}
	                    		$.ajax({
	                    			type: "POST",
	                    			url : "../Authority_Insert.do",
	                    			data: authPage,
	                    			async: false,
	                                success: function(datas2){
	                                	if(datas2 == 'SUCCESS'){
	                                		success++;
	                                	}
	                                }
	                    		});
            				}
            				if(i == 6 && uid != $("#A_ID").val()){
								var authPage={
									MEM_ID : $("#A_ID").val(),
									PAGE : $(".tr" + i).find(".page").val(),
									M_PAGE : $(".tr" + i).find(".mpage").val(),
									AUTH : $(".tr" + i).find(".auth").val()
								}
	                    		$.ajax({
	                    			type: "POST",
	                    			url : "../Authority_Insert.do",
	                    			data: authPage,
	                    			async: false,
	                                success: function(datas2){
	                                	if(datas2 == 'SUCCESS'){
	                                		success++;
	                                	}
	                                }
	                    		});
            				}
            			}
            		}
            		if(success > 0 ){
            			alert("변경된 권한이 적용되었습니다.")
            		}
            		else{
            			alert("모든 권한을 쓰기/읽기로 전환하였습니다.")
            		}
            	}
            }
		});
	}
</script>
</html>