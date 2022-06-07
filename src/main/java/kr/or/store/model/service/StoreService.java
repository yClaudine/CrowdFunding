package kr.or.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.member.vo.Member;
import kr.or.store.model.dao.StoreDao;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreAllPageData;
import kr.or.store.model.vo.StoreStar;
import kr.or.store.model.vo.StoreViewData;


@Service
public class StoreService {
	@Autowired
	private StoreDao dao;

	public ArrayList<Store> selectAllStore() {
		// TODO Auto-generated method stub
		return dao.selectAllStore();
	}

	public StoreViewData selectOneStore(int storeNo) {
		// TODO Auto-generated method stub
		Store sm = dao.selectOneStore(storeNo);
		ArrayList<StoreStar> list = dao.selectcommentAllList(storeNo);
		double starAvg = dao.selectStarAvg(storeNo);
		StoreViewData sv = new StoreViewData(sm, list, starAvg);
		return sv;
	}

	public StoreAllPageData selectStoreAllList(int reqPage, String storeCategory) {
		// 한 페이지 당 보여줄 게시물 수 : 8개
		int numPerPage = 8;
		//reqPage 1 -> 1~8, reqPage 2 -> 9~16
		//페이지 마지막 번호
		int end = reqPage * numPerPage;
		//페이지 첫번째 번호
		int start = end - numPerPage + 1;
		//게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start",start);
		map.put("end", end);
		map.put("storeCategory", storeCategory);	
		ArrayList<Store> list = dao.selectStoreAllList(map);
		//pageNavi 작성시작
		//전체페이지수 계산이 필요 => 전체 게시물 수의 db에서 조회해와야 계산
		//전체게시물수
		int totalCount = dao.selectStoreCount(map);
		//전체게시물로 전체 페이지수 구하기
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		//페이지 네비 길이
		int pageNaviSize = 5;
		//페이지번호
		int pageNo = 1;
		if(reqPage>3) {
			pageNo = reqPage - 2;
		}
		//페이지Navi생성시작
		String pageNavi = "";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<a href='/storeList.do?reqPage="+(reqPage-1)+"&storeCategory="+storeCategory+"'>[이전]</a>";
		}
		//페이지숫자생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/storeList.do?reqPage="+pageNo+"&storeCategory="+storeCategory+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/storeList.do?reqPage="+(reqPage+1)+"&storeCategory="+storeCategory+"'>[다음]</a>";
		}
		StoreAllPageData spd = new StoreAllPageData(list, pageNavi);
		return spd;
	}

	public int insertComment(StoreStar ss) {
		int result = dao.insertComment(ss);
		return result;
	}



	public ArrayList<MemberCoupon> SelectMemberCouponList(int memberNo) {
		return dao.selectMemberCouponList(memberNo);
	}

	public Coupon selectOneCoupon(int couponNo, int totalprice, String storeCategory) {
		HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("couponNo", couponNo);
        map.put("totalprice", totalprice);
        map.put("storeCategory", storeCategory);
        return dao.selectOneCoupon(map);
	}

	public ArrayList<Integer> selectStorepayNo(int memberNo,int storeNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("storeNo", storeNo);
		return dao.selectStorepayNo(map);
	}

	public int insertPay(int memberNo, int couponNo, int storeNo, int number, int storeDelivery, int storePrice,
			int storepayAllprice) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("couponNo", couponNo);
		map.put("storeNo", storeNo);
		map.put("number", number);
		map.put("storeDelivery", storeDelivery);
		map.put("storePrice", storePrice);
		map.put("storepayAllprice", storepayAllprice);
		return dao.insertPay(map);
	}

	




}
