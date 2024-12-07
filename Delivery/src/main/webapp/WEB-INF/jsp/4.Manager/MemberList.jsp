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
    <title>회원관리 페이지</title>
</head>

<style type="text/css">
	button{
		cursor:pointer;
	}
	.conMainTitle{
	    justify-content: space-between;
	}
	.beh{
		background: #ebebff;
	}
	.hoi{
	}
	.man{
		background: #ffcfcf;
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
		width: 1000px;
/* 		height: 250px; */
		background: white;
		position: fixed;
		transform: translate(-50%, -50%);
		left: 50%;
		top: 50%;
		padding: 20px;
		display:none;
	}
	#popup_modify{
/* 		height: 500px; */
	}
	.popup_X{
		width: 40px;
		height: 40px;
	    background: white;
	    font-size: 30px;
	    font-weight: bold;
	}
	.popup_X:hover{
		color:grey;
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
	.popup_input_div > h3 > span{
		color: red;
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
	.update{
	    width: 100px;
	    height: 40px;
	    border-radius: 5px;
	    color: white;
	    background: #2840ff;
	    margin-left: 10px;
    	margin-right: 10px;
    	display:none;
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
	.popup_middle_double{
		display:flex;
	}
	.popup_table{
	    height: 300px;
   		overflow-y: scroll;
	}
	.popup_table > h3{
		margin: 20px 0px 20px 10px;
	}
	#reset_search{
		width: 30px;
	    height: 30px;
	    border: 1px solid #E88100;
	    background: white;
	    background-image: url(./images/pc_icon/delete_black.svg);
	    background-repeat: no-repeat;
	    background-position: center;
	    border-radius: 5px;
	}
	#reset_search:hover{
	    background: #E88100;
	    background-image: url(./images/pc_icon/delete_black.svg);
	    background-repeat: no-repeat;
	    background-position: center;
	}
	#popup_discount{
		width:500px;
	}
	#Alldiscount_open{
		width: 60%;
	    height: 40px;
	    border-radius: 3px;
	    border: 1px solid #E88100;
	    background: #E88100;
	    color: white;
	}
	#Alldiscount_open:hover{
	    background: white;
	    color: black;
	}
	.popup_h4{
	    font-weight: normal;
    	margin: 10px 0 0 10px;
	}
	.human{
		border: 2px dotted #ffb6b6;
	}
	.pickup_input{
		display:none;
	}
	.dot_line{
		display:flex;
	}
	.dot_line_txt{    
		color: black;
	    font-weight: normal;
	    font-size: 16px;
	    margin-left: 5px;
	}
	.dot_line_span{
	    width: 25px;
	    display: block;
	    height: 10px;
	    border-bottom: 3px dotted #fd6d6d;
	}
	.input_two{
		display: flex;
		justify-content: space-between;
	}
	.input_two > .input_two_in > input{
		width: 45% !important;
	}
	.input_two_in{
		display: flex;    
		width: 50%;
	}
	.input_two_in > span{
		line-height: 50px;
    	margin-left: 3px;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/3.Manager/MemberList_style.css">   
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>


</head>

<body>
	<div class="pop_container">
		<div class="grey_pop">
			<div class="popup" id="popup_discount">
				<div class="popup_head">
					<h2 class="popup_h2">전체 할인율 편집</h2>
					<button class="popup_X">X</button>
				</div>
				<h4 class="popup_h4">※개별 할인율과 별개로 회원 전체에 할인율이 적용됩니다.</h4>
				<h4 class="popup_h4">※할인 시 높은 할인율이 우선 적용됩니다.</h4>
				<div class="popup_middle">
					<div class="popup_input_div">
						<h3>할인율(%)</h3>
						<input type="number" class="popup_input" id="T_DISCOUNT" placeholder="할인율">
					</div>
				</div>
				<div class="popup_bottom">
					<button class="confirm" id="T_create">수정하기</button>
				</div>
			</div>
			<div class="popup" id="popup_modify">
				<div class="popup_head">
					<h2 class="popup_h2">고객정보 추가</h2>
					<button class="popup_X">X</button>
				</div>
				<div class="popup_table">
					<h3>이용내역</h3>
					<table id="history">
						<thead>
							<tr>
								<th>마감일</th>
								<th>박스 수</th>
								<th>금액</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="popup_middle_double">
					<div class="popup_middle">
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
							<h3>지역</h3>
							<select class="popup_input" id="M_NATION">
								<option value="K">한국</option>
								<option value="L">라오스</option>
							</select>
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
					</div>
					<div class="popup_middle">
						<div class="popup_input_div">
							<h3>할인율(%)</h3>
							<input type="number" class="popup_input" id="M_DISCOUNT" placeholder="할인율">
						</div>
						<div class="popup_input_div">
							<h3>구분</h3>
							<select class="popup_input" id="M_LEVEL">
								<option value="1">일반회원</option>
								<option value="2">관리자</option>
								<option value="3">선교사</option>
								<option value="4">도매업</option>
								<option value="0">비회원</option>
							</select>
						</div>
						<div class="popup_input_div">
							<h3>픽업지 선택</h3>
							<select class="popup_input" id="M_TARGET">
						        <option value="0">픽업지 선택</option>
					            <option value="1">본사</option>
					            <option value="2">하우 창고</option>
					            <option value="3">택배 서비스</option>
							</select>
						</div>
						<div class="popup_input_div pickup_input">
							<h3>택배사</h3>
							 <select class="popup_input" name="M_ADDR" id="M_ADDR">
			                	<c:forEach var="item" items="${shipComList}">
			                		<option value="${item.target }">${item.tName }</option>
			                	</c:forEach>
			                </select>
						</div>
						<div class="popup_input_div pickup_input">
							<h3>상세주소</h3>
							<input type="text" class="popup_input" id="M_HOU" placeholder="상세주소">
						</div>
						<div class="popup_input_div">
							<h3>비고</h3>
							<input type="text" class="popup_input" id="M_BIGO" placeholder="비고">
						</div>
					</div>
				</div>
				<div class="popup_bottom">
					<button class="confirm" id="M_create">추가하기</button>
					<button class="update" id="M_modify">수정하기</button>
					<button class="delete" id="M_delete">삭제하기</button>
				</div>
			</div>
		</div>
	</div>
    <div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">고객관리</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">고객 리스트 필터</a>
                            <button id="reset_search" onclick="reset_Search();">
                        	</button>
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
                                <select class="search" name="" id="chk_count">
                                    <option value="">이용횟수</option>
                                    <option value="Y">많은순서</option>
                                    <option value="N">적은순서</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                                <select class="search" name="" id="chk_cost">
                                    <option value="">배송비 총 금액</option>
                                    <option value="Y">높은순서</option>
                                    <option value="N">낮은순서</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                                <select class="search" name="" id="chk_arrDay">
	                            	<option value="">최근 이용 마감일 선택</option>
	                            	<c:forEach var="item" items="${outdayList }">
	                            		<option value="${item.outKey }">${item.outDay }</option> 
	                            	</c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="triple">
                            <div class="inputWrap">
                                <select class="search" name="" id="chk_level">
                                    <option value="">구분</option>
                                    <option value="1">일반회원</option>
                                    <option value="3">선교사</option>
                                </select>
                            </div>
                            <div class="inputWrap">
	                            <input type="text" class="search" id="chk_useDay" name="useDay" placeholder="휴면 고객 검색 기준일">
                            </div>
                            <div class="inputWrap input_two">
                            	<div class="input_two_in">
	                            	<input type="number" class="search" id="chk_useday_num" name="useday_num" value="30" placeholder="휴면 기준 일">
                            		<span>일</span>
                            	</div>
                            	<button id="Alldiscount_open">전체 할인율 편집</button>
                            </div>
                        </div>
                    </div>

                    <h3 class="conMainTitle">
                        <a href="#">고객리스트</a>     
                        <a class="dot_line" href="#">
                        	<hr class="dot_line_span"/>
                        	<span class="dot_line_txt">:휴면고객</span>
                        </a>
                        
                        <button class="create">
                        	<img src="./images/pc_icon/modify_black.svg" alt="저장하기">
                        </button>                                                                     
                    </h3>                                       
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id="Member_Table">
                                <thead>
                                    <tr>
<!--                                         <th><input type="checkbox"></th> -->
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>최근이용일</th>
                                        <th>이용횟수</th>
                                        <th>배송비 총 금액</th>
                                        <th>할인율(%)</th>
                                        <th class="modifyth">정보수정</th>
<!--                                         <th>할인율수정</th> -->
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

	console.log(level);
 
	$(document).on('ready',function(){

    	$("#chk_useDay").datepicker();
    	$("#chk_useDay").datepicker("option", "dateFormat", "yy-mm-dd");
    	
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
				   location.href = "Main.do";
			   }
			}

		if(auth == 'R'){
			$(".modifyth").remove();
			$(".create").remove();
		}		
		else if(auth == 'D'){
			location.href = "Main.do";
		}

		/* 버튼 클릭시 해당 회원 정보 열람 / 수정페이지로 이동 */
		$(document).on("click",".modi",function(){
			
			if($(this).parents("tr").find(".tdid").val() != ''){

				$("#M_ID").val($(this).parents("tr").find(".tdid").val());
				$("#M_LEVEL").val($(this).parents("tr").find(".tdlevel").val());
				reset('M');
// 				   location.href = "MemberModifyPage.do?id="+$(this).parents("tr").find(".tdid").val()+"&level="+$(this).parents("tr").find(".tdlevel").val();
			}
			
		});

		$(".create").on("click",function(){

			reset('C');
			
		})
		/* 버튼 클릭 시 할인용 팝업창 */
		$(document).on("click",".discount",function(){
			
			if($(this).parents("tr").find(".tdid").val() != ''){

				reset('D');
				$("#T_ID").val($(this).parents("tr").find(".tdid").val());
				$("#T_NAME").val($(this).parents("tr").find(".tdnm").text());
				$("#T_DISCOUNT").val($(this).parents("tr").find(".tddiscount").text());
				
			}
			
		});
		$("#M_TARGET").on("change",function(){
			if($("#M_TARGET").val() =="3"){
				$(".pickup_input").css("display","flex");
			}
			else{
				$(".pickup_input").hide();
			}
		})

		$("#Alldiscount_open").on("click",function(){

			reset('D');

		})
		
// 		등록하기
		$("#T_create").on("click",function(){
			if($("#T_DISCOUNT").val() == ""){
				alert("할인율을 입력해주세요.");
			}
			else{
				var discount = {
					TYPE : "A",
					PERCENT : $("#T_DISCOUNT").val()
				};
				

				$.ajax({
					type: "POST",
					url : "./Discount_IU.do",
					data: discount,
					async: false,
		            success: function(datas){
						alert(datas);

						selectList();
						reset('END');
		            }
				});
			}
		})
		
		$("#M_ID").on("change",function(){
			$.ajax({
				type: "POST",
				url : "./id_chk.do",
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
			else if($("#M_TARGET").val() == '3' && $("#M_ADDR").val() == null){
				alert("택배사를 선택해주세요.");
				$("#M_ADDR").focus();
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
						MEM_NATION : $("#M_NATION").val(),
						MEM_PHONE : $("#M_PHONE").val(),
						MEM_EMAIL : $("#M_EMAIL").val(),
						MEM_DISCOUNT : $("#M_DISCOUNT").val(),
						MEM_LEVEL : $("#M_LEVEL").val(),
						MEM_BIGO : $("#M_BIGO").val(),
						MEM_TARGET : $("#M_TARGET").val(),
						MEM_ADDR : $("#M_ADDR").val(),
						MEM_HOU : $("#M_HOU").val()
				};
				$.ajax({
					type: "POST",
					url : "./Join_M.do",
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
			else if($("#M_TARGET").val() == '3' && $("#M_ADDR").val() == null){
				alert("택배사를 선택해주세요.");
				$("#M_ADDR").focus();
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
						MEM_BIGO : $("#M_BIGO").val(),
						MEM_TARGET : $("#M_TARGET").val(),
						MEM_ADDR : $("#M_ADDR").val(),
						MEM_HOU : $("#M_HOU").val(),
						MEM_NATION : $("#M_NATION").val()
				};
				$.ajax({
					type: "POST",
					url : "./Member_Modify.do",
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
			if($("#popup_modify").find(".popup_h2").text() == "고객정보 수정(본인)"){
				alert("자신의 데이터는 삭제할수 없습니다.");
			}
			else if(confirm("해당 회원을 삭제하시겠습니까?")){
				var joindata = {
						MAN_ID : uid,
						MEM_ID : $("#M_ID").val()
				};
				$.ajax({
					type: "POST",
					url : "./Member_Delete.do",
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
		
		
// 		팝업 닫기
		$(".popup_X").on("click",function(){
			reset('END');
		})
		
		selectList();
		
		$(".search").on("change",function(){
			selectList();
		})
	})
	
	/* 회원 리스트 불러오기 */
	function selectList(){
			var deliverydata = {
					MEM_ID : uid,
					COUNT : $("#chk_count option:selected").val(),
					TOTALCOST : $("#chk_cost option:selected").val(),
					ARR_DAY : $("#chk_arrDay option:selected").val(),
					M_LEVEL : $("#chk_level option:selected").val(),
					USE_DAY : $("#chk_useDay").val(),
					USE_DAY_NUM : $("input[name='useday_num']").val() != '' ? $("input[name='useday_num']").val()
								   : 0
			};
			$.ajax({
				type: "POST",
				url : "./Member_Select.do",
				data: deliverydata,
				async: false,
	            success: function(datas){
					var result = JSON.parse(datas);

					$("#Member_Table > tbody").empty();
					var tbodyData = "";

					for(let i=0; i<result.length; i++ ){
						
						var classname = '';
						if(result[i].LEVEL == '0'){
							classname = 'beh';
						}
						else if(result[i].LEVEL == '1'){
							classname = 'hoi';
						}
						else if(result[i].LEVEL == '2'){
							classname = 'man';
						}
					
						if(result[i].RESTUSER == 'Y'){
							classname += ' human';
						}
						
						
						tbodyData += "<tr class='"+classname+"'>";
// 						tbodyData += "<td><input type='checkbox'></td>";
						tbodyData += "<td class='tdnm'>"+result[i].NAME+"</td>";
						tbodyData += "<td>"+result[i].PHONE+"</td>";
						tbodyData += "<td>"+result[i].LASTUSE+"</td>";
						tbodyData += "<td>"+result[i].USECOUNT+"</td>";
						tbodyData += "<td>$"+result[i].COST+"</td>";
						tbodyData += "<td class='tddiscount'>"+result[i].DISCOUNT+"</td>";
						if(auth != 'R'){
							tbodyData += "<td><button class='modify modi'><img src='./images/pc_icon/modify_black.svg'></button></td>";
						}
// 						tbodyData += "<td><button class='modify discount'><img src='./images/pc_icon/modify_black.svg'></button></td>";
						tbodyData += "<input type='hidden' class='tdid' value='"+result[i].MEM_ID+"'>";
						tbodyData += "<input type='hidden' class='tdlevel' value='"+result[i].LEVEL+"'>";
						tbodyData += "</tr>";
					}

					$("#Member_Table > tbody").append(tbodyData);
					
	            }
				
			})	
	}
	
	function chknm(){
		if($("#M_NAME").val().length > 0 && $("#M_PHONE").val().length > 0){
			$.ajax({
				type: "POST",
				url : "./nm_chk.do",
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
	
	function reset(mode){
		$(".popup").find(".blik").val("");
		$(".popup_input").css("border","1px solid black");
		$("#M_PASSWORD").val("");
		if(mode == 'D'){

			$(".pop_container").show();
			$("#popup_discount").show();
			var dmode ={
				TYPE: "A",
				TARGET: "ALL",
				SUB_TARGET: ""
			};
			$.ajax({
				type: "POST",
				url : "./Discount_Load.do",
				data: dmode,
				async: false,
	            success: function(datas){
	            	var result = JSON.parse(datas);
	            	
	            	$("#T_DISCOUNT").val(result.PERCENT);
	            }
			})
		}
		
		if(mode == 'C'){
			$(".popup_input").val("");
			$("#M_DISCOUNT").val(0);
			$("#M_LEVEL").val("1");
			$("#M_TARGET").val("0");
			$("#M_create").show();
			$("#M_modify").hide();
			$("#M_delete").hide();
        	$("#history > tbody").empty();
			$(".popup_table").hide();
			$(".pwh3").html("비밀번호<span>*</span>");
			$(".pop_container").show();
			$(".pickup_input").hide();
			$("#popup_modify").show();
			$("#popup_modify").find(".popup_h2").text("고객정보 추가");
		}
		else if(mode == 'M'){
			$("#M_create").hide();
			$("#M_modify").show();
			$("#M_delete").show();
			$(".popup_table").show();
			$(".pwh3").html("비밀번호");
			$(".pop_container").show();
			$("#popup_modify").show();
			if($("#M_ID").val() != uid){
				$("#popup_modify").find(".popup_h2").text("고객정보 수정");	
				$("#M_LEVEL").prop("disabled",false);
			}
			else{
				$("#popup_modify").find(".popup_h2").text("고객정보 수정(본인)");		
				$("#M_LEVEL").prop("disabled",true);
				$("#M_delete").hide();
			}
			
			var discount = {
					MEM_ID : $("#M_ID").val(),
					MEM_LEVEL : $("#M_LEVEL").val(),
				};
				

				$.ajax({
					type: "POST",
					url : "./Delivery_Mem_Info.do",
					data: discount,
					async: false,
		            success: function(datas){
		            	var result = JSON.parse(datas);
		            	discount["MEM_NAME"] = result.NAME;
		            	discount["MEM_PHONE"] = result.PHONE;
		            	
						$.ajax({
							type: "POST",
							url : "./Delivery_Mem_History.do",
							data: discount,
							async: false,
				            success: function(datas2){
				            	var result2 = JSON.parse(datas2);
				            	$("#M_ID_CHK").val(result.MEM_ID);
				            	$("#M_NAME").val(result.NAME);
				            	$("#M_NAME_CHK").val("Y");
				            	$("#M_EMAIL").val(result.EMAIL);
				            	$("#M_PHONE").val(result.PHONE);
				            	$("#M_DISCOUNT").val(result.DISCOUNT);
				            	$("#M_LEVEL").val(result.LEVEL);
				            	$("#M_NATION").val(result.NATION);
				            	$("#M_TARGET").val(result.MEM_TARGET).trigger("change");
				            	$("#M_ADDR").val(result.MEM_ADDR);
				            	$("#M_HOU").val(result.MEM_HOU);
				            	$("#M_BIGO").val(result.BIGO);
				            	
				            	var tabledata = "";

				            	$("#history > tbody").empty();
				            	for(let i=0; i<result2.length ; i++){
					            	tabledata += "<tr>";
					            	tabledata += "<td>"+result2[i].ARR_DAY+"</td>";
					            	tabledata += "<td>"+result2[i].BOX+"</td>";
					            	tabledata += "<td>"+result2[i].TOTAL+"$</td>";
					            	tabledata += "</tr>";
				            	}

				            	$("#history > tbody").append(tabledata);
				            }
				        })
		            }
				});
		}

		else if(mode == 'END'){

			$(".pop_container").hide();
			$("#popup_discount").hide();
			$("#popup_modify").hide();
		}
	}
	
	function reset_Search(){
		$(".search").val("");
		selectList();
	}

	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
	}
</script>
</html>