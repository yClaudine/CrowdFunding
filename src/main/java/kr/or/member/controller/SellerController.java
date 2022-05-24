package kr.or.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.member.service.SellerService;
import kr.or.member.vo.Seller;

@Controller
public class SellerController {

	@Autowired
	private SellerService service;

	@RequestMapping(value = "sellerReqFrm.do")
	public String sellerReqFrm() {
		return "member/sellerReq";
	}

	@RequestMapping(value = "sellerReq.do")
	public String sellerReq(Seller s, HttpServletRequest request, MultipartFile[] upfile) {

		String savepath = request.getSession().getServletContext().getRealPath("/resources/image/member/");
		String photopath = upfile[0].getOriginalFilename();
		String enPath = upfile[1].getOriginalFilename();

		s.setEnPath(enPath);
		s.setPhotopath(photopath);
			
		int result = service.insertSeller(s);
		if(result>0) {
			for (MultipartFile file : upfile) {
				String filepath = file.getOriginalFilename();
				try {
					FileOutputStream fos = new FileOutputStream(new File(savepath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();

				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println(s);
				}
			}
	
		}
		return "redirect:/";

	}
}
