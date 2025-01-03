package delivery.C_Delivery;

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
public class DeliveryController {
	
	@Resource(name = "DeliveryService")
	private DeliveryService DeliveryService;
	
	/** DeliveryRegistService */
	@Resource(name = "DeliveryRegistService")
	private DeliveryRegistService delRegistService;
	
	/* 배송신청 목록 검색페이지로 이동.(사용자) */
	@RequestMapping("/Delivery_Search.do")
	public String Delivery_Search() {
		return "2.Delivery/Delivery_Search";
	}

	
	/* 배송신청 목록 검색페이지로 이동.(비회원, 로그인 필요X) */
	@RequestMapping("/Delivery_Search_B.do")
	public String Delivery_Search_B() {
		return "2.Delivery/Delivery_Search_B";
	}

	/* 배송신청 목록 검색페이지로 이동.(비회원, 로그인 필요X) */
	@RequestMapping("/Delivery_Search_B_CHK.do")
	public String Delivery_Search_B_CHK() {
		return "2.Delivery/Delivery_Search_B_CHK";
	}

	/* 배송신청 목록 검색페이지로 이동.(사용자) */
	@RequestMapping("/Delivery_Search_A.do")
	public ModelAndView Delivery_Search_A(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		inputMap.put("IN_KEY",inputMap.get("ik"));
		
		HashMap<String, String> DeliveryList = DeliveryService.Delivery_Search_A(inputMap);
		// 택배사 데이터 가지고 오기
		List<HashMap<String, String>> shipComList = delRegistService.shipComList(inputMap);
		
		
		mav.addObject("IN_KEY", inputMap.get("ik"));
		mav.addObject("Dlist", DeliveryList);
		mav.addObject("shipComList", shipComList);

		mav.setViewName("2.Delivery/Delivery_Search_A");
		
		return mav;
	}
	
	/* 배송신청 목록 검색 */
	@RequestMapping(value = "/Delivery_Select.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> DeliveryList = DeliveryService.Delivery_Select(inputMap);
		System.out.println(DeliveryList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(DeliveryList);
		return jsonStr;
	}

	/* 배송신청 데이터 */
	@RequestMapping(value = "/Delivery_Select_A2.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Select_A2(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		HashMap<String, String> DeliveryList = DeliveryService.Delivery_Search_A(inputMap);
		System.out.println(DeliveryList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(DeliveryList);
		return jsonStr;
	}
	/* 배송신청 상세데이터 */
	@RequestMapping(value = "/Delivery_Select_D.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Select_D(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> DeliveryList = DeliveryService.Delivery_Select_D(inputMap);
		System.out.println(DeliveryList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(DeliveryList);
		return jsonStr;
	}

	/* 배송신청 현황 */
	@RequestMapping(value = "/Delivery_Select_O.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Select_O(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> DeliveryList = DeliveryService.Delivery_Select_O(inputMap);
		System.out.println(DeliveryList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(DeliveryList);
		return jsonStr;
	}
	

	/* 배송신청 비회원 검색(신청한 로그가 있는지 체크) */
	@RequestMapping(value = "/Delivery_Select_B_CHK.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Select_B_CHK(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String DeliveryList = DeliveryService.Delivery_Select_B_CHK(inputMap);
		return DeliveryList;
	}
	

	/* 배송신청 비회원 검색 */
	@RequestMapping(value = "/Delivery_Select_B.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Select_B(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> DeliveryList = DeliveryService.Delivery_Select_B(inputMap);
		System.out.println(DeliveryList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(DeliveryList);
		return jsonStr;
	}

	/* 회원정보를 배송현황 포함해서 불러오기 */
	@RequestMapping(value = "/Delivery_Mem_Info.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Mem_Info(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		HashMap<String, String> LoginList = DeliveryService.Delivery_Mem_Info(inputMap);
		System.out.println(LoginList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}

	/* 회원 이용 내역 가져오기 */
	@RequestMapping(value = "/Delivery_Mem_History.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_Mem_History(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> LoginList = DeliveryService.Delivery_Mem_History(inputMap);
		System.out.println(LoginList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}

	/* 이용횟수, 돈, 다가올 출항일  불러오기. */
	@RequestMapping(value = "/Status_Select.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Status_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		HashMap<String, String> DeliveryList = DeliveryService.Status_Select(inputMap);
		System.out.println(DeliveryList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(DeliveryList);
		return jsonStr;
	}
	

	/* 사용자 픽업지 등록 - 마감 */
	@RequestMapping(value = "/Pickup_Insert_deadline.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Pickup_Insert_deadline(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		
		String LoginList = DeliveryService.Pickup_Insert_deadline(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}
	
	/* 사용자 픽업지 등록 */
	@RequestMapping(value = "/Pickup_Insert.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Pickup_Insert(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		
		String LoginList = DeliveryService.Pickup_Insert(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}
}