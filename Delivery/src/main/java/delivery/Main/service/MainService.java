package delivery.Main.service;

import java.util.HashMap;
import java.util.List;

public interface MainService {
	// 로그인
	List<HashMap<String, String>> signin(HashMap<String, Object> inputMap) throws Exception;
	
}