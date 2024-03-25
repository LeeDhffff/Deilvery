package delivery.B_delivery.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("DeliveryRegistMapper")
public interface DeliveryRegistMapper {

	/************************** 회원파트 start!! ********************************/
	
	/* 회원 배송신청 등록 */
	public void userDelRegist(HashMap<String, Object> inputMap) throws Exception;

	
	
	
	
	
	
	/************************** 관리자파트 start!! ********************************/
	
	/* 미완료 배송건 조회 */
	public HashMap<String, String> ingDeliveryRead(HashMap<String, Object> inputMap) throws Exception;
	/* 출항일 조회 */
	public List<HashMap<String, String>> outDayList(HashMap<String, Object> inputMap) throws Exception;
	/* 박스정보 가져오기 */
	public List<HashMap<String, String>> packInfoList(HashMap<String, Object> inputMap) throws Exception;
		
	/* 관리자 배송신청 등록 */
	public void adminDelRegist(HashMap<String, Object> inputMap) throws Exception;
	/* 박스 정보 등록 체크 */
	public int cntTotalPacketInfo(HashMap<String, Object> inputMap) throws Exception;
	/* 박스 정보 등록 */
	public void packetInfoRegist(HashMap<String, Object> inputMap) throws Exception;
	/* 등록된 박스 정보 삭제 */
	public void delPacketInfo(HashMap<String, Object> inputMap) throws Exception;
}
