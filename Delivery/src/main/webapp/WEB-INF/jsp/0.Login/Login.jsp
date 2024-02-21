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
    <title>Delivery</title>
</head>
<style type="text/css">
	
    body{
        width: 100%;
        height: 100%;
    }
    button{
        cursor:pointer;
    }
    .main_container{
        width: 100%;
        height: 100%;
        text-align: center;
        display: block;
    }
    .main_div{
        display: block;
        width: 500px;
        padding: 10px;
        margin: auto;
        text-align: center;
    }
    .identify{
        width: 300px;
        height: 30px;
        margin: 5px;
        padding-left: 5px;
    }
    .loginbutton{
        display: block;
        width: 310px;
        height: 30px;
        color: white;
        background: red;
        border: 0px;
        border-radius: 2px;
        margin: auto;
    }
    .side{
        display: flex;
        justify-content: space-between;
        width: 310px;
        margin: auto;
        padding-top: 5px;
        padding-bottom: 5px;
    }
    .sidebutton{
        border: 0px;
        border-radius: 2px;
        height: 30px;
    }
    #idpw_find{
        background: #8980f9;
        color: white;
    }
    #none_id{
        background: black;
        color: white;
    }

</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<body>
    <div class="main_container">
        <div class="main_div">
            <h2>로그인</h2>
            <input type="text" class="identify" id="login_ID" placeholder="아이디">
            <input type="password" class="identify" id="login_PW" placeholder="비밀번호">
            <button class="loginbutton">로그인</button>
            <div class="side">
                <button class="sidebutton" id="idpw_find">아이디/비밀번호 찾기</button>
                <button class="sidebutton" id="none_id">비회원</button>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript">

</script>
</html>