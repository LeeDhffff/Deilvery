package delivery.A_Login.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("LoginMapper")
public interface LoginMapper {
	// id 중복체크
	String id_chk(HashMap<String, Object> inputMap) throws Exception;
	
	// [관리자] 이름,전화번호 중복체크
	String nm_chk(HashMap<String, Object> inputMap) throws Exception;
	
	// 회원가입
	String Join(HashMap<String, Object> inputMap) throws Exception;
	
	// [관리자]회원가입
	String Join_M(HashMap<String, Object> inputMap) throws Exception;
	
	// 로그인
	HashMap<String, String> Login(HashMap<String, Object> inputMap) throws Exception;

	// 자동로그인
	HashMap<String, String> AutoLogin(HashMap<String, Object> inputMap) throws Exception;
	
	// 비회원 로그인
	HashMap<String, String> Login_B(HashMap<String, Object> inputMap) throws Exception;
	
	// 아이디 찾기
	String find_id(HashMap<String, Object> inputMap) throws Exception;
	// 비밀번호 찾기
	String find_pw(HashMap<String, Object> inputMap) throws Exception;
	// 찾기 후 비밀번호 변경
	String find_pw_change(HashMap<String, Object> inputMap) throws Exception;
}
