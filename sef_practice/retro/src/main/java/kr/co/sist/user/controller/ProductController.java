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
	 * 상품 등록 완료 시 나오는 페이지
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/user/product/product_register_ok.do")
	public String productRegisterOk(HttpSession session,HttpServletRequest request, Model model,ProductVO pVO)  {
		
		File saveDir=new File("C:/Users/user/git/retro/retro_prj/src/main/webapp/upload");
		
		int maxSize=1024*1024*30; // 최대 파일 업로드 사이즈 30Mbyte
		String pcode=null;
		try {
			MultipartRequest mr=new MultipartRequest(request, saveDir.getAbsolutePath(), 
					maxSize, "UTF-8",new DefaultFileRenamePolicy());
			
			String pname=mr.getParameter("pname");
			String context=mr.getParameter("context");
			String img=mr.getFilesystemName("img");
			String img2=mr.getFilesystemName("img2");
			String img3=mr.getFilesystemName("img3");
			String img4=mr.getFilesystemName("img4");
			int price=Integer.parseInt(mr.getParameter("price"));
			String deliver=mr.getParameter("deliver");
			String status=mr.getParameter("status");
			String loc=mr.getParameter("loc");
			String c3code=mr.getParameter("c3code");
			String id = (String)session.getAttribute("id");
			
			
//			System.out.println(img);
			pVO.setPname(pname);
			pVO.setContext(context);
			pVO.setImg(img);
			pVO.setImg2(img2);
			pVO.setImg3(img3);
			pVO.setImg4(img4);
			pVO.setPrice(price);
			pVO.setDeliver(deliver);
			pVO.setStatus(status);
			pVO.setLoc(loc);
			pVO.setC3code(c3code);
			pVO.setId("1011kiy111");
			ps.addProduct(pVO);

	     // 파일을 원하는 위치에 저장
//	        Enumeration<String> files = mr.getFileNames();
//	        while (files.hasMoreElements()) {
//	            String name = files.nextElement();
//	            MultipartFile file = mr.getFile(name);
//
//	            // 각 업로드된 파일을 처리합니다.
//	            String originalFileName = file.getOriginalFilename();
//	            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
//	            String savedFileName = pcode + fileExtension;
//
//	            // 파일을 원하는 위치에 저장합니다.
//	            File savedFile = new File(saveDir, savedFileName);
//	            file.transferTo(savedFile);
//	        }
	       
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
	public String productDetail(HttpServletRequest request, HttpSession session,Model model,ProductVO pVO) {
		String id = (String)session.getAttribute("id");
	
		String pcode=ps.getPcode("1011kiy111");
		pVO.setPcode(pcode);
		pVO.setId("1011kiy111");
//		String pcode=request.getParameter("pcode");
		ProductDomain userProduct=ps.searchProduct(pVO);
		model.addAttribute("AllCominfo", ps.searchBuyerAllInfo("1011kiy111"));
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
	public String productEditFrm(HttpServletRequest request, String seller,HttpSession session, Model model, ProductVO pVO) {

	    String pcode = request.getParameter("pcode"); 
	    pVO.setPcode(pcode); 

		/* model.addAttribute("AllCominfo", ps.searchBuyerAllInfo(seller)); */
	    model.addAttribute("userProduct", ps.searchProduct(pVO));

	    return "user/product/product_edit";
	}
	
	
	@RequestMapping("/user/product/productEdit_register_ok.do")
	public String productEdit(HttpSession session,HttpServletRequest request, Model model,ProductVO pVO)  {
		
		File saveDir=new File("C:/Users/user/git/retro/retro_prj/src/main/webapp/upload");
		
		int maxSize=1024*1024*30; // 최대 파일 업로드 사이즈 30Mbyte
		String pcode=null;
		try {
			MultipartRequest mr=new MultipartRequest(request, saveDir.getAbsolutePath(), 
					maxSize, "UTF-8",new DefaultFileRenamePolicy());
			
			String pname=mr.getParameter("pname");
			String context=mr.getParameter("context");
			String img=mr.getFilesystemName("img");
			String img2=mr.getFilesystemName("img2");
			String img3=mr.getFilesystemName("img3");
			String img4=mr.getFilesystemName("img4");
			int price=Integer.parseInt(mr.getParameter("price"));
			String deliver=mr.getParameter("deliver");
			String status=mr.getParameter("status");
			String loc=mr.getParameter("loc");
			String c3code=mr.getParameter("c3code");
			String id = (String)session.getAttribute("id");
			
			pVO.setPname(pname);
			pVO.setContext(context);
			pVO.setImg(img);
			pVO.setImg2(img2);
			pVO.setImg3(img3);
			pVO.setImg4(img4);
			pVO.setPrice(price);
			pVO.setDeliver(deliver);
			pVO.setStatus(status);
			pVO.setLoc(loc);
			pVO.setC3code(c3code);
			pVO.setId("1011kiy111");
			ps.editProduct(pVO);

	       
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch

	    return "user/product/productEdit_register_ok";

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