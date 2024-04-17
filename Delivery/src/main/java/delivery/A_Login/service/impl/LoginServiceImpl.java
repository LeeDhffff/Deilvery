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
	public String id_chk(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.id_chk(inputMap);
	}

	@Override
	public String Join(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.Join(inputMap);
	}

	@Override
	public HashMap<String, String> Login(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.Login(inputMap);
	}

	
	@Override
	public HashMap<String, String> Login_B(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.Login_B(inputMap);
	}

	@Override
	public String find_id(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.find_id(inputMap);
	}

	@Override
	public String find_pw(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.find_pw(inputMap);
	}

	@Override
	public String find_pw_change(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.find_pw_change(inputMap);
	}

	@Override
	public HashMap<String, String> AutoLogin(HashMap<String, Object> inputMap) throws Exception {
		// TODO Auto-generated method stub
		return LoginMapper.AutoLogin(inputMap);
	}

}