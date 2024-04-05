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

</head>

<body>
   <div class="pop">
        <div class="popCon">
            <div class="popHeader">
                <div class="popTitle">고객관리 필터</div>
                <h5 class="cancel">
                    <a href="#">
                        <img src="./images/m_icon/cancel_black.svg" alt="">
                    </a>
                </h5>
            </div>
            <div class="popBody">
                <h3 class="tabCon on"><a href="#">이용 횟수</a></h3>     
                <h3 class="tabCon"><a href="#">배송비 총 금액</a></h3>          
            </div>
            <button class="popButton">적용하기</button>            
        </div>        
    </div> 
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow back">
                <a href="#">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">고객관리</div>
        </header>        
        <section>  
            <div class="currentWrap">
                <h5 class="icon filter">
                    <img src="./images/m_icon/filter_orange.svg" alt="#">
                </h5>
                <div class="currentHeader">
                    <h5><a href="#">고객리스트</a></h5>
                </div>
                <div class="tableWrap">
                    <table id="Member_Table">
                        <thead>
                            <tr>
                                <th><input type="checkbox"></th>
                                <th>이름</th>
                                <th>전화번호</th>
                                <th>이용횟수</th>
                                <th>배송비 총금액</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div> 
            </div>
        </section>
        <footer>
            <button class="back">이전</button>
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


		/* 테이블 클릭시 해당 회원 정보 열람 / 수정페이지로 이동 */
		$(document).on("click","#Member_Table > tbody > tr",function(){
			
			if($(this).find(".tdid").val() != ''){
				
				   location.href = "Mobile_Modify.do?id="+$(this).find(".tdid").val()+"&level="+$(this).find(".tdlevel").val();
			}
			
		});
		selectList();
	})
	
	/* 회원 리스트 불러오기 */
	function selectList(){
			var deliverydata = {
					MEM_ID : uid
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

						tbodyData += "<tr><td><input type='checkbox'></td>";
						tbodyData += "<td class='tdnm'><input type='hidden' class='tdid' value='"+result[i].MEM_ID+"'>"+result[i].NAME+"</td>";
						tbodyData += "<td>"+result[i].PHONE+"</td>";
						tbodyData += "<td>"+result[i].USECOUNT+"</td>";
						tbodyData += "<td><input type='hidden' class='tdlevel' value='"+result[i].LEVEL+"'>$"+result[i].COST+"</td>";
						tbodyData += "</tr>";
					}

					$("#Member_Table > tbody").append(tbodyData);
					
	            }
				
			})	
	}
</script>
</html>