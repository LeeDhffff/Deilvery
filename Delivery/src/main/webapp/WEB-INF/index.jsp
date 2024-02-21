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
    <title>JMT - 스케쥴러</title>
</head>
<style type="text/css">
	

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
    <div class="main-container">    	
        <div class="container">
            <img src="./images/login/note.l.png" alt="#" class="note">
            <div class="form">                
                <div class="choice individual">
                	<div class="con_div">
                		<img src="./images/login/individual.svg" alt="#" class="note">
                		<button class="button individual">개인모드로 바로가기</button>
                	</div>
                </div>
                <div class="choice company">
                	<div class="con_div">
                		<img src="./images/login/company.svg" alt="#" class="note">
                		<button class="button company">회사모드로 바로가기</button>
                	</div>
                </div>
			</div>            
        </div>
    </div>
</body>

<script type="text/javascript">

</script>
</html>