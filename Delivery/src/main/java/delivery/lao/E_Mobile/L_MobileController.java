package delivery.lao.E_Mobile;

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
import delivery.D_Manager.service.ManagerService;
import delivery.E_Mobile.service.MobileService;

@Controller
public class L_MobileController {
	
	@Resource(name = "MobileService")
	private MobileService MobileService;

	@Resource(name = "DeliveryService")
	private DeliveryService DeliveryService;

	@Resource(name = "ManagerService")
	private ManagerService ManagerService;

	/** DeliveryRegistService */
	@Resource(name = "DeliveryRegistService")
	private DeliveryRegistService delRegistService;
	
	// 모바일 로딩창으로 이동 //
	@RequestMapping("/lao/Mobile.do")
	public String Load() {
		return "lao/5.MobileLogin/Load";
	}

	// 모바일 로그인페이지로 이동 //
	@RequestMapping("/lao/Mobile_Login.do")
	public String Mobile_Login() {
		return "lao/5.MobileLogin/MobileLogin";
	}

	// 모바일 비회원 로그인페이지로 이동 //
	@RequestMapping("/lao/Mobile_Login_B.do")
	public String Mobile_Login_B() {
		return "lao/5.MobileLogin/MobileLogin_B";
	}

	// 모바일 회원가입페이지로 이동 //
	@RequestMapping("/lao/Mobile_Join.do")
	public String Mobile_Join() {
		return "lao/5.MobileLogin/MobileJoin";
	}

	// 모바일 회원정보 수정으로 이동 //
	@RequestMapping("/lao/Mobile_Modify.do")
	public String Mobile_Modify() {
		return "lao/5.MobileLogin/MobileModify";
	}

	// 모바일 회원가입 완료페이지로 이동 //
	@RequestMapping("/lao/Mobile_JoinComplete.do")
	public String Mobile_JoinComplete() {
		return "lao/5.MobileLogin/MobileJoinComplete";
	}
	
