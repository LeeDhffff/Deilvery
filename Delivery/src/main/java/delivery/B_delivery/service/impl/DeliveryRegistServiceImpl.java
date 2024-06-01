package delivery.B_delivery.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import delivery.B_delivery.service.DeliveryRegistService;

@Service("DeliveryRegistService")
public class DeliveryRegistServiceImpl implements DeliveryRegistService{
	
	@Resource(name="DeliveryRegistMapper")
	private DeliveryRegistMapper delRegistMapper;

	
	/************************** 공통파트 start!! ********************************/
	
	/* 접속한 member 정보 가져오기 */
	@Override
	public List<HashMap<String, String>> memInfoList(HashMap<String, Object> inputMap) throws Exception {
		return delRegistMapper.memInfoList(inputMap);
	}
	
	
	
	
	
	
	/************************** 회원파트 start!! ********************************/
	
	/* 회원 배송신청 등록 */
	@Override
	public void userDelRegist(HashMap<String, Object> inputMap) throws Exception {
		
		Date nowDate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat creDay = new SimpleDateFormat("yyyy-MM-dd");
		sdf.format(nowDate);
		inputMap.put("creDay", creDay.format(nowDate));
		
		/* IN_KEY 초기화 */
		String inKey = "";
		String inKeyDay = sdf.format(nowDate);
		String inKeyHead = "IN";
		String inKeyFoot = "";
		inputMap.put("inKeyDay", inKeyDay);
		
		int cntInKey = delRegistMapper.cntInKey(inputMap);
		if(cntInKey > 0) {
			inKey = delRegistMapper.lastInKey(inputMap);
			inKeyHead = inKey.substring(0,10);
			inKeyFoot = ""+(Integer.parseInt(inKey.substring(10))+1);
			inKey = inKeyHead + inKeyFoot;
		}else {
			inKey = inKeyHead+inKeyDay+1;
		}
		System.out.println("inKey : " + inKey);
		System.out.println("inKeyHead : " + inKeyHead);
		System.out.println("inKeyFoot : " + inKeyFoot);
		inputMap.put("inKey", inKey);
		
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
	
	/* 택배사 조회 */
	@Override
	public List<HashMap<String, String>> shipComList(HashMap<String, Object> inputMap) throws Exception {
		
		return delRegistMapper.shipComList(inputMap);
	}
	
	/* 박스정보 가져오기 */
	@Override
	public List<HashMap<String, String>> packInfoList(HashMap<String, Object> inputMap) throws Exception {
		
		return delRegistMapper.packInfoList(inputMap);
	}	
	
	/* ************************************************************************************** */
	/* *******************    after 5/29 Test!!!!    **************************************** */
	/* ************************************************************************************** */	
		
	/* 배송신청등록 (240529 이후 테스트 중) ==> inKey가 없다 */
	@Override
	public String adminDelRegist(HashMap<String, Object> inputMap) throws Exception {
		
		String resultMsg = "inKey is not exist!!";
		String inKey = "";		
		int inKeyCnt = delRegistMapper.chkInKey(inputMap);
		
		if(inKeyCnt > 0) {
			// 동일한 날짜에 등록된 접수건이 있는 경우
			inKey = "IN"+inputMap.get("creDay").toString().replace("-", "")+(inKeyCnt+1);
			inputMap.put("inKey", inKey);
			System.out.println("inputMap : " + inputMap);
			
			/* insert application */
			delRegistMapper.adminDelRegist(inputMap);
			
			resultMsg = "Y";
			
		}else {
			// 동일한 날짜에 등록된 접수건이 없는 경우
			inKey = "IN"+inputMap.get("creDay").toString().replace("-", "")+1;
			inputMap.put("inKey", inKey);
			System.out.println("inputMap : " + inputMap);
			
			/* insert application */
			delRegistMapper.adminDelRegist(inputMap);
			
			resultMsg = "Y";

		}
		
		return resultMsg;
	}


	/* 미확인 배송신청, 물류접수-수정 (240529 이후 테스트 중) ==> inKey가 있다 */
	@Override
	public String adminDelUpdate(HashMap<String, Object> inputMap) throws Exception {
		
		String resultMsg = "inKey is exist!!";
		String inKey = (String) inputMap.get("inKey");
		
		/* update application */
		delRegistMapper.adminDelUpdate(inputMap);
		
		resultMsg = "Y";
		
		return resultMsg;
	}

	/* 박스정보 등록 (240529 이후 Update) */
	@Override
	public String adminBoxRegist(HashMap<String, Object> inputMap) throws Exception {
		
		System.out.println("inputMap adminBoxRegist : " + inputMap);		
		
		String resultMsg = "관리자 박스정보 등록";
		String sjHead = "EK";
		String sjKey = "";
		String inKey = (String) inputMap.get("inKey");
		int cnt;
		String [] widthArr = inputMap.get("widthArr").toString().split(",");
		String [] heightArr = inputMap.get("heightArr").toString().split(",");
		String [] lengthArr = inputMap.get("lengthArr").toString().split(",");
		String [] weightArr = inputMap.get("weightArr").toString().split(",");
		String [] costArr = inputMap.get("costArr").toString().split(",");
		
		/* check SN count (from OUT_KEY) */
		cnt = delRegistMapper.checkSnOutKey(inputMap);
		String initSjKey = (String) inputMap.get("initSjKey");
		System.out.println("cnt : "+ cnt);
		System.out.println("initSjKey : "+ initSjKey);
		
		if(cnt > 0) {
			// SJ_KEY 추가 발급 또는 기존 박스 정보 수정(EK2~)			
			if(initSjKey != null && initSjKey.length() != 0) {
				// 등록된 송장 번호가 있는 경우(ex.동일한 출항일 기존 박스 정보 전체 삭제 후 등록 또는 수정)
				// inKey 기준 등록된 박스 정보 일괄 삭제
				delRegistMapper.packetInfoDelete(inputMap);
				for(int i=0; i<widthArr.length; i++) {
					sjKey = initSjKey+(i+1);
					inputMap.put("sjKey", sjKey);
					inputMap.put("width", widthArr[i]);
					inputMap.put("length", lengthArr[i]);
					inputMap.put("height", heightArr[i]);
					inputMap.put("weight", weightArr[i]);
					inputMap.put("cost", costArr[i]);
					
					delRegistMapper.packetInfoRegist(inputMap);
				}
				resultMsg = inKey + "=물류접수가 완료되었습니다.";
				
			}else {
				// 등록된 송장 번호가 없는 경우(ex.동일한 출항일 신규 박스정보 추가 등록)
				initSjKey = sjHead + (cnt+1)+ "-" + inputMap.get("outKey") + "-";
				inputMap.put("sn", (cnt+1));
				
				for(int i=0; i<widthArr.length; i++) {
					sjKey = initSjKey+(i+1);
					inputMap.put("sjKey", sjKey);
					inputMap.put("width", widthArr[i]);
					inputMap.put("length", lengthArr[i]);
					inputMap.put("height", heightArr[i]);
					inputMap.put("weight", weightArr[i]);
					inputMap.put("cost", costArr[i]);
					
					delRegistMapper.packetInfoRegist(inputMap);
				}
				resultMsg = inKey + "=물류접수가 완료되었습니다.";
			}
			
		}else {
			
			// SJ_KEY 신규 발급(EK1)
			initSjKey = sjHead + "1-" + inputMap.get("outKey") + "-";
			inputMap.put("sn", (cnt+1));
			
			for(int i=0; i<widthArr.length; i++) {
				sjKey = initSjKey+(i+1);
				inputMap.put("sjKey", sjKey);
				inputMap.put("width", widthArr[i]);
				inputMap.put("length", lengthArr[i]);
				inputMap.put("height", heightArr[i]);
				inputMap.put("weight", weightArr[i]);
				inputMap.put("cost", costArr[i]);
				
				delRegistMapper.packetInfoRegist(inputMap);
			}
			resultMsg = inKey + "=물류접수가 완료되었습니다.";
		}		
		
		return resultMsg;
		
	}	
	
}
