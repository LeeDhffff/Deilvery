package delivery.A_Login.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("LoginMapper")
public interface LoginMapper {
	// 회원가입
	HashMap<String, String> Join(HashMap<String, Object> inputMap) throws Exception;
}
