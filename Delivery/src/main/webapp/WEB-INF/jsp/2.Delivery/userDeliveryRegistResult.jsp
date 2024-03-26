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
    <link href="css/userDeliveryRegist/userDeliveryRegistResultStyle.css" rel="stylesheet" type="text/css">
    <link href="css/userDeliveryRegist/common.css" rel="stylesheet" type="text/css">
    <link href="css/userDeliveryRegist/commonStyle.css" rel="stylesheet" type="text/css">
    
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
                    <a href="#">배송신청 완료</a>
                </h1>
                <div class="conWrap">
                    <a href="#">
                        <span class="icon">
                            <img src="images/delivery/pc_icon/truck_orange.svg" alt="#">
                        </span>
                    </a>
                    <h3 class="conMainTitle">
                        <a href="#">
                            <span class="customer">${memNm}</span>님 배송신청이 접수되었습니다.
                        </a>
                    </h3>  
                    <h3 class="subTitle">
                        <a href="#">
                            ${memNm} 님께서 신청하신 배송이 접수되었습니다. 배송확인을 하시려면 배송현황에서 확인하실수 있습니다.
                        </a>
                    </h3>
                    <button class="move" id="delStateBtn">배송현황으로 이동</button>
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
	
	<!-- script setting -->
    <script>
    $(document).ready(function(){
    	
//     	console.log("uid : ", uid);
    	
    	/* 배송현황으로 이동 버튼 클릭 이벤트 설정 (JANG) */
    	$("#delStateBtn").on("click", function(evt){
    		
    		$(".Delivery_Search").trigger("click");
    		
    	});
   	});	// document.ready end!!
    </script>
</body>
</html>