package delivery.D_Manager;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
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
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	public String Out_Day_File_Insert(@RequestParam("uploadFile") List<MultipartFile> uploadFile, @RequestParam HashMap<String, Object> inputMap, HttpServletRequest request, MultipartHttpServletRequest mRequest,
			HttpSession session) throws Exception {


		System.out.println("uploadFile.size : "+uploadFile.size());
		
		String path1 = "D:\\DeliveryUpload\\outdayFile";
		File savePath1 = new File(path1);
		if(!savePath1.exists()) savePath1.mkdir();

		
		SimpleDateFormat now = new SimpleDateFormat("yyyyMMddhhmmss");		
		
		for(int i=0; i<uploadFile.size(); i++) {
			
			String today = now.format(System.currentTimeMillis());
			String oName = uploadFile.get(i).getOriginalFilename();
			String ext = oName.substring(oName.lastIndexOf(".")+1);
			if(!oName.equals("")) {
				oName = today+"_"+oName.substring(oName.lastIndexOf("\\")+1);
			}
			System.out.println("oName : " + oName + ", " + "확장자 : " + ext);

			inputMap.put("PATH", path1);

			File saveFile = new File(path1, oName);
			try {
				if(!oName.equals("")) {
					uploadFile.get(i).transferTo(saveFile);
					inputMap.put("SAVE_NM", oName);
					inputMap.put("ORGIN_NM", uploadFile.get(i).getOriginalFilename());
					System.out.println("업로드 성공 :" + "ORGIN_NM");
				}
				else {
					System.out.println("해당파일 없음 :" + "ORGIN_NM");
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}				
		}	
		if(uploadFile.size() == 0) {
			inputMap.put("PATH", "");
			inputMap.put("ORGIN_NM", "");
			inputMap.put("SAVE_NM", "");
		}
		
		System.out.println("출항일 현황 등록 input: " + inputMap);
		String ListDays = ManagerService.Out_Day_File_Insert(inputMap);
		System.out.println("출항일 현황 등록 result: " + ListDays);

		
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(ListDays);
		
		return jsonStr;
	}
	

	/* 출항일 파일 수정/삭제 (현재 사용여부 X) */
	@RequestMapping(value = "Out_Day_File_UD.do", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Out_Day_File_UD(@RequestParam("uploadFile") List<MultipartFile> uploadFile, @RequestParam HashMap<String, Object> inputMap, HttpServletRequest request, MultipartHttpServletRequest mRequest,
			HttpSession session) throws Exception {

		
		if(inputMap.get("MODE").equals("U")) {
		System.out.println("uploadFile.size : "+uploadFile.size());
		
		String path1 = "D:\\DeliveryUpload\\outdayFile";
		File savePath1 = new File(path1);
		if(!savePath1.exists()) savePath1.mkdir();

		
		SimpleDateFormat now = new SimpleDateFormat("yyyyMMddhhmmss");	
		for(int i=0; i<uploadFile.size(); i++) {
			
			String today = now.format(System.currentTimeMillis());
			String oName = uploadFile.get(i).getOriginalFilename();
			String ext = oName.substring(oName.lastIndexOf(".")+1);
			if(!oName.equals("")) {
				oName = today+"_"+oName.substring(oName.lastIndexOf("\\")+1);
			}
			System.out.println("oName : " + oName + ", " + "확장자 : " + ext);

			inputMap.put("PATH", path1);

			File saveFile = new File(path1, oName);
			try {
				if(!oName.equals("")) {
					uploadFile.get(i).transferTo(saveFile);
					inputMap.put("ORGIN_NM", oName);
					inputMap.put("SAVE_NM", uploadFile.get(i).getOriginalFilename());
					System.out.println("업로드 성공 :" + "ORGIN_NM");
				}
				else {
					System.out.println("해당파일 없음 :" + "ORGIN_NM");
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}				
		}	

		if(uploadFile.size() == 0) {
			inputMap.put("PATH", "");
			inputMap.put("ORGIN_NM", "");
			inputMap.put("SAVE_NM", "");
		}
		
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
		
		String msg = sendMail((String)(inputMap.get("EMAIL")),resultNum);

	    
	    HashMap<String, Object> mav = new HashMap<String, Object>();
		mav.put("resultMsg", msg);
		mav.put("code", resultNum);

		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(mav);

	    System.out.println(msg);
		return jsonStr;
	}
	
	
	
	public static String sendMail(String toMail, String _Key) {

	    System.out.println("이메일 전송 시작.");

	    String subject = "EK Logistics 인증키입니다.";
	    String fromMail = "ehdgjs1411@naver.com";
	    String fromName = "EK Logistics";
	    String _email = "ehdgjs1411@naver.com";
	    String _password = "onyxsky_123";

	    // mail contents
	    StringBuffer contents = new StringBuffer();
	    contents.append("<h1>Hello</h1>\n");
	    contents.append("<p>Nice to meet you ~! :)</p><br>");
	    contents.append("<p>your code : )</p><br>");
	    contents.append("<p><h2><b></b>"+_Key +"</h2></p><br>");
	    contents.append("<p>good bye.</p><br>");
	    
	    // mail properties
	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.naver.com"); // use naver
	    props.put("mail.smtp.port", "587"); // set port gamil은 465

	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true"); // use TLS

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
}