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


}