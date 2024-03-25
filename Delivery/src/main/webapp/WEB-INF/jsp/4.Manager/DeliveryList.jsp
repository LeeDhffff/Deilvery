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
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/3.Manager/AppList_style.css">   
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
        <section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">배송조회</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">배송검색 필터</a>
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Out_Day" onchange="ChangeSearch();" placeholder="출항일을 입력해주세요">
                            </div>
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Rec_Nm" onchange="ChangeSearch();" placeholder="수령인을 입력해주세요">
                            </div>
                            <div class="inputWrap">
                                <input type="text" class="Search" id="S_Rec_Phone" onchange="ChangeSearch();" placeholder="전화번호를 입력해주세요">
                            </div>
                        </div>
                        <div class="triple">
                            <div class="inputWrap">
                                <select name="pickup" onchange="ChangeSearch();" id="S_Pickup">
                                    <option value="">픽업지를 선택하세요</option>
                                    <option value="1">본사</option>
                                    <option value="2">하우창고</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                                <select name="pickup" onchange="ChangeSearch();" id="S_Service">
                                    <option value="">배송서비스 유무를 선택하세요</option>
                                    <option value="Y">신청</option>
                                    <option value="N">미신청</option>
                                </select>
                            </div>                            
                        </div>
                    </div>

                    <h3 class="conMainTitle">
                        <a href="#">배송 리스트</a>
                        <div class="buttonWrap">
                            <button class="bill">
                                <a href="#">
                                    <img src="./images/pc_icon/calculator.svg" alt="영수증출력하기">
                                </a>
                            </button>
                            <button class="excel">
                                <a href="#">
                                    <img src="./images/pc_icon/down_black.svg" alt="영수증출력하기">
                                </a>
                            </button>
                        </div>                        
                    </h3>                                       
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id = "Delivery_Table">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="List_Check All"></th>
                                        <th>출항일</th>
                                        <th>수령인</th>
                                        <th>픽업지</th>
                                        <th>배송현황</th>
                                        <th>배송완료 여부</th>
                                        <th>배송서비스</th>
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

	console.log(level);
 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
					location.href = "Main.do";
			   }
			}
		

		$('#S_Out_Day').datepicker(
				{
					changeMonth : true,
					changeYear : true,
					showMonthAfterYear : true,
					dayNamesMin :  ['일', '월', '화', '수', '목', '금','토'],
				    monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
				    monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
					dateFormat : 'yy-mm-dd',
				});
// 		$('#S_Out_Day').datepicker('setDate','today');

		// 체크박스 트리거
		
		$(".List_Check.All").on("click",function(){
			if($(this).prop("checked") == true){
				$(".List_Check.sub").prop("checked",true);
			}
			else{
				$(".List_Check.sub").prop("checked",false);	
			}
		});
		

		$(document).on("click",".List_Check.sub",function(){
			if($(this).prop("checked") == true){
				if($("input:checkbox[name=List_Check]:checked").length == $("input:checkbox[name=List_Check]").length){
					$(".List_Check.All").prop("checked",true);
				}
			}
			else{
				$(".List_Check.All").prop("checked",false);		
			}
		});

		

		/* 인쇄페이지 열기(팝업) */
		$(".bill").on("click",function(){
			$("#print_grayback").show();
		})
		
		ChangeSearch();
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

					tbodyData += "<tr><td><input type='checkbox' name='List_Check' class='List_Check sub'>";
					tbodyData += "<td>"+result[i].OUT_DAY+"</td>";
					tbodyData += "<td>"+result[i].REC_NM+"</td>";
					tbodyData += "<td>"+result[i].REC_TARGET+"</td>";
					tbodyData += "<td>"+result[i].NOW_DELIVERY+"</td>";
					tbodyData += "<td>"+result[i].MAXCHK+"</td>";
					tbodyData += "<td>"+result[i].SERVICE+"</td>";
					tbodyData += "</tr>";
				}

				$("#Delivery_Table > tbody").append(tbodyData);
				
            }
		})
	}

</script>
</html>