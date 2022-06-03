package kr.or.manager.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;
import kr.or.member.vo.Dm;
import kr.or.member.vo.Member;
import kr.or.member.vo.Seller;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreStar;

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

	//멤버 관리
	public ArrayList<Member> selectAllMember(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.selectAllMember", map);
		return (ArrayList<Member>)list;
	}

	public int selectMemberCount(HashMap<String, Object> countMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectMemberCount", countMap);
	}

	public ArrayList<StoreStar> selectOneStar(String memberId) {
		List list = sqlSession.selectList("manager.selectOneStar", memberId);
		return (ArrayList<StoreStar>)list;
	}
	
	//펀드관리
	public ArrayList<Fund> selectAllFund(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.selectAllFund",map);
		return (ArrayList<Fund>)list;
	}

	public int selectFundCount(HashMap<String, Object> countMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectFundCount", countMap);
	}

	public ArrayList<Store> selectAllStore(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.selectAllStore", map);
		return (ArrayList<Store>) list;
	}

	public int selectStoreCount(HashMap<String, Object> countMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectStoreCount", countMap);
	}

	public Fund selectOneFund(int fundNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectOneFund", fundNo);
	}

	public Store selectOneStore(int storeNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectOneStore", storeNo);
	}

	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("manager.selectOneMember", memberNo);
	}

	public ArrayList<Dm> selectReportList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("manager.selectReportList",map);
		return (ArrayList<Dm>)list;
	}

	
}
