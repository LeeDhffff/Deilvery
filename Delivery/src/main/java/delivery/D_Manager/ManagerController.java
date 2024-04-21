package delivery.D_Manager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.TreeMap;

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

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.usermodel.SheetConditionalFormatting;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

    public static String filePath = "C:\\Users\\USERPC\\Downloads";
    
	@RequestMapping(value = "/Excel.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String exceldownload(@RequestParam HashMap<String, Object> inputMap, Map<String, Object> model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		excel(inputMap,response,model);
		
		return "엑셀 파일이 다운로드 폴더에 저장되었습니다.";
	}
	


    public static void excel(HashMap<String, Object> inputMap , HttpServletResponse response, Map<String, Object> model) throws Exception{
    	 // 빈 Workbook 생성
        XSSFWorkbook workbook = new XSSFWorkbook();
        System.out.println(inputMap);
        // 빈 Sheet를 생성
        XSSFSheet sheet = workbook.createSheet((String)(inputMap.get("IN_KEY")));
        String fileNm = "EK Logistics_"+(String)(inputMap.get("IN_KEY"))+".xlsx";
        
        // Sheet를 채우기 위한 데이터들을 Map에 저장
        Map<String, Object[]> data = new TreeMap<>();
        data.put("1", new Object[]{"INVOICE"});
        data.put("2", new Object[]{"WOW"});
        data.put("3", new Object[]{"2"});
        data.put("4", new Object[]{"3"});
        data.put("5", new Object[]{"4"});

        // data에서 keySet를 가져온다. 이 Set 값들을 조회하면서 데이터들을 sheet에 입력한다.
        Set<String> keyset = data.keySet();
        int rownum = 0;
        // (세로form~ 세로to , 가로from~가로to)
        sheet.addMergedRegion(new CellRangeAddress(0,1,0,8));
        sheet.addMergedRegion(new CellRangeAddress(2,3,0,1));
        sheet.addMergedRegion(new CellRangeAddress(2,2,4,8));
        sheet.addMergedRegion(new CellRangeAddress(3,3,4,8));
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
        
        CellStyle TestStyle = workbook.createCellStyle();
        Font TestFont = workbook.createFont();

//        Object[] objArr = data.get("1");
//        Row row = sheet.createRow(0);
//        Cell cell = row.createCell(0);
        
//        TestFont.setBoldweight(Font.BOLDWEIGHT_BOLD);
//        TestStyle.setFont(TestFont);
//        
//        
//        // 이렇게 해당 cell에 주입하고 싶은 Style객체를 주입하면 끝입니다. 
        
//        cell.setCellStyle(TestStyle);
//
//        System.out.println((String)objArr[0]);
//        cell.setCellValue((String)objArr[0]);
//
//        System.out.println((String)objArr[1]);
//        cell.setCellValue((String)objArr[1]);
        // 알아야할 점, TreeMap을 통해 생성된 keySet는 for를 조회시, 키값이 오름차순으로 조회된다.
//        for (String key : keyset) {
//            Row row = sheet.createRow(rownum++);
//            Object[] objArr = data.get(key);
//            int cellnum = 0;
//            System.out.println(key);
//            for (Object obj : objArr) {
//                Cell cell = row.createCell(cellnum++);
//
//                System.out.println(cellnum +" : "+ obj);
        		Row row = sheet.createRow(0);
        		row.createCell(0).setCellValue("INVOICE");
        		row = sheet.createRow(2);
        		row.createCell(0).setCellValue("NOY");
        		row.createCell(3).setCellValue("ຕູ້ທີ່1 ເດືອນ11");
        		row.createCell(4).setCellValue("EK Logistics");
        		row = sheet.createRow(3);
        		row.createCell(2).setCellValue("고객님 귀하");
        		row.createCell(3).setCellValue((String)(inputMap.get("EXCEL_NAME")));
        		row.createCell(4).setCellValue((String)(inputMap.get("EXCEL_ADDRESS")));
        		
        		row = sheet.createRow(4);
        		row.createCell(0).setCellValue("접수번호:");
        		row.createCell(1).setCellValue((String)(inputMap.get("EXCEL_EK")));
        		row.createCell(4).setCellValue("TEL: +856 2099118282(LAO) / +856 2055533327(KR)");
                
        		row = sheet.createRow(5);
        		row.createCell(0).setCellValue("ລະຫັດ");
        		row.createCell(4).setCellValue("+856 2054155374(LAO)");

        		row = sheet.createRow(6);
        		row.createCell(0).setCellValue("전화번호:ເບີໂທ");
        		row.createCell(1).setCellValue((String)(inputMap.get("EXCEL_PHONE")));
        		row.createCell(4).setCellValue("운임ລວມ");
        		row.createCell(5).setCellValue((String)(inputMap.get("EXCEL_TR_COST")));
        		row.createCell(7).setCellValue("담당직원 서명 ຜູ້ສົ່ງເຄືອງ");
        		
                row = sheet.createRow(7);
                row.createCell(0).setCellValue("이용연도:ປີ");
        		row.createCell(1).setCellValue((String)(inputMap.get("EXCEL_YEAR")));
                row.createCell(7).setCellValue("Signiture");
                
                row = sheet.createRow(8);
                row.createCell(0).setCellValue("물품수량:ຈ/ນແກັດ");
        		row.createCell(1).setCellValue((String)(inputMap.get("EXCEL_COUNT")));
                row.createCell(4).setCellValue("할인율ສ່ວນຫຼຸດ");
                row.createCell(7).setCellValue("고객/수령인 서명 ຜູ້ຮັບເຄືອງ");
                
                row = sheet.createRow(9);
                row.createCell(0).setCellValue("출항 월:ເດືອນ");
        		row.createCell(1).setCellValue((String)(inputMap.get("EXCEL_MONTH")));
                row.createCell(4).setCellValue("할인금액 ລວມສ່ວນຫຼຸດ");
                row.createCell(7).setCellValue("고객/수령인 서명 ຜູ້ຮັບເຄືອງ");
                
                row = sheet.createRow(10);
                row.createCell(0).setCellValue("이용에 감사드립니다. 더 나은 서비스로 보답하겠습니다.");
        		row.createCell(5).setCellValue((String)(inputMap.get("EXCEL_COST")));
                row.createCell(4).setCellValue("청구액 ລວມຕ້ອງຈ່າຍ");
                row.createCell(7).setCellValue("Signiture");
                
                row = sheet.createRow(12);
                row.createCell(0).setCellValue("※이용약관에 따라 운임은 중량과 부피 기반 환산금액중 높은쪽으로 청구되며, 최소 운임은 10$ 입니다.(소수점 단위 반올림) ※ອີງຕາມຂໍ້ກຳນົດ ແລະເງື່ອນໄຂ, ຄ່າຂົນສົ່ງແມ່ນຄິດໄລ່ ຕາມຂະໜາດ ,ນ້ຳໜັກ,ແລະ ປະລິມານ");
                row.createCell(4).setCellValue("(KIP)");

                row = sheet.createRow(13);
                row.createCell(0).setCellValue("원화결제 →하나은행 : 윤병인 369-810087-61207");
                row.createCell(4).setCellValue("BCEL BANK : MR HOUMPHAN SIHAPANYA");

                row = sheet.createRow(14);
                row.createCell(0).setCellValue("ບັນຊີ ຢູ່ ເກົາຫຼີ");
                row.createCell(4).setCellValue("010-12-01-01761708-001 (USD)");
                row.createCell(7).setCellValue("010-12-0001761708-001 (KIP)");
                

                row = sheet.createRow(16);
                row.createCell(0).setCellValue("내품");
                row.createCell(1).setCellValue("중량");
                row.createCell(2).setCellValue("장");
                row.createCell(3).setCellValue("폭");
                row.createCell(4).setCellValue("고");
                row.createCell(5).setCellValue("용적중량");
                row.createCell(6).setCellValue("기준가");
                row.createCell(7).setCellValue("청구중량");
                row.createCell(8).setCellValue("청구운임");
                
                int rowNumber = 17;
                int length = Integer.valueOf((String)inputMap.get("EXCEL_TABLE_NUM"));
                for(int i=0; i<length; i++) {
                	row = sheet.createRow(rowNumber + i);
                	for(int j=0; j<9; j++) {
                		 row.createCell(j).setCellValue((String)(inputMap.get("EXCEL_TABLE[" + Integer.toString(i) +"][CELL"+ Integer.toString(j) + "]")));
                	}
                }
                
                //                if (obj instanceof String) {
//                    cell.setCellValue((String)obj);
//                    TestStyle.setBorderLeft(HSSFCellStyle.BORDER_MEDIUM);
//                    TestStyle.setBorderTop(HSSFCellStyle.BORDER_MEDIUM);
//                    cell.setCellStyle(TestStyle);
//                }
//            }
//        }

        try (FileOutputStream out = new FileOutputStream(new File(filePath, fileNm))) {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
//	public static XSSFWorkbook excel(HashMap<String, Object> inputMap , HttpServletResponse response, Map<String, Object> model) throws Exception{
//			
//		//List<HntTabs>
//				XSSFWorkbook workbook = new XSSFWorkbook();
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
//				XSSFSheet sheet = workbook.createSheet(sheetTitle);
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
//	            SXSSFWorkbook workbook2 = null;
//
//		        try {
//		        	workbook2 = new SXSSFWorkbook(workbook);
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