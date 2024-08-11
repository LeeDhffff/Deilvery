package delivery.lao.C_Delivery;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import delivery.B_delivery.service.DeliveryRegistService;
import delivery.C_Delivery.service.DeliveryService;

/**
 * @Class Name : DeliveryController.java
 * @Description : Delivery Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.03.25  이동헌           최초생성
 *
 * @author 이동헌
 * @since 2024. 03.05
 * @version 1.0
 * @see
 *
 *  Copyright (C) by LLJ All right reserved.
 */
@Controller
public class L_DeliveryController {
	
	@Resource(name = "DeliveryService")
	private DeliveryService DeliveryService;
	
	/** DeliveryRegistService */
	@Resource(name = "DeliveryRegistService")
	private DeliveryRegistService delRegistService;
	
	/* 배송신청 목록 검색페이지로 이동.(사용자) */
	@RequestMapping("/lao/Delivery_Search.do")
	public String Delivery_Search() {
		return "2.Delivery/Delivery_Search";
	}

	
	/* 배송신청 목록 검색페이지로 이동.(비회원, 로그인 필요X) */
	@RequestMapping("/lao/Delivery_Search_B.do")
	public String Delivery_Search_B() {
		return "2.Delivery/Delivery_Search_B";
	}

	/* 배송신청 목록 검색페이지로 이동.(비회원, 로그인 필요X) */
	@RequestMapping("/lao/Delivery_Search_B_CHK.do")
	public String Delivery_Search_B_CHK() {
		return "2.Delivery/Delivery_Search_B_CHK";
	}

	/* 배송신청 목록 검색페이지로 이동.(사용자) */
	@RequestMapping("/lao/Delivery_Search_A.do")
	public ModelAndView Delivery_Search_A(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		inputMap.put("IN_KEY",inputMap.get("ik"));
		
		HashMap<String, String> DeliveryList = DeliveryService.Delivery_Search_A(inputMap);
		// 택배사 데이터 가지고 오기
		List<HashMap<String, String>> shipComList = delRegistService.shipComList(inputMap);
		
		
		mav.addObject("IN_KEY", inputMap.get("ik"));
		mav.addObject("Dlist", DeliveryList);
		mav.addObject("shipComList", shipComList);

		mav.setViewName("lao/2.Delivery/Delivery_Search_A");
		
		return mav;
	}
	

}