package kr.or.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectOneMember(Member mem) {
		
		Member m = sqlSession.selectOne("member.selectOneMember",mem); 
		return m;
	}

	public int signUpMember(Member m) {
		
		int result = sqlSession.insert("member.signUpMember",m);
		return result;
	}

}
