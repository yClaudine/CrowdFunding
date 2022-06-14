package kr.or.fund.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundCalculate;
import kr.or.fund.model.vo.FundPay;
import kr.or.fund.model.vo.FundPayTmp;
import kr.or.fund.model.vo.Reward;
import kr.or.fund.model.vo.TmpFund;
import kr.or.member.vo.Member;
import kr.or.member.vo.Seller;

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

	public int createFundCalculate(FundCalculate fc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fund.createFundCalculate",fc);
	}

	public int updateFundCalculate(FundCalculate fc) {
		// TODO Auto-generated method stub
		return sqlSession.update("fund.updateFundCalculate",fc);
	}

	public ArrayList<Fund> selectMemberFund(Member m) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("fund.selectMemberFund",m);
		return (ArrayList<Fund>)list;
	}

	public ArrayList<TmpFund> selectMemberTmpFund(Member m) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("fund.selectMemberTmpFund",m);
		return (ArrayList<TmpFund>)list;
	}

	public ArrayList<FundPay> selectFundPay(Fund f) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("fund.selectFundPay",f);
		return (ArrayList<FundPay>)list;
	}

	public int selectTotalFund(Fund f) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fund.selectTotalFund",f);
	}

	public ArrayList<FundPay> selectPayBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("fund.selectPayBoardList",map);
		return (ArrayList<FundPay>)list;
	}

	public int selectPayBoardCount(Fund f) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fund.selectPayBoardCount",f);
	}

	public Seller selectOneSeller(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fund.selectOneSeller",m);
	}

	public ArrayList<FundPayTmp> selectPayDaySum(Fund f) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("fund.selectPayDaySum",f);
		return (ArrayList<FundPayTmp>)list;
	}
	

}
