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
    <title>EK Logistics - Manager </title>
</head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/3.Manager/Main_style.css">   
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
<!-- import js -->

</head>

<body>
    <div class="container">
		<jsp:include page="../common.jsp"></jsp:include>
        <section>
            <div class="textCon">
                <h3 class="mainTitle">
                    <a href="#">
                        Global Specialized In Logistics 
                    </a>
                </h3>
                <h1 class="logoWhite">
                    <a href="#">
                        <img src="./images/pc_icon/logo_white.svg" alt="logo">
                    </a>
                </h1>
                <h5 class="subTitle">
                    <a href="#">
                        한국과 라오스의 빠른<br> 
                        해상물류와 서비스 개선 해결<br>
                        제3자 물류 서비스와 유통 
                    </a>
                </h5>
            </div>
            <div class="buttonCon">
                <button class="register">
                    <a href="#">
                        <span class="icon truckBlack"></span>
                        배송신청
                    </a>
                </button>
                <button class="search">
                    <a href="#">
                        <span class="icon searchBlack"></span>
                        배송조회
                    </a>
                </button>
            </div> 
            <div class="version">
              <span class="version_span">1.2.7-Release</span><br>
              <span class="version_span" style="font-size: 11px;">2024-12-22</span>
            </div>
        </section>
    </div>
   	
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
					location.href = "Main.do";
			   }
			}
		else{
			location.href = "Main.do";
		}

		$(".register").on("click",function(){
			location.href="adminDeliveryRegistMain.do";
		})
		$(".search").on("click",function(){
			location.href="M_DeliveryList.do";
		})
	})
</script>
</html>