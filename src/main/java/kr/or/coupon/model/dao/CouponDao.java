package kr.or.coupon.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.coupon.model.vo.Coupon;

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
	
}
