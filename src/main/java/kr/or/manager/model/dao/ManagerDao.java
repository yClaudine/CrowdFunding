package kr.or.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.vo.Seller;

@Repository
public class ManagerDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int totalSellerCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.totalSellerCount", map);
	}

	public ArrayList<Seller> selectSellerForManager(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.selectSellerForManager", map);
		return (ArrayList<Seller>)list;
	}

	public int changeMemberAuth(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("manager.changeMemberAuth", map);
	}

	public int changeSellerAuth(Seller seller) {
		// TODO Auto-generated method stub
		return sqlSession.update("manager.changeSellerAuth", seller);
	}

	public ArrayList<Seller> moreSeller(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.moreSeller", map);
		return (ArrayList<Seller>)list;
	}
}
