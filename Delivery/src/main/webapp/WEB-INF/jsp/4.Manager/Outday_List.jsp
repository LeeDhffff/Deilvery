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
<link rel="stylesheet" href="./css/3.Manager/OutdayList_style.css">   
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<script src="./js/3.Manager/Outday_List_index.js"></script>

</head>

<body>
    <div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
		<section>
            <div class="sectionContainer">
                <h1 class="sectionTitle">
                    <a href="#">출항일 관리</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">출항일 리스트</a>
                        <div class="buttonWrap">
                            <button class="plus">
                                <a href="Outday.do">
                                    <img src="./images/pc_icon/plus_black.svg" alt="영수증출력하기">
                                </a>
                            </button>
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
                            <table id="Outday_Table">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>출항일</th>
                                        <th>진행상황</th>
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

				$("#Outday_Table > tbody").empty();
				var tbodyData = "";

				for(let i=0; i<result.length; i++ ){

					tbodyData += "<tr>";
					tbodyData += "<td>"+(String)(i+1)+"</td>";
					tbodyData += "<td><input type='hidden' class='out_key' value='"+result[i].OUT_KEY+"'>"+result[i].OUT_DAY+"</td>";
					tbodyData += "<td>"+result[i].NOW_DELIVERY+"</td>";
					tbodyData += "</tr>";
				}

				$("#Outday_Table > tbody").append(tbodyData);
				
            }
		})
		
		
		/* 클릭시 출항일 관리페이지로 이동 */
		$(document).on("click","#Outday_Table > tbody > tr", function(){
			
			var outkey = $(this).find(".out_key").val();
			
			location.href="Outday.do?ok=" + outkey;
			
		})
		
	})

</script>
</html>