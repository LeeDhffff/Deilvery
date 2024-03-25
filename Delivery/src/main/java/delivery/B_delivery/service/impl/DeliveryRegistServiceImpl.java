package delivery.B_delivery.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import delivery.B_delivery.service.DeliveryRegistService;

@Service("DeliveryRegistService")
public class DeliveryRegistServiceImpl implements DeliveryRegistService{
	
	@Resource(name="DeliveryRegistMapper")
	private DeliveryRegistMapper delRegistMapper;

	
	/************************** 회원파트 start!! ********************************/
	
	/* 회원 배송신청 등록 */
	@Override
	public void userDelRegist(HashMap<String, Object> inputMap) throws Exception {
		
		delRegistMapper.userDelRegist(inputMap);
	}
	
	
	
	
	
	
	/************************** 관리자파트 start!! ********************************/
	
	/* 미완료 배송건 조회 */
	@Override
	public HashMap<String, String> ingDeliveryRead(HashMap<String, Object> inputMap) throws Exception {

		return delRegistMapper.ingDeliveryRead(inputMap);
	}
	/* 출항일 조회 */
	@Override
	public List<HashMap<String, String>> outDayList(HashMap<String, Object> inputMap) throws Exception {
		
		return delRegistMapper.outDayList(inputMap);
	}
	
	/* 박스정보 가져오기 */
	@Override
	public List<HashMap<String, String>> packInfoList(HashMap<String, Object> inputMap) throws Exception {
		
		return delRegistMapper.packInfoList(inputMap);
	}
	
	/* 관리자 배송신청 등록 */
	@Override
	public String adminDelRegist(HashMap<String, Object> inputMap) throws Exception {
		
		String resultMsg = "";
		
		if(inputMap.get("inKey").toString() != null && !inputMap.get("inKey").toString().equals("")) {
			/* 배송신청 내용 등록 */
			delRegistMapper.adminDelRegist(inputMap);
			
			/* 등록된 박스정보 삭제(IN_KEY 기준) */
			delRegistMapper.delPacketInfo(inputMap);
			
			/* 등록된 박스정보 확인(OUT_KEY 기준) */
			Integer cnt = delRegistMapper.cntTotalPacketInfo(inputMap);
			
			/* 박스정보 설정 */
			String [] widthArr = inputMap.get("widthArr").toString().split(",");
			String [] heightArr = inputMap.get("heightArr").toString().split(",");
			String [] lengthArr = inputMap.get("lengthArr").toString().split(",");
			String [] weightArr = inputMap.get("weightArr").toString().split(",");
			String sjKey = "EK";
			String outKey = inputMap.get("outKey").toString();
			
			for(int i=0; i<widthArr.length; i++) {
				inputMap.put("width", widthArr[i]);
				inputMap.put("height", heightArr[i]);
				inputMap.put("length", lengthArr[i]);
				inputMap.put("weight", weightArr[i]);
				inputMap.put("sjKey", (sjKey+(cnt+(i+1))+"-"+outKey+"-"+(i+1)));
				
				System.out.println("width ["+i+"] : " + inputMap.get("width"));
				System.out.println("height ["+i+"] : " + inputMap.get("height"));
				System.out.println("length ["+i+"] : " + inputMap.get("length"));
				System.out.println("weight ["+i+"] : " + inputMap.get("weight"));
				System.out.println("sjKey : " + inputMap.get("sjKey"));
				
				
				/* 박스 정보 등록 */
				delRegistMapper.packetInfoRegist(inputMap);	
				
			}
			resultMsg = "배송신청을 완료했습니다.";
		}else {
			resultMsg = "배송신청에 실패했습니다. 관리자에게 문의해주세요.";
		}
				
		return resultMsg;		
		
	}
	
}
