package delivery.Main.service.impl;

import java.util.HashMap;
import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("MainMapper")
public interface MainMapper {
	String LOG_MM(HashMap<String, Object> MM) throws Exception;
}
