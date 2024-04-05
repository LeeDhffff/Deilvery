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
<link rel="stylesheet" href="./css/4.MobileLogin/JoinC_style.css">    
<!-- import font-awesome, line-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/line-awesome/css/line-awesome.min.css">
<!-- import pretendard font -->
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/variable/pretendardvariable.css"/>
</head>

<body>
    <div class="m_container">
        <header class="m_header">
            <h3 class="arrow">
                <a href="Mobile_Login.do">
                    <img src="./images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">회원가입</div>
        </header>        
        <section>
            <h1 class="icon">
                <a href="#"><img src="./images/m_icon/check_orange.svg" alt="#"></a>
            </h1>                                    
            <p class="mainP">
                <span class="id">이*원</span>님 환영합니다!<br>
                EK Logistics<br>
                회원가입을 축하드립니다.
            </p>
            <p class="subP">
                회원님은 <br>
                EK Logistics의 모든 기능을 사용하실 수 있습니다.<br>
                회원접속 후 이용가능합니다.
            </p>
        </section>
        <footer>
            <button class="moveLogin">로그인 페이지로 이동</button>
        </footer>
    </div>
</body>

<script type="text/javascript">


	var chk_mods = decodeURI(decodeURIComponent(window.location.search.replaceAll("?nm=","")));

	$(document).on('ready',function(){
		var width = window.outerWidth;
		
// 		if(width <= 767){
// 		}
// 		else{
// 			location.href = "Main.do";
// 		}

		$(".id").text(chk_mods);

		$(".moveLogin").on("click",function(){
			location.href="Mobile_Login.do";
		})
	})
</script>
</html>