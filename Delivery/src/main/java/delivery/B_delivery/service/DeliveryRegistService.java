package delivery.B_delivery.service;

import java.util.HashMap;
import java.util.List;

public interface DeliveryRegistService {

	/************************** 회원파트 start!! ********************************/	
	
	/* 회원 배송신청 등록 */
	public void userDelRegist(HashMap<String, Object> inputMap) throws Exception;
	
	
	
	
	
	/************************** 관리자파트 start!! ********************************/
	
	/* 미완료 배송건 조회 */
	public HashMap<String, String> ingDeliveryRead(HashMap<String, Object> inputMap) throws Exception;
	/* 출항일 조회 */
	public List<HashMap<String, String>> outDayList(HashMap<String, Object> inputMap) throws Exception;
	/* 택배사 조회 */
	public List<HashMap<String, String>> shipComList(HashMap<String, Object> inputMap) throws Exception;
	/* 수령인 조회 */
	public List<HashMap<String, String>> memberList(HashMap<String, Object> inputMap) throws Exception;
	/* 박스정보 가져오기 */
	public List<HashMap<String, String>> packInfoList(HashMap<String, Object> inputMap) throws Exception;
	
	/* 접속한 member 정보 가져오기 */
	public List<HashMap<String, String>> memInfoList(HashMap<String, Object> inputMap) throws Exception;
		
	
	
	/*************************************************************************************************/
	/***************************after 5/29 Update !!!***************************************************/
	/*************************************************************************************************/
	
	/* 관리자 물류접수 등록 */
	public String adminDelRegist(HashMap<String, Object> inputMap) throws Exception;
	/* 관리자 물류접수 수정 */
	public String adminDelUpdate(HashMap<String, Object> inputMap) throws Exception;
	/* 관리자 박스정보 등록 */
	public String adminBoxRegist(HashMap<String, Object> inputMap) throws Exception;
	/* 물류접수자 level 조회 */
	public HashMap<String, String> chkLevel(HashMap<String, Object> inputMap) throws Exception;
	
}
