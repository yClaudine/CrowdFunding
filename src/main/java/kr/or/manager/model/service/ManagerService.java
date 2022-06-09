package kr.or.manager.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.fund.model.vo.Fund;
import kr.or.manager.model.dao.ManagerDao;
import kr.or.manager.model.vo.FundPageData;
import kr.or.manager.model.vo.MemberPageData;
import kr.or.member.vo.Dm;
import kr.or.member.vo.Member;
import kr.or.member.vo.Seller;
import kr.or.notice.model.vo.Notice;
import kr.or.notice.model.vo.NoticePageData;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreAllPageData;
import kr.or.store.model.vo.StoreStar;

@Transactional
@Service
public class ManagerService {
	
	@Autowired
	private ManagerDao dao;

	public int totalSellerCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.totalSellerCount(map);
	}

	public ArrayList<Seller> selectSellerForManager(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectSellerForManager(map);
	}

	//멤버 판매자 권한 변경
	public int changeMemberAuth(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.changeMemberAuth(map);
	}
	//판매자 승인상태 변경
	public int changeSellerAuth(Seller seller) {
		// TODO Auto-generated method stub
		return dao.changeSellerAuth(seller);
	}

	public ArrayList<Seller> moreSeller(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.moreSeller(map);
	}
	
	//회원관리
	public MemberPageData selectAllMember(int reqPage, String type, String keyword) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("keyword", keyword);
		ArrayList<Member> list = dao.selectAllMember(map);
		
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("type",type);
		countMap.put("keyword",keyword);
		int totalCount = dao.selectMemberCount(countMap);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi="<div><ul class='pagination'>";
		if(pageNo !=1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/memberManage.do?reqPage="+(pageNo-1)+"&keyword="+keyword+"&type="+type+"'>[이전]</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
						
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/memberManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='page-link' href='/memberManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>[다음]</a></li></ul></div>";
		}
		MemberPageData mpd = new MemberPageData(list, pageNavi);
		return mpd;
	}
	
	//리뷰조회
	public ArrayList<StoreStar> selectOneStar(String memberId) {
		// TODO Auto-generated method stub
		return dao.selectOneStar(memberId);
	}
	
	//펀드관리
	public FundPageData selectAllFund(int reqPage, String type, String keyword) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("keyword", keyword);
		ArrayList<Fund> list = dao.selectAllFund(map);
		
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("type",type);
		countMap.put("keyword",keyword);
		int totalCount = dao.selectFundCount(countMap);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi="<div><ul class='pagination'>";
		if(pageNo !=1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/fundManage.do?reqPage="+(pageNo-1)+"&keyword="+keyword+"&type="+type+"'>[이전]</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
						
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/fundManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='page-link' href='/fundManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>[다음]</a></li></ul></div>";
		}
		FundPageData fpd = new FundPageData(list, pageNavi);
		return fpd;
	}

	//스토어관리
	public StoreAllPageData selectAllStore(int reqPage, String type, String keyword) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("keyword", keyword);
		ArrayList<Store> list = dao.selectAllStore(map);
		
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("type",type);
		countMap.put("keyword",keyword);
		int totalCount = dao.selectStoreCount(countMap);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi="<div><ul class='pagination'>";
		if(pageNo !=1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/storeManage.do?reqPage="+(pageNo-1)+"&keyword="+keyword+"&type="+type+"'>[이전]</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
						
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/storeManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='page-link' href='/storeManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>[다음]</a></li></ul></div>";
		}
		StoreAllPageData spd = new StoreAllPageData(list, pageNavi);
		return spd;
	}
	//펀드 하나 조회
	public Fund selectOneFund(int fundNo) {
		// TODO Auto-generated method stub
		return dao.selectOneFund(fundNo);
	}

	public Store selectOneStore(int storeNo) {
		// TODO Auto-generated method stub
		return dao.selectOneStore(storeNo);
	}

	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(memberNo);
	}

	public ArrayList<Dm> selectReportList(String memberId, int category, int categoryNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("category", category);
		map.put("categoryNo", categoryNo);
		return dao.selectReportList(map);
	}

	//회원 권한 변경
	public int updateMemberAuth(String memberId, int auth) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("auth", auth);
		return dao.updateMemberAuth(map);
	}

	public int deleteStore(int storeNo) {
		//결제취소 상태로 변경
		int result=0;
		int result1 = dao.cancelStorePay(storeNo);
		if(result1>0) {
			//쿠폰 사용전 상태로 변경
			result = dao.updateCouponUse(storeNo);
			/*
			if(result2>0) {
				//result = dao.deleteStore(storeNo);
				result = 1;
			}else {
				result = -1;
			}
			*/
		}else {
			result = -1;
		}
		
		return result;
	}

	public int deleteFund(int fundNo) {
		//결제취소 상태로 변경
		int result=0;
		int result1 = dao.cancelFundPay(fundNo);
		if(result1>0) {
			//쿠폰 사용전 상태로 변경
			int result2 = dao.updateFundCouponUse(fundNo);
			if(result2>0) {
				//펀드 삭제
				result = dao.deleteFund(fundNo);
			}else {
				result = -1;
			}
		}else {
			result = -1;
		}
		return result;
	}

	
	

	
}
