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
    <title>배송조회</title>
</head>

<style type="text/css">
	
    body{
        width: 100%;
        height: 100%;
    }
    button{
        cursor:pointer;
    }
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/2.Delivery/SearchB_style.css">    
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
                    <a href="#">배송조회_비회원</a>
                </h1>
                <div class="conWrap">
                    <h1 class="logo">
                        <a href="#">
                            <img src="./images/pc_icon/search_orange.svg" alt="logo">
                        </a>
                    </h1>
                    <div class="wrap">
                        <div class="inputWrap">
                            <h5 class="inputName"><a href="#">수령인 이름</a></h5>
                            <input type="text" id="B_NM" placeholder="수령인 이름을 입력해주세요">
                        </div>
                        <div class="inputWrap password">
                            <h5 class="inputName"><a href="#">수령인 전화번호</a></h5>
                            <input type="text" id="B_PHONE" oninput="oninputPhone(this)" maxlength="13" placeholder="수령인 전화번호를 입력해주세요">
                        </div>                        
                        <div class="inputWrap login">
                            <button class="login" id="B_SEARCH">조회하기</button>
                        </div>                        
                    </div>
                </div>
            </div>
        </section>
	</div>
</body>

<script type="text/javascript">

 
 
	$(document).on('ready',function(){
		
		$("#B_SEARCH").on("click",function(){
			var BHW = {
					MEM_NM : $("#B_NM").val(),
					MEM_PHONE : $("#B_PHONE").val(),
			}

			$.ajax({
				type: "POST",
				url : "./Delivery_Select_B_CHK.do",
				data: BHW,
				async: false,
	            success: function(datas){
	            	console.log(datas);
	            	if(datas == 'Y'){
	            		location.href= "Delivery_Search_B_CHK.do?nm=" + encodeURI(encodeURIComponent($("#B_NM").val())) + "&ph=" + $("#B_PHONE").val();
	            	}
	            	else{
	            		alert("해당 정보로 신청한 배송정보가 없습니다.")
	            	}
	            }
			})
		})
		
	})
	
	
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]{4})([0-9]{4})/g, "$1-$2-$3");
}
	
</script>
</html>