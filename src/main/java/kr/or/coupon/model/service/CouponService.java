package kr.or.coupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.coupon.model.dao.CouponDao;
import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;

@Service
@Transactional
public class CouponService {

	@Autowired
	private CouponDao dao;

	public ArrayList<Coupon> selectAllCoupon() {
		// TODO Auto-generated method stub
		return dao.selectAllCoupon();
	}

	public int insertCoupon(Coupon coupon) {
		// TODO Auto-generated method stub
		return dao.insertCoupon(coupon);
	}

	public Coupon selectOneCoupon(int couponNo) {
		// TODO Auto-generated method stub
		return dao.selectOneCoupon(couponNo);
	}

	public int updateCoupon(Coupon c) {
		// TODO Auto-generated method stub
		return dao.updateCoupon(c);
	}

	public int deleteCoupon(int couponNo) {
		// TODO Auto-generated method stub
		return dao.deleteCoupon(couponNo);
	}

	public int expireCoupon(String todayString) {
		// TODO Auto-generated method stub
		return dao.expireCoupon(todayString);
	}

	public int expireMemberCoupon(String todayString) {
		// TODO Auto-generated method stub
		return dao.expireMemberCoupon(todayString);
	}

	public ArrayList<Coupon> selectValidCoupon() {
		// TODO Auto-generated method stub
		return dao.selectValidCoupon();
	}

	

//멤버쿠폰
	
	public MemberCoupon searchOneMemberCoupon(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.searchOneMemberCoupon(map);
	}

	public int insertMemberCoupon(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.insertMemberCoupon(map);
	}

	public int updateCouponStatus(int couponNo) {
		//이벤트에 쿠폰 등록 후 쿠폰 게시상태 변경해주
		return dao.updateCouponStatus(couponNo);
	}
	
}
