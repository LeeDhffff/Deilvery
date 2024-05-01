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
    <title>EK Logistics - 택배사 관리 </title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
	table{
		width: 100% !important;
	}
	.popup_input_div{
		display: flex;
		width: 100%;
	}
	.search{
		width: 200px;
	    height: 40px;
	    border: 1px solid gray;
	    margin: 10px;
	}
	.popup_input{
		width: 100%;
	    height: 40px;
	    border: 1px solid gray;
	    margin: 10px;
	}
	#Company_Table > thead > tr > th:last-child{
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
	.confirm{
	    background: #249900 !important;
	}
	.modifys{
    	display:none;
		width: 50% !important;
	    background: #2840ff !important;
	}
	.deletes{
    	display:none;
		width: 50% !important;
	    background: red !important;
	}
	.popup_button{
		display: flex;
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
   <div id="pop1" class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">택배사 필터</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <input type="text" class="search" id="S_T_NAME" placeholder="택배사명">    
                <select class="search" name="" id="chk_use">
                    <option value="">사용여부</option>
                    <option value="Y">사용</option>
                    <option value="N">미사용</option>
                </select>
            </div>
            <button class="popButton">적용하기</button>            
        </div>        
    </div> 
   <div id="pop2" class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle" id="pop2_text">택배사 등록</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
				<div class="popup_input_div">
<!-- 					<h3>택배사명</h3> -->
					<input type="text" class="popup_input" id="T_NAME" placeholder="택배사명">
					<input type="hidden" class="popup_input" id="TARGET">
				</div>
				<div class="popup_input_div">
<!-- 					<h3>사용여부</h3> -->
					<select class="popup_input" id="T_USE">
						<option value="Y">사용</option>
						<option value="N">미사용</option>
					</select>
				</div>
            </div>
            <div class="popup_button">
			<button class="confirm" id="T_create">등록</button>
			<button class="modifys" id="T_modify">수정</button>
			<button class="deletes" id="T_delete">삭제</button>   
        	</div>
        </div>        
    </div> 
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">택배사관리</div>
        </header>        
        <section>  
            <div class="currentWrap">
                <h5 class="icon filter">
                    <img src="./images/m_icon/filter_orange.svg" alt="#">
                </h5>
                <div class="currentHeader">
                    <h5><a href="#">택배사 리스트</a></h5>
                </div>
                <div class="tableWrap">
                    <table id="Company_Table">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>택배사명</th>
                                <th>사용여부</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div> 
            </div>
        </section>
        <footer>
            <button class="create">택배사 등록</button>
        </footer>        
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	$(document).on('ready',function(){
		

		$(".back").on("click",function(){
			history.back();
		})


		$(document).on("click",".modimode",function(){

			$("#Company_Table > tbody > tr").removeClass("tron");
			$(this).parents("tr").addClass("tron");
			
			$("#pop2").css("display","flex");
			reset('U');
		});
		
		
		$(".create").on("click",function(){
			$("#pop2").css("display","flex");
			reset('I');
		})
		
// 		$(".popup_X").on("click",function(){
// 			$(".pop_container").hide();
// 			reset('I');
// 		})
		
		
		$("#T_create").on("click",function(){
			createMode('I');
		})
		
		$("#T_modify").on("click",function(){
			createMode('U');
		})
		
		$("#T_delete").on("click",function(){
			createMode('D');
		})
		selectList();

		$(".popButton").on("click",function(){
			selectList();
		})
	})
	
	function reset(mode){
		
		if(mode == 'I'){
			$("#pop2_text").text("택배사 등록");
			$(".confirm").show();
			$(".modifys").hide();
			$(".deletes").hide();
			$(".popup_input").val("");
			$("#T_USE").val("Y");
		}
		else if(mode == 'U'){
			$("#pop2_text").text("택배사 수정");
			$(".confirm").hide();
			$(".modifys").show();
			$(".deletes").show();
			$(".popup_input").val("");
			$("#T_USE").val("Y");
			
			var deliverydata = {
					TARGET : $(".tron").find(".target").val()
			};
			$.ajax({
				type: "POST",
				url : "./DeliveryCompanyList_Load.do",
				data: deliverydata,
				async: false,
	            success: function(datas){
					var result = JSON.parse(datas);
					
					if(result.length <= 0){
						alert("해당 택배사의 정보가 없습니다.");
					}
					else{
						$("#TARGET").val(result.TARGET);
						$("#T_NAME").val(result.T_NAME);
						$("#T_USE").val(result.USEAGE);
					}
	            }
			})
		}
		
	}
	
	function createMode(mode){
		var deliverydata = {
				TARGET : 0,
				T_NAME : "",
				USE : $("#T_USE option:selected").val(),
				MODE: mode
		};
		if(mode == 'I'){
			if($("#T_NAME").val().length <= 0 ){
				alert("택배사명을 입력해주세요.");
			}
			else{
				deliverydata.T_NAME = $("#T_NAME").val();
				create(deliverydata,mode);
			}
		}
		else if(mode == 'U'){
			if($("#T_NAME").val().length <= 0 ){
				alert("택배사명을 입력해주세요.");
			}
			else{
				deliverydata.TARGET = $("#TARGET").val();
				deliverydata.T_NAME = $("#T_NAME").val();
				create(deliverydata,mode);
			}
		}
		else if(mode == 'D'){
			if(confirm("해당 택배사를 삭제하시겠습니까?")){
				deliverydata.TARGET = $("#TARGET").val();
				create(deliverydata,mode);
			}
		}
	}
	function create(data,mode){

		$.ajax({
			type: "POST",
			url : "./DeliveryCompanyList_IUD.do",
			data: data,
			async: false,
            success: function(result){
            	alert(result);
            	selectList();
            	$("#pop2").hide();
    			reset('I');
            }
		})
	}
	/* 회원 리스트 불러오기 */
	function selectList(){
			var deliverydata = {
					T_NAME : $("#S_T_NAME").val(),
					USE : $("#chk_use option:selected").val()
			};
			$.ajax({
				type: "POST",
				url : "./DeliveryCompanyList_Search.do",
				data: deliverydata,
				async: false,
	            success: function(datas){
					var result = JSON.parse(datas);

					$("#Company_Table > tbody").empty();
					var tbodyData = "";

					for(let i=0; i<result.length; i++ ){
						
						
						tbodyData += "<tr><td>"+(String)(i+1)+"<input type='hidden' class='target' value='"+result[i].TARGET+"'></td>";
						tbodyData += "<td>"+result[i].T_NAME+"</td>";
						tbodyData += "<td>"+result[i].USEAGE+"</td>";
						tbodyData += "<td><button class='modimode'><img src='./images/pc_icon/modify_black.svg'></button></td>"
						tbodyData += "</tr>";
					}

					$("#Company_Table > tbody").append(tbodyData);
					
	            }
				
			})	
	}
</script>
</html>