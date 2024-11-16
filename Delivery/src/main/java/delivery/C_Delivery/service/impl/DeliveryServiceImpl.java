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
	

}