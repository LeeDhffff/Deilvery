<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%-- <jsp:forward page="/egovSampleList.do"/> --%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="kr">    
</head>
<style>
	.loading_back{
	    width: 100%;
	    height: 100%;
	    position: fixed;
	    background: #fffbfb61;
/* 	    display:none; */
	    z-index:2000;
	}
	.loading_img{
		width: 300px;
	    height: 300px;
	    /* background: white; */
	    position: absolute;
	    transform: translate(-50%, -50%);
	    left: 50%;
	    top: 50%;
	}
	.loading_img > img{
		width: 100%;
	    height: 100%;
	}
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>


<body>
	<div class="loading_back">
		<div class="loading_img">
			<img src="./images/pc_icon/Rolling.svg">
		</div>
	</div>
	<script type="text/javascript">
	function startLoading(){
		$(".loading_back").show();
	}
	
	function stopLoading(){
		$(".loading_back").hide();
	}
	$(window).load(function() {     
		 $('.loading_back').hide();   
	}); 
</script>
</body>

</html>