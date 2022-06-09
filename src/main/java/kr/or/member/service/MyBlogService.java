package kr.or.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import kr.or.member.dao.MyBlogDao;
import kr.or.member.vo.MBP;
import kr.or.member.vo.Myblog;


@Service
public class MyBlogService {
	@Autowired
	private MyBlogDao dao;
	
	@Transactional
	public int insertMyblog(String memComment, String visitor, String memberId) {
		Myblog mb= new Myblog();
		mb.setMemberId(memberId);
		mb.setMemComment(memComment);
		mb.setVisitor(visitor);
		System.out.println(mb);
		int result = dao.insertMyblog(mb);
		int count; 
		if(result>0) {
			count = dao.selectCount(mb);
		}else {
			count=-1;
		}
		return count;
	}

	public MBP selectMyblog(String memberId, int req) {
		MBP list = new MBP();
		HashMap<String,Object> map =new HashMap<String,Object>();
		int numPerPage = 5; 
		int last =	numPerPage*req;
		int first = last - numPerPage + 1;
		//쿠폰의 갯수 종류를 넣어서 진행하기 
		map.put("first", first);
		map.put("last", last);
		map.put("memberId",memberId);
		
		//쿠폰을 먼저 값을 넘겨줘서 구해줌 
		ArrayList<Myblog> mb = dao.selectMyblog(map);
		
		Myblog m= new Myblog();
		m.setMemberId(memberId);
		
		//totalCount 구하기 
		int totalCount = dao.selectCount(m);
		//전역변수 선언 
		int totalPage=0; 
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int pageNaviSize=4;
	
		int pageNo=1;
		String pageNavi="";
		pageNavi +="<div class='btn-group me-2 page' role='group' aria-label='First group'>";
		
		if(req>3) {
			pageNo=req-2;
		}
			
			if(pageNo!=1) {
				int bC = req-1;
				pageNavi +="<button class='btn btn-secondary btns' onclick='myBlogList("+bC+")'>《</button>";
			}
			
		
		for(int i=0; i<pageNaviSize; i++) {
			if(req==pageNo) {
				pageNavi +="<button class='btn btn-secondary btns' id='active' onclick='myBlogList("+pageNo+")'>"+pageNo+"</button>";
			}else {
				pageNavi +="<button class='btn btn-secondary btns' onclick='myBlogList("+pageNo+")'>"+pageNo+"</button>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
			
		}//페이지 요소 끝 
		
		pageNavi+="</div>";
		list.setCount(totalCount);
		list.setList(mb);
		list.setPagenation(pageNavi);
		
		return list;
	}

	public int updateMyblog(String memComment, int blogNo) {
		Myblog m = new Myblog();
		m.setBlogNo(blogNo);
		m.setMemComment(memComment);
		
		return dao.updateMyblog(m);
	}

	public int deleteMyblog(int blogNo) {
		
		return dao.deleteMyblog(blogNo);
	}
}
