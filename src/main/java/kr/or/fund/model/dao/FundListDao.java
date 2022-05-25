package kr.or.fund.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;

@Repository
public class FundListDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	//펀딩 리스트 메인페이지
	public ArrayList<Fund> selectFundList() {
		List list = sqlSession.selectList("fundList.selectAllFund");
		return (ArrayList<Fund>)list;
	}
	
	//펀딩 상세 메인페이지-story
	public Fund selectOneFund(int fundNo) {
		Fund f = sqlSession.selectOne("fundList.selectOneFund");
		return f;
	}
}
