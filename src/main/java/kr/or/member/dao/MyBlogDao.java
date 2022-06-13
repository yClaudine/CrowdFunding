package kr.or.member.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.coupon.model.vo.Coupon;
import kr.or.member.vo.Myblog;

@Repository
public class MyBlogDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMyblog(Myblog mb) {
		
		int result = sqlSession.insert("mb.insertMyblog",mb);
		return result;
	}

	public int selectCount(Myblog mb) {
		int count = sqlSession.selectOne("mb.selectCount",mb);
		return count;
	}

	public ArrayList<Myblog> selectMyblog(HashMap<String, Object> map) {
		
		List list = sqlSession.selectList("mb.selectMyblog", map);
		return (ArrayList<Myblog>)list;
	}

	public int updateMyblog(Myblog m) {
		
		int result = sqlSession.update("mb.updateMyblog",m);
		return result;
	}

	public int deleteMyblog(int blogNo) {
		
		
		return sqlSession.delete("mb.deleteMyblog",blogNo);
	}

	
}
