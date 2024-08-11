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
    <title>택배사 관리 페이지</title>
</head>

<style type="text/css">
	#Company_Table > tbody > tr:hover{
		background: #e1e1e1;
	}
	button{
	    cursor: pointer;
	}
	.tron{
		background: #ffecdb !important;
	}
	.conMainTitle{
		justify-content: space-between;
	}
	.pop_container{
		display:none;
		width: 100%;
		height: 100%;
		position: absolute;
	}
	.grey_pop{
		width: 100%;
		height: 100%;
		background: #5d5d5d9c;
	}
	.popup{
		width: 600px;
		height: 250px;
		background: white;
		position: fixed;
		transform: translate(-50%, -50%);
		left: 50%;
		top: 50%;
		padding: 20px;
	}
	.popup_X{
		width: 40px;
		height: 40px;
	    background: white;
	    font-size: 30px;
	    font-weight: bold;
	}
	.popup_head{
		display: flex;
	    justify-content: space-between;
	    border-bottom: 1px solid lightgray;
	}
	.popup_middle{
		padding: 10px;
	    width: 100%;
	    height: 70%;
	    box-sizing: border-box;
	}
	.popup_bottom{
	    display: flex;
        justify-content: center;
	}
	.popup_input_div{
		display: flex;
		margin-top: 20px;
    	margin-bottom: 20px;
   	    justify-content: center;
	}
	.popup_input_div > h3{
		width: 100px;
		line-height: 37px;
	}
	.popup_input{
		width: 300px;
		height: 40px;
	    border: 1px solid;
	    padding-left: 5px;
	    font-size: 15px;
	}
	.create{
	    background: white;
	    border: 1px solid #ffaa40;
	    border-radius: 3px;
        width: 28px;
   		height: 28px;
	}
	.create:hover{
		background: #ffaa40;
	}
	.confirm{
	    width: 100px;
	    height: 40px;
	    border-radius: 5px;
	    color: white;
	    background: #249900;
	    margin-left: 10px;
    	margin-right: 10px;
	}
	.modify{
	    width: 100px;
	    height: 40px;
	    border-radius: 5px;
	    color: white;
	    background: #2840ff;
	    margin-left: 10px;
    	margin-right: 10px;
    	display:none;
	}
	
	.modi{
		background: white;
		width:40px;
		height:30px;
		border: 1px solid #ffaa40;
	    padding: 2px;
	    cursor: pointer;
	    border-radius: 5px;
	}
	.modi:hover{
		background: #ffaa40;
	}
	
	.delete{
	    width: 100px;
	    height: 40px;
	    border-radius: 5px;
	    color: white;
	    background: red;
	    margin-left: 10px;
	    margin-right: 10px;	
    	display:none;
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
	<div class="pop_container">
		<div class="grey_pop">
			<div class="popup">
				<div class="popup_head">
				<h2 class="popup_h2">택배사 등록</h2>
				<button class="popup_X">X</button>
				</div>
				<div class="popup_middle">
					<div class="popup_input_div">
						<h3>택배사명</h3>
						<input type="text" class="popup_input" id="T_NAME" placeholder="택배사명">
						<input type="hidden" class="popup_input" id="TARGET">
					</div>
					<div class="popup_input_div">
						<h3>사용여부</h3>
						<select class="popup_input" id="T_USE">
							<option value="Y">사용</option>
							<option value="N">미사용</option>
						</select>
					</div>
				</div>
				<div class="popup_bottom">
					<button class="confirm" id="T_create">등록</button>
					<button class="modify" id="T_modify">수정</button>
					<button class="delete" id="T_delete">삭제</button>
				</div>
			</div>
		</div>
	</div>
    <div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">택배사관리</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">택배사 리스트 필터</a>
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
                            	<input type="text" class="search" id="S_T_NAME" placeholder="택배사명">
<!--                                 <select class="search" name="" id="chk_count"> -->
<!--                                     <option value="">이용횟수</option> -->
<!--                                     <option value="Y">많은순서</option> -->
<!--                                     <option value="N">적은순서</option> -->
<!--                                 </select> -->
                            </div>
                            <div class="inputWrap">
                                <select class="search" name="" id="chk_use">
                                    <option value="">사용여부</option>
                                    <option value="Y">사용</option>
                                    <option value="N">미사용</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <h3 class="conMainTitle">
                        <a href="#">택배사 리스트</a>       
                        <button class="create">
                        	<img src="../images/pc_icon/modify_black.svg" alt="저장하기">
                        </button>                                         
                    </h3>                                       
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id="Company_Table">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>택배사명</th>
                                        <th>사용여부</th>
                                        <th class="modifyth">정보수정</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
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

 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
				   location.href = "Main.do";
			   }
			}

		if(auth == 'R'){
			$(".create").remove();
			$(".modifyth").remove();
		}		
		else if(auth == 'D'){
			location.href = "Main.do";
		}

		/* 테이블 클릭시 해당 회원 정보 열람 / 수정페이지로 이동 */
		$(document).on("click","#Company_Table > tbody > tr",function(){
			
			$("#Company_Table > tbody > tr").removeClass("tron");
			$(this).addClass("tron");
			
		});
		
