package kr.or.notice.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.coupon.model.service.CouponService;
import kr.or.coupon.model.vo.Coupon;
import kr.or.notice.model.service.NoticeService;
import kr.or.notice.model.vo.Notice;
import kr.or.notice.model.vo.NoticePageData;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	@Autowired
	private CouponService couponService;
	
	@RequestMapping(value="/notice.do")
	public String notice(int reqPage, String type, Model model) {
		NoticePageData npd = service.selectNoticeList(reqPage, type);
		model.addAttribute("list", npd.getList());
		model.addAttribute("pageNavi", npd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("type", type);
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/insertNoticeFrm.do")
	public String insertNoticeFrm(String noticeWriter, Model model) {
		ArrayList<Coupon> couponList = couponService.selectValidCoupon();
		model.addAttribute("noticeWriter", noticeWriter);
		model.addAttribute("couponList", couponList);
		return "notice/noticeWrite";
		
	}
	
	@RequestMapping(value="/insertNotice.do")
	public String insertNotice(Notice n, HttpServletRequest request, MultipartFile file) {
		
		if(!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/image/notice/main/");
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
			String extention = filename.substring(filename.lastIndexOf("."));
			String filepath = null;
			//파일명중복검사
			int count=0;
			while(true) {
				if(count == 0) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			//파일업로드
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
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
			}
			
			n.setNoticeFilepath(filepath);
		}
		
		int result = service.insertNotice(n);
		return "redirect:/notice.do?reqPage=1&type=all";
	}
	
	
	//섬머노트
	@ResponseBody
	@RequestMapping(value="/uploadImage.do")
	public String uploadImage(HttpServletRequest request, MultipartFile file) {
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image/notice/editor/");
		
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
		String extention = filename.substring(filename.lastIndexOf("."));
		String filepath = null;
		//파일명중복검사
		int count=0;
		while(true) {
			if(count == 0) {
				filepath = onlyFilename+extention;
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		//파일업로드
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
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
		}
		String realPath = "/resources/image/notice/editor/"+filepath;
		 return realPath;
	
	}
	
	@RequestMapping(value="/noticeView.do")
	public String noticeView(int noticeNo, Model model) {
		Notice notice = service.selectOneNotice(noticeNo);
		if(notice.getCouponNo() != 0) {
			Coupon coupon = couponService.selectOneCoupon(notice.getCouponNo());
			model.addAttribute("coupon", coupon);
		}
		model.addAttribute("notice", notice);
		return "notice/noticeView";
	}
	
}
