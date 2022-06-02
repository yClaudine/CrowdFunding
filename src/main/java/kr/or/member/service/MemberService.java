package kr.or.member.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.dao.MemberDao;
import kr.or.member.vo.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;
	
	
	
	public Member selectOneMember(Member mem) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(mem);
	}

	public int signUpMember(Member m) {
		// TODO Auto-generated method stub
		
		
		
		return dao.signUpMember(m);
	}

	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return dao.deleteMember(m);
	}

	public int updatePwMember(Member m) {
		// TODO Auto-generated method stub
		return dao.changePw(m);
	}

	public int updateMember(Member m) {
		
		return dao.updateMember(m);
	}

	public ArrayList<Member> selectAllMember() {
		
		return dao.selectAllMember();
	}

}