	// 모바일 메인페이지로 이동 //
	@RequestMapping("/lao/Mobile_Main.do")
	public ModelAndView Mobile_Main(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession httpSession = request.getSession(true);
		
		if(httpSession.getAttribute("SESSION_MEM_NM") != null){

			mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));
		}
		else if(httpSession.getAttribute("SESSION_PROTO_NM") != null){
			mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_PROTO_NM")));
		}

		mav.setViewName("lao/6.MobileMain/MobileMain");
		
		return mav;
	}

	// 모바일 관리자용 메인페이지로 이동 //
	@RequestMapping("/lao/Mobile_ManagerMain.do")
	public ModelAndView Mobile_ManagerMain(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

		HttpSession httpSession = request.getSession(true);

		if(httpSession.getAttribute("SESSION_MEM_NM") != null){

			mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));
		}

		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		List<HashMap<String, String>> ManagerList = ManagerService.Authority_Select(inputMap);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		
		mav.addObject("R_List", jsonStr);
		
		mav.setViewName("lao/8.MobileManager/MobileManagerMain");
		
		return mav;
	}
	
	// 모바일 사용자 배송현황 검색페이지 이동 //
	@RequestMapping("/lao/Mobile_Delivery_Search.do")
	public ModelAndView Mobile_Delivery_Search(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
//		mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));

		mav.setViewName("lao/7.MobileDelivery/MobileDelivery_Search");
		
		return mav;
	}

	// 모바일 비로그인 링크 배송현황 //
	@RequestMapping("/lao/Mobile_Delivery_Search_A.do")
	public ModelAndView Mobile_Delivery_Search_A(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		inputMap.put("IN_KEY",inputMap.get("ik"));
		
		HashMap<String, String> DeliveryList = DeliveryService.Delivery_Search_A(inputMap);
		// 택배사 데이터 가지고 오기
		List<HashMap<String, String>> shipComList = delRegistService.shipComList(inputMap);
		mav.addObject("IN_KEY", inputMap.get("ik"));
		mav.addObject("Dlist", DeliveryList);
		mav.addObject("shipComList", shipComList);

//		HttpSession httpSession = request.getSession(true);
//		mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));

		mav.setViewName("lao/7.MobileDelivery/MobileDelivery_Search_A");
		
		return mav;
	}

	// 모바일 비로그인 배송현황 //
	@RequestMapping("/lao/Mobile_Delivery_Search_B.do")
	public ModelAndView Mobile_Delivery_Search_B(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
//		mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));

		mav.setViewName("lao/7.MobileDelivery/MobileDelivery_Search_B");
		
		return mav;
	}

	// 모바일 비로그인 배송현황 검색결과 //
	@RequestMapping("/lao/Mobile_Delivery_Search_B_CHK.do")
	public ModelAndView Mobile_Delivery_Search_B_CHK(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
//		mav.addObject("memNm", (String)(httpSession.getAttribute("SESSION_MEM_NM")));

		mav.setViewName("lao/7.MobileDelivery/MobileDelivery_Search_B_CHK");
		
		return mav;
	}
	// 모바일 사용자 배송현황 상세 //
	@RequestMapping("/lao/Mobile_Delivery_Detail.do")
	public ModelAndView Mobile_Delivery_Detail(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();

//		HttpSession httpSession = request.getSession(true);
		mav.addObject("inkey", inputMap.get("ik"));
		mav.addObject("memid", inputMap.get("id"));

		mav.setViewName("lao/7.MobileDelivery/MobileDelivery_Detail");
		
		return mav;
	}
	

	/* 모바일 관리자용 비회원 배송신청목록페이지로 이동 */
	@RequestMapping("/lao/Mobile_M_Delivery_NC_List.do")
	public ModelAndView Delivery_NC_List(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		

		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","M_Delivery_NC_List");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		mav.setViewName("lao/8.MobileManager/MobileDeliveryNCList");
		
		return mav;
	}

	/* 모바일 관리자용 배송신청목록페이지로 이동 */
	@RequestMapping("/lao/Mobile_M_DeliveryList.do")
	public ModelAndView DeliveryList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();

		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","M_DeliveryList");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);

		mav.setViewName("lao/8.MobileManager/MobileDeliveryList");
		
		return mav;
	}

	/* 모바일 관리자용 출항일 리스트 페이지로 이동 */
	@RequestMapping("/lao/Mobile_M_OutdayList.do")
	public ModelAndView OutdayList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","Outday_List");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		

		mav.setViewName("lao/8.MobileManager/MobileOutdayList");
		
		return mav;
	}

	/* 모바일 관리자용 출항일 생성 페이지로 이동 */
	@RequestMapping("/lao/Mobile_M_Outday.do")
	public ModelAndView MobileOutday(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","Outday_List");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		

		mav.setViewName("lao/8.MobileManager/MobileOutday");
		
		return mav;
	}
	
	/* 모바일 관리자용 택배사 관리 페이지로 이동 */
	@RequestMapping("/lao/Mobile_DeliveryCompanyList.do")
	public ModelAndView DeliveryCompanyList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","DeliveryCompanyList");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);

		mav.setViewName("lao/8.MobileManager/MobileDeliveryCompanyList");
		
		return mav;
	}

	/* 모바일 관리자용 택배사 관리 페이지로 이동 */
	@RequestMapping("/lao/Mobile_AuthorityPage.do")
	public ModelAndView AuthorityPage(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","AuthorityPage");
		

		String ManagerList2 = ManagerService.Authority_CHK(inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Manager_List(inputMap);
		
		mav.addObject("M_List",ManagerList);
		mav.addObject("M_AUTH",ManagerList2);

		mav.setViewName("lao/8.MobileManager/MobileAuthority");
		
		return mav;
	}
	/* 모바일 관리자용 회원 관리 페이지로 이동 */
	@RequestMapping("/lao/Mobile_M_MemberList.do")
	public ModelAndView MemberList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception  {

		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","MemberListPage");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		

		mav.setViewName("lao/8.MobileManager/MobileMemberList");
		
		return mav;
	}

}