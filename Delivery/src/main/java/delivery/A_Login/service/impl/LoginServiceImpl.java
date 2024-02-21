package delivery.A_Login.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import delivery.A_Login.service.LoginService;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
	@Resource(name="LoginMapper")
	private LoginMapper LoginMapper;
	
	@Override
	public HashMap<String, String> Join(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.Join(inputMap);
	}

}