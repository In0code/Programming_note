package kr.co.sist.user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.service.ProductService;
import kr.co.sist.user.vo.ProductVO;

@Controller
public class ProductController {
	private static final String UPLOAD_DIR = "E:/dev/workspace-spring/mvc_prj/src/main/webapp/upload";
	private ProductService ps=ProductService.getInstance();

	/**
	 * 상품 등록 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_register.do")
	public String productRegister(HttpServletRequest request, Model model) {
		
		
		
		return "user/product/product_register";
	}//productRegister
	
//	@RequestMapping("/upload_process.do")
//	public String upload(HttpServletRequest request, Model model) {
//		
//		
//	}//productRegister
	
	
	/**
	 * 판매자가 보는 상품 상세 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_detail.do")
	public String productDetail(HttpServletRequest request, Model model,ProductVO pVO) {
		
		ProductDomain userProduct=ps.searchProduct(pVO);
		
		model.addAttribute("userProduct",userProduct);
		
		return "user/product/product_detail";
	}//productDetail
	
	/**
	 * 상품 등록 완료 시 나오는 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@PostMapping("/user/product/product_register_ok.do")
	public String productRegisterOk(HttpSession session,HttpServletRequest request, Model model,ProductVO pVO) {
		
		File saveDir=new File("C:/Users/user/git/retro/retro_prj/src/main/webapp/upload");
		
		int maxSize=1024*1024*30; // 최대 파일 업로드 사이즈 30Mbyte
		try {
			MultipartRequest mr=new MultipartRequest(request, saveDir.getAbsolutePath(), 
					maxSize, "UTF-8",new DefaultFileRenamePolicy());
			
			String pname=mr.getParameter("pname");
			String context=mr.getParameter("context");
			String img=mr.getFilesystemName("img");
			int price=Integer.parseInt(mr.getParameter("price"));
			String deliver=mr.getParameter("deliver");
			String status=mr.getParameter("status");
			String loc=mr.getParameter("loc");
			String c3code=mr.getParameter("c3code");
			String id = (String)session.getAttribute("id");
			
			pVO.setPname(pname);
			pVO.setContext(context);
			pVO.setImg(img);
			pVO.setPrice(price);
			pVO.setDeliver(deliver);
			pVO.setStatus(status);
			pVO.setLoc(loc);
			pVO.setC3code(c3code);
			pVO.setId("1011kiy111");
			
			int insertCnt= ps.addProduct(pVO);
			model.addAttribute("insertCnt",insertCnt);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "user/product/product_register_ok";
	}//productDetails
	
	@ResponseBody
	@RequestMapping("/user/product/productEdit.do")
	public String productEdit(ProductVO pVO) {
		
		return ps.editProduct(pVO).toJSONString();
	}//productDetail
	
	@ResponseBody
	@RequestMapping("/user/product/productDelete.do")
	public String productDelete(ProductVO pVO) {
		
		return ps.cancelProduct(pVO).toJSONString();
	}//productDetail
	
	
}//class