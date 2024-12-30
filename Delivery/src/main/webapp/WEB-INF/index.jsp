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
    
    <title></title>
</head>
 <jsp:forward page="/Main.do"/>
<style>
body{
	margin: auto;
    text-align: center;
}
.main{
	width:100%;
	height:100%;
}
.button{
    width: 200px;
    height: 100px;
    font-size: 1.5em;
    color: white;
    cursor: pointer; 
    border: 0px;
    border-radius: 10px;
}
#individual{
	background : #ff688b;
}
#company{
	background : #8d68ff;
}
</style>


<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
<body>

	
	
</body>

<script type="text/javascript">
	$(document).ready(function(){
// 		$.ajax({
// 			type: "POST",
// 			url : "./id_chk.do",
// 			data: {},
// 			async: false,
//             success: function(datas){
//                 alert(datas);
//             }
//         })
	})

</script>
</html>