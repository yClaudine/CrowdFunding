package kr.or.coupon.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;

@Repository
public class CouponDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Coupon> selectAllCoupon() {
		List list = sqlSession.selectList("coupon.selectAllCoupon");
		return (ArrayList<Coupon>)list;
	}

	public int insertCoupon(Coupon coupon) {
		int result = sqlSession.insert("coupon.insertCoupon", coupon);
		return result;
	}

	public Coupon selectOneCoupon(int couponNo) {
		Coupon c = sqlSession.selectOne("coupon.selectOneCoupon", couponNo);
		return c;
	}

	public int updateCoupon(Coupon c) {
		int result = sqlSession.update("coupon.updateCoupon", c);
		return result;
	}

	public int deleteCoupon(int couponNo) {
		int result = sqlSession.delete("coupon.deleteCoupon", couponNo);
		return result;
	}

	public int expireCoupon(String todayString) {
		int result = sqlSession.update("coupon.expireCoupon", todayString);
		return result;
	}

	public int expireMemberCoupon(String todayString) {
		int result = sqlSession.update("coupon.expireMemberCoupon", todayString);
		return result;
	}

	public ArrayList<Coupon> selectValidCoupon() {
		List list = sqlSession.selectList("coupon.selectValidCoupon");
		return (ArrayList<Coupon>)list;
	}
	
//멤버쿠폰
	public MemberCoupon searchOneMemberCoupon(HashMap<String, Object> map) {
		MemberCoupon mc = sqlSession.selectOne("coupon.searchOneMemberCoupon", map);
		return mc;
	}

	public int insertMemberCoupon(HashMap<String, Object> map) {
		int result = sqlSession.insert("coupon.insertMemberCoupon", map);
		return result;
	}

	public int updateCouponStatus(int couponNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("coupon.updateCouponStatus", couponNo);
	}
	
	
	

	
	
	
}
