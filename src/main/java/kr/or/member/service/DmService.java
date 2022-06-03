package kr.or.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.dao.Dmdao;
import kr.or.member.vo.Dm;
import kr.or.member.vo.Member;

import kr.or.member.vo.pagiDm;

@Service
public class DmService {

	@Autowired
	private Dmdao dao;
	
	public int dmCount(String memberId) {
		
		return dao.dmCount(memberId);
	}
	
	@Transactional
	public int insertDm(Dm dm) {
		// TODO Auto-generated method stub
		int result = dao.insertDm(dm);
		//user2의 쪽지 갯수가 갱신이 되어야함 
		if(result>0) {
			//쪽지를 보냈으니 수신자가 안읽은 메시지 갯수를 리턴해야함 
			result = dao.dmCount(dm.getRecvMemId());
		}else {
			result = -1;
		}
		return result;
	}

	public pagiDm selectDmList(String memberId, int check, int req) {
		
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberId",memberId);
		map.put("check", check);
	
		int numPerPage =7; 
		 
		int last =numPerPage *req; 
		int start = last -numPerPage +1;
		map.put("start",start);
		map.put("last",last);
		
		ArrayList<Dm> list = dao.selectDmList(map);
		HashMap<String,Object> count = new HashMap<String,Object>();
		count.put("memberId", memberId);
		count.put("check", check);
		int totalCount = dao.TotalCount(count);
			int totalPage;
		if(totalCount % numPerPage ==0) {
			 totalPage =  totalCount / numPerPage; 
		}else {
			 totalPage = totalCount / numPerPage+1 ;
		}
		
		//페이지 길이
		int pageNaviSize =5; 
		//페이지 시작 번호 
		int pageNo =1; 
		if(req>3) {
			pageNo = req -2;
		}
		
		String pageNavi = "";
		pageNavi ="<div class='btn-group me-2' id='pagi' role='group' aria-label='First group'>";
		if (check==0) {
			if(pageNo !=1) {
				int p = req-1;
				pageNavi += "<div class='btn btn-secondary' onclick='recvMemId("+p+")'>«</div>";
			}
			
			//페이지 숫자 생성 
			for(int i=0; i<pageNaviSize; i++) {
		
				if(pageNo==req) {
					pageNavi +="<div class='btn btn-info' onclick='recvMemId("+pageNo+")'>"+pageNo+"</div>";
				}else {
					pageNavi +="<div class='btn btn-secondary' onclick='recvMemId("+pageNo+")'>"+pageNo+"</div>";
				}
				pageNo++;
				if(pageNo>totalPage) {
					break;
				}
			}
			if(pageNo<=totalPage) {
				int p1 = req+1;
				pageNavi += "<div class='btn btn-secondary' onclick='recvMemId("+p1+")'>»</div>";
			}

			
		}else if (check==1){
			
			//이전버튼 
			
				if(pageNo !=1) {
					int p = pageNo-1;
					pageNavi += "<div class='btn btn-secondary' onclick='sendMemId("+p+")'>«</div>";
				}
				
				//페이지 숫자 생성 
				for(int i=0; i<pageNaviSize; i++) {
					if(pageNo==req) {
						pageNavi +="<div class='btn btn-info' onclick='sendMemId("+pageNo+")'>"+pageNo+"</div>";
					}else {
						pageNavi +="<div class='btn btn-secondary' onclick='sendMemId("+pageNo+")'>"+pageNo+"</div>";
					}
				
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
					
				}
				if(pageNo<=totalPage) {
					int p1 = pageNo+1;
					pageNavi += "<div class='btn btn-secondary' onclick='sendMemId("+p1+")'>»</div>";
				}
		}
		pagiDm dm = new pagiDm();
		dm.setList(list);
		dm.setPagination(pageNavi);
		return dm;
	}
	
	
	public Dm selectOneDm(int dmNo) {
		
		
		
		return dao.selectOneDm(dmNo);
	}

	@Transactional
	public int updateReadCk(int dmNo) {
		
		int result = dao.updateRead(dmNo);
		
		return result;
	}

	public int deleteMessage(int dmNo) {
		
		
		return dao.deleteMessage(dmNo);
	}

}
