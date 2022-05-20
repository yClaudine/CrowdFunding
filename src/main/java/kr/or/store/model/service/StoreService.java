package kr.or.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.store.model.dao.StoreDao;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreAllPageData;


@Service
public class StoreService {
	@Autowired
	private StoreDao dao;

	public ArrayList<Store> selectAllStore() {
		// TODO Auto-generated method stub
		return dao.selectAllStore();
	}

	public Store selectOneStore(int storeNo) {
		// TODO Auto-generated method stub
		return dao.selectOneStore(storeNo);
	}

	public StoreAllPageData selectStoreAllList(int reqPage) {
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
		ArrayList<Store> list = dao.selectStoreAllList(map);
		//pageNavi 작성시작
		//전체페이지수 계산이 필요 => 전체 게시물 수의 db에서 조회해와야 계산
		//전체게시물수
		int totalCount = dao.selectStoreCount();
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
			pageNavi += "<a href='/storeList.do?reqPage="+(reqPage-1)+"'>[이전]</a>";
		}
		//페이지숫자생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/storeList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<a href='/storeList.do?reqPage="+(reqPage+1)+"'>[다음]</a>";
		}
		StoreAllPageData spd = new StoreAllPageData(list, pageNavi);
		return spd;
	}
}
