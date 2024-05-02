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
	#tologout{
		display:none;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/5.MobileMain/MM_style.css">    
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
            <h1 class="logo">
                <img src="./images/m_icon/logo_color.svg" alt="logo">
            </h1>            
            <ul class="header_option">
<!--                 <li id="topc"><img src="./images/m_icon/pc_icon.svg" alt="pc"></li> -->
                <li id="tologin"><img src="./images/m_icon/login.svg" alt="login"></li>
                <li id="tologout"><img src="./images/m_icon/logout.svg" alt="logout"></li>
                <li class="language">
                    <img src="./images/m_icon/globe-solid.svg" alt="language">
                    <select name="language">
                        <option value="kor">KOR</option>
                        <option value="lao">LAO</option>
                    </select>
                </li>
            </ul>
        </header>
        <section>
            <div class="slide">
                <div class="textCon">
                    <h3 class="mainTitle">
                        <a href="#">
                            Global<br> Specialized In Logistics 
                        </a>
                    </h3>                    
                    <h5 class="subTitle">
                        <a href="#">
                            한국과 라오스의 빠른<br> 
                            해상물류와 서비스 개선 해결<br>
                            제3자 물류 서비스와 유통 
                        </a>
                    </h5>
                </div>
            </div>

            <div class="noticeWrap">
                <div class="mainTitle">공지사항</div>
                <div class="notice">
                    <h5 class="icon">
                        <img src="./images/m_icon/notice_orange.svg" alt="#">
                    </h5>
                    <h5 class="txt">금주 예상 출항일은 <span id="dateOut" class="date"></span> 입니다.</h5>
                </div>
            </div>

            <div class="menuWrap">
                <div class="mainTitle">배송 메뉴</div>
                <div class="buttonCon">
                    <button class="register">
                        <a href="#">
                            <span class="icon truckBlack"></span>
                            배송신청
                        </a>
                    </button>
                    <button class="search" id="Delivery_Search">
                        <a href="#">
                            <span class="icon searchBlack"></span>
                            배송조회
                        </a>
                    </button>
                </div> 
            </div> 

            <div class="useWrap">
                <div class="mainTitle">
                    <span class="id">${memNm}</span> 회원님 실시간 누적데이터
                </div>
                
                <button class="cost">
                    <div class="txt">
                        <h5>누적 배송 금액</h5>
                        <h1 id="totalcost"></h1>
                    </div>
                    <a href="#">
                        <span class="icon cost">
                            <img src="./images/m_icon/medal_orange.svg" alt="">
                        </span>
                    </a>
                </button>
                <button class="use">
                    <div class="txt">
                        <h5>누적 이용 횟수</h5>
                        <h1 id="totaluse"></h1>
                    </div>
                    <a href="#">
                        <span class="icon use">
                            <img src="./images/m_icon/write_orange.svg" alt="">
                        </span>
                    </a>
                </button>
                
            </div>             
        </section>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	$(document).on('ready',function(){
		if(uid == 'null' && uid2== 'null'){
			$.ajax({
				type: "POST",
				url : "./AutoLogin.do",
				data: {},
				async: false,
		        success: function(datas){
				   var result = JSON.parse(datas);

		           if(result.MSG == 'Y'){
			     	   location.reload();   
		           }
		           else{
// 		        	   console.log("아님");
		           }
		        }
				
			})	
		}
		
		
		if(uid != "null" || uid2 != "null"){
			$("#tologin").remove();
			$("#tologout").show();
		}
		
		if(level == '2'){
			location.href = "Mobile_ManagerMain.do";
		}

		$.ajax({
			type: "POST",
			url : "./Status_Select.do",
			data: {MEM_ID : uid},
			async: false,
            success: function(datas){
            	var result = JSON.parse(datas);
            	
            	$("#totalcost").text(result.COST);
            	$("#totaluse").text(result.COUNTS);
            	$("#dateOut").text(result.OUT_DAYS);
            }
			
		})	
		
		
		$("#topc").on("click",function(){
			location.href = "Main.do";
		})
		$("#tologin").on("click",function(){
			location.href = "Mobile_Login.do";
		})

		$("#Delivery_Search").on("click",function(){
			if(uid != "null"){
				location.href="Mobile_Delivery_Search.do";
			}
			else if(uid2 != "null"){
				location.href="Mobile_Delivery_Search_B.do";
			}
			else if(uid2 == "null"){
// 				alert("로그인이 필요한 서비스입니다.")
				location.href="Mobile_Delivery_Search_B.do";
			}
			
		})
		
		$(".register").on("click",function(){
			if(uid != "null" || uid2 != "null"){
				// 경로 초기화 (240331 장연우)
				location.href="mUserDeliveryRegistMain.do";
			}
			else if(uid == "null" && uid2 == "null"){
				alert("로그인이 필요한 서비스입니다.")
			}
		})
		
		$("#tologout").on("click",function(){

				$.ajax({
					type: "POST",
					url : "./Logout.do",
					data: {},
					async: false,
		            success: function(datas){
// 		            	alert(datas);

		         	   location.href = "Mobile_Main.do";
		            }
					
				})	
		})
	})
</script>
</html>