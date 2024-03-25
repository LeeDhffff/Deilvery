package delivery.C_Delivery.service;

import java.util.HashMap;
import java.util.List;

public interface DeliveryService {
	//배송조회
	List<HashMap<String, String>> Delivery_Select(HashMap<String, Object> inputMap) throws Exception;
	//배송조회 상세
	List<HashMap<String, String>> Delivery_Select_D(HashMap<String, Object> inputMap) throws Exception;
	//배송현황 상세
	List<HashMap<String, String>> Delivery_Select_O(HashMap<String, Object> inputMap) throws Exception;
	
	
	//신청인 정보 불러오기
	HashMap<String, String> Delivery_Mem_Info(HashMap<String, Object> inputMap) throws Exception;
	
	String Delivery_Select_B_CHK(HashMap<String, Object> inputMap) throws Exception;
	List<HashMap<String, String>> Delivery_Select_B(HashMap<String, Object> inputMap) throws Exception;
}