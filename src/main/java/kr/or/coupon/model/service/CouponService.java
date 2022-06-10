package kr.or.coupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.coupon.model.dao.CouponDao;
import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.CouponPageData;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreAllPageData;

@Service
@Transactional
public class CouponService {

	@Autowired
	private CouponDao dao;

	public ArrayList<Coupon> selectAllCoupon() {
		// TODO Auto-generated method stub
		return dao.selectAllCoupon();
	}

	//쿠폰 조회
	public CouponPageData selectAllCoupon(int reqPage, String type, String keyword) {
		int numPerPage = 5;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		map.put("keyword", keyword);
		ArrayList<Coupon> list = dao.selectAllCoupon(map);
		
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("type",type);
		countMap.put("keyword",keyword);
		int totalCount = dao.selectCouponCount(countMap);
		
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
			pageNavi += "<li class='page-item'><a class='page-link' href='/couponManage.do?reqPage="+(pageNo-1)+"&keyword="+keyword+"&type="+type+"'>[이전]</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
						
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/couponManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='page-link' href='/couponManage.do?reqPage="+pageNo+"&keyword="+keyword+"&type="+type+"'>[다음]</a></li></ul></div>";
		}
		CouponPageData cpd = new CouponPageData(list, pageNavi);
		return cpd;
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
