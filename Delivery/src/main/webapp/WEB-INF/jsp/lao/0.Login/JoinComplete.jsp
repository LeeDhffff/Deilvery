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
    <title>회원가입 완료!</title>
</head>

<style type="text/css">
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="../css/common.css">  
<link rel="stylesheet" href="../css/0.Login/style_JoinC.css">    
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
                    <a href="#">회원가입 완료</a>
                </h1>
                <div class="conWrap">
                    <a href="#">
                        <span class="icon">
                            <img src="../images/pc_icon/check_orange.svg" alt="#">
                        </span>
                    </a>
                    <h3 class="conMainTitle">
                        <a href="#">
                            <span class="customer">이*원</span>님 환영합니다!<br>
                            EK Logistics 회원가입 되셨습니다.
                        </a>
                    </h3>  
                    <h3 class="subTitle">
                        <a href="#">
                            회원님은 EK Logistics의 모든 기능을 사용하실수 있습니다.<br>
                            회원접속 후 이용가능합니다.
                        </a>
                    </h3>                                    
                    <button class="move">로그인페이지로 이동</button>
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>


</body>

<script type="text/javascript">


	var chk_mods = decodeURI(decodeURIComponent(window.location.search.replaceAll("?nm=","")));
	
	console.log(chk_mods);

	$(document).on('ready',function(){
		$(".customer").text(chk_mods);

		$(".move").on("click",function(){
			location.href="LoginPage.do";
		})
	})
</script>
</html>