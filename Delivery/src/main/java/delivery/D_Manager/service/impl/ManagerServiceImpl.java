package delivery.D_Manager.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import delivery.D_Manager.service.ManagerService;

@Service("ManagerService")
public class ManagerServiceImpl implements ManagerService {
	@Resource(name="ManagerMapper")
	private ManagerMapper ManagerMapper;

	@Override
	public List<HashMap<String, String>> Member_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Member_Select(inputMap);
	}

	@Override
	public String Member_Modify(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Member_Modify(inputMap);
	}

	@Override
	public String Member_Modify_Discount(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		   
		return ManagerMapper.Member_Modify_Discount(inputMap);
	}
	
	@Override
	public String Mem_Pw_Chk(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Mem_Pw_Chk(inputMap);
	}


	@Override
	public List<HashMap<String, String>> Nocomplete_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Nocomplete_Select(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Out_Day_List(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Out_Day_List(inputMap);
	}

	@Override
	public HashMap<String, String> Outday_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Outday_Select(inputMap);
	}

	@Override
	public String Outday_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Outday_Insert(inputMap);
	}

	@Override
	public String Outday_UD(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Outday_UD(inputMap);
	}

	
	@Override
	public List<HashMap<String, String>> Deilvery_Now_List(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Deilvery_Now_List(inputMap);
	}



	@Override
	public List<HashMap<String, String>> Out_Day_File_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Out_Day_File_Select(inputMap);
	}
	
	@Override
	public String Out_Day_File_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Out_Day_File_Insert(inputMap);
	}

	@Override
	public String Out_Day_File_UD(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Out_Day_File_UD(inputMap);
	}

	@Override
	public List<HashMap<String, String>> M_Nocomplete_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.M_Nocomplete_Select(inputMap);
	}

	@Override
	public HashMap<String, String> Emailinfo(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Emailinfo(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Delivery_receipt(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Delivery_receipt(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Delivery_receipt_D(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Delivery_receipt_D(inputMap);
	}

//	@Override
//	public List<HashMap<String, String>> DeliveryCompanyList_Select(HashMap<String, Object> inputMap) throws Exception {
//		// TODO Auto-generated method stub
//		return ManagerMapper.DeliveryCompanyList_Select(inputMap);
//	}

	@Override
	public List<HashMap<String, String>> DeliveryCompanyList_Search(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.DeliveryCompanyList_Search(inputMap);
	}

	@Override
	public String DeliveryCompanyList_IUD(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.DeliveryCompanyList_IUD(inputMap);
	}

	@Override
	public HashMap<String, String> DeliveryCompanyList_Load(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.DeliveryCompanyList_Load(inputMap);
	}

	@Override
	public String Member_Delete(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Member_Delete(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Authority_Select(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Authority_Select(inputMap);
	}

	@Override
	public String Authority_CHK(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Authority_CHK(inputMap);
	}

	@Override
	public String Authority_Insert(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Authority_Insert(inputMap);
	}

	@Override
	public String Authority_Delete(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Authority_Delete(inputMap);
	}

	@Override
	public List<HashMap<String, String>> Manager_List(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Manager_List(inputMap);
	}

	@Override
	public HashMap<String, String> Discount_Load(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return ManagerMapper.Discount_Load(inputMap);
	}

	@Override
	public String Discount_IU(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
			String type	= inputMap.get("TYPE").toString();
		   
		   if(type.equals("A")) {
			   inputMap.put("TARGET","ALL");
			   inputMap.put("SUB_TARGET","");
		   }
		return ManagerMapper.Discount_IU(inputMap);
	}



}