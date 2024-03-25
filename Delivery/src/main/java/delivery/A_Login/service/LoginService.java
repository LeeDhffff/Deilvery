package delivery.A_Login.service;

import java.util.HashMap;
import java.util.List;

public interface LoginService {
	// id 중복체크
	String id_chk(HashMap<String, Object> inputMap) throws Exception;
	
	// 회원가입
	String Join(HashMap<String, Object> inputMap) throws Exception;
	
	// 로그인
	HashMap<String, String> Login(HashMap<String, Object> inputMap) throws Exception;

	// 비회원 로그인
	HashMap<String, String> Login_B(HashMap<String, Object> inputMap) throws Exception;
	
	// 아이디 찾기
	String find_id(HashMap<String, Object> inputMap) throws Exception;
	// 비밀번호 찾기
	String find_pw(HashMap<String, Object> inputMap) throws Exception;
	// 찾기 후 비밀번호 변경
	String find_pw_change(HashMap<String, Object> inputMap) throws Exception;
}