package delivery.B_delivery.service.impl;

import java.lang.reflect.Array;
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
	
	/* 관리자 배송신청 등록 */
	@Override
	public String adminDelRegist(HashMap<String, Object> inputMap) throws Exception {
		
		String resultMsg = "";
		String sjKeyHead = "";
		
		if(inputMap.get("inKey") != null && inputMap.get("inKey") != "") {
			System.out.println("inKey exist");
			/* 배송신청 내용 수정 */
			delRegistMapper.adminDelUpdate(inputMap);
			
			/* 박스정보 설정 */
			if(inputMap.get("sjKeyArr") != null && inputMap.get("sjKeyArr") != "") {
				System.out.println("sjKey exist 물류접수-수정");
				
				String [] widthArr = inputMap.get("widthArr").toString().split(",");		
				String [] heightArr = inputMap.get("heightArr").toString().split(",");
				String [] lengthArr = inputMap.get("lengthArr").toString().split(",");
				String [] weightArr = inputMap.get("weightArr").toString().split(",");
				String [] sjKeyArr = inputMap.get("sjKeyArr").toString().split(",");
				
				/* 등록된 outKey 값 확인(SJ_KEY 기준) */
				String outKey = delRegistMapper.lastOutKey(inputMap);
				System.out.println("outKey : " + outKey + " == inputMap.outKey : " + inputMap.get("outKey"));
				
				if(outKey != null && outKey != "") {
					if(outKey.equals(inputMap.get("outKey"))) {
						System.out.println("outKey is equal");
						sjKeyHead = sjKeyArr[0].split("-")[0] + "-" + sjKeyArr[0].split("-")[1] + "-";
						/* 등록된 박스 sn값 확인(SJ_KEY 기준) */
						Integer sn = delRegistMapper.snSjKeyInfo(inputMap);
						inputMap.put("sn", sn);
					}else {
						System.out.println("outKey is not equal");
						/* 등록된 박스정보 확인(OUT_KEY 기준) */					
						Integer cnt = delRegistMapper.cntTotalPacketInfo(inputMap);
						inputMap.put("sn", (cnt+1));
						sjKeyHead = "EK"+(cnt+1)+"-"+inputMap.get("outKey")+"-";
					}
				}else {
					resultMsg = "outKey is null or blank. 관리자에게 문의해주세요."; 
					return resultMsg;
				}				
				
				/* 등록된 박스정보 초기화(sjKey 삭제) */
				delRegistMapper.packetInfoDelete(inputMap);
												
				for(int i=0; i<widthArr.length; i++) {
					inputMap.put("width", widthArr[i]);
					inputMap.put("height", heightArr[i]);
					inputMap.put("length", lengthArr[i]);
					inputMap.put("weight", weightArr[i]);
					inputMap.put("sjKey", sjKeyHead+(i+1));
					
					System.out.print("width ["+i+"] : " + inputMap.get("width"));
					System.out.print(" height ["+i+"] : " + inputMap.get("height"));
					System.out.print(" length ["+i+"] : " + inputMap.get("length"));
					System.out.print(" weight ["+i+"] : " + inputMap.get("weight"));
					System.out.println("sjKey ["+i+"] : " + inputMap.get("sjKey"));
					
					/* 등록된 박스정보 수정(insert) */
					delRegistMapper.packetInfoRegist(inputMap);

				}
				resultMsg = "배송정보를 수정했습니다.";
				
			}else {
				System.out.println("sjKey not exist 미완료 배송신청-등록");
				
				/* 등록된 sjKey 유무 체크(IN_KEY 기준) */
				String lastSjKey = delRegistMapper.lastSjKey(inputMap);
				System.out.println("lastSjKey : " + lastSjKey);
				if(!lastSjKey.equals("N")) {
					System.out.println("lastSjKey is exist.");
					inputMap.put("sjKey", lastSjKey);
					
					/* 등록된 outKey 값 확인(SJ_KEY 기준) */
					String outKey = delRegistMapper.lastOutKey(inputMap);
					System.out.println("outKey : " + outKey + " == inputMap.outKey : " + inputMap.get("outKey"));
					
					if(outKey != null && outKey != "") {
						if(outKey.equals(inputMap.get("outKey"))) {
							System.out.println("outKey is equal");
							
							/* 등록된 박스 sn값 확인(IN_KEY 기준) */
							Integer sn = delRegistMapper.snInkeyInfo(inputMap);
							/* 등록된 박스정보 확인(OUT_KEY 기준) */					
							Integer cnt = delRegistMapper.cntTotalPacketInfo(inputMap);
							String sjKey = "EK";				
							
							if(sn!=0) {
								System.out.println("sn is not null : " + sn);
								inputMap.put("sn", sn);
								sjKeyHead = sjKey+sn;
							}else {
								System.out.println("sn is null : " + cnt);
								inputMap.put("sn", (cnt+1));
								sjKeyHead = sjKey+(cnt+1);
							}
						}else {
							System.out.println("outKey is not equal");
							/* 등록된 박스정보 확인(OUT_KEY 기준) */					
							Integer cnt = delRegistMapper.cntTotalPacketInfo(inputMap);
							inputMap.put("sn", (cnt+1));
							sjKeyHead = "EK"+(cnt+1);
						}
					}else {
						resultMsg = "outKey is null or blank. 관리자에게 문의해주세요."; 
						return resultMsg;
					}
					
				}else {					
					System.out.println("lastSjKey is not exist.");
					
					/* 등록된 박스 sn값 확인(IN_KEY 기준) */
					Integer sn = delRegistMapper.snInkeyInfo(inputMap);
					/* 등록된 박스정보 확인(OUT_KEY 기준) */					
					Integer cnt = delRegistMapper.cntTotalPacketInfo(inputMap);
					String sjKey = "EK";				
					
					if(sn!=0) {
						System.out.println("sn is not null : " + sn);
						inputMap.put("sn", sn);
						sjKeyHead = sjKey+sn;
					}else {
						System.out.println("sn is null : " + cnt);
						inputMap.put("sn", (cnt+1));
						sjKeyHead = sjKey+(cnt+1);
					}
					
					System.out.println("last sn : " + inputMap.get("sn"));
				}
				
				/* 등록된 박스정보 초기화(sjKey 삭제) */
				delRegistMapper.packetInfoDelete(inputMap);	
				
				/* 박스정보 설정 */
				String [] widthArr = inputMap.get("widthArr").toString().split(",");
				String [] heightArr = inputMap.get("heightArr").toString().split(",");
				String [] lengthArr = inputMap.get("lengthArr").toString().split(",");
				String [] weightArr = inputMap.get("weightArr").toString().split(",");
				
				String outKey = inputMap.get("outKey").toString();
				
				for(int i=0; i<widthArr.length; i++) {
					inputMap.put("width", widthArr[i]);
					inputMap.put("height", heightArr[i]);
					inputMap.put("length", lengthArr[i]);
					inputMap.put("weight", weightArr[i]);
					inputMap.put("sjKey", (sjKeyHead+"-"+outKey+"-"+(i+1)));
					
					System.out.print("width ["+i+"] : " + inputMap.get("width"));
					System.out.print(" height ["+i+"] : " + inputMap.get("height"));
					System.out.print(" length ["+i+"] : " + inputMap.get("length"));
					System.out.print(" weight ["+i+"] : " + inputMap.get("weight"));
					System.out.println("sjKey : " + inputMap.get("sjKey"));
					
					/* 박스 정보 등록 */
					delRegistMapper.packetInfoRegist(inputMap);
					
				}
				
				resultMsg = "배송정보를 수정했습니다.";
				
			}
		}else {
			System.out.println("inKey empty 물류접수-등록");
			/* IN_KEY 초기화 */
			String inKey = "";			
			String inKeyDay = inputMap.get("creDay").toString().replace("-", "");
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
			
			/* 배송신청 내용 등록 */
			delRegistMapper.adminDelRegist(inputMap);			
			
			/* 등록된 박스정보 확인(OUT_KEY 기준) */
			Integer cnt = delRegistMapper.cntTotalPacketInfo(inputMap);
			inputMap.put("sn", (cnt+1));
			
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
				inputMap.put("sjKey", (sjKey+(cnt+1)+"-"+outKey+"-"+(i+1)));
				
				System.out.print("width ["+i+"] : " + inputMap.get("width"));
				System.out.print(" height ["+i+"] : " + inputMap.get("height"));
				System.out.print(" length ["+i+"] : " + inputMap.get("length"));
				System.out.print(" weight ["+i+"] : " + inputMap.get("weight"));
				System.out.println("sjKey : " + inputMap.get("sjKey"));
				
				/* 박스 정보 등록 */
				delRegistMapper.packetInfoRegist(inputMap);
				
			}
			
			resultMsg = inKey+"=배송신청을 완료했습니다.";
		}
				
		return resultMsg;		
		
	}
	
}
