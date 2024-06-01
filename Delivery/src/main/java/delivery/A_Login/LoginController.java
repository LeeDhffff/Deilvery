package delivery.A_Login;

import java.net.URLDecoder;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import delivery.F_Utility.AES256;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import delivery.A_Login.service.LoginService;
import delivery.Main.service.MainService;


/**
 * @Class Name : LoginController.java
 * @Description : Login Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.03.25  이동헌           최초생성
 *
 * @author 이동헌
 * @since 2024. 03.01
 * @version 1.0
 * @see
 *
 *  Copyright (C) by LLJ All right reserved.
 */
@Controller
public class LoginController {

	@Resource(name = "LoginService")
	private LoginService LoginService;

	@Resource(name = "MainService")
	private MainService MainService;
	
    /* 로그인 페이지로 이동 */
	@RequestMapping("/LoginPage.do")
	public String LoginPage() {
		return "0.Login/Login";
	}
	
	/* 비회원 로그인 페이지로 이동 */
	@RequestMapping("/LoginPage_B.do")
	public String LoginPage_B() {
		return "0.Login/LoginB";
	}

	/* 회원가입 페이지로 이동 */
	@RequestMapping("/JoinPage.do")
	public String JoinPage() {
		return "0.Login/Join";
	}
	
	/* 회원가입 완료 페이지로 이동 */
	@RequestMapping("/JoinComplete.do")
	public String JoinComplete() {
		return "0.Login/JoinComplete";
	}

	/* 회원정보 수정페이지 페이지로 이동(관리자도 사용함) */
	@RequestMapping("/MemberModifyPage.do")
	public String MemberModifyPage() {
		return "0.Login/Modify";
	}

	/* 회원가입 */
	@RequestMapping(value = "/Join.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Join(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = LoginService.Join(inputMap);

		String ATH_IP = request.getHeader("X-FORWARDED-FOR");

		if (ATH_IP == null) {
			ATH_IP = request.getRemoteAddr();
		}

		HashMap<String, Object> MM = new HashMap<String, Object>();

		MM.put("MEM_ID", inputMap.get("MEM_ID"));
		MM.put("LOG_TEXT", "회원가입");
		MM.put("IP", ATH_IP);

		String PutLog = MainService.LOG_MM(MM);

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}

	/* [관리자] 회원가입 */
	@RequestMapping(value = "/Join_M.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Join_M(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = LoginService.Join_M(inputMap);

		String ATH_IP = request.getHeader("X-FORWARDED-FOR");

		if (ATH_IP == null) {
			ATH_IP = request.getRemoteAddr();
		}

		HashMap<String, Object> MM = new HashMap<String, Object>();

		MM.put("MEM_ID", inputMap.get("MEM_ID"));
		MM.put("LOG_TEXT", "회원가입");
		MM.put("IP", ATH_IP);

		String PutLog = MainService.LOG_MM(MM);

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}

	/* 아이디 체크(중복) */
	@RequestMapping(value = "/id_chk.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String id_chk(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = LoginService.id_chk(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}
	
	/* [관리자] 이름,전화번호 체크(중복) */
	@RequestMapping(value = "/nm_chk.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String nm_chk(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = LoginService.nm_chk(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}

	/* 아이디 찾기 */
	@RequestMapping(value = "/find_id.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String find_id(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = LoginService.find_id(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}

	/* 비밀번호 찾기 */
	@RequestMapping(value = "/find_pw.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String find_pw(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = LoginService.find_pw(inputMap);
		
		return LoginList;
	}

	/* 비밀번호 찾기 후 변경 */
	@RequestMapping(value = "/find_pw_change.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String find_pw_change(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = LoginService.find_pw_change(inputMap);
		
		return LoginList;
	}

	/* 로그인 */
	@RequestMapping(value = "/Login.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Login(@RequestParam HashMap<String, Object> inputMap,HttpServletResponse res, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String ATH_IP = request.getHeader("X-FORWARDED-FOR");

		if (ATH_IP == null) {
			ATH_IP = request.getRemoteAddr();
		}

		HashMap<String, String> LoginList = LoginService.Login(inputMap);
		

		if(!LoginList.get("RESULTMSG").equals("ACCESS")) {
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(LoginList);
			return jsonStr;
		}else {
		HttpSession httpSession = request.getSession(true);
		httpSession.setAttribute("SESSION_MEM_ID", LoginList.get("MEM_ID"));
		httpSession.setAttribute("SESSION_MEM_NM", LoginList.get("NAME"));
		httpSession.setAttribute("SESSION_LEVEL", LoginList.get("LEVEL"));
		httpSession.setMaxInactiveInterval(24*60*60*7);
		System.out.println("inputMap:: "+inputMap);
		System.out.println("세션:: "+(String)httpSession.getAttribute("SESSION_MEM_ID")+(String)httpSession.getAttribute("SESSION_MEM_NM")+(String)httpSession.getAttribute("SESSION_LEVEL"));
		LoginList.put("ip", ATH_IP);
		if(inputMap.get("CHK").equals("Y") ) {
			Cookie cookie = new Cookie("auth_id", AES256.AES_Encode((String)(LoginList.get("MEM_ID"))) );	//Cookie 생성
			
			cookie.setMaxAge(60*60*24); 						//60초 X 60분 X 24시간
			cookie.setPath("/");
//			cookie.setHttpOnly(true);
			res.addCookie(cookie);
		}else {
			Cookie[] cookies = request.getCookies();
			for(Cookie cookie : cookies) {
			   if(cookie.getName().equals("auth_id")){
				   // 삭제할 쿠키에 대한 값을 null로 지정
				    cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
				    res.addCookie(cookie); // 응답에 추가해서 없어지도록 함
			   }
			}
		}
			
		HashMap<String, Object> MM = new HashMap<String, Object>();
		
		MM.put("MEM_ID", LoginList.get("MEM_ID"));
		MM.put("LOG_TEXT", "로그인");
		MM.put("IP", ATH_IP);
		
		String PutLog = MainService.LOG_MM(MM);
			
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
		}
	}

	/* 자동 로그인 */
	@RequestMapping(value = "/AutoLogin.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String AutoLogin(@RequestParam HashMap<String, Object> inputMap,HttpServletResponse res, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String ATH_IP = request.getHeader("X-FORWARDED-FOR");

		if (ATH_IP == null) {
			ATH_IP = request.getRemoteAddr();
		}

		String saveid = "";
		Cookie[] cookies2 = request.getCookies();
		for(Cookie cookie : cookies2) {
		   if(cookie.getName().equals("auth_id")){
			  saveid = AES256.AES_Decode(cookie.getValue());
		   }
		}
		
		if(saveid != null && !saveid.equals("")) {
		inputMap.put("MEM_ID", saveid);
		HashMap<String, String> LoginList = LoginService.AutoLogin(inputMap);
		
		
		HttpSession httpSession = request.getSession(true);
		httpSession.setAttribute("SESSION_MEM_ID", LoginList.get("MEM_ID"));
		httpSession.setAttribute("SESSION_MEM_NM", LoginList.get("NAME"));
		httpSession.setAttribute("SESSION_LEVEL", LoginList.get("LEVEL"));
		httpSession.setMaxInactiveInterval(24*60*60*7);
		System.out.println("inputMap:: "+inputMap);
		System.out.println("세션:: "+(String)httpSession.getAttribute("SESSION_MEM_ID")+(String)httpSession.getAttribute("SESSION_MEM_NM")+(String)httpSession.getAttribute("SESSION_LEVEL"));
		LoginList.put("ip", ATH_IP);
			
		HashMap<String, Object> MM = new HashMap<String, Object>();
		
		MM.put("MEM_ID", LoginList.get("MEM_ID"));
		MM.put("LOG_TEXT", "로그인");
		MM.put("IP", ATH_IP);
		
		String PutLog = MainService.LOG_MM(MM);

		LoginList.put("MSG", "Y");
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
		}
		else {

			HashMap<String, Object> NOT = new HashMap<String, Object>();

			NOT.put("MSG", "N");
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(NOT);
			return jsonStr;
			
		}
	}

	/* 로그아웃 */
	@RequestMapping(value = "Logout.do")
	@ResponseBody
	public String Logout(@RequestParam HashMap<String, Object> inputMap,HttpServletResponse res, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String ATH_IP = request.getHeader("X-FORWARDED-FOR");
		if (ATH_IP == null) {
			ATH_IP = request.getRemoteAddr();
		}
		Cookie[] cookies = request.getCookies();
		for(Cookie cookie : cookies) {
		   if(cookie.getName().equals("auth_id")){
			   // 삭제할 쿠키에 대한 값을 null로 지정
			   System.out.print("뭐함");
			    cookie.setPath("/");
			    cookie.setMaxAge(0); // 유효시간을 0으로 설정해서 바로 만료시킨다.
			    res.addCookie(cookie); // 응답에 추가해서 없어지도록 함
		   }
		}
		HashMap<String, Object> MM = new HashMap<String, Object>();

		HttpSession httpSession = request.getSession(true);
		if(httpSession.getAttribute("SESSION_MEM_ID") != null && httpSession.getAttribute("SESSION_PROTO_ID") == null)
			MM.put("MEM_ID", (String)httpSession.getAttribute("SESSION_MEM_ID"));
		else if(httpSession.getAttribute("SESSION_PROTO_ID") != null && httpSession.getAttribute("SESSION_MEM_ID") == null) {
			MM.put("MEM_ID", (String)httpSession.getAttribute("SESSION_PROTO_ID"));
		}
		MM.put("LOG_TEXT", "로그아웃");
		MM.put("IP", ATH_IP);

		
		String PutLog = MainService.LOG_MM(MM);
		
		ModelAndView mav = new ModelAndView();
		httpSession.invalidate();
		
		return "";
	}
	
	

	/* 비회원 로그인 */
	@RequestMapping(value = "/Login_B.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Login_B(@RequestParam HashMap<String, Object> inputMap,HttpServletResponse res, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String ATH_IP = request.getHeader("X-FORWARDED-FOR");

		if (ATH_IP == null) {
			ATH_IP = request.getRemoteAddr();
		}
		
		HashMap<String, String> LoginList = LoginService.Login_B(inputMap);

		System.out.println("inputMap:: "+LoginList);
		if(!LoginList.get("RESULTMSG").equals("ACCESS")) {
			ObjectMapper mapper = new ObjectMapper();
			String jsonStr = mapper.writeValueAsString(LoginList);
			return jsonStr;
		}else {
		HttpSession httpSession = request.getSession(true);
		httpSession.setAttribute("SESSION_PROTO_ID", LoginList.get("PROTO_ID"));
		httpSession.setAttribute("SESSION_PROTO_NM", LoginList.get("NAME"));
		httpSession.setAttribute("SESSION_LEVEL", LoginList.get("LEVEL"));
		httpSession.setMaxInactiveInterval(24*60*60*7);
		System.out.println("inputMap:: "+inputMap);
		System.out.println("세션:: "+(String)httpSession.getAttribute("SESSION_PROTO_ID")+(String)httpSession.getAttribute("SESSION_PROTO_NM")+(String)httpSession.getAttribute("SESSION_LEVEL"));
		LoginList.put("ip", ATH_IP);
		Cookie cookie = new Cookie("proto_id", (String)(LoginList.get("PROTO_ID") ) );	//Cookie 생성
		cookie.setMaxAge(60*60*24); 						//60초 X 60분 X 24시간
		cookie.setPath("/");
		res.addCookie(cookie);
		

		HashMap<String, Object> MM = new HashMap<String, Object>();
		
		MM.put("MEM_ID", (String)httpSession.getAttribute("SESSION_PROTO_ID"));
		MM.put("LOG_TEXT", "비회원로그인");
		MM.put("IP", ATH_IP);
		
		String PutLog = MainService.LOG_MM(MM);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
		
	}
}