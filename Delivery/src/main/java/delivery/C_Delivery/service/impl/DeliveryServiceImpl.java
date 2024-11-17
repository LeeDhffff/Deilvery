package delivery.C_Delivery.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import delivery.C_Delivery.service.DeliveryService;

@Service("DeliveryService")
public class DeliveryServiceImpl implements DeliveryService {
	@Resource(name="DeliveryMapper")
	private DeliveryMapper DeliveryMapper;

	@Override
	public HashMap<String, String> Delivery_Mem_Info(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Mem_Info(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Delivery_Mem_History(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Mem_History(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Delivery_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Select(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Delivery_Select_D(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Select_D(inputMap);
	}

	@Override
	public String Delivery_Select_B_CHK(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Select_B_CHK(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Delivery_Select_B(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Select_B(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Delivery_Select_O(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Select_O(inputMap);
	}

	@Override
	public HashMap<String, String> Status_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Status_Select(inputMap);
	}

	@Override
	public HashMap<String, String> Delivery_Search_A(HashMap<String, Object> inputMap) throws Exception {

		// TODO Auto-generated method stub
		return DeliveryMapper.Delivery_Search_A(inputMap);
	}

	@Override
	public String Pickup_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return DeliveryMapper.Pickup_Insert(inputMap);
	}

	@Override
	public String Pickup_Insert_deadline(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		

		String [] inkeys = inputMap.get("Inkey").toString().split(",");
		String [] targets = inputMap.get("Itarget").toString().split(",");
		String [] addrs = inputMap.get("Iaddr").toString().split(",");
		String [] hous = inputMap.get("Ihou").toString().split(",");
		
		for(int i=0; i<inkeys.length; i++) {
			inputMap.put("IN_KEY",inkeys[i]);
		    inputMap.put("TARGET",targets[i]);
		    inputMap.put("ADDR",addrs[i]);
		    inputMap.put("HOU",hous[i]);
			String vars = DeliveryMapper.Pickup_Insert(inputMap);
		}
		
		String resultMsg = "선택한 품목이 마감되었습니다.";
		
		return resultMsg;
	}
	

}