// 		더블클릭 이벤트
// 		$(document).on("dblclick","#Company_Table > tbody > tr",function(){
			
		$(document).on("click",".modi",function(){
			
			if($(this).parents("tr").find(".tdid").val() != ''){
				$(this).parents("tr").trigger("click");
// 			수정 팝업창을 연다
			$(".pop_container").show();
			reset('U');
			}
		});
		
// 		등록 창
		$(".create").on("click",function(){
			$(".pop_container").show();
			reset('I');
		})
		
// 		팝업 닫기
		$(".popup_X").on("click",function(){
			$(".pop_container").hide();
			reset('I');
		})
		
// 		등록하기
		$("#T_create").on("click",function(){
			createMode('I');
		})
		
// 		수정하기
		$("#T_modify").on("click",function(){
			createMode('U');
		})
		
// 		삭제하기
		$("#T_delete").on("click",function(){
			createMode('D');
		})
		selectList();
		
// 		검색
		$(".search").on("change",function(){
			selectList();
		})
	})
	
// 	파라미터 리셋
	function reset(mode){
		
		if(mode == 'I'){
			$(".popup_h2").text("택배사 등록");
			$(".confirm").show();
			$(".modify").hide();
			$(".delete").hide();
			$(".popup_input").val("");
			$("#T_USE").val("Y");
		}
		else if(mode == 'U'){
			$(".popup_h2").text("택배사 수정");
			$(".confirm").hide();
			$(".modify").show();
			$(".delete").show();
			$(".popup_input").val("");
			$("#T_USE").val("Y");
			
			var deliverydata = {
					TARGET : $(".tron").find(".target").val()
			};
			$.ajax({
				type: "POST",
				url : "../DeliveryCompanyList_Load.do",
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
	
// 	택배사 등록/수정/삭제 요청 (I : 등록, U : 수정, D : 삭제)
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
// 	택배사 등록/수정/삭제
	function create(data,mode){

		$.ajax({
			type: "POST",
			url : "../DeliveryCompanyList_IUD.do",
			data: data,
			async: false,
            success: function(result){
            	alert(result);
            	selectList();
    			$(".pop_container").hide();
    			reset('I');
            }
		})
	}
	/* 택배사 리스트 불러오기 */
	function selectList(){
			var deliverydata = {
					T_NAME : $("#S_T_NAME").val(),
					USE : $("#chk_use option:selected").val()
			};
			$.ajax({
				type: "POST",
				url : "../DeliveryCompanyList_Search.do",
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
						if(auth != 'R'){
							tbodyData += "<td><button class='modi'><img src='../images/pc_icon/modify_black.svg'></button></td>";
						}
						tbodyData += "</tr>";
					}

					$("#Company_Table > tbody").append(tbodyData);
					
	            }
				
			})	
	}
</script>
</html>