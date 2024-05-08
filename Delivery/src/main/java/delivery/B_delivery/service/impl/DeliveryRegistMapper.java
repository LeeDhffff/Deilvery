package delivery.B_delivery.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("DeliveryRegistMapper")
public interface DeliveryRegistMapper {

	/************************** 회원파트 start!! ********************************/
	
	/* 접속한 member 정보 가져오기 */
	public List<HashMap<String, String>> memInfoList(HashMap<String, Object> inputMap) throws Exception;
	
	
	
	
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
	/* 박스정보 가져오기 */
	public List<HashMap<String, String>> packInfoList(HashMap<String, Object> inputMap) throws Exception;
		
	/* 관리자 배송신청 등록 */
	public void adminDelRegist(HashMap<String, Object> inputMap) throws Exception;
	/* 관리자 배송신청 수정 */
	public void adminDelUpdate(HashMap<String, Object> inputMap) throws Exception;
	/* IN_KEY 등록여부 체크 */
	public int cntInKey(HashMap<String, Object> inputMap) throws Exception;
	/* 해당 신청일 마지막 등록된 IN_KEY 값 */
	public String lastInKey(HashMap<String, Object> inputMap) throws Exception;
	
	/* 박스 정보 등록 체크 */
	public int cntTotalPacketInfo(HashMap<String, Object> inputMap) throws Exception;
	/* 박스 정보 등록 */
	public void packetInfoRegist(HashMap<String, Object> inputMap) throws Exception;
	/* 등록된 박스 정보 수정 */
	public void packetInfoDelete(HashMap<String, Object> inputMap) throws Exception;
	/* 등록된 박스 정보 삭제 */
	public void delPacketInfo(HashMap<String, Object> inputMap) throws Exception;
}
