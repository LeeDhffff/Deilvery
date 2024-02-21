package delivery.A_Login;

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

import com.fasterxml.jackson.databind.ObjectMapper;

import delivery.A_Login.service.LoginService;

//import delivery.TempKey;
//import delivery.Login.service.LoginService;

@Controller
public class LoginController {

	@Resource(name = "LoginService")
	private LoginService LoginService;
	
	@RequestMapping("/LoginPage.do")
	public String LoginPage() {
		return "0.Login/Login";
	}
	

	@RequestMapping(value = "/Join.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Join(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("resultMsg" + inputMap);
		HashMap<String, String> LoginList = LoginService.Join(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(LoginList);
		return jsonStr;
	}
}