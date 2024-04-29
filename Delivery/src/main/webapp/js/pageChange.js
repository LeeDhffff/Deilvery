/**
 * 
 */




$(document).on("ready",function(){
	
	var nowpage = window.location.pathname;
	var search = window.location.search;
	if(nowpage.indexOf("/Delivery/") >= 0){
		nowpage = nowpage.replace("/Delivery/","");	
	}
	
	console.log(nowpage);
	
	var width = window.outerWidth;
	
	var page = ["Main.do",
		"LoginPage.do","LoginPage_B.do","JoinPage.do","JoinComplete.do","MemberModifyPage.do",
		"userDeliveryRegistMain.do","userDeliveryRegistResult.do","adminDeliveryRegistMain.do",
		"Delivery_Search.do","Delivery_Search_B.do","Delivery_Search_B_CHK.do",
		"Main_Manager.do","MemberListPage.do","M_DeliveryList.do","M_Delivery_NC_List.do","Outday_List.do","Outday.do"]
	var mobilepage = ["Mobile_Main.do",
		"Mobile_Login.do","Mobile_Login_B.do","Mobile_Join.do","Mobile_JoinComplete.do","Mobile_Modify.do",
		"mUserDeliveryRegistMain.do","mUserDeliveryRegistResult.do","mAdminDeliveryRegistMain.do",
		"Mobile_Delivery_Search.do","Mobile_Delivery_Search_B.do","Mobile_Delivery_Search_B_CHK.do",
		"Mobile_ManagerMain.do","Mobile_M_MemberList.do","Mobile_M_DeliveryList.do","Mobile_M_Delivery_NC_List.do","Mobile_M_OutdayList.do","Mobile_M_Outday.do"
	    ];
	if(width <= 767){
		if(page.indexOf(nowpage) >= 0){
			location.href = mobilepage[page.indexOf(nowpage)] + search;
		}
	}
	else{
		if(mobilepage.indexOf(nowpage) >= 0){
			
			location.href = page[mobilepage.indexOf(nowpage)] + search;
		}
	}
})