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
    <title>EK Logistics - 권한 관리</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
	.search{
	    width: 100%;
	    border: 1px solid;
	    height: 40px;
	    margin-bottom: 10px;
	}
	#Authority_Table{
		width: 100%;
	}
	
	#Authority_Table > tbody{
		display:none;
	}
	.tron{
		background: #ffecdb !important;
	}
	.checkAllth{
    display: flex;
    justify-content: center;
	}
	.firstth{
		width: 50px;
	}
	.lastth{
		width: 100px;
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
	.sidefooter{
		display:flex;
	}
	.sidebutton{
		width:33.3%;
	}
	.sidebutton:disabled{
		background: #9d9d9d !important;
	}
	#ATH_INSERT:disabled{
		background: #9d9d9d !important;
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

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/8.MobileManager/MobileMemberList_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/8.MobileManager/MemberList_index.js"></script>
<script src="./js/pageChange.js"></script>
</head>

<body>
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">권한관리</div>
        </header>        
        <section>  
            <div class="currentWrap">
                 <select class="search" name="" id="A_ID">
                 	<option value="">관리자 선택</option>
                 	<c:forEach var="List" items="${M_List}">
                 		<option value="${List.MEM_ID}">${List.NAME}</option>
                 	</c:forEach>
                 </select>
                <div class="currentHeader">
                    <h5><a href="#">페이지리스트</a></h5>
                </div>
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
            </div>
        </section>
        <footer>
        	<div class='sidefooter'>
            <button class="sidebutton" id="ATH_WR" onclick="runAuth('W');" disabled>쓰기/읽기</button>
            <button class="sidebutton" id="ATH_R" onclick="runAuth('R');" disabled>읽기</button>
            <button class="sidebutton" id="ATH_D" onclick="runAuth('D');" disabled>접근불가</button>
            </div>
            <button class="create"  id="ATH_INSERT" onclick="AuthInsert();" disabled>등록하기</button>
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
			$(".sidebutton").remove();
			$("#ATH_INSERT").remove();
		}		
		else if(auth == 'D'){
			location.href = "Mobile_ManagerMain.do";
		}

		$(".back").on("click",function(){
			history.back();
		})
		

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
	
		$(document).on("click","#Authority_Table > tbody > tr",function(event){

			if($(event.target).attr("class") != "List_Check sub" && $(event.target).hasClass("sub") == false){
					if($(this).find(".List_Check").prop("checked") == false){
// 						$("#Authority_Table > tbody > tr").removeClass("tron");
// 						$("#Authority_Table > tbody > tr").find(".List_Check").prop("checked",false);
						$(this).addClass("tron");
						$(this).find(".List_Check").prop("checked",true);
					}
					else{
						$(this).removeClass("tron");
						$(this).find(".List_Check").prop("checked",false);
					}	
				
				if($("input:checkbox[name=List_Check]:checked").length == $("input:checkbox[name=List_Check]").length){
					$(".List_Check.All").prop("checked",true);
				}
				else{
					$(".List_Check.All").prop("checked",false);
				}
			}
		})
		
		$("#A_ID").on("change",function(){
			if($(this).val() == ''){
				reset('D');
			}
			else{
				reset();
			}
		});
		
		/* 테이블 클릭시 해당 회원 정보 열람 / 수정페이지로 이동 */
// 		$(document).on("click","#Member_Table > tbody > tr",function(){
			
// 			if($(this).find(".tdid").val() != '' && auth != 'R'){
				
// 				   location.href = "Mobile_Modify.do?id="+$(this).find(".tdid").val()+"&level="+$(this).find(".tdlevel").val();
// 			}
			
// 		});
	})
	
	function reset(mode){

		$(".auth").val("W");
		$(".auth_status").text("쓰기/읽기");
		$(".auth_status").removeClass("td_R");
		$(".auth_status").removeClass("td_D");
		if(mode == 'D'){
			$("#Authority_Table > tbody").hide();
			$(".sidebutton").prop("disabled",true);
			$("#ATH_INSERT").prop("disabled",true);
		}
		else{
			$("#Authority_Table > tbody").show();
			$(".sidebutton").prop("disabled",false);
			$("#ATH_INSERT").prop("disabled",false);
			
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
				url : "./Authority_Select.do",
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
			url : "./Authority_Delete.do",
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
	                    			url : "./Authority_Insert.do",
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
	                    			url : "./Authority_Insert.do",
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