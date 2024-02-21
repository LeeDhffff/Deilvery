package delivery.Main.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("MainMapper")
public interface MainMapper {
	// 로그인
	List<HashMap<String, String>> signin(HashMap<String, Object> inputMap) throws Exception;
}
