package kr.or.fund.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.dao.FundListDao;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundLike;
import kr.or.fund.model.vo.FundPay;
import kr.or.fund.model.vo.FundViewData;
import kr.or.fund.model.vo.PayRewardViewData;
import kr.or.fund.model.vo.PayViewData;
import kr.or.fund.model.vo.Reward;
import kr.or.fund.model.vo.RewardCart;
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
	
	//펀딩 상세 페이지 데이터
	public FundViewData selectOneFundView(int fundNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		Fund f = dao.selectOneFund(fundNo);
		Seller s = dao.selectOneSeller(fundNo);
		FundLike fl = dao.selectLikeCheck(map);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		ArrayList<FundPay> plist = dao.selectPayList(fundNo); 
		FundViewData fvd = new FundViewData(f, list, s, fl, plist);
		return fvd;
	}

	//펀딩 신고하기
	public int updateReportCount(int fundNo) {
		return dao.updateReportCount(fundNo);
	}

	//좋아요 insert--------------------------------------
	public int insertFundlike(int fundNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		return dao.insertFundlike(map);
	}
	//좋아요 delete
	public int deleteFundlike(int fundNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		return dao.deleteFundlike(map);
	}
	//좋아요 체크
	@Transactional
	public int likeCheck(int fundNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		FundLike fl = dao.selectLikeCheck(map);
		if(fl.getLikeCheck() == 0) {
			int result = dao.insertFundlike(map);
			if(result == 0) {
				return -1;
			}else {
				dao.updateLikeUp(fundNo);
			}
		}else {
			int result = dao.deleteFundlike(map);
			if(result == 0) {
				return -1;
			}else {
				dao.updateLikeDown(fundNo);
			}
		}
		Fund f = dao.selectOneFund(fundNo);
		return f.getFundLike();
		
		
	}
	
	//좋아요 +1
	public int updateLikeUp(int fundNo) {
		return dao.updateLikeUp(fundNo);	
	}
	//좋아요 -1
	public int updateLikeDown(int fundNo) {
		return dao.updateLikeDown(fundNo);
	}
	
//--------------------------------------------------------
	//결제 페이지
	public PayRewardViewData selectPayReward(int fundNo) {
		Fund f = dao.selectOneFund(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		PayRewardViewData prvd= new PayRewardViewData(f,list);
		return prvd;
	}


	//해당하는 쿠폰 리스트 조회
	public ArrayList<Coupon> selectCouponList(int memberNo, String fundCategory, int rewardSum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("memberNo", memberNo);
        map.put("rewardSum", rewardSum);
        map.put("fundCategory", fundCategory);
		return dao.selectCouponList(map);
	}

	//최종 결제 정보
	public int insertPay(String memberId, String memberName, int fundNo, int fpayDeliveryfee, int fpaySupport,
			int fpayRewardTotal, int fpayFunding, int fpayFinalpay, int nameShow, int fundingShow, int payMethod) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId",memberId);
		map.put("memberName",memberName);
		map.put("fundNo",fundNo);
		map.put("fpayDeliveryfee",fpayDeliveryfee);
		map.put("fpaySupport",fpaySupport);
		map.put("fpayRewardTotal",fpayRewardTotal);
		map.put("fpayFunding",fpayFunding);
		map.put("fpayFinalpay",fpayFinalpay);
		map.put("nameShow",nameShow);
		map.put("fundingShow",fundingShow);
		map.put("payMethod",payMethod);
		return dao.insertPay(map);

	}
	//결제 확인 조회
	public PayViewData payConfirm(int fundNo, String memberId, int fpayFinalpay) {
		Fund f = dao.selectOneFund(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundPay fp = dao.selectOnePay(fundNo,memberId,fpayFinalpay);
		PayViewData pvd= new PayViewData(f,list,fp);
		return pvd;
	}





	
	/*리워드 카트 인서트
	public int insertCart(int memberNo, int rewardAmount, int fundNo, int rewardNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rewardNo",rewardNo);
		map.put("memberNo",memberNo);
		map.put("rewardAmount",rewardAmount);
		map.put("fundNo",fundNo);
		return dao.insertCart(map);
	}
	//리워드 카트 삭제
	public int deleteCart(int memberNo, int rewardAmount, int fundNo, int rewardNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rewardNo",rewardNo);
		map.put("memberNo",memberNo);
		map.put("rewardAmount",rewardAmount);
		map.put("fundNo",fundNo);
		return dao.deleteCart(map);
	}*/
	
	/*array
	public int insertReward(List<RewardCart> rewardNo) {//,int memberNo, int rewardAmount, int fundNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("rewardNo",rewardNo);
		//map.put("memberNo",memberNo);
		//map.put("rewardAmount",rewardAmount);
		//map.put("fundNo",fundNo);
		return dao.insertReward(map);
	}*/

}
