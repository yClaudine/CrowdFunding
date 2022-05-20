package kr.or.coupon.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.coupon.model.service.CouponService;
import kr.or.coupon.model.vo.Coupon;

@Component
public class CouponExpiration {

	@Autowired
	private CouponService service;
	
	//만료
		@Scheduled(cron = "55 59 23 * * *")
		public void expireCoupon() {
			ArrayList<Coupon> list = service.selectAllCoupon();
			Date today = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String todayString = format.format(today);
			//쿠폰 만료
			int result = service.expireCoupon(todayString);
			//멤버가 갖고있는 쿠폰도 만료
			int result2 = service.expireMemberCoupon(todayString);
			
		}
}
