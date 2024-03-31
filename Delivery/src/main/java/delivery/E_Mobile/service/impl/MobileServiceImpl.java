package delivery.E_Mobile.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import delivery.E_Mobile.service.MobileService;

@Service("MobileService")
public class MobileServiceImpl implements MobileService {
	@Resource(name="MobileMapper")
	private MobileMapper MobileMapper;

	

}