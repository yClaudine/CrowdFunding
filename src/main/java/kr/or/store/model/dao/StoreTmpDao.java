package kr.or.store.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.store.model.vo.TmpStore;

@Repository
public class StoreTmpDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int createTmpStore(TmpStore t) {
		// TODO Auto-generated method stub
		sqlSession.insert("tmpStore.createTmpStore",t);
		int result = t.getStNo();
		return result;
	}
}
