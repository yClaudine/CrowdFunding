package kr.or.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.dao.Dmdao;
import kr.or.member.vo.Dm;
import kr.or.member.vo.Member;

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

	public ArrayList<Dm> selectDmList(String memberId, int check) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("memberId",memberId);
		map.put("check", check);
		return dao.selectDmList(map);
	}
	
	
	public Dm selectOneDm(int dmNo) {
		
		
		
		return dao.selectOneDm(dmNo);
	}

	@Transactional
	public int updateReadCk(int dmNo) {
		
		int result = dao.updateRead(dmNo);
		
		return result;
	}
//관리자가 경고시, 경고수 +1
	@Transactional
	public int reportCount(int category, int categoryNo, String recvMemId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("categoryNo", categoryNo);
		map.put("recvMemId", recvMemId);
		return dao.reportCount(map);
	}

}
