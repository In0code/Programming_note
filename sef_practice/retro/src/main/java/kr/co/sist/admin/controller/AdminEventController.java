package kr.co.sist.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.Loader.Simple;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.sist.admin.domain.AdminEventDomain;
import kr.co.sist.admin.service.AdminEventService;
import kr.co.sist.admin.vo.AdminEventVO;
import kr.co.sist.common.BoardRangeVO;

@Controller
public class AdminEventController {
	
	@Autowired
	private AdminEventService aes;
	
	/**
	 * 이벤트 리스트
	 * @return
	 */
	@GetMapping("/admin/event.do")
	public String eventList(Model model, HttpSession session, BoardRangeVO brVO) {
		
		List<AdminEventDomain> list = aes.searchAllEvent(brVO);
		
		model.addAttribute("eventList", list);
		
		return "admin/event/event_managing";
	}

	
	/**
	 * 이벤트 상세 보기
	 * @return
	 */
	@GetMapping("/admin/eventDetail.do")
	public String eventDetail(String ecode, Model model) {
		AdminEventDomain event = aes.searchOneEvent(ecode);
		
		model.addAttribute("event", event);
		
		return "admin/event/eventDetail_managing";
	}

	
	/**
	 * 이벤트 등록 화면
	 * @return
	 */
	@GetMapping("/admin/eventAddFrm.do")
	public String eventAddFrm() {
		return "admin/event/event_add_frm";
	}
	
	@ResponseBody
	@PostMapping("/admin/eventAddProcess.do")
	public String eventAddProcess(HttpServletRequest request, Model model) {
		File saveDir = new File("C:/Users/user/git/retro/retro_prj/src/main/webapp/upload");
		int maxSize = 1024*1024*30; //최대 파일 업로드 사이즈는 10Mbyte
		int chkSize = 1024*1024*10;
		boolean uploadFlag = true;
		JSONObject json = new JSONObject();
		AdminEventVO aeVO = new AdminEventVO();
		
		try {
			//파일 업로드 수행
			MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), 
					maxSize, "UTF-8", new DefaultFileRenamePolicy());
			File img = new File(saveDir.getAbsoluteFile() + "/" + mr.getFilesystemName("img"));
			File img2 = new File(saveDir.getAbsoluteFile() + "/" + mr.getFilesystemName("img2"));
			
			//본문 이미지
			if(img.length() > chkSize) {
				uploadFlag = false;
				img.delete(); //사이즈 초과시 파일 삭제
				json.put("overFileimg", mr.getFilesystemName("img"));
			}
			
			//썸네일
			if(img2.length() > chkSize) {
				uploadFlag = false;
				img2.delete();
				json.put("overFileimg2", mr.getFilesystemName("img2"));
			}
			
			if(uploadFlag) {
				aeVO.setStart_date(mr.getParameter("start_date"));
				aeVO.setEnd_date(mr.getParameter("end_date"));
				aeVO.setTitle((mr.getParameter("title")));
				aeVO.setContext((mr.getParameter("context")));
				aeVO.setImg(mr.getFilesystemName("img"));
				aeVO.setImg2(mr.getFilesystemName("img2"));
				aeVO.setId("admin");
				System.out.println(aeVO.toString());
				
				json.put("insertFlag",aes.addEvent(aeVO)==1);
			}
			
			json.put("uploadFlag", uploadFlag);
			System.out.println(json.toJSONString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return json.toJSONString();
	}
	

}
