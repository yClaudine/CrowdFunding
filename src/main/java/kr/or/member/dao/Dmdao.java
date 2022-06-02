package kr.or.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.vo.Dm;
import kr.or.member.vo.Member;

@Repository
public class Dmdao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int dmCount(String memberId) {
		
		int dmCount = sqlSession.selectOne("dm.dmCount",memberId);
		return dmCount;
	}

	public int insertDm(Dm dm) {
		
		return sqlSession.insert("dm.dmInsert",dm);
		
	}

	public ArrayList<Dm> selectDmList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("dm.selectDmList",map);
		return (ArrayList<Dm>)list;
	}

	public Dm selectOneDm(int dmNo) {
		
		Dm d = sqlSession.selectOne("dm.selectOneDm",dmNo);
		return d;
	}

	public int updateRead(int dmNo) {
		
		int result = sqlSession.update("dm.updateRc",dmNo);
		return result;
	}
}
