package kr.or.fund.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.dao.FundListDao;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundLike;
import kr.or.fund.model.vo.FundViewData;
import kr.or.fund.model.vo.PayRewardViewData;
import kr.or.fund.model.vo.PayViewData;
import kr.or.fund.model.vo.Reward;
import kr.or.member.vo.Seller;

@Service
public class FundListService {
	@Autowired
	private FundListDao dao;

	//펀딩 리스트 메인페이지
	public ArrayList<Fund> selectFundList(String category) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		return dao.selectFundList(map);
	}

	/*
	public Fund selectOneFundView(int fundNo) {
		return dao.selectOneFund(fundNo);
	}*/
	
	//펀딩 상세 페이지 데이터
	public FundViewData selectOneFundView(int fundNo) {
		Fund f = dao.selectOneFund(fundNo);
		Seller s = dao.selectOneSeller(fundNo);
		FundLike fl = dao.selectFundTotal(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundViewData fvd = new FundViewData(f,list,s,fl);
		return fvd;
	}
	
	

	//펀딩 신고하기
	public int updateReportCount(int fundNo) {
		return dao.updateReportCount(fundNo);
	}
	/*좋아요 ajax
	public FundLike selectOneFundlike(HashMap<String, Object> map) {
		return dao.selectOneFundlike(map);
	}*/
	//좋아요 insert
	public int insertFundlike(FundLike fl) {
		return dao.insertFundlike(fl);
	}
	//좋아요 delete
	public int deleteFundlike(int fundNo) {
		return dao.deleteFundlike(fundNo);
	}
	//좋아요 체크
	public FundLike fundCheck(HashMap<String, Object> map) {
		return dao.fundCheck(map);
	}
//--------------------------------------------------------
	//리워드 선택 페이지 이동
	public PayRewardViewData selectPayReward(int fundNo) {
		Fund f = dao.selectOneFund(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		PayRewardViewData prvd= new PayRewardViewData(f,list);
		return prvd;
	}
	//결제 페이지 - 펀딩, 리워드-----------------------------------
	public PayViewData selectPay(int fundNo) {
		Fund f = dao.selectOneFund(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		PayViewData pvd= new PayViewData(f,list);
		return pvd;
	}

	//멤버 다운로드 쿠폰
	public ArrayList<MemberCoupon> SelectMemberCouponList(int memberNo) {
		return dao.selectMemberCouponList(memberNo);
	}

	//쿠폰 하나 조회
	public Coupon selectOneCoupon(int couponNo, String fundCategory, int rewardSum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("couponNo", couponNo);
        map.put("rewardSum", rewardSum);
        map.put("fundCategory", fundCategory);
        return dao.selectOneCoupon(map);
	}

	public ArrayList<Coupon> selectCouponList(int memberNo, String fundCategory, int rewardSum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("memberNo", memberNo);
        map.put("rewardSum", rewardSum);
        map.put("fundCategory", fundCategory);
		return dao.selectCouponList(map);
	}

}
