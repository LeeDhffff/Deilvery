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
    <title>회원관리 페이지</title>
</head>

<style type="text/css">
	
</style>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



<link rel="stylesheet" href="./css/common.css">  
<link rel="stylesheet" href="./css/3.Manager/MemberList_style.css">   
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
                    <a href="#">고객관리</a>
                </h1>                
                <div class="conWrap">
                    <h3 class="conMainTitle">
                        <a href="#">고객 리스트 필터</a>
                    </h3>
                    <div class="wrap">
                        <div class="triple">
                            <div class="inputWrap">
                                <select name="" id="">
                                    <option value="">이용횟수</option>
                                    <option value="">많은순서</option>
                                    <option value="">적은순서</option>
                                </select>
                            </div>
                            <div class="inputWrap">
                                <select name="" id="">
                                    <option value="">배송비 총 금액</option>
                                    <option value="">높은순서</option>
                                    <option value="">낮은순서</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <h3 class="conMainTitle">
                        <a href="#">고객리스트</a>                                                
                    </h3>                                       
                    <div class="wrap">
                        <div class="tableWrap">
                            <table id="Member_Table">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox"></th>
                                        <th>이름</th>
                                        <th>전화번호</th>
                                        <th>이용횟수</th>
                                        <th>배송비 총 금액</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>이재원</td>
                                        <td>010-2222-3333</td>
                                        <td>10</td>
                                        <td>$1,000,000</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div> <!-- wrap -->
                </div> <!-- conWrap -->
            </div> <!-- sectionContainer -->
        </section>
    </div>
</body>

<script type="text/javascript">

	var uid = '<%=(String)session.getAttribute("SESSION_MEM_ID")%>';
	var uid2 = '<%=(String)session.getAttribute("SESSION_PROTO_ID")%>';
	var level = '<%=(String)session.getAttribute("SESSION_LEVEL")%>';

	console.log(level);
 
	$(document).on('ready',function(){
		
		if(uid!="null" || uid2 != "null"){ 
			   if(level != '2'){
				   location.href = "Main.do";
			   }
			}
		

		/* 테이블 클릭시 해당 회원 정보 열람 / 수정페이지로 이동 */
		$(document).on("click","#Member_Table > tbody > tr",function(){
			
			if($(this).find(".tdid").val() != ''){
				
				   location.href = "MemberModifyPage.do?id="+$(this).find(".tdid").val()+"&level="+$(this).find(".tdlevel").val();
			}
			
		});
		selectList();
	})
	
	/* 회원 리스트 불러오기 */
	function selectList(){
			var deliverydata = {
					MEM_ID : uid
			};
			$.ajax({
				type: "POST",
				url : "./Member_Select.do",
				data: deliverydata,
				async: false,
	            success: function(datas){
					var result = JSON.parse(datas);

					$("#Member_Table > tbody").empty();
					var tbodyData = "";

					for(let i=0; i<result.length; i++ ){

						tbodyData += "<tr><td><input type='checkbox'></td>";
						tbodyData += "<td class='tdnm'><input type='hidden' class='tdid' value='"+result[i].MEM_ID+"'>"+result[i].NAME+"</td>";
						tbodyData += "<td>"+result[i].PHONE+"</td>";
						tbodyData += "<td>"+result[i].USECOUNT+"</td>";
						tbodyData += "<td><input type='hidden' class='tdlevel' value='"+result[i].LEVEL+"'>$"+result[i].COST+"</td>";
						tbodyData += "</tr>";
					}

					$("#Member_Table > tbody").append(tbodyData);
					
	            }
				
			})	
	}
</script>
</html>