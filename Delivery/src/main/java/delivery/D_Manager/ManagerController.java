package delivery.D_Manager;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
public class ManagerController {
	
	@Resource(name = "ManagerService")
	private ManagerService ManagerService;


	/* 관리자용 메인페이지로 이동 */
	@RequestMapping("/Main_Manager.do")
	public String Main_Manager() {
		return "4.Manager/Main_Manager";
	}
	
	/* 회원 목록으로 이동 */
	@RequestMapping("/MemberListPage.do")
	public String MemberList() {
		return "4.Manager/MemberList";
	}

	/* 관리자용 배송신청목록페이지로 이동 */
	@RequestMapping("/M_DeliveryList.do")
	public String DeliveryList() {
		return "4.Manager/DeliveryList";
	}

	/* 관리자용 미완료 배송신청 목록페이지로 이동 */	
	@RequestMapping("/M_Delivery_NC_List.do")
	public String Delivery_NC_List() {
		return "4.Manager/Delivery_NC_List";
	}

	/* 관리자용 출항일 리스트 페이지로 이동 */
	@RequestMapping("/Outday_List.do")
	public String Outday_List() {
		return "4.Manager/Outday_List";
	}
	
	/* 출항일 관리페이지로 이동 */
	@RequestMapping("/Outday.do")
	public String Outday() {
		return "4.Manager/Outday";
	}

	/* 택배사 관리페이지로 이동 */
	@RequestMapping("/DeliveryCompanyList.do")
	public String DeliveryCompany() {
		return "4.Manager/Delivery_CompanyList";
	}
	
	/* 회원 목록가져오기 */
	@RequestMapping(value = "/Member_Select.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Member_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Member_Select(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	
	

	/* 회원정보 수정 시 비밀번호 확인 */
	@RequestMapping(value = "/Mem_Pw_Chk.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Mem_Pw_Chk(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String LoginList = ManagerService.Mem_Pw_Chk(inputMap);
		
		return LoginList;
	}
	

	/* 회원정보 수정 */
	@RequestMapping(value = "/Member_Modify.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Member_Modify(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = ManagerService.Member_Modify(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}


	/* 미완료 배송신청 목록 불러오기 */
	@RequestMapping(value = "/Nocomplete_Select.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Nocomplete_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Nocomplete_Select(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	

	/* 미완료 배송신청 목록 불러오기 모바일 */
	@RequestMapping(value = "/M_Nocomplete_Select.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String M_Nocomplete_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.M_Nocomplete_Select(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	
	
	

	/* 완료된 배송신청 목록 불러오기 */
	@RequestMapping(value = "/Deilvery_Now_List.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Deilvery_Now_List(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Deilvery_Now_List(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}

	
	
	
	/*출항일 리스트*/

	@RequestMapping(value = "/Out_Day_List.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_List(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Out_Day_List(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	
	/*출항일 불러오기*/

	@RequestMapping(value = "/Out_Day_Select.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		HashMap<String, String> ManagerList = ManagerService.Outday_Select(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}

	/*출항일 생성하기*/

	@RequestMapping(value = "/Out_Day_Insert.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_Insert(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = ManagerService.Outday_Insert(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}

	/*출항일 수정 및 삭제하기*/

	@RequestMapping(value = "/Out_Day_UD.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_UD(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = ManagerService.Outday_UD(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}

	/* 출항일 파일 불러오기 (현재 사용여부 X) */
	@RequestMapping(value = "/Out_Day_File_Select.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_File_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Out_Day_File_Select(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	

	/* 출항일 파일 삽입 (현재 사용여부 X) */
	@RequestMapping(value = "Out_Day_File_Insert.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_File_Insert(@RequestParam HashMap<String, Object> inputMap, HttpServletRequest request,
			HttpSession session) throws Exception {


		inputMap.put("PATH", "");
		inputMap.put("ORGIN_NM", "");
		inputMap.put("SAVE_NM", "");
		
		System.out.println("출항일 현황 등록 input: " + inputMap);
		String ListDays = ManagerService.Out_Day_File_Insert(inputMap);
		System.out.println("출항일 현황 등록 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
//	@RequestMapping(value = "Out_Day_File_Insert.do", produces = "application/text; charset=utf-8")
//	@ResponseBody
//	public String Out_Day_File_Insert(@RequestParam("uploadFile") List<MultipartFile> uploadFile, @RequestParam HashMap<String, Object> inputMap, HttpServletRequest request, MultipartHttpServletRequest mRequest,
//			HttpSession session) throws Exception {
//
//
//		System.out.println("uploadFile.size : "+uploadFile.size());
//		
//		String path1 = "D:\\DeliveryUpload\\outdayFile";
//		File savePath1 = new File(path1);
//		if(!savePath1.exists()) savePath1.mkdir();
//
//		
//		SimpleDateFormat now = new SimpleDateFormat("yyyyMMddhhmmss");		
//		
//		for(int i=0; i<uploadFile.size(); i++) {
//			
//			String today = now.format(System.currentTimeMillis());
//			String oName = uploadFile.get(i).getOriginalFilename();
//			String ext = oName.substring(oName.lastIndexOf(".")+1);
//			if(!oName.equals("")) {
//				oName = today+"_"+oName.substring(oName.lastIndexOf("\\")+1);
//			}
//			System.out.println("oName : " + oName + ", " + "확장자 : " + ext);
//
//			inputMap.put("PATH", path1);
//
//			File saveFile = new File(path1, oName);
//			try {
//				if(!oName.equals("")) {
//					uploadFile.get(i).transferTo(saveFile);
//					inputMap.put("SAVE_NM", oName);
//					inputMap.put("ORGIN_NM", uploadFile.get(i).getOriginalFilename());
//					System.out.println("업로드 성공 :" + "ORGIN_NM");
//				}
//				else {
//					System.out.println("해당파일 없음 :" + "ORGIN_NM");
//				}
//			}catch(Exception e) {
//				System.out.println(e.getMessage());
//			}				
//		}	
//		if(uploadFile.size() == 0) {
//			inputMap.put("PATH", "");
//			inputMap.put("ORGIN_NM", "");
//			inputMap.put("SAVE_NM", "");
//		}
//		
//		System.out.println("출항일 현황 등록 input: " + inputMap);
//		String ListDays = ManagerService.Out_Day_File_Insert(inputMap);
//		System.out.println("출항일 현황 등록 result: " + ListDays);
//
//		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(ListDays);
//		
//		return jsonStr;
//	}
	

	/* 출항일 파일 수정/삭제 (현재 사용여부 X) */
	@RequestMapping(value = "Out_Day_File_UD.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_File_UD(@RequestParam HashMap<String, Object> inputMap, HttpServletRequest request,
			HttpSession session) throws Exception {
			
		System.out.println("Out_Day_File_UD 체크 :: "+ inputMap + inputMap.get("MODE"));
		
		if(inputMap.get("MODE").equals("U")) {
			
			inputMap.put("PATH", "");
			inputMap.put("ORGIN_NM", "");
			inputMap.put("SAVE_NM", "");
		
		}
		else if(inputMap.get("MODE").equals("D")){
			inputMap.put("PATH", "");
			inputMap.put("ORGIN_NM", "");
			inputMap.put("SAVE_NM", "");
		}
		System.out.println("출항일 현황 등록 input: " + inputMap);
		String ListDays = ManagerService.Out_Day_File_UD(inputMap);
		System.out.println("출항일 현황 등록 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
//	@RequestMapping(value = "Out_Day_File_UD.do", produces = "application/text; charset=utf-8")
//	@ResponseBody
//	public String Out_Day_File_UD(@RequestParam("uploadFile") List<MultipartFile> uploadFile, @RequestParam HashMap<String, Object> inputMap, HttpServletRequest request, MultipartHttpServletRequest mRequest,
//			HttpSession session) throws Exception {
//
//		
//		if(inputMap.get("MODE").equals("U")) {
//		System.out.println("uploadFile.size : "+uploadFile.size());
//		
//		String path1 = "D:\\DeliveryUpload\\outdayFile";
//		File savePath1 = new File(path1);
//		if(!savePath1.exists()) savePath1.mkdir();
//
//		
//		SimpleDateFormat now = new SimpleDateFormat("yyyyMMddhhmmss");	
//		for(int i=0; i<uploadFile.size(); i++) {
//			
//			String today = now.format(System.currentTimeMillis());
//			String oName = uploadFile.get(i).getOriginalFilename();
//			String ext = oName.substring(oName.lastIndexOf(".")+1);
//			if(!oName.equals("")) {
//				oName = today+"_"+oName.substring(oName.lastIndexOf("\\")+1);
//			}
//			System.out.println("oName : " + oName + ", " + "확장자 : " + ext);
//
//			inputMap.put("PATH", path1);
//
//			File saveFile = new File(path1, oName);
//			try {
//				if(!oName.equals("")) {
//					uploadFile.get(i).transferTo(saveFile);
//					inputMap.put("ORGIN_NM", oName);
//					inputMap.put("SAVE_NM", uploadFile.get(i).getOriginalFilename());
//					System.out.println("업로드 성공 :" + "ORGIN_NM");
//				}
//				else {
//					System.out.println("해당파일 없음 :" + "ORGIN_NM");
//				}
//			}catch(Exception e) {
//				System.out.println(e.getMessage());
//			}				
//		}	
//
//		if(uploadFile.size() == 0) {
//			inputMap.put("PATH", "");
//			inputMap.put("ORGIN_NM", "");
//			inputMap.put("SAVE_NM", "");
//		}
//		
//		}
//		else if(inputMap.get("MODE").equals("D")){
//			inputMap.put("PATH", "");
//			inputMap.put("ORGIN_NM", "");
//			inputMap.put("SAVE_NM", "");
//		}
//		System.out.println("출항일 현황 등록 input: " + inputMap);
//		String ListDays = ManagerService.Out_Day_File_UD(inputMap);
//		System.out.println("출항일 현황 등록 result: " + ListDays);
//
//		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(ListDays);
//		
//		return jsonStr;
//	}
	

	@RequestMapping(value = "/Delivery_receipt.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_receipt(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Delivery_receipt(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}

	@RequestMapping(value = "/Delivery_receipt_D.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Delivery_receipt_D(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.Delivery_receipt_D(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	
	/* 택배사 사용하는것만 불러오기 */
//	@RequestMapping(value = "/DeliveryCompanyList_Select.do" , produces = "application/text; charset=utf-8")
//	@ResponseBody
//	public String DeliveryCompanyList_Select(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {
//
//		System.out.println("inputMap" + inputMap);
//		List<HashMap<String, String>> ManagerList = ManagerService.DeliveryCompanyList_Select(inputMap);
//		System.out.println(ManagerList);
//
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(ManagerList);
//		return jsonStr;
//	}
	
	/* 택배사 검색 */
	@RequestMapping(value = "/DeliveryCompanyList_Search.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String DeliveryCompanyList_Search(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		List<HashMap<String, String>> ManagerList = ManagerService.DeliveryCompanyList_Search(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	

	/* 택배사 특정 타겟 정보 불러오기 */
	@RequestMapping(value = "/DeliveryCompanyList_Load.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String DeliveryCompanyList_Load(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		HashMap<String, String> ManagerList = ManagerService.DeliveryCompanyList_Load(inputMap);
		System.out.println(ManagerList);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ManagerList);
		return jsonStr;
	}
	


	@RequestMapping(value = "/DeliveryCompanyList_IUD.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String DeliveryCompanyList_IUD(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		System.out.println("inputMap" + inputMap);
		String LoginList = ManagerService.DeliveryCompanyList_IUD(inputMap);
//		System.out.println(LoginList.get("resultMsg"));

//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(LoginList);
		return LoginList;
	}
	
	
	
	
	/* Javamail 실행 */
	@RequestMapping(value = "/Mail.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Mail(@RequestParam HashMap<String, Object> inputMap, Model model) throws Exception {

		Random random = new Random();
		int createNum = 0;
		String ranNum = "";
		int letter = 6;
		String resultNum = "";
		
		for(int i=0; i<letter; i++) {
			createNum = random.nextInt(9);
			ranNum = Integer.toString(createNum);
			resultNum += ranNum;
		}

		HashMap<String, String> EmailId = ManagerService.Emailinfo(inputMap);
		String msg = sendMail((String)(inputMap.get("EMAIL")),resultNum,EmailId);

	    
	    HashMap<String, Object> mav = new HashMap<String, Object>();
		mav.put("resultMsg", msg);
		mav.put("code", resultNum);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(mav);

	    System.out.println(msg);
		return jsonStr;
	}
	
	
	@ResponseBody
	public static String sendMail(String toMail, String _Key, HashMap<String, String> emaillist) {
		
		
		
	    System.out.println("이메일 전송 시작.");

	    String subject = "EK Logistics 인증키입니다.";
	    String fromName = "EK Logistics";

	    
	    String fromMail = emaillist.get("ID");
	    String _email = emaillist.get("ID");
	    String _password = emaillist.get("PW");

	    // mail contents
	    StringBuffer contents = new StringBuffer();
	    contents.append("<h1>Hello</h1>\n");
	    contents.append("<p>Nice to meet you ~! :)</p><br>");
	    contents.append("<p>your code : )</p><br>");
	    contents.append("<p><h2><b></b>"+_Key +"</h2></p><br>");
	    contents.append("<p>good bye.</p><br>");
	    
	    // mail properties
	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com"); // use naver
	    props.put("mail.smtp.port", "587"); // set port gamil은 465, naver는 587

	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true"); // use TLS
	    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	    
	    Session mailSession = Session.getInstance(props,
	            new javax.mail.Authenticator() { // set authenticator
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(_email, _password);
	                }
	            });

	    try {
	        MimeMessage message = new MimeMessage(mailSession);

	        message.setFrom(new InternetAddress(fromMail, MimeUtility.encodeText(fromName, "UTF-8", "B"))); // 한글의 경우 encoding 필요
	        message.setRecipients(
	            Message.RecipientType.TO, 
	            InternetAddress.parse(toMail)
	        );
	        message.setSubject(subject);
	        message.setContent(contents.toString(), "text/html;charset=UTF-8"); // 내용 설정 (HTML 형식)
	        message.setSentDate(new java.util.Date());

	        Transport t = mailSession.getTransport("smtp");
	        t.connect(_email, _password);
	        t.sendMessage(message, message.getAllRecipients());
	        t.close();

	        return "done";

	    } catch (Exception e) {
	        e.printStackTrace();
	        
	        return "fail";
	    }
	}

//    public static String filePath = "D:\\upload\\deliveryFile";
	public static String filePath = "..\\upload";
	private static final String BASE64_PNG_PRE_FIX = "data:image/png;base64,";
    
	@RequestMapping(value = "/Excel.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String exceldownload(@RequestParam HashMap<String, Object> inputMap, Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String txt = excel(inputMap,response,model);
		
		if(txt.equals("N")) {
			return "엑셀 파일을 다운로드 하는데 문제가 발생하였습니다";
		}
		else {
			return txt;
		}
		
		
	}
//	
//
    public static String excel(HashMap<String, Object> inputMap , HttpServletResponse response, Map<String, Object> model){
    	 // 빈 Workbook 생성
        Workbook workbook = new HSSFWorkbook();
    	
        System.out.println(inputMap);
        System.out.println("엑셀 저장 : inputMap - " + inputMap);
        // 빈 Sheet를 생성
        Sheet sheet = workbook.createSheet((String)(inputMap.get("IN_KEY")));
        String fileNm = "EK Logistics_"+(String)(inputMap.get("IN_KEY"))+".xls";

        System.out.println("엑셀 이미지저장 : fileNm - " + fileNm);
        String imageData = (String)(inputMap.get("EXCEL_QR"));
        System.out.println("엑셀 이미지저장 : imageData - " + imageData);
        String encodingStr = imageData.replace(BASE64_PNG_PRE_FIX, "");
        System.out.println("엑셀 이미지저장 : encodingStr - " + encodingStr);
        byte[] decodeImg = null;
        try{
        	decodeImg = Base64.getDecoder().decode(encodingStr);
            System.out.println("메서드종료");
    	}catch(Exception e){
    		e.getStackTrace();
    	}
		
        System.out.println("메서드종료: decodeImg - " + decodeImg);
		InputStream in = null;
		FileOutputStream fos = null;
		File imageFile = null;
		

        System.out.println("엑셀 이미지저장 : 경로 - " + filePath);
        
        byte[] bytes = null;
		try {
			FileUtils.forceMkdir(new File(filePath));
			imageFile = new File(filePath + "/"+(String)(inputMap.get("IN_KEY"))+".png");
			fos = new FileOutputStream(imageFile);
			fos.write(decodeImg);

	        System.out.println("엑셀 이미지저장 : 완료");
			in = new FileInputStream(imageFile);
			bytes = IOUtils.toByteArray(in);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} //디렉토리 미 존재시 생성
		
		int pictureIdx = workbook.addPicture(bytes, SXSSFWorkbook.PICTURE_TYPE_PNG);

		final CreationHelper helper = workbook.getCreationHelper();
		final Drawing drawing = sheet.createDrawingPatriarch();
		final ClientAnchor anchor = helper.createClientAnchor();
	
        int rownum = 0;
        
        // (세로form~ 세로to , 가로from~가로to)
        sheet.addMergedRegion(new CellRangeAddress(0,1,0,8));
        
        
        sheet.addMergedRegion(new CellRangeAddress(2,3,0,1));
        sheet.addMergedRegion(new CellRangeAddress(2,2,4,8));
        sheet.addMergedRegion(new CellRangeAddress(3,3,4,8));
        sheet.addMergedRegion(new CellRangeAddress(4,5,0,0));
        sheet.addMergedRegion(new CellRangeAddress(4,5,1,3));
        sheet.addMergedRegion(new CellRangeAddress(4,4,4,8));
        sheet.addMergedRegion(new CellRangeAddress(5,5,4,8));
        sheet.addMergedRegion(new CellRangeAddress(6,6,1,3));
        sheet.addMergedRegion(new CellRangeAddress(7,7,1,3));
        sheet.addMergedRegion(new CellRangeAddress(6,7,4,4));
        sheet.addMergedRegion(new CellRangeAddress(6,7,5,6));
        sheet.addMergedRegion(new CellRangeAddress(6,6,7,8));
        
        sheet.addMergedRegion(new CellRangeAddress(7,8,7,8));
        sheet.addMergedRegion(new CellRangeAddress(8,8,1,3));
        sheet.addMergedRegion(new CellRangeAddress(8,8,5,6));
        
        sheet.addMergedRegion(new CellRangeAddress(9,9,1,3));
        sheet.addMergedRegion(new CellRangeAddress(9,9,5,6));
        sheet.addMergedRegion(new CellRangeAddress(9,9,7,8));
        
        sheet.addMergedRegion(new CellRangeAddress(10,11,0,3));
        sheet.addMergedRegion(new CellRangeAddress(10,11,4,4));
        sheet.addMergedRegion(new CellRangeAddress(10,11,5,6));
        sheet.addMergedRegion(new CellRangeAddress(10,11,7,8));
        sheet.addMergedRegion(new CellRangeAddress(12,12,0,3));
        sheet.addMergedRegion(new CellRangeAddress(12,12,4,8));
        sheet.addMergedRegion(new CellRangeAddress(13,13,0,3));
        sheet.addMergedRegion(new CellRangeAddress(13,13,4,8));
        sheet.addMergedRegion(new CellRangeAddress(14,14,0,3));
        sheet.addMergedRegion(new CellRangeAddress(14,14,4,6));
        sheet.addMergedRegion(new CellRangeAddress(14,14,7,8));
        
        CellStyle HeadStyle = workbook.createCellStyle();
        Font HeadFont = workbook.createFont();
        HeadStyle.setWrapText(true);
        HeadStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyle.setBorderRight(HSSFCellStyle.BORDER_MEDIUM);
        HeadStyle.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
        HeadStyle.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
        HeadStyle.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);
        HeadFont.setFontHeight((short)(20*20)); //사이즈
        HeadFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadFont.setColor(HSSFColor.BLACK.index);
        HeadStyle.setFont(HeadFont);

        CellStyle HeadStyleWhiteBold = workbook.createCellStyle();
        Font HeadFontWhite = workbook.createFont();
        HeadStyleWhiteBold.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleWhiteBold.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleWhiteBold.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleWhiteBold.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleWhiteBold.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleWhiteBold.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontWhite.setFontHeight((short)(10*20)); //사이즈
        HeadFontWhite.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadFontWhite.setColor(HSSFColor.BLACK.index);
        HeadStyleWhiteBold.setFont(HeadFontWhite);

        CellStyle HeadStyleGreyBold = workbook.createCellStyle();
        Font HeadFontGrey = workbook.createFont();
        HeadStyleGreyBold.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleGreyBold.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleGreyBold.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleGreyBold.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleGreyBold.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleGreyBold.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontGrey.setFontHeight((short)(10*20)); //사이즈
        HeadFontGrey.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadFontGrey.setColor(HSSFColor.BLACK.index);
        HeadStyleGreyBold.setFont(HeadFontGrey);
        HeadStyleGreyBold.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        HeadStyleGreyBold.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        
        CellStyle HeadStyleBlue = workbook.createCellStyle();
        Font HeadFont2 = workbook.createFont();
        HeadStyleBlue.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleBlue.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleBlue.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleBlue.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleBlue.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleBlue.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFont2.setFontHeight((short)(10*20)); //사이즈
//        HeadFont2.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadFont2.setColor(HSSFColor.BLACK.index);
        HeadStyleBlue.setFont(HeadFont2);
        HeadStyleBlue.setWrapText(true);
        HeadStyleBlue.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
        HeadStyleBlue.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        
        CellStyle HeadStyleBlueBold = workbook.createCellStyle();
        Font HeadFont2Bold = workbook.createFont();
        HeadStyleBlueBold.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleBlueBold.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleBlueBold.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleBlueBold.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleBlueBold.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleBlueBold.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFont2Bold.setFontHeight((short)(10*20)); //사이즈
        HeadFont2Bold.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadFont2Bold.setColor(HSSFColor.BLACK.index);
        HeadStyleBlueBold.setFont(HeadFont2Bold);
        HeadStyleBlueBold.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
        HeadStyleBlueBold.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        
        CellStyle HeadStyleYellowBold = workbook.createCellStyle();
        Font HeadFont3 = workbook.createFont();
        HeadStyleYellowBold.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleYellowBold.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleYellowBold.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleYellowBold.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleYellowBold.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleYellowBold.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFont3.setFontHeight((short)(10*20)); //사이즈
        HeadFont3.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadFont3.setColor(HSSFColor.BLACK.index);
        HeadStyleYellowBold.setFillForegroundColor(IndexedColors.YELLOW.getIndex());
        HeadStyleYellowBold.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        HeadStyleYellowBold.setFont(HeadFont3);

        CellStyle HeadStyleOrangeBold = workbook.createCellStyle();
        Font HeadFont4 = workbook.createFont();
        HeadStyleOrangeBold.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleOrangeBold.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleOrangeBold.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleOrangeBold.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleOrangeBold.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleOrangeBold.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFont4.setFontHeight((short)(10*20)); //사이즈
        HeadFont4.setColor(HSSFColor.BLACK.index);
        HeadFont4.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadStyleOrangeBold.setFillForegroundColor(IndexedColors.CORAL.getIndex());
        HeadStyleOrangeBold.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        HeadStyleOrangeBold.setFont(HeadFont4);
        
        CellStyle HeadStyleEK = workbook.createCellStyle();
        Font HeadFontEK = workbook.createFont();
        HeadStyleEK.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleEK.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleEK.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleEK.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleEK.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleEK.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontEK.setFontHeight((short)(16*20)); //사이즈
        HeadFontEK.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadFontEK.setColor(HSSFColor.BLACK.index);
        HeadStyleEK.setFont(HeadFontEK);
        HeadStyleEK.setFillForegroundColor(IndexedColors.CORAL.getIndex());
        HeadStyleEK.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

        CellStyle HeadStyleNormal = workbook.createCellStyle();
        Font HeadFontNormal = workbook.createFont();
        HeadStyleNormal.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleNormal.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleNormal.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormal.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormal.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormal.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontNormal.setFontHeight((short)(10*20)); //사이즈
        HeadFontNormal.setColor(HSSFColor.BLACK.index);
        HeadStyleNormal.setFont(HeadFontNormal);
        HeadStyleNormal.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        HeadStyleNormal.setFillForegroundColor(IndexedColors.WHITE.getIndex());


        CellStyle HeadStyleNormalMonth = workbook.createCellStyle();
        Font HeadFontNormalMonth = workbook.createFont();
        HeadStyleNormalMonth.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleNormalMonth.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleNormalMonth.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalMonth.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalMonth.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalMonth.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontNormalMonth.setFontHeight((short)(10*20)); //사이즈
        HeadFontNormalMonth.setColor(HSSFColor.BLACK.index);
        HeadStyleNormalMonth.setFont(HeadFontNormalMonth);
        HeadStyleNormalMonth.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        HeadStyleNormalMonth.setFillForegroundColor(IndexedColors.CORAL.getIndex());
        
        CellStyle HeadStyleNormalRed = workbook.createCellStyle();
        Font HeadFontNormalRed = workbook.createFont();
        HeadStyleNormalRed.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleNormalRed.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleNormalRed.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalRed.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalRed.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalRed.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontNormalRed.setFontHeight((short)(10*20)); //사이즈
        HeadFontNormalRed.setColor(HSSFColor.RED.index);
        HeadFontNormalRed.setBoldweight(Font.BOLDWEIGHT_BOLD);
        HeadStyleNormalRed.setFont(HeadFontNormalRed);
        HeadStyleNormalRed.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        HeadStyleNormalRed.setFillForegroundColor(IndexedColors.WHITE.getIndex());

        CellStyle HeadStyleNormalBlue = workbook.createCellStyle();
        Font HeadFontNormalBlue = workbook.createFont();
        HeadStyleNormalBlue.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleNormalBlue.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleNormalBlue.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalBlue.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalBlue.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalBlue.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontNormalBlue.setFontHeight((short)(10*20)); //사이즈
        HeadFontNormalBlue.setColor(HSSFColor.PALE_BLUE.index);
        HeadStyleNormalBlue.setFont(HeadFontNormalBlue);
        HeadStyleNormalBlue.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        HeadStyleNormalBlue.setFillForegroundColor(IndexedColors.WHITE.getIndex());
        

        CellStyle HeadStyleNormalDown = workbook.createCellStyle();
        Font HeadFontNormalDown = workbook.createFont();
        HeadStyleNormalDown.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleNormalDown.setVerticalAlignment(HSSFCellStyle.VERTICAL_BOTTOM); //높이 아래 정렬
        HeadStyleNormalDown.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalDown.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalDown.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleNormalDown.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadFontNormalDown.setFontHeight((short)(10*20)); //사이즈
        HeadFontNormalDown.setColor(HSSFColor.BLACK.index);
        HeadStyleNormalDown.setFont(HeadFontNormalDown);
        HeadStyleNormalDown.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        HeadStyleNormalDown.setFillForegroundColor(IndexedColors.WHITE.getIndex());
        
        CellStyle SignitureStyleNormal = workbook.createCellStyle();
        Font SignitureFontNormal = workbook.createFont();
        SignitureStyleNormal.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        SignitureStyleNormal.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        SignitureStyleNormal.setBorderRight(HSSFCellStyle.BORDER_THIN);
        SignitureStyleNormal.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        SignitureStyleNormal.setBorderTop(HSSFCellStyle.BORDER_THIN);
        SignitureStyleNormal.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        SignitureFontNormal.setFontHeight((short)(10*20)); //사이즈
        SignitureFontNormal.setColor(HSSFColor.GREY_40_PERCENT.index);
        SignitureFontNormal.setBoldweight(Font.BOLDWEIGHT_BOLD);
        SignitureStyleNormal.setFont(SignitureFontNormal);
        
        CellStyle HeadStyleLong = workbook.createCellStyle();
        Font HeadFontLong = workbook.createFont();
        HeadStyleLong.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        HeadStyleLong.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER); //높이 가운데 정렬
        HeadStyleLong.setBorderRight(HSSFCellStyle.BORDER_THIN);
        HeadStyleLong.setBorderLeft(HSSFCellStyle.BORDER_THIN);
        HeadStyleLong.setBorderTop(HSSFCellStyle.BORDER_THIN);
        HeadStyleLong.setBorderBottom(HSSFCellStyle.BORDER_THIN);
        HeadStyleLong.setWrapText(true);
        HeadFontLong.setFontHeight((short)(10*20)); //사이즈
        HeadStyleLong.setFont(HeadFontLong);

        CellStyle HeadStyleBorderLeft = workbook.createCellStyle();
        HeadStyleBorderLeft.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);

        CellStyle HeadStyleBorderTopBottom = workbook.createCellStyle();
        HeadStyleBorderTopBottom.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
        HeadStyleBorderTopBottom.setBorderBottom(HSSFCellStyle.BORDER_MEDIUM);

        CellStyle HeadStyleBorderTop = workbook.createCellStyle();
        HeadStyleBorderTop.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
        
        sheet.setColumnWidth(0, 7000);
        for(int i=1; i<9; i++) {
        	sheet.setColumnWidth(i, 4000);
        }
        sheet.setColumnWidth(4, 6000);
        
        		//***************************1,2번째 row *****************************//
        		int length = Integer.valueOf((String)inputMap.get("EXCEL_TABLE_NUM"));
        		Row row = null;
        		Cell cell = null;
        		for(int j=0; j<18 + length; j++) {
            		row = sheet.createRow(j);
	        		for(int i=0; i<10; i++) {
	        			cell = sheet.getRow(j).createCell(i);
	        		}
	        		sheet.getRow(j).setHeight((short)400);
        		}
                sheet.getRow(12).setHeight((short)1800);
                
        		for(int j=0; j<2; j++) {
	        		for(int i=0; i<9; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(HeadStyle);
	        		}
        		}
        		sheet.getRow(0).getCell(0).setCellValue("INVOICE");
                System.out.println("1,2번쨰 완료.");
        		
        		//***************************3번째 row *****************************//
                sheet.getRow(2).getCell(3).setCellValue("ຕູ້ທີ່1 ເດືອນ11");
        		sheet.getRow(2).getCell(3).setCellStyle(HeadStyleNormal);
        		for(int i=4; i<9; i++) {
        			sheet.getRow(2).getCell(i).setCellStyle(HeadStyleGreyBold);
        		}
        		sheet.getRow(2).getCell(4).setCellValue("EK Logistics");
                System.out.println("3번쨰 완료.");
        		//***************************4번째 row *****************************//
        		sheet.getRow(2).getCell(0).setCellValue("NOY");
        		
        		for(int j=2; j<4; j++) {
	        		for(int i=0; i<2; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(HeadStyleWhiteBold);
	        		}
        		}
        		
        		sheet.getRow(3).getCell(2).setCellValue("고객님 귀하");
        		sheet.getRow(3).getCell(2).setCellStyle(HeadStyleNormal);
        		sheet.getRow(3).getCell(3).setCellValue((String)(inputMap.get("EXCEL_NAME")));
        		sheet.getRow(3).getCell(3).setCellStyle(HeadStyleNormal);
        		sheet.getRow(3).getCell(4).setCellValue((String)(inputMap.get("EXCEL_ADDRESS")));
        		sheet.getRow(3).getCell(4).setCellStyle(HeadStyleNormal);
                System.out.println("4번쨰 완료.");
        		
        		//***************************5번째 row *****************************//
        		sheet.getRow(4).getCell(0).setCellValue("접수번호:\nລະຫັດ");
    			sheet.getRow(4).getCell(0).setCellStyle(HeadStyleBlue);
    			sheet.getRow(5).getCell(0).setCellStyle(HeadStyleBlue);
    			sheet.getRow(4).getCell(4).setCellValue("TEL: +856 2099118282(LAO) / +856 2055533327(KR)");
        		for(int i=4; i<9; i++) {
        			sheet.getRow(4).getCell(i).setCellStyle(HeadStyleNormal);
        		}
                System.out.println("5번쨰 완료.");
        		//***************************6번째 row *****************************//

        		for(int j=4; j<5; j++) {
	        		for(int i=1; i<4; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(HeadStyleEK);
	        		}
        		}
        		sheet.getRow(4).getCell(1).setCellValue((String)(inputMap.get("EXCEL_EK")));
        		
        		for(int i=4; i<9; i++) {
        			sheet.getRow(5).getCell(i).setCellStyle(HeadStyleNormal);
        		}
        		sheet.getRow(5).getCell(4).setCellValue("+856 2054155374(LAO)");
                System.out.println("6번쨰 완료.");
        		
        		//***************************7번째 row *****************************//
    			sheet.getRow(6).getCell(0).setCellStyle(HeadStyleBlue);
        		
    			sheet.getRow(6).getCell(0).setCellValue("전화번호:ເບີໂທ");
        		for(int i=1; i<4; i++) {
        			sheet.getRow(6).getCell(i).setCellStyle(HeadStyleNormal);
        		}
        		
        		sheet.getRow(6).getCell(1).setCellValue((String)(inputMap.get("EXCEL_PHONE")));
        		sheet.getRow(6).getCell(4).setCellValue("운임ລວມ");
        		sheet.getRow(6).getCell(5).setCellValue((String)(inputMap.get("EXCEL_TR_COST")));
        		sheet.getRow(6).getCell(7).setCellValue("담당직원 서명 ຜູ້ສົ່ງເຄືອງ");

                System.out.println("7번쨰 완료.");

        		//***************************8번째 row *****************************//
                
                sheet.getRow(7).getCell(0).setCellValue("이용연도:ປີ");
    			sheet.getRow(7).getCell(0).setCellStyle(HeadStyleBlue);
    			sheet.getRow(7).getCell(1).setCellValue((String)(inputMap.get("EXCEL_YEAR")));
        		for(int i=1; i<4; i++) {
        			sheet.getRow(7).getCell(i).setCellStyle(HeadStyleNormal);
        		}
        		for(int j=6; j<8; j++) {
        			sheet.getRow(j).getCell(4).setCellStyle(HeadStyleBlue);
	        		
        		}
        		for(int j=6; j<8; j++) {
	        		for(int i=5; i<7; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(HeadStyleNormal);
	        		}
        		}
        		for(int j=7; j<9; j++) {
        			sheet.getRow(6).getCell(j).setCellStyle(HeadStyleOrangeBold);
	        		
        		}
        		
        		sheet.getRow(7).getCell(7).setCellValue("Signiture");

        		for(int j=7; j<9; j++) {
	        		for(int i=7; i<9; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(SignitureStyleNormal);
	        		}
        		}

                System.out.println("8번쨰 완료.");

        		//***************************9번째 row *****************************//
                
        		sheet.getRow(8).getCell(0).setCellValue("물품수량:ຈ/ນແກັດ");
    			sheet.getRow(8).getCell(0).setCellStyle(HeadStyleBlue);
        		sheet.getRow(8).getCell(1).setCellValue((String)(inputMap.get("EXCEL_COUNT")));
        		for(int i=1; i<4; i++) {
        			sheet.getRow(8).getCell(i).setCellStyle(HeadStyleWhiteBold);
        		}
        		sheet.getRow(8).getCell(4).setCellValue("할인율ສ່ວນຫຼຸດ");
    			sheet.getRow(8).getCell(4).setCellStyle(HeadStyleBlue);
        		sheet.getRow(8).getCell(5).setCellValue("0%");
    			for(int i=5; i<7; i++) {
        			sheet.getRow(8).getCell(i).setCellStyle(HeadStyleNormal);
        		}

                System.out.println("9번쨰 완료.");

        		//***************************10번째 row *****************************//
                
        		sheet.getRow(9).getCell(0).setCellValue("출항 월:ເດືອນ");
    			sheet.getRow(9).getCell(0).setCellStyle(HeadStyleBlue);
        		sheet.getRow(9).getCell(1).setCellValue((String)(inputMap.get("EXCEL_MONTH")));
    			sheet.getRow(9).getCell(1).setCellStyle(HeadStyleNormalMonth);
        		sheet.getRow(9).getCell(4).setCellValue("할인금액 ລວມສ່ວນຫຼຸດ");
    			sheet.getRow(9).getCell(4).setCellStyle(HeadStyleBlue);
        		sheet.getRow(9).getCell(5).setCellValue("0$");
        		for(int i=5; i<7; i++) {
        			sheet.getRow(9).getCell(i).setCellStyle(HeadStyleNormalBlue);
        		}
        		sheet.getRow(9).getCell(7).setCellValue("고객/수령인 서명 ຜູ້ຮັບເຄືອງ");
    			sheet.getRow(9).getCell(7).setCellStyle(HeadStyleYellowBold);
    			sheet.getRow(9).getCell(8).setCellStyle(HeadStyleYellowBold);
                System.out.println("10번쨰 완료.");

        		//***************************11번째, 12번째 row *****************************//
        		sheet.getRow(10).getCell(0).setCellValue("이용에 감사드립니다. 더 나은 서비스로 보답하겠습니다.");
        		for(int j=10; j<12; j++) {
	        		for(int i=0; i<4; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(HeadStyleNormal);
	        		}
        		}
        		sheet.getRow(10).getCell(4).setCellValue("청구액 ລວມຕ້ອງຈ່າຍ");
        		for(int i=10; i<12; i++) {
        			sheet.getRow(i).getCell(4).setCellStyle(HeadStyleBlueBold);
        		}
        		sheet.getRow(10).getCell(5).setCellValue((String)(inputMap.get("EXCEL_COST")));
        		
        		for(int j=10; j<12; j++) {
        			for(int i=5; i<7; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(HeadStyleNormalRed);
	        		}
        		}
        		sheet.getRow(10).getCell(7).setCellValue("Signiture");

        		for(int j=10; j<12; j++) {
	        		for(int i=7; i<9; i++) {
	        			sheet.getRow(j).getCell(i).setCellStyle(SignitureStyleNormal);
	        		}
        		}


                System.out.println("11,12번쨰 완료.");

        		//***************************13번째 row *****************************//
        		sheet.getRow(12).getCell(0).setCellValue("※이용약관에 따라 운임은 중량과 부피 기반 환산금액중 높은쪽으로 청구되며,\n 최소 운임은 10$ 입니다.(소수점 단위 반올림) \n※ອີງຕາມຂໍ້ກຳນົດ ແລະເງື່ອນໄຂ, ຄ່າຂົນສົ່ງແມ່ນຄິດໄລ່ ຕາມຂະໜາດ ,ນ້ຳໜັກ,ແລະ ປະລິມານ");
        		
        		for(int i=0; i<4; i++) {
        			sheet.getRow(12).getCell(i).setCellStyle(HeadStyleLong);
        		}

    			anchor.setRow1(12);
        		anchor.setCol1(6);

    			// 이미지 그리기
    			final Picture pict = drawing.createPicture(anchor, pictureIdx);

    			// 이미지 사이즈 비율 설정
    			pict.resize();
    			
        		sheet.getRow(12).getCell(4).setCellValue("(KIP)");
        		for(int i=4; i<9; i++) {
        			sheet.getRow(12).getCell(i).setCellStyle(HeadStyleNormalDown);
        		}


                System.out.println("13번쨰 완료.");

        		//***************************14번째 row *****************************//
        		sheet.getRow(13).getCell(0).setCellValue("원화결제 →하나은행 : 윤병인 369-810087-61207");
        		for(int i=0; i<4; i++) {
        			sheet.getRow(13).getCell(i).setCellStyle(HeadStyleNormal);
        		}
        		sheet.getRow(13).getCell(4).setCellValue("BCEL BANK : MR HOUMPHAN SIHAPANYA");
        		for(int i=4; i<9; i++) {
        			sheet.getRow(13).getCell(i).setCellStyle(HeadStyleNormal);
        		}
                System.out.println("14번쨰 완료.");

        		//***************************15번째 row *****************************//
        		sheet.getRow(14).getCell(0).setCellValue("ບັນຊີ ຢູ່ ເກົາຫຼີ");
        		for(int i=0; i<4; i++) {
        			sheet.getRow(14).getCell(i).setCellStyle(HeadStyleNormal);
        		}
                sheet.getRow(14).getCell(4).setCellValue("010-12-01-01761708-001 (USD)");
                sheet.getRow(14).getCell(7).setCellValue("010-12-0001761708-001 (KIP)");
                for(int i=4; i<9; i++) {
        			sheet.getRow(14).getCell(i).setCellStyle(HeadStyleNormal);
        		}

                System.out.println("15번쨰 완료.");

        		//***************************테두리 작업 *****************************//
                
                for(int i=0; i<9; i++) {
        			sheet.getRow(15).getCell(i).setCellStyle(HeadStyleBorderTopBottom);
                	
                }

                for(int i=0; i<15; i++) {
        			sheet.getRow(i).getCell(9).setCellStyle(HeadStyleBorderLeft);
                	
                }
        		//***************************17번째 row *****************************//
                sheet.getRow(16).getCell(0).setCellValue("내품");
                sheet.getRow(16).getCell(1).setCellValue("중량");
                sheet.getRow(16).getCell(2).setCellValue("장");
                sheet.getRow(16).getCell(3).setCellValue("폭");
                sheet.getRow(16).getCell(4).setCellValue("고");
                sheet.getRow(16).getCell(5).setCellValue("용적중량");
                sheet.getRow(16).getCell(6).setCellValue("기준가");
                sheet.getRow(16).getCell(7).setCellValue("청구중량");
                sheet.getRow(16).getCell(8).setCellValue("청구운임");
                for(int i=0; i<9; i++) {
        			sheet.getRow(16).getCell(i).setCellStyle(HeadStyleBlueBold);
                	
                }
                int rowNumber = 17;
                for(int i=0; i<length; i++) {
                	for(int j=0; j<9; j++) {
                		sheet.getRow(rowNumber + i).getCell(j).setCellValue((String)(inputMap.get("EXCEL_TABLE[" + Integer.toString(i) +"][CELL"+ Integer.toString(j) + "]")));
            			sheet.getRow(rowNumber + i).getCell(j).setCellStyle(HeadStyleNormal);
                	}
                }


                for(int i=0; i<9; i++) {
        			sheet.getRow(rowNumber + length).getCell(i).setCellStyle(HeadStyleBorderTop);
                	
                }

                for(int i=rowNumber-1; i<rowNumber + length; i++) {
        			sheet.getRow(i).getCell(9).setCellStyle(HeadStyleBorderLeft);
                	
                }

        try{
	        FileOutputStream fileO = new FileOutputStream(new File(filePath, fileNm));
	
	        workbook.write(fileO);
	        in.close();
        	fos.close();
	        fileO.close();
        	return fileNm;
        	
	    }catch(Exception e){
	  		e.getStackTrace();
        	return "N";
	  	}
        finally {
   		 System.gc();
   		 System.runFinalization();
        	if(imageFile.delete()){
//    			System.out.println("이미지파일삭제 성공");
    		}else{
//    			System.out.println("이미지파일삭제 실패");
    		}
        }
    }
    
    @RequestMapping(value = "/Excel2.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public void exceldownload2(@RequestParam HashMap<String, Object> inputMap, Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {

    	String path = filePath + "\\" +(String)(inputMap.get("fileNm"));
		File file = new File(path);
		
    	 try{
    	    	
    	        
    			System.out.println(" getName : " + file.getName());

    			System.out.println(" path : " + path);
    			long fileLength = file.length();
    	        response.setContentType("application/vnd.ms-excel;");
    			response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());


				FileInputStream fileInputStream = new FileInputStream(path);		
				OutputStream out = response.getOutputStream();
	            
				int read=0;
				byte[] buffer = new byte[1024];
				while((read = fileInputStream.read(buffer)) > -1) {
					out.write(buffer, 0, read);
//    					workbook.write(out);
				}
				out.flush();

				fileInputStream.close();
				out.close();
				

    		}
			catch(Exception ex) {
				throw new RuntimeException("파일 저장 에러");

			}
    	 finally {
    		 System.gc();
    		 System.runFinalization();
    		 if(file.delete()){
//	    			System.out.println("파일삭제 성공");
	    		}else{
//	    			System.out.println("파일삭제 실패");
	    		}
    	 }
		
		
	}

   
//	public static HSSFWorkbook excel(HashMap<String, Object> inputMap , HttpServletResponse response, Map<String, Object> model) throws Exception{
//			
//		//List<HntTabs>
//				HSSFWorkbook workbook = new HSSFWorkbook();
//		        
//		        // 변수 가져오기
//		        String sheetTitle = String.valueOf(inputMap.get("Title"));
////		        ArrayList<HashMap<String, String>> t1100List = (ArrayList<HashMap<String, String>>)inputMap.get("list");
//		        
//		   
////		        int cellCnt = inputMap.keySet().size();
//
//		        
//		        // 시트 생성
//				HSSFSheet sheet = workbook.createSheet(sheetTitle);
//
//		        Locale locale = (Locale) model.get("locale");
//		        String workbookName = (String) model.get("workbookName");
//		        
    
//		        
//				CellStyle borderStyle = workbook.createCellStyle();
//				borderStyle.setBorderBottom(CellStyle.BORDER_THIN);
//				borderStyle.setBorderLeft(CellStyle.BORDER_THIN);
//				borderStyle.setBorderRight(CellStyle.BORDER_THIN);
//				borderStyle.setBorderTop(CellStyle.BORDER_THIN);
//				borderStyle.setAlignment(CellStyle.ALIGN_CENTER);
//				
//		        //시트 열 너비 설정
//		        sheet.setColumnWidth(0, 1500);
//		        sheet.setColumnWidth(0, 3000);
//		        sheet.setColumnWidth(0, 3000);
//		        sheet.setColumnWidth(0, 1500);
//		        
////		        for(int i=0; i<2; i++) {
//		            Row bodyRow = null;
//		            Cell bodyCell = null;
//		            bodyRow = sheet.createRow(0);
//		            bodyCell = bodyRow.createCell(0);
////		            bodyCell.setCellValue(t1100List.get(i).get(code));
//		            
////		        }
//		        bodyCell.setCellValue((String)(inputMap.get("ONE_HEAD1")));
//	            sheet.addMergedRegion(new CellRangeAddress(1, 1, 1, 5));
////		            Iterator iterator = header.keySet().iterator();
////		            int j=0;
////					while(iterator.hasNext()){
////						String code = (String)iterator.next();
////						bodyCell = bodyRow.createCell(j++);
//////						bodyCell.setCellValue(t1100List.get(i).get(code));
////					}
////		        }
//	            response.setContentType("application/download;charset=utf-8");
//	            response.setHeader("Content-Disposition", "attachment; filename=\"" + "20241011.xlsx" +"\";");
//	            response.setHeader("Content-Transfer-Encoding", "binary");
//
//	            OutputStream os = null;
//	            SHSSFWorkbook workbook2 = null;
//
//		        try {
//		        	workbook2 = new SHSSFWorkbook(workbook);
//		            os = response.getOutputStream();
//		            
//		            // 파일생성
//		            workbook2.write(os);
//		        }catch (Exception e) {
//		            e.printStackTrace();
//		        } finally {
//		            if(workbook2 != null) {
//		                try {
//		                	workbook2.close();
//		                } catch (Exception e) {
//		                    e.printStackTrace();
//		                }
//		            }
//		            
//		            if(os != null) {
//		                try {
//		                    os.close();
//		                } catch (Exception e) {
//		                    e.printStackTrace();
//		                }
//		            }
//		        }
//
//		        return workbook;
//		}
	
}