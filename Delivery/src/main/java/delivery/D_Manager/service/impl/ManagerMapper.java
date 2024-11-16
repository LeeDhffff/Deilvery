package delivery.D_Manager.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("ManagerMapper")
public interface ManagerMapper {

	List<HashMap<String, String>> Member_Select(HashMap<String, Object> inputMap) throws Exception;
	
	
	String Member_Modify(HashMap<String, Object> inputMap) throws Exception;
	String Member_Modify_Discount(HashMap<String, Object> inputMap) throws Exception;
	String Member_Delete(HashMap<String, Object> inputMap) throws Exception;

	List<HashMap<String, String>> Manager_List(HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String, String>> Authority_Select(HashMap<String, Object> inputMap) throws Exception;
	String Authority_CHK(HashMap<String, Object> inputMap) throws Exception;
	String Authority_Insert(HashMap<String, Object> inputMap) throws Exception;
	String Authority_Delete(HashMap<String, Object> inputMap) throws Exception;
	
	String Mem_Pw_Chk(HashMap<String, Object> inputMap) throws Exception;

	List<HashMap<String, String>> Nocomplete_Select(HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String, String>> M_Nocomplete_Select(HashMap<String, Object> inputMap) throws Exception;

	List<HashMap<String, String>> Out_Day_List(HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> Outday_Select(HashMap<String, Object> inputMap) throws Exception;
	String Outday_Insert(HashMap<String, Object> inputMap) throws Exception;
	String Outday_UD(HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String, String>> Out_Day_File_Select(HashMap<String, Object> inputMap) throws Exception;
	String Out_Day_File_Insert(HashMap<String, Object> inputMap) throws Exception;
	String Out_Day_File_UD(HashMap<String, Object> inputMap) throws Exception;

	
	List<HashMap<String, String>> Deilvery_Now_List(HashMap<String, Object> inputMap) throws Exception;

	List<HashMap<String, String>> Delivery_receipt (HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String, String>> Delivery_receipt_D (HashMap<String, Object> inputMap) throws Exception;


//	List<HashMap<String, String>> DeliveryCompanyList_Select (HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String, String>> DeliveryCompanyList_Search (HashMap<String, Object> inputMap) throws Exception;
	HashMap<String, String> DeliveryCompanyList_Load(HashMap<String, Object> inputMap) throws Exception;
	String DeliveryCompanyList_IUD(HashMap<String, Object> inputMap) throws Exception;

	HashMap<String, String> Discount_Load(HashMap<String, Object> inputMap) throws Exception;
	String Discount_IU(HashMap<String, Object> inputMap) throws Exception;
	
	HashMap<String, String> Emailinfo(HashMap<String, Object> inputMap) throws Exception;
	
}
