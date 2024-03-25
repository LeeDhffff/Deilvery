/*
 * Copyright 2008-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package delivery.B_delivery.web;

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

import delivery.B_delivery.service.DeliveryRegistService;

/**
 * @Class Name : DeliveryRegistController.java
 * @Description : DeliveryRegist Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2009.03.16           최초생성
 *
 * @author 장연우
 * @since 2024. 03.17
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class DeliveryRegistController {

	/** DeliveryRegistService */
	@Resource(name = "DeliveryRegistService")
	private DeliveryRegistService delRegistService;
	

	
	/************************** 회원파트 start!! ********************************/
	
	/* 사용자 배송신청 화면 진입 */
	@RequestMapping("userDeliveryRegistMain.do")
	public String userDeliveryRegistMain(){
		return "2.Delivery/userDeliveryRegist";
	}

	/* 회원 배송신청 등록 */
	@RequestMapping(value = "/userDelRegist.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String userDelRegist(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		
		
		inputMap.put("inKey", "US24031704");
		if(!session.getAttribute("SESSION_MEM_ID").equals(null)) {
			inputMap.put("memId", (String)(session.getAttribute("SESSION_MEM_ID")));	
		}
		else if(!session.getAttribute("SESSION_PROTO_ID").equals(null)) {
			inputMap.put("memId", (String)(session.getAttribute("SESSION_PROTO_ID")));	
		}
		System.out.println("key : " + inputMap.keySet().toString());
		System.out.println("values : " + inputMap.values().toString());
		
		delRegistService.userDelRegist(inputMap);
		
		return "배송신청을 완료했습니다.";
		
	}
	
	/* 회원 배송신청결과 화면 진입 */
	@RequestMapping("userDeliveryRegistResult.do")
	public String userDeliveryRegistResult(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		return "2.Delivery/userDeliveryRegistResult";
	}
	
	
	
	
	
	
	
	
	/************************** 관리자파트 start!! ********************************/
	
	/* 관리자 배송신청 화면 진입 */
	@RequestMapping("adminDeliveryRegistMain.do")
	@ResponseBody
	public ModelAndView adminDeliveryRegistMain(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();

		// 관리자 검증 부분 구현 필요
		
		
		// 선택한 데이터 가지고 오기
		
		inputMap.put("inKey", inputMap.get("ik"));
		
		HashMap<String, String> ingDelRead = delRegistService.ingDeliveryRead(inputMap);
		
		// 박스정보 가지고 오기
		List<HashMap<String, String>> packInfo = delRegistService.packInfoList(inputMap);
		
		// 출항일 데이터 가지고 오기
		List<HashMap<String, String>> outDayList = delRegistService.outDayList(inputMap);

		mav.addObject("result", ingDelRead);
		mav.addObject("outDayList", outDayList);
		mav.addObject("packInfo", packInfo);
		
		mav.setViewName("2.Delivery/adminDeliveryRegist");
		
		return mav;
		
	}
	
	/* 관리자 배송신청 등록 */
	@RequestMapping(value = "/adminDelRegist.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String adminDelRegist(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		inputMap.put("chk", "Y");
		System.out.println("key : " + inputMap.keySet().toString());
		System.out.println("values : " + inputMap.values().toString());
		
		String resultMsg = delRegistService.adminDelRegist(inputMap);
		
		return resultMsg;
		
	}
	

}
