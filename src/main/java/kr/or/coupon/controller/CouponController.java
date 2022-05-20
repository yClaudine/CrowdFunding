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
}
