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

<style type="text/css">
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/Mobile/common.css">  
<link rel="stylesheet" href="./css/8.MobileManager/MMM_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
</head>

<body>
    <div class="m_container">
        <header class="m_header">
            <h1 class="logo">
                <img src="./images/m_icon/logo_color.svg" alt="logo">
            </h1>            
            <ul class="header_option">
                <li id="topc"><img src="./images/m_icon/pc_icon.svg" alt="pc"></li>
                <li id="tologin"><img src="./images/m_icon/login.svg" alt="login"></li>
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
                    <h5 class="txt">금주 예상 출항일은 <span class="date">24-03-12</span> 입니다.</h5>
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
                <div class="buttonCon">
                    <button class="register">
                        <a href="#">
                            <span class="icon register"></span>
                            물류접수하기
                        </a>
                    </button>
                    <button class="outdate">
                        <a href="#">
                            <span class="icon outdate"></span>
                            출항일 관리
                        </a>
                    </button>
                </div>
                <div class="buttonCon">
                    <button class="customer">
                        <a href="#">
                            <span class="icon customer"></span>
                            고객 관리
                        </a>
                    </button>                    
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
		var width = window.outerWidth;
		
// 		if(width <= 767){

// 		}
// 		else{
// 			location.href = "Main.do";
// 		}
		
		$("#topc").on("click",function(){
			location.href = "Main.do";
		})
		$("#tologin").on("click",function(){
			location.href = "Mobile_Login.do";
		})

		$("#Delivery_Search").on("click",function(){
			if(uid != "null"){
				location.href="Mobile_M_DeliveryList.do";
			}
			
		})
		
		$("#Delivery_Search").on("click",function(){
			if(uid != "null"){
				location.href="Mobile_M_DeliveryList.do";
			}
			
		})
		
		
		$(".outdate").on("click",function(){
			if(uid != "null"){
				location.href="Mobile_M_OutdayList.do";
			}
			
		})
		
		$(".customer").on("click",function(){
			if(uid != "null"){
				location.href="Mobile_M_MemberList.do";
			}
			
		})
		$(".register").on("click",function(){
			if(uid != "null" || uid2 != "null"){
				// 경로 설정 (240331 장연우)
				location.href="mAdminDeliveryRegistMain.do";
			}
			else if(uid == "null" && uid2 == "null"){
				alert("로그인이 필요한 서비스입니다.")
			}
		})
		
	})
</script>
</html>