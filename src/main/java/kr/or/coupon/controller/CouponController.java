package kr.or.coupon.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.coupon.model.service.CouponService;
import kr.or.coupon.model.vo.Coupon;

@Controller
public class CouponController {

	@Autowired
	private CouponService service;
	
	
	@RequestMapping(value="/managerPage.do")
	public String managerPage() {
		return "manager/managerPage";
	}
	
	
	
	@RequestMapping(value="/couponManage.do")
	public String couponManage(Model model) {
		ArrayList<Coupon> list = service.selectAllCoupon();
		model.addAttribute("list", list);
		return "manager/couponManage";
	}
	
	@RequestMapping(value="/insertCouponFrm.do")
	public String insertCouponFrm() {
		return "manager/couponRegister";
	}
	
	@RequestMapping(value="/insertCoupon.do")
	public String insertCoupon(Coupon coupon) {
		int result = service.insertCoupon(coupon);
		return "redirect:/couponManage.do";
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
		return "redirect:/couponManage.do";
	}
	
	@RequestMapping(value="/deleteCoupon.do")
	public String deleteCoupon(int couponNo) {
		int result = service.deleteCoupon(couponNo);
		return "redirect:/couponManage.do";
	}
}














