package kr.or.fund.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundLike;
import kr.or.fund.model.vo.Reward;
import kr.or.member.vo.Seller;

@Repository
public class FundListDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//펀딩 리스트 메인페이지
	public ArrayList<Fund> selectFundList(HashMap<String, Object> map){
		List list = sqlSession.selectList("fundList.selectFundList",map);
		return (ArrayList<Fund>)list;
	}
	
	//펀딩 상세 - 프로젝트 조회
	public Fund selectOneFund(int fundNo) {
		Fund f = sqlSession.selectOne("fundList.selectOneFund",fundNo);
		return f;
	}
	//펀딩 상세 - 리워드 조회
	public ArrayList<Reward> selectRewardList(int fundNo) {
		List list = sqlSession.selectList("fundReward.selectRewardList",fundNo);
		return (ArrayList<Reward>) list;
	}
	//펀딩 상세 - 셀러 조회
 	public Seller selectOneSeller(int fundNo) {
 		Seller s = sqlSession.selectOne("fundSeller.selectOneSeller",fundNo);
		return s;
	}
	//펀딩 상세 - 해당 펀딩 좋아요 total
	public FundLike selectFundTotal(int fundNo) {
		FundLike fl = sqlSession.selectOne("fundLike.selectFundTotal",fundNo);
		return fl;
	}
//-------------------------------------
	//펀딩 신고
	public int updateReportCount(int fundNo) {
		int result = sqlSession.update("fundList.updateReportCount",fundNo);
		return result;
	}
	/* 좋아요 ajax
	public FundLike selectOneFundlike(HashMap<String, Object> map) {
		FundLike fl = sqlSession.selectOne("fundLike.selectOneFundlike",map);
		return fl;
	}
	
	*/
	//좋아요 insert
	public int insertFundlike(FundLike fl) {
		int result = sqlSession.update("fundLike.insertFundlike",fl);
		return result;
	}
	//좋아요 delete
	public int deleteFundlike(int fundNo) {
		int result = sqlSession.delete("fundLike.deleteFundlike",fundNo);
		return result;
	}
	//좋아요 체크
	public FundLike fundCheck(HashMap<String, Object> map) {
		FundLike fc = sqlSession.selectOne("fundLike.fundCheck",map);
		return fc;
	}

	//멤버 다운로드 쿠폰-----------------------------------------------------------
	public ArrayList<MemberCoupon> selectMemberCouponList(int memberNo) {
		List list = sqlSession.selectList("fundPay.selectMemberCouponList",memberNo);
		return (ArrayList<MemberCoupon>)list;
	}

	//쿠폰 하나 조회
	public Coupon selectOneCoupon(HashMap<String, Object> map) {
		return sqlSession.selectOne("fundPay.selectOneCoupon",map);
	}
	
	



	
	
}
