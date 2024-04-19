package delivery.D_Manager.service;

import java.util.HashMap;
import java.util.List;

public interface ManagerService {
	
	List<HashMap<String, String>> Member_Select(HashMap<String, Object> inputMap) throws Exception;
	
	String Member_Modify(HashMap<String, Object> inputMap) throws Exception;
	
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


	HashMap<String, String> Emailinfo(HashMap<String, Object> inputMap) throws Exception;
}