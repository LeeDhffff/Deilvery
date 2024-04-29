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
    <title>EK Logistics</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/8.MobileManager/MobileDeliveryNCList_style.css">     
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
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
            <div class="m_headerTitle">미완료 배송 신청 건수</div>
        </header>        
        <section>                                   
            <div class="countWrap">
                <div class="countCon">
                    <h5 class="date"></h5>
                    <h3 class="txt">미완료 배송 신청 건수</h3>
                </div>
                <h1 class="count">0건</h1>
            </div>
                   
            <div class="currentWrap">
                <div class="currentHeader">
                    <h5><a href="#">미완료 배송 신청 현황</a></h5>
                </div>
                <div class="tableWrap">
                    <table id="Nocomplete_Table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>수령인</th>
                                <th>신청일자</th>
                            </tr>
                        </thead>
                        <tbody>                            
                        </tbody>
                    </table>
                </div>   
            </div>
        </section>        
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
		

		/* 날짜설정 */
		var Dates = new Date();

		var todayYear = (String)(Dates.getFullYear());
		var todayMonth = ((String)(Dates.getMonth() + 1).length < 2) ? "0" + (String)(Dates.getMonth() + 1)
						: (String)(Dates.getMonth() + 1);
		var todayDate = ((String)(Dates.getDate()).length < 2) ? "0" + (String)(Dates.getDate())
						: (String)(Dates.getDate());

		$(".date").text(todayYear + "-" + todayMonth + "-" + todayDate);
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
					location.href = "Main.do";
			   }
			}


		var page = Number(window.location.search.replaceAll("?p=","")) - 1;
			console.log(page);
		if(page == -1){
			page = 0;
		}
		/* 페이지 시작하자마자 불러오기 */
		delivery_nc();
		

		/* 테이블 목록 클릭시 */
		$(document).on("click","#Nocomplete_Table > tbody > tr",function(){
			var nc = $(this).find(".in_key").val();
			

			/* 미완료 배송신청으로 이동 */
			location.href = "mAdminDeliveryRegistMain.do?ik=" +nc;
		})
		
		 
	})
	
	
	/* 미완료된 배송신청목록 불러오기 */
	function delivery_nc(){
		var deliverydata = {
				MEM_ID : uid
		};
		$.ajax({
			type: "POST",
			url : "./M_Nocomplete_Select.do",
			data: deliverydata,
			async: false,
            success: function(datas){
				var result = JSON.parse(datas);

				$("#Nocomplete_Table > tbody").empty();
				var tbodyData = "";

				$(".pageControll").empty();
				for(let i=0; i<result.length; i++ ){

					tbodyData += "<tr>";
					tbodyData += "<td>"+(String)(i+1)+"</td>";
					tbodyData += "<td><input type='hidden' class='in_key' value='"+result[i].IN_KEY+"'>"+result[i].REC_NM+"</td>";
					tbodyData += "<td>"+result[i].CRE_DAY+"</td>";
					tbodyData += "</tr>";
				}

				
				$("#Nocomplete_Table > tbody").append(tbodyData);
				$(".count").text(result.length + "건");
				
            }
		})
	}
</script>
</html>