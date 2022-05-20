package kr.or.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;
import kr.or.store.model.vo.Store;

@Repository
public class StoreDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Store> selectAllStore() {
		List list = sqlSession.selectList("store.selectAllStore");
		return (ArrayList<Store>)list;
	}

	public Store selectOneStore(int storeNo) {
		Store s = sqlSession.selectOne("store.selectOneStore",storeNo);
		return s;
	}

	public ArrayList<Store> selectStoreAllList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("store.selectStoreAllList",map);
		return (ArrayList<Store>)list;
	}

	public int selectStoreCount() {
		int totalCount = sqlSession.selectOne("store.selectTotalCount");
		return totalCount;
	}
}
