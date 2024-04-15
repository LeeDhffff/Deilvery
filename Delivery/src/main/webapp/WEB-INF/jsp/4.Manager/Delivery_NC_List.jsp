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
    <title>배송조회</title>
</head>

<style type="text/css">
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/3.Manager/NC_style.css">    
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
                    <a href="#">미완료 배송신청 건수</a>
                </h1>
                <h1 class="noticeNum">
                    <a href="#">
                        <span class="date">2024-02-27</span> 미완료 배송 신청 건수는 총 <span class="num">3</span>건 입니다.
                    </a>
                </h1>
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">미완료 배송신청 현황</a>
                    </h3>                                       
                    <div class="wrap">
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
                                    <tr>
                                        <td>1</td>
                                        <td>이재원</td>
                                        <td>2024-01-10</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>윤도균</td>
                                        <td>2024-01-10</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="pageControll">
                            <div class="page on">1</div>
                            <div class="page">2</div>
                            <div class="page">3</div>
                            <div class="page">4</div>
                            <div class="page">5</div>
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
		delivery_nc(page);
		

		/* 테이블 목록 클릭시 */
		$(document).on("click","#Nocomplete_Table > tbody > tr",function(){
			var nc = $(this).find(".in_key").val();
			

			/* 미완료 배송신청으로 이동 */
			location.href = "adminDeliveryRegistMain.do?ik=" +nc;
		})
		
		/* 페이징 클릭시 */
		$(document).on("click",".page",function(){
			if($(this).hasClass("on") == false){
				/* 해당 페이징으로 이동 */
				location.href = "M_Delivery_NC_List.do?p=" +$(this).text();
			}
		})
		 
	})
	
	
	/* 미완료된 배송신청목록 불러오기 */
	function delivery_nc(Page){
		var deliverydata = {
				MEM_ID : uid,
				MODE : 'N',
				PAGE : Page
		};
		$.ajax({
			type: "POST",
			url : "./Nocomplete_Select.do",
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

				var pageData = "";
				var paging = Math.ceil(result[0].CNT / 10);
				
				for(let i=0; i<paging; i++ ){
					var classname = "page";
					if(i+1 == Page+1){
						classname = "page on";
					}

					pageData += '<div class="'+classname+'">'+(String)(i+1)+'</div>';
				}
				
				$(".pageControll").append(pageData);
				$("#Nocomplete_Table > tbody").append(tbodyData);
				$(".num").text(result[0].CNT);
				
            }
		})
	}

</script>
</html>