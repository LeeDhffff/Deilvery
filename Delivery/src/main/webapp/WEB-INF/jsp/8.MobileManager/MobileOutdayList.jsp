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
    <title>EK Logistics - 출항일 검색</title>
</head>

<style type="text/css">
	.ton{
		background: #e1e1e1;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/8.MobileManager/MobileOutdayList_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
</head>

<body>
   <div class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">출항일 수정하기</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <p class="popP">
                    선택하신 출항일을 수정하시겠습니까?
                </p>                
            </div>
            <button class="popModify">수정하기</button>            
        </div>        
    </div> 

    <div class="pop2">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">출항일 삭제하기</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <p class="popP">
                    선택하신 출항일을 삭제하시겠습니까?
                </p>                
            </div>
            <button class="popDelete">삭제하기</button>            
        </div>        
    </div> 

    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">출항일관리</div>
        </header>        
        <section>  
            <div class="currentWrap">
                <div class="iconWrap">
                    <h5 class="icon plus">
                        <img src="./images/m_icon/plus_orange.svg" alt="#">
                    </h5>
                    <h5 class="icon modify">
                        <img src="./images/m_icon/modify_orange.svg" alt="#">
                    </h5>
                </div>                
                <div class="currentHeader">
                    <h5><a href="#">출항일리스트</a></h5>
                </div>
                <div class="tableWrap">
                    <table id="Outday_Table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>No</th>
                                <th>출항일</th>
                                <th>진행상황</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>                 
            </div>
        </section>
        <footer>
            <button>이전</button>
        </footer>        
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	$(document).on('ready',function(){
		var width = window.outerWidth;
		
// 		if(width <= 767){

// 		}
// 		else{
// 			location.href = "Main.do";
// 		}

		$(".back").on("click",function(){
			history.back();
		})

		
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

					tbodyData += "<tr><td><input type='radio' name='List_Check' class='List_Check'></td>";
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

			$(".ton").removeClass("ton");
			$(this).addClass("ton");
			
			$(".List_Check").prop("checked",false);
			$(this).find(".List_Check").prop("checked",true);
			
			
		})
		
		
		$(".plus").on("click",function(){
			location.href="Mobile_M_Outday.do";
		})
		$(".modify").on("click",function(){
			if($("input[name=List_Check]:checked").length <= 0){
				alert("수정할 출항일을 선택해주세요.");
			}
			else{
				var outkey = $("input[name=List_Check]:checked").parents("tr").find(".out_key").val();
				
				location.href="Mobile_M_Outday.do?ok=" + outkey;
			}
		})
	})
</script>
</html>