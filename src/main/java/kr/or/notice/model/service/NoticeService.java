package kr.or.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.notice.model.dao.NoticeDao;
import kr.or.notice.model.vo.Notice;
import kr.or.notice.model.vo.NoticePageData;
@Transactional
@Service
public class NoticeService {

	@Autowired
	private NoticeDao dao;

	public NoticePageData selectNoticeList(int reqPage, String type) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		//전체, 공지사항, 이벤트 경우에 따라서 데이터 가져오기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("type", type);
		ArrayList<Notice> list = dao.selectNoticeList(map);
		
		HashMap<String, Object> countMap = new HashMap<String, Object>();
		countMap.put("type",type);
		int totalCount = dao.selectNoticeCount(countMap);
		
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		//int pageNo = 1;
		//if(reqPage>3) {
		//	pageNo = reqPage - 2;
		//}
		
		String pageNavi="<div><ul class='pagination'>";
		if(pageNo !=1) {
			pageNavi += "<li class='page-item'><a class='page-link' href='/notice.do?reqPage="+(pageNo-1)+"&type="+type+"'>[이전]</a></li>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
						
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/notice.do?reqPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi +="<li class='page-item'><a class='page-link' href='/notice.do?reqPage="+pageNo+"&type="+type+"'>[다음]</a></li></ul></div>";
		}
		NoticePageData npd = new NoticePageData(list, pageNavi);
		return npd;
	}

	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return dao.insertNotice(n);
	}

	public Notice selectOneNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return dao.selectOneNotice(noticeNo);
	}
	
	
}
