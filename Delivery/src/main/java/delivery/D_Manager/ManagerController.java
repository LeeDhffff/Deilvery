package delivery.D_Manager;

import java.io.File;
import java.text.SimpleDateFormat;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import delivery.D_Manager.service.ManagerService;

@Controller
public class ManagerController {
	
	@Resource(name = "ManagerService")
	private ManagerService ManagerService;


	@RequestMapping("/Main_Manager.do")
	public String Main_Manager() {
		return "4.Manager/Main_Manager";
	}
	

	@RequestMapping("/MemberListPage.do")
	public String MemberList() {
		return "4.Manager/MemberList";
	}


	@RequestMapping("/M_DeliveryList.do")
	public String DeliveryList() {
		return "4.Manager/DeliveryList";
	}
	
	@RequestMapping("/M_Delivery_NC_List.do")
	public String Delivery_NC_List() {
		return "4.Manager/Delivery_NC_List";
	}

	@RequestMapping("/Outday_List.do")
	public String Outday_List() {
		return "4.Manager/Outday_List";
	}

	@RequestMapping("/Outday.do")
	public String Outday() {
		return "4.Manager/Outday";
	}
	
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
	
	

	@RequestMapping(value = "/Mem_Pw_Chk.do" , produces = "application/text; charset=utf-8")
	@ResponseBody
	public String Mem_Pw_Chk(@RequestParam HashMap<String, Object> inputMap, Model model, HttpServletRequest request, HttpSession session) throws Exception {

		String LoginList = ManagerService.Mem_Pw_Chk(inputMap);
		
		return LoginList;
	}
	
	
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
}