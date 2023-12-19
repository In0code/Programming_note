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
import kr.co.sist.common.pagination.Pagination;
import kr.co.sist.common.pagination.PaginationDomain;

@Controller
public class AdminEventController {
	
	@Autowired
	private AdminEventService aes;
	
	/**
	 * 이벤트 리스트
	 * @return
	 */
	@GetMapping("/admin/event.do")
	public String eventList(Model model, HttpSession session, BoardRangeVO brVO, String page) {
		int currentPage = 1;
		if(page != null && !"".equals(page)) {
			currentPage = Integer.parseInt(page);
		}
		
		int totalRecode = aes.totalCnt(brVO);
		PaginationDomain pDomain = new Pagination().setStartEndPageNum(totalRecode, currentPage);
		
		brVO.setStartNum(pDomain.getStartNum());
		brVO.setEndNum(pDomain.getEndNum());
		
		List<AdminEventDomain> list = aes.searchAllEvent(brVO);
		
		model.addAttribute("eventList", list);
		model.addAttribute("pageStart", pDomain.getPaginationStartNum());
		model.addAttribute("pageEnd", pDomain.getPaginationEndNum());
		
		return "admin/event/event_managing";
	}

	/**
	 * 이벤트 상세 보기
	 * @return
	 */
	@GetMapping("/admin/eventDetail.do")
	public String eventDetail(String eventcode, Model model) {
		AdminEventDomain event = aes.searchOneEvent(eventcode);
		
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
	
	/**
	 * 이벤트 등록 프로세스
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/admin/eventAddProcess.do")
	public String eventAddProcess(HttpServletRequest request) {
		return eventProcess(request, "insert");
	}

	/**
	 * 이벤트 수정 프로세스
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/admin/eventUpdateProcess.do")
	public String eventUpdateProcess(HttpServletRequest request) {
		return eventProcess(request, "update");
	}
	
	/**
	 * 등록/수정 프로세스
	 * @param request
	 * @param method insert/update
	 * @return
	 */
	public String eventProcess(HttpServletRequest request, String method) {
		File saveDir = new File("C:/Users/user/git/retro/retro_prj/src/main/webapp/upload");
		int maxSize = 1024*1024*30; //최대 파일 업로드 사이즈는 10Mbyte
		int chkSize = 1024*1024*10;
		boolean uploadFlag = true;
		boolean resultFlag = false;
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
				json.put("overFileimg", mr.getOriginalFileName("img"));
			}
			
			//썸네일
			if(img2.length() > chkSize) {
				uploadFlag = false;
				json.put("overFileimg2", mr.getOriginalFileName("img2"));
			}
			
			if(uploadFlag) {
				aeVO.setEventcode(mr.getParameter("eventcode"));
				aeVO.setStart_date(mr.getParameter("start_date"));
				aeVO.setEnd_date(mr.getParameter("end_date"));
				aeVO.setTitle((mr.getParameter("title")));
				aeVO.setContext((mr.getParameter("context")));
				aeVO.setImg(mr.getOriginalFileName("img"));
				aeVO.setImg2(mr.getOriginalFileName("img2"));
				aeVO.setId(mr.getParameter("id"));
				
				if("insert".equals(method)) {
					resultFlag = aes.addEvent(aeVO)==1;
				}
				if("update".equals(method)) {
					resultFlag = aes.editEvent(aeVO)==1;
				}
			}
			
			//insert/update 실패시 파일 삭제
			if(!resultFlag || !uploadFlag) {
				img.delete();
				img2.delete();
			}
			
			json.put("resultFlag",resultFlag);
			json.put("uploadFlag",uploadFlag);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return json.toJSONString();
	}
	
	@ResponseBody
	@PostMapping("/admin/eventDeleteProcess.do")
	public String removeEvent(String eventcode) {
		JSONObject json = new JSONObject();
		
		int cnt = aes.removeEvent(eventcode);
		
		if(cnt == 1) {
			json.put("resultFlag", true);
		}else {
			json.put("resultFlag", false);
		}
		
		return json.toJSONString();
	}
	
}
