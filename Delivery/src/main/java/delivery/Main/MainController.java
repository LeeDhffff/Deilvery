package delivery.Main;

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

import delivery.Main.service.MainService;

@Controller
public class MainController {
	
	@Resource(name = "MainService")
	private MainService MainService;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/Main.do")
	public String Main() {
		return "1.Main/Main";
	}

}