<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송신청완료</title>
    
    <!-- jQuery import -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>    
    
    <!-- css import -->
    <link href="css/userDeliveryRegist/mUserDeliveryRegistResultStyle.css" rel="stylesheet" type="text/css">
    <link href="css/userDeliveryRegist/mCommon.css" rel="stylesheet" type="text/css">    
    
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
                <a href="#">
                    <img src="images/m_icon/header_arrow.svg" alt="#">
                </a>
            </h3>
            <div class="m_headerTitle">배송신청</div>
        </header>        
        <section>
            <h1 class="icon">
                <a href="#"><img src="images/m_icon/truck_orange.svg" alt="#" style="width:64px; height:64px;"></a>
            </h1>                                    
            <p class="mainP">
                <span class="id">${memNm}</span>님 배송신청이<br>
                 접수되었습니다.
            </p>
            <p class="subP">
                배송확인을 하시려면<br>
                배송조회에서 확인하실 수 있습니다.
            </p>
        </section>
        <footer>
            <button class="moveLogin" id="delStateBtn">배송조회로 이동</button>
        </footer>
    </div>
	
	<!-- script setting -->
    <script>
    $(document).ready(function(){
    	    	
    	/* 배송현황으로 이동 버튼 클릭 이벤트 설정 (JANG) */
    	$("#delStateBtn").on("click", function(evt){
    		
    		$(".Delivery_Search").trigger("click");
    		
    	});
   	});	// document.ready end!!
    </script>
</body>
</html>