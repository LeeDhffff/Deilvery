package delivery.E_Mobile;

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

import delivery.E_Mobile.service.MobileService;

@Controller
public class MobileController {
	
	@Resource(name = "MobileService")
	private MobileService MobileService;
	
	// 모바일 로딩창으로 이동 //
	@RequestMapping("/Mobile.do")
	public String Load() {
		return "5.MobileLogin/Load";
	}

	// 모바일 로딩창으로 이동 //
	@RequestMapping("/Mobile_Login.do")
	public String Mobile_Login() {
		return "5.MobileLogin/MobileLogin";
	}

	// 모바일 로딩창으로 이동 //
	@RequestMapping("/Mobile_Login_B.do")
	public String Mobile_Login_B() {
		return "5.MobileLogin/MobileLogin_B";
	}

	// 모바일 로딩창으로 이동 //
	@RequestMapping("/Mobile_Join.do")
	public String Mobile_Join() {
		return "5.MobileLogin/MobileJoin";
	}

	// 모바일 로딩창으로 이동 //
	@RequestMapping("/Mobile_JoinComplete.do")
	public String Mobile_JoinComplete() {
		return "5.MobileLogin/MobileJoinComplete";
	}
	
	// 모바일 메인페이지로 이동 //
	@RequestMapping("/Mobile_Main.do")
	public ModelAndView Mobile_Main(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession httpSession = request.getSession(true);
		
		if(httpSession.getAttribute("SESSION_MEM_NM") != null){

			mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));
		}
		else if(httpSession.getAttribute("SESSION_PROTO_NM") != null){
			mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_PROTO_NM")));
		}

		mav.setViewName("6.MobileMain/MobileMain");
		
		return mav;
	}

	// 모바일 관리자용 메인페이지로 이동 //
	@RequestMapping("/Mobile_ManagerMain.do")
	public ModelAndView Mobile_ManagerMain(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession httpSession = request.getSession(true);
		
		if(httpSession.getAttribute("SESSION_MEM_NM") != null){

			mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));
		}

		mav.setViewName("8.MobileManager/MobileManagerMain");
		
		return mav;
	}
	
	// 모바일 사용자 배송현황 검색페이지 이동 //
	@RequestMapping("/Mobile_Delivery_Search.do")
	public ModelAndView Mobile_Delivery_Search(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
//		mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));

		mav.setViewName("7.MobileDelivery/MobileDelivery_Search");
		
		return mav;
	}

	// 모바일 비로그인 배송현황 //
	@RequestMapping("/Mobile_Delivery_Search_B.do")
	public ModelAndView Mobile_Delivery_Search_B(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
//		mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));

		mav.setViewName("7.MobileDelivery/MobileDelivery_Search_B");
		
		return mav;
	}

	// 모바일 비로그인 배송현황 검색결과 //
	@RequestMapping("/Mobile_Delivery_Search_B_CHK.do")
	public ModelAndView Mobile_Delivery_Search_B_CHK(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
//		mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));

		mav.setViewName("7.MobileDelivery/MobileDelivery_Search_B_CHK");
		
		return mav;
	}
	// 모바일 사용자 배송현황 상세 //
	@RequestMapping("/Mobile_Delivery_Detail.do")
	public ModelAndView Mobile_Delivery_Detail(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
		mav.addObject("inkey", inputMap.get("ik"));
		mav.addObject("memid", inputMap.get("id"));

		mav.setViewName("7.MobileDelivery/MobileDelivery_Detail");
		
		return mav;
	}
	

	/* 모바일 관리자용 배송신청목록페이지로 이동 */
	@RequestMapping("/Mobile_M_DeliveryList.do")
	public ModelAndView DeliveryList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		

		mav.setViewName("8.MobileManager/MobileDeliveryList");
		
		return mav;
	}

	/* 모바일 관리자용 배송신청목록페이지로 이동 */
	@RequestMapping("/Mobile_M_OutdayList.do")
	public ModelAndView OutdayList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		

		mav.setViewName("8.MobileManager/MobileOutdayList");
		
		return mav;
	}

	/* 모바일 관리자용 배송신청목록페이지로 이동 */
	@RequestMapping("/Mobile_M_Outday.do")
	public ModelAndView MobileOutday(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		

		mav.setViewName("8.MobileManager/MobileOutday");
		
		return mav;
	}
	
	/* 모바일 관리자용 배송신청목록페이지로 이동 */
	@RequestMapping("/Mobile_M_MemberList.do")
	public ModelAndView MemberList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		

		mav.setViewName("8.MobileManager/MobileMemberList");
		
		return mav;
	}

}