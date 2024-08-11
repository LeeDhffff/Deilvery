package delivery.lao.D_Manager;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import delivery.D_Manager.service.ManagerService;

/**
 * @Class Name : ManagerController.java
 * @Description : Manager Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2024.03.25  이동헌           최초생성
 *
 * @author 이동헌
 * @since 2024. 03.10
 * @version 1.0
 * @see
 *
 *  Copyright (C) by LLJ All right reserved.
 */
@Controller
public class L_ManagerController {

	
	@Resource(name = "ManagerService")
	private ManagerService ManagerService;


	/* 관리자용 메인페이지로 이동 */
	@RequestMapping("/lao/Main_Manager.do")
	public String Main_Manager() {
		return "lao/4.Manager/Main_Manager";
	}
	
	/* 회원 목록으로 이동 */
	@RequestMapping("/lao/MemberListPage.do")
	public ModelAndView MemberList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","MemberListPage");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		mav.setViewName("lao/4.Manager/MemberList");
		
		return mav;
	}

	/* 관리자용 배송신청목록페이지로 이동 */
	@RequestMapping("/lao/M_DeliveryList.do")
	public ModelAndView DeliveryList(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","M_DeliveryList");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		mav.setViewName("lao/4.Manager/DeliveryList");
		return mav;
	}

	/* 관리자용 미완료 배송신청 목록페이지로 이동 */	
	@RequestMapping("/lao/M_Delivery_NC_List.do")
	public ModelAndView Delivery_NC_List(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","M_Delivery_NC_List");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		mav.setViewName("lao/4.Manager/Delivery_NC_List");
		
		return mav;
	}

	/* 관리자용 출항일 리스트 페이지로 이동 */
	@RequestMapping("/lao/Outday_List.do")
	public ModelAndView Outday_List(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","Outday_List");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		mav.setViewName("lao/4.Manager/Outday_List");
		
		return mav;
	}
	
	/* 출항일 관리페이지로 이동 */
	@RequestMapping("/lao/Outday.do")
	public ModelAndView Outday(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","Outday_List");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		mav.setViewName("lao/4.Manager/Outday");
		
		return mav;
	}

	/* 택배사 관리페이지로 이동 */
	@RequestMapping("/lao/DeliveryCompanyList.do")
	public ModelAndView DeliveryCompany(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","DeliveryCompanyList");
		
		String ManagerList = ManagerService.Authority_CHK(inputMap);
		mav.addObject("M_AUTH",ManagerList);
		mav.setViewName("lao/4.Manager/Delivery_CompanyList");
		
		return mav;
	}

	/* 권한 관리페이지로 이동 */
	@RequestMapping("/lao/AuthorityPage.do")
	public ModelAndView AuthorityPage(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();

		HttpSession httpSession = request.getSession(true);

		inputMap.put("MEM_ID",(String)session.getAttribute("SESSION_MEM_ID"));
		inputMap.put("PAGE","AuthorityPage");
		
		String ManagerList2 = ManagerService.Authority_CHK(inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Manager_List(inputMap);
		
		mav.addObject("M_List",ManagerList);
		mav.addObject("M_AUTH",ManagerList2);
		mav.setViewName("lao/4.Manager/Authority");
		
		return mav;
	}
	
	
}