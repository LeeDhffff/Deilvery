<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<script>
	uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';	
// 	console.log("uid : ", uid, " // udi2 : ", uid2, " // level : ", level);
	
	function chkAuth(uid, uid2, level){		
		// 로그인 안했을 때,
		if((uid == "" || uid == "null" || uid == null) && (uid2 == "" || uid2 == "null" || uid2 == null)){
			alert("로그인 후 이용할 수 있습니다.");
			location.href = "LoginPage.do";		
		}
	}	
	
</script>