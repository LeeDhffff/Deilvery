package delivery.lao.A_Login;

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
public class L_LoginController {

	@Resource(name = "LoginService")
	private LoginService LoginService;

	@Resource(name = "MainService")
	private MainService MainService;
	
    /* 로그인 페이지로 이동 */
	@RequestMapping("/lao/LoginPage.do")
	public String LoginPage() {
		return "lao/0.Login/Login";
	}
	
	/* 비회원 로그인 페이지로 이동 */
	@RequestMapping("/lao/LoginPage_B.do")
	public String LoginPage_B() {
		return "lao/0.Login/LoginB";
	}

	/* 회원가입 페이지로 이동 */
	@RequestMapping("/lao/JoinPage.do")
	public String JoinPage() {
		return "lao/0.Login/Join";
	}
	
	/* 회원가입 완료 페이지로 이동 */
	@RequestMapping("/lao/JoinComplete.do")
	public String JoinComplete() {
		return "lao/0.Login/JoinComplete";
	}

	/* 회원정보 수정페이지 페이지로 이동(관리자도 사용함) */
	@RequestMapping("/lao/MemberModifyPage.do")
	public String MemberModifyPage() {
		return "lao/0.Login/Modify";
	}

}