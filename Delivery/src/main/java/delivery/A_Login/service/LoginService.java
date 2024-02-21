package delivery.A_Login.service;

import java.util.HashMap;
import java.util.List;

public interface LoginService {
	// 회원가입
	HashMap<String, String> Join(HashMap<String, Object> inputMap) throws Exception;
	
}