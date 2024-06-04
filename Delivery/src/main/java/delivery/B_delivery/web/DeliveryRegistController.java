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
	
	/* PC사용자 배송신청 화면 진입 */
	@RequestMapping(value = "userDeliveryRegistMain.do")
	@ResponseBody
	public ModelAndView userDeliveryRegistMain(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		System.out.println("[inputMap] userDeliveryRegistMain : " + inputMap);
		
		ModelAndView mav = new ModelAndView();
		
		/* memId를 세션값으로 삽입 - (수정자 : 이동헌) */
		if(session.getAttribute("SESSION_MEM_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_MEM_ID")));	
		}
		else if(session.getAttribute("SESSION_PROTO_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_PROTO_ID")));	
		}
		System.out.println("memId : " + inputMap.get("memId"));
		
		/* 접속한 member 정보 가져오기 (JANG) - 생략해도 됨 */
		List<HashMap<String, String>> memInfo = delRegistService.memInfoList(inputMap);
		
		mav.addObject("memInfo", memInfo);		
		mav.setViewName("2.Delivery/userDeliveryRegist");
		
		return mav;
		
	}

	/* PC회원 배송신청 등록 */
	@RequestMapping(value = "/userDelRegist.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String userDelRegist(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("[inputMap] userDelRegist : " + inputMap);
		
		/* memId를 세션값으로 삽입 - (수정자 : 이동헌) */
		if(session.getAttribute("SESSION_MEM_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_MEM_ID")));	
		}
		else if(session.getAttribute("SESSION_PROTO_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_PROTO_ID")));	
		}
		System.out.println("PC회원 배송신청 등록 memId : " + inputMap.get("memId"));
		
		delRegistService.userDelRegist(inputMap);
		
		return "배송신청을 완료했습니다.";
		
	}
	
	/* PC회원 배송신청결과 화면 진입 */
	@RequestMapping("userDeliveryRegistResult.do")
	@ResponseBody
	public ModelAndView userDeliveryRegistResult(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("[inputMap] userDeliveryRegistResult : " + inputMap);
		
		ModelAndView mav = new ModelAndView();

		mav.addObject("memId", inputMap.get("memId"));
		mav.addObject("memNm", inputMap.get("memNm"));		
		mav.setViewName("2.Delivery/userDeliveryRegistResult");
		
		return mav;
	}
	
	
	/* Mobile사용자 배송신청 화면 진입 */
	@RequestMapping(value = "mUserDeliveryRegistMain.do")
	@ResponseBody
	public ModelAndView mUserDeliveryRegistMain(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("[inputMap] mUserDeliveryRegistMain : " + inputMap);
		
		/* memId를 세션값으로 삽입 - (수정자 : 이동헌) */
		if(session.getAttribute("SESSION_MEM_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_MEM_ID")));	
		}
		else if(session.getAttribute("SESSION_PROTO_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_PROTO_ID")));	
		}
		System.out.println("Mobile사용자 배송신청 화면 memId : " + inputMap.get("memId"));
		
		/* 접속한 member 정보 가져오기 (JANG) - 생략해도 됨 */
		List<HashMap<String, String>> memInfo = delRegistService.memInfoList(inputMap);		
		
		mav.addObject("memInfo", memInfo);		
		mav.setViewName("7.MobileDelivery/mUserDeliveryRegist");
		
		return mav;
		
	}
	
	/* Mobile회원 배송신청 등록 */
	@RequestMapping(value = "/mUserDelRegist.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String mUserDelRegist(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("[inputMap] mUserDelRegist : " + inputMap);
		
		/* memId를 세션값으로 삽입 - (수정자 : 이동헌) */
		if(session.getAttribute("SESSION_MEM_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_MEM_ID")));	
		}
		else if(session.getAttribute("SESSION_PROTO_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_PROTO_ID")));	
		}
		System.out.println("Mobile회원 배송신청 등록 memId : " + inputMap.get("memId"));
		
		delRegistService.userDelRegist(inputMap);
		
		return "배송신청을 완료했습니다.";
		
	}
	 
	/* Mobile회원 배송신청결과 화면 진입 */
	@RequestMapping("mUserDeliveryRegistResult.do")
	@ResponseBody
	public ModelAndView mUserDeliveryRegistResult(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("[inputMap] mUserDeliveryRegistResult : " + inputMap);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("memId", inputMap.get("memId"));
		mav.addObject("memNm", inputMap.get("memNm"));		
		mav.setViewName("7.MobileDelivery/mUserDeliveryRegistResult");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	/************************** 관리자파트 start!! ********************************/
	
	/* PC관리자 배송신청 화면 진입 */
	@RequestMapping("adminDeliveryRegistMain.do")
	@ResponseBody
	public ModelAndView adminDeliveryRegistMain(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();

		System.out.println("[inputMap] adminDeliveryRegistMain : " + inputMap);
		
		// 선택한 데이터 가지고 오기		
		inputMap.put("inKey", inputMap.get("ik"));		
		HashMap<String, String> ingDelRead = delRegistService.ingDeliveryRead(inputMap);
		System.out.println("ingDelRead : " + ingDelRead);
		// 박스정보 가지고 오기
		List<HashMap<String, String>> packInfo = delRegistService.packInfoList(inputMap);
		
		// 출항일 데이터 가지고 오기
		List<HashMap<String, String>> outDayList = delRegistService.outDayList(inputMap);
		
		// 택배사 데이터 가지고 오기
		List<HashMap<String, String>> shipComList = delRegistService.shipComList(inputMap);
		
		// 수령인 정보 가지고 오기
		List<HashMap<String, String>> memberList = delRegistService.memberList(inputMap);
		
		// 물류접수자 level 조회
		HashMap<String, String> chkLevel = delRegistService.chkLevel(inputMap);

		mav.addObject("result", ingDelRead);
		mav.addObject("outDayList", outDayList);
		mav.addObject("packInfo", packInfo);
		mav.addObject("shipComList", shipComList);
		mav.addObject("memberList", memberList);
		mav.addObject("chkLevel", chkLevel);
		
		mav.setViewName("2.Delivery/adminDeliveryRegist");
		
		return mav;
		
	}
	
	/* PC관리자 배송신청 등록 */
	@RequestMapping(value = "adminDelRegist.do", produces = "application/text; charset=utf-8" )
	@ResponseBody
	public String adminDelRegist(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		String resultMsg = "";
		
		/* memId를 세션값으로 삽입 - (수정자 : 이동헌) */
		if(session.getAttribute("SESSION_MEM_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_MEM_ID")));	
		}
		else if(session.getAttribute("SESSION_PROTO_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_PROTO_ID")));	
		}
		
		String ik = (String) inputMap.get("inKey");
		
		/* 물류배송 정보 등록 및 수정 */
		if(ik != "" && ik != null && ik.length()!=0) {			
			resultMsg = delRegistService.adminDelUpdate(inputMap);
			System.out.println("inkey 있음 : " + resultMsg);
		}else {
			resultMsg = delRegistService.adminDelRegist(inputMap);			
			System.out.println("inkey 없음 : " + resultMsg);
		}
		
		/* 박스정보 등록 및 수정 */
		if(resultMsg == "Y") {
			/* 박스 등록 실행 */
			resultMsg = delRegistService.adminBoxRegist(inputMap);
		}else {
			resultMsg = "물류접수에 실패했습니다. 관리자에게 문의해주세요.";
		}
		
		return resultMsg;
		
	}
	
	/* Mobile관리자 배송신청 화면1 진입 */
	@RequestMapping("mAdminDeliveryRegistMain.do")
	@ResponseBody
	public ModelAndView mAdminDeliveryRegistMain(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();

		// 선택한 데이터 가지고 오기
		inputMap.put("inKey", inputMap.get("ik"));
		
		HashMap<String, String> ingDelRead = delRegistService.ingDeliveryRead(inputMap);
		
		// 택배사 데이터 가지고 오기
		List<HashMap<String, String>> shipComList = delRegistService.shipComList(inputMap);
		
		// 수령인 정보 가지고 오기
		List<HashMap<String, String>> memberList = delRegistService.memberList(inputMap);

		// 물류접수자 level 조회
		HashMap<String, String> chkLevel = delRegistService.chkLevel(inputMap);
		
		mav.addObject("inputMap", inputMap);
		mav.addObject("result", ingDelRead);		
		mav.addObject("shipComList", shipComList);
		mav.addObject("memberList", memberList);
		mav.addObject("chkLevel", chkLevel);
		
		mav.setViewName("7.MobileDelivery/mAdminDeliveryRegist_A");
		
		System.out.println("[inputMap] mAdminDeliveryRegistMain : " + inputMap);
		System.out.println("result : " + ingDelRead);
		
		return mav;
	}
	
	/* Mobile관리자 배송신청 화면2 진입 */
	@RequestMapping("mAdminDeliveryRegistB.do")
	@ResponseBody
	public ModelAndView mAdminDeliveryRegistB(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		inputMap.put("ik", inputMap.get("inKey"));
		
		// 박스정보 가지고 오기
		List<HashMap<String, String>> packInfo = delRegistService.packInfoList(inputMap);

		mav.addObject("inputMap", inputMap);
		mav.addObject("packInfo", packInfo);
		mav.setViewName("7.MobileDelivery/mAdminDeliveryRegist_B");
		
		System.out.println("[inputMap] mAdminDeliveryRegistB : " + inputMap);
		System.out.println("packInfo : " + packInfo);
		return mav;
	}
	
	/* Mobile관리자 배송신청 화면3 진입 */
	@RequestMapping("mAdminDeliveryRegistC.do")
	@ResponseBody
	public ModelAndView mAdminDeliveryRegistC(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		// 출항일 데이터 가지고 오기
		List<HashMap<String, String>> outDayList = delRegistService.outDayList(inputMap);
		
		mav.addObject("inputMap", inputMap);
		mav.addObject("outDayList", outDayList);
		mav.setViewName("7.MobileDelivery/mAdminDeliveryRegist_C");
		
		System.out.println("[inputMap] mAdminDeliveryRegistC : " + inputMap);
		
		return mav;
	}
	
	
	/* Mobile관리자 배송신청 등록 */
	@RequestMapping(value = "/mAdminDelRegist.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String mAdminDelRegist(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		System.out.println("[inputMap] mAdminDelRegist : " + inputMap);
		
		/* memId를 세션값으로 삽입 - (수정자 : 이동헌) */
		if(session.getAttribute("SESSION_MEM_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_MEM_ID")));	
		}
		else if(session.getAttribute("SESSION_PROTO_ID") != null) {			
			inputMap.put("memId", (String)(session.getAttribute("SESSION_PROTO_ID")));	
		}
		System.out.println("Mobile관리자 배송신청 등록 memId : " + inputMap.get("memId"));
						
		String ik = (String) inputMap.get("inKey");
		String resultMsg = "";
		
		/* 물류배송 정보 등록 및 수정 */
		if(ik != "" && ik != null && ik.length()!=0) {			
			resultMsg = delRegistService.adminDelUpdate(inputMap);
			System.out.println("inkey 있음 : " + resultMsg);
		}else {
			resultMsg = delRegistService.adminDelRegist(inputMap);			
			System.out.println("inkey 없음 : " + resultMsg);
		}
		
		/* 박스정보 등록 및 수정 */
		if(resultMsg == "Y") {
			/* 박스 등록 실행 */
			resultMsg = delRegistService.adminBoxRegist(inputMap);
		}else {
			resultMsg = "물류접수에 실패했습니다. 관리자에게 문의해주세요.";
		}
		
		return resultMsg;
		
	}

}
