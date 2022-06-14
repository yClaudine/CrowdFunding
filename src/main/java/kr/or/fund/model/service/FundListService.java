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
import kr.or.fund.model.vo.FundNotice;
import kr.or.fund.model.vo.FundNoticeViewData;
import kr.or.fund.model.vo.FundOneNoticeViewData;
import kr.or.fund.model.vo.FundPay;
import kr.or.fund.model.vo.FundUpdateNoticeViewData;
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

	//필터링 리스트
	public ArrayList<Fund> searchFundList(String keyword, String searchType, String fstatus) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("fstatus", fstatus);
		return dao.searchFundList(map);
	}


	//펀딩 상세 페이지 데이터
	public FundViewData selectOneFundView(int fundNo, String memberId, String sellerId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		Fund f = dao.selectOneFund(fundNo);
		Seller s = dao.selectOneSeller(sellerId);
		FundLike fl = dao.selectLikeCheck(map);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundPay p = dao.selectViewPay(fundNo);
		ArrayList<FundPay> plist = dao.selectPayList(fundNo); 
		FundViewData fvd = new FundViewData(f, list, s, fl, p, plist);
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
	public ArrayList<Coupon> selectCouponList(int memberNo, String fundCategory, int rewardSum, int maxFee) {
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("memberNo", memberNo);
        map.put("rewardSum", rewardSum);
        map.put("maxFee", maxFee);
        map.put("fundCategory", fundCategory);
		return dao.selectCouponList(map);
	}

	//최종 결제 정보
	@Transactional
	public int insertPay(String memberId, String memberName, int fundNo, int fpayDeliveryfee, int fpaySupport,
			int fpayRewardTotal, int fpayFunding, int fpayFinalpay, int nameShow, int fundingShow, int payMethod, int couponNo, int memberNo) {
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
		map.put("couponNo",couponNo);
		map.put("memberNo",memberNo);
		
		//쿠폰 상태 업데이트
		int result = dao.insertPay(map);
		if(result == 0) {
			return -1;
		}else {
			//쿠폰 업데이트
			dao.updateMemberCoupon(map);
			//최근 인서트된 결제번호
			int payNo = dao.selectPayNo();
			return payNo;
		}
		//return result;
	}
	
	//방금 결제된 정보 조회
	public PayViewData payConfirm(int fundNo, int fpayNo, String memberId) {
		Fund f = dao.selectOneFund(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundPay fp = dao.selectOnePay(fundNo,fpayNo,memberId);
		PayViewData pvd= new PayViewData(f,list,fp);
		return pvd;
	}
	
	
	
	/*결제 확인 조회------------------기존--------------
	public PayViewData payConfirm(int fundNo, String memberId, int fpayFinalpay) {
		Fund f = dao.selectOneFund(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundPay fp = dao.selectOnePay(fundNo,memberId,fpayFinalpay);
		PayViewData pvd= new PayViewData(f,list,fp);
		return pvd;
	}
*/

	
	//array 리워드
	public int insertReward(List<RewardCart> reward) {
		int result=0;
		for(RewardCart cart : reward) {			
			result += dao.insertReward(cart);
		}
		
		return result;
	}

	//---------------------------------------------------
	//펀딩 상세 - 새소식 페이지 데이터관리
	public FundNoticeViewData selectFundNoticeView(int fundNo, String memberId, String sellerId, int reqPage, String type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		Fund f = dao.selectOneFund(fundNo);
		Seller s = dao.selectOneSeller(sellerId);
		FundLike fl = dao.selectLikeCheck(map);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundPay p = dao.selectViewPay(fundNo);
		ArrayList<FundPay> plist = dao.selectPayList(fundNo);
		
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		ArrayList<FundNotice> fnList = dao.selectFundNoticeList(map);
		
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("type",type);
		int totalCount = dao.selectFundNoticeCount(countMap);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi="<ul class='pagination'>";
		if(pageNo !=1) {  
			pageNavi += "<li class='page-item'><a class='page-link' href='/fundViewNotice.do?fundNo="+fundNo+"&memberId="+memberId+"&sellerId="+sellerId+"&reqPage="+(pageNo-1)+"&type="+type+"'>[이전]</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
						
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/fundViewNotice.do?fundNo="+fundNo+"&memberId="+memberId+"&sellerId="+sellerId+"&reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='page-link' href='/fundViewNotice.do?fundNo="+fundNo+"&memberId="+memberId+"&sellerId="+sellerId+"&reqPage="+pageNo+"&type="+type+"'>[다음]</a></li></ul>";
		}
		FundNoticeViewData fnvd = new FundNoticeViewData(f, list, s, fl, p, plist, fnList, pageNavi);
		return fnvd;
	}

	//파일 포함 인서트
	public int insertFundNotice (FundNotice fn) {
		return dao.insertFundNotice(fn);
	}
	
	//새소식 상세보기
	public FundOneNoticeViewData selectOneNotice(int fundNo, String memberId, String fnNo, String sellerId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		Fund f = dao.selectOneFund(fundNo);
		Seller s = dao.selectOneSeller(sellerId);
		FundLike fl = dao.selectLikeCheck(map);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundPay p = dao.selectViewPay(fundNo);
		ArrayList<FundPay> plist = dao.selectPayList(fundNo);
		//새소식
		FundNotice fn = dao.selectOneNotice(fundNo,fnNo);
		
		FundOneNoticeViewData fod = new FundOneNoticeViewData(f, list, s, fl, p, plist, fn);
		return fod;
	}

	//새소식 수정 페이지
	public FundUpdateNoticeViewData updateNoticeFrm(int fundNo, String memberId, String fnNo, String sellerId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		Fund f = dao.selectOneFund(fundNo);
		Seller s = dao.selectOneSeller(sellerId);
		FundLike fl = dao.selectLikeCheck(map);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundPay p = dao.selectViewPay(fundNo);
		ArrayList<FundPay> plist = dao.selectPayList(fundNo);
		//새소식
		FundNotice fn = dao.selectOneNotice(fundNo,fnNo);
		
		FundUpdateNoticeViewData fud = new FundUpdateNoticeViewData(f, list, s, fl, p, plist, fn);
		return fud;
	}

	//새소식 최종수정
	public int updateFundNotice(FundNotice fn) {
		return dao.updateFundNotice(fn);
	}

	//새소식 삭제
	public int deleteFundNotice(String fnNo, int fundNo, String sellerId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fnNo",fnNo);
		map.put("fundNo",fundNo);
		map.put("sellerId",sellerId);
		return dao.deleteFundNotice(map);
	}


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
	
	

