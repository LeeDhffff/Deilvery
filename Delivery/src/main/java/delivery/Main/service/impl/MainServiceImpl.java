package delivery.Main.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import delivery.Main.service.MainService;

@Service("MainService")
public class MainServiceImpl implements MainService {
	@Resource(name="MainMapper")
	private MainMapper MainMapper;
	
	@Override
	public List<HashMap<String, String>> signin(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return MainMapper.signin(inputMap);
	}

}