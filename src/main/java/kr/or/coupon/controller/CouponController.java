package kr.or.coupon.controller;



import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.coupon.model.service.CouponService;
import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.CouponPageData;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.store.model.vo.StoreAllPageData;

@Controller
public class CouponController {

	@Autowired
	private CouponService service;
	
	
	@RequestMapping(value="/managerPage.do")
	public String managerPage() {
		return "manager/managerPage";
	}
	
	
	@RequestMapping(value="/couponManage.do")
	public String couponManage(int reqPage, String type, String keyword, Model model) {
		CouponPageData cpd = service.selectAllCoupon(reqPage, type, keyword);
		model.addAttribute("list", cpd.getList());
		model.addAttribute("pageNavi", cpd.getPageNavi());
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("reqPage", reqPage);
		return "manager/couponManage";
	}
	
	
	
	@RequestMapping(value="/insertCouponFrm.do")
	public String insertCouponFrm() {
		return "manager/couponRegister";
	}
	
	@RequestMapping(value="/insertCoupon.do")
	public String insertCoupon(Coupon coupon) {
		int result = service.insertCoupon(coupon);
		return "redirect:/couponManage.do?reqPage=1&keyword=&type=3";
	}
	
	@RequestMapping(value="/updateCouponFrm.do")
	public String updateCouponFrm(int couponNo, Model model) {
		Coupon c = service.selectOneCoupon(couponNo);
		model.addAttribute("coupon", c);
		return "manager/couponUpdate";
	}
	
	@RequestMapping(value="/updateCoupon.do")
	public String updateCoupon(Coupon c) {
		int result = service.updateCoupon(c);
		return "redirect:/couponManage.do?reqPage=1&keyword=&type=3";
	}
	
	@RequestMapping(value="/deleteCoupon.do")
	public String deleteCoupon(int couponNo) {
		int result = service.deleteCoupon(couponNo);
		return "redirect:/couponManage.do?reqPage=1&keyword=&type=3";
	}
	
	
//멤버쿠폰
	@RequestMapping(value="/insertMemberCoupon.do")
	public String insertMemberCoupon(int memberNo, int couponNo, int noticeNo, String validEnd, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("couponNo",couponNo);
		map.put("validEnd", validEnd);
		
		MemberCoupon mc = service.searchOneMemberCoupon(map);
		
		if(mc == null) {
			int result = service.insertMemberCoupon(map);
			model.addAttribute("title", "확인" );
			model.addAttribute("text", "다운로드 되었습니다.");
			model.addAttribute("icon", "info");
			model.addAttribute("loc", "/noticeView.do?noticeNo="+noticeNo);
		}else {
			model.addAttribute("title", " " );
			model.addAttribute("text", "이미 다운로드 받은 쿠폰입니다.");
			model.addAttribute("icon", "info");
			model.addAttribute("loc", "/noticeView.do?noticeNo="+noticeNo);
		}
		return "manager/msg";
		
	}
	
}














