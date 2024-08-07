<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Error Page</title>

<style>
	html,body{
		height: 100%;
	}
	.error_back{
	    width: 100%;
    	height: 100%;
	}
	.error_box{
		text-align: center;
	    position: absolute;
	    left: 50%;
	    top: 50%;
	    transform: translate(-50%, -50%);
	}
	.error_box > h1{
	    color: red;
    	margin-bottom: 30px;
	}
	.error_box > h3{
		line-height: 30px;
	}
</style>
</head>

<body>
<!--     <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"> -->
<!--         <tr> -->
<!--             <td width="100%" height="100%" align="center" valign="middle" style="padding-top: 150px;"><table border="0" cellspacing="0" cellpadding="0"> -->
<!--                     <tr> -->
<%--                         <td class="<spring:message code='image.errorBg' />"> --%>
<!--                             <span style="font-family: Tahoma; font-weight: bold; color: #000000; line-height: 150%; width: 440px; height: 70px;"></span> -->
<!--                         </td> -->
<!--                     </tr> -->
<!--                 </table> -->
<!--             </td> -->
<!--         </tr> -->
<!--     </table> -->
<div class="error_back">
	<div class="error_box">
		 <img src="./images/pc_icon/warning.svg">
		<h1>404 ERROR</h1>
		<h3>에러가 발생하였습니다.
		<br/>관리자에게 문의해주십시오.</h3>	
	</div>
</div>
</body>
</html>