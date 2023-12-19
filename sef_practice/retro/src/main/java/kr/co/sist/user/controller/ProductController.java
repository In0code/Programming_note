package kr.co.sist.user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.sist.user.domain.ProductDomain;
import kr.co.sist.user.service.ProductService;
import kr.co.sist.user.vo.ProductVO;

@SessionAttributes("pcode")
@Controller
public class ProductController {
	private ProductService ps=ProductService.getInstance();

	/**
	 * 상품 등록 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_register.do")
	public String productRegister() {
		
		return "user/product/product_register";
	}//productRegister
	
	
	
	/**
	 * 상품 등록 완료 시 나오는 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_register_ok.do")
	public String productRegisterOk(Model model,HttpSession session,HttpServletRequest request,ProductVO pVO)  {
		
		File saveDir=new File("C:/Users/user/git/retro/retro_prj/src/main/webapp/upload");
		
		int maxSize=1024*1024*30; // 최대 파일 업로드 사이즈 30Mbyte
		try {
			
			String pcode=ps.pcode();
			
			MultipartRequest mr=new MultipartRequest(request, saveDir.getAbsolutePath(), 
					maxSize, "UTF-8",new DefaultFileRenamePolicy());
			
			String id = (String)session.getAttribute("id");
			
			
			
			pVO.setPname(mr.getParameter("pname"));
			pVO.setContext(mr.getParameter("context"));
			pVO.setImg(mr.getFilesystemName("img"));
			pVO.setImg2(mr.getFilesystemName("img2"));
			pVO.setImg3(mr.getFilesystemName("img3"));
			pVO.setImg4(mr.getFilesystemName("img4"));
			pVO.setPrice(Integer.parseInt(mr.getParameter("price")));
			pVO.setDeliver(mr.getParameter("deliver"));
			pVO.setStatus(mr.getParameter("status"));
			pVO.setLoc(mr.getParameter("loc"));
			pVO.setC3code(mr.getParameter("c3code"));
			pVO.setPcode(pcode);
			pVO.setId(id);
			
			ps.addProduct(pVO);
			
			model.addAttribute("pcode", pcode);
	       
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
	    return "user/product/product_register_ok";
	}//productDetails
	

	/**
	 * 판매자가 보는 상품 상세 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_detail.do")
	public String productDetail( HttpSession session,Model model,ProductVO pVO) {
		String id = (String)session.getAttribute("id");
	
		String pcode = (String)session.getAttribute("pcode"); 
		pVO.setPcode(pcode);
		pVO.setId(id);
		ProductDomain userProduct=ps.searchProduct(pVO);
		
		model.addAttribute("AllCominfo", ps.searchBuyerAllInfo(id));
		model.addAttribute("wishCnt", ps.searchWishCnt(pcode));
		model.addAttribute("searchChk", ps.searchCheck(pVO));
		
		model.addAttribute("userProduct",userProduct);
		
		return "user/product/product_detail";
	}//productDetail
	
	/**
	 * 상품 수정 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_edit.do")
	public String productEditFrm(HttpServletRequest request, Model model, ProductVO pVO) {

	    String pcode = request.getParameter("pcode"); 
	    pVO.setPcode(pcode); 

	    model.addAttribute("userProduct", ps.searchProduct(pVO));
	    model.addAttribute("searchChk", ps.searchCheck(pVO));

	    return "user/product/product_edit";
	}//productEditFrm
	
	
	@RequestMapping("/user/product/productEdit_register_ok.do")
	public String productEdit(HttpSession session,HttpServletRequest request, ProductVO pVO)  {
		
		File saveDir=new File("C:/Users/user/git/retro/retro_prj/src/main/webapp/upload");
		
		int maxSize=1024*1024*30; // 최대 파일 업로드 사이즈 30Mbyte
		try {
			MultipartRequest mr=new MultipartRequest(request, saveDir.getAbsolutePath(), 
					maxSize, "UTF-8",new DefaultFileRenamePolicy());
			
			String id = (String)session.getAttribute("id");
			
			pVO.setPname(mr.getParameter("pname"));
			pVO.setContext(mr.getParameter("context"));
			pVO.setImg(mr.getFilesystemName("img"));
			pVO.setImg2(mr.getFilesystemName("img2"));
			pVO.setImg3(mr.getFilesystemName("img3"));
			pVO.setImg4(mr.getFilesystemName("img4"));
			pVO.setPrice(Integer.parseInt(mr.getParameter("price")));
			pVO.setDeliver(mr.getParameter("deliver"));
			pVO.setStatus(mr.getParameter("status"));
			pVO.setLoc(mr.getParameter("loc"));
			pVO.setC3code(mr.getParameter("c3code"));
			pVO.setPcode(mr.getParameter("pcode"));
			pVO.setId(id);
			ps.editProduct(pVO);
	       
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
	    return "user/product/product_register_ok";

	}//productDetails
	
	
	@ResponseBody
	@RequestMapping("/user/product/productSaleEdit.do")
	public String productSaleEdit(String pcode) {
		
		return ps.editSaleok(pcode).toJSONString();
	}//productDetail
	
	@ResponseBody
	@RequestMapping("/user/product/productDelete.do")
	public String productDelete(String pcode) {
		return ps.cancelProduct(pcode).toJSONString();
	}//productDetail
	
	
}//class