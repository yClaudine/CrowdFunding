package kr.or.fund.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundCalculate;
import kr.or.fund.model.vo.Reward;

@Repository
public class FundDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Fund> selectAllFund() {
		List list = sqlSession.selectList("fund.selectAllFund");
		return (ArrayList<Fund>)list;
	}

	public Fund selectOneFund(Fund f) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fund.selectOneFund",f);
	}

	public int updateFundStory(Fund fund) {
		// TODO Auto-generated method stub
		return sqlSession.update("fund.updateFundStory",fund);
	}

	public ArrayList<Reward> selectReward(Fund f) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("fund.selectReward",f);
		return (ArrayList<Reward>)list;
	}

	public int createReward(Reward r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fund.createReward",r);
	}

	public int updateReward(Reward r) {
		// TODO Auto-generated method stub
		return sqlSession.update("fund.updateReward",r);
	}

	public int deleteReward(Reward r) {
		// TODO Auto-generated method stub
		return sqlSession.delete("fund.deleteReward",r);
	}

	public FundCalculate selectFundCalculate(Fund f) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fund.selectFundCalculate",f);
	}
	

}
