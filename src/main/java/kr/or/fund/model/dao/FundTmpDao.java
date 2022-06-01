package kr.or.fund.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.TmpFund;
import kr.or.fund.model.vo.TmpFundCalculate;
import kr.or.fund.model.vo.TmpReward;

@Repository
public class FundTmpDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int createTmpFund(TmpFund f) {
		// TODO Auto-generated method stub
		sqlSession.insert("tmpFund.createTmpFund",f);
		int result = f.getTfNo();
		return result;
	}

	public TmpFund selectOneTmpFund(TmpFund tf) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("tmpFund.selectOneTmpFund",tf);
	}

	public ArrayList<TmpReward> selectReward(TmpFund tf) {
		List list = sqlSession.selectList("tmpFund.selectReward",tf);
		return (ArrayList<TmpReward>)list;
	}

	public TmpFundCalculate selectOneFundCalculate(TmpFund tf) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("tmpFund.selectOneFundCalculate",tf);
	}

	public int updateTmpFees(TmpFund tf) {
		// TODO Auto-generated method stub
		return sqlSession.update("tmpFund.updateTmpFees",tf);
	}

	public int updateTmpBasic(TmpFund tf) {
		// TODO Auto-generated method stub
		return sqlSession.update("tmpFund.updateTmpBasic",tf);
	}

	public int updateTmpStory(TmpFund tf) {
		// TODO Auto-generated method stub
		return sqlSession.update("tmpFund.updateTmpStory",tf);
	}

	public int createTmpReward(TmpReward tr) {
		// TODO Auto-generated method stub
		return sqlSession.insert("tmpFund.createTmpReward",tr);
	}

	public int updateTmpReward(TmpReward tr) {
		// TODO Auto-generated method stub
		return sqlSession.update("tmpFund.updateTmpReward",tr);
	}

	public int deleteTmpReward(TmpReward tr) {
		// TODO Auto-generated method stub
		return sqlSession.delete("tmpFund.deleteTmpReward",tr);
	}

	public int updateTmpPolicy(TmpFund tf) {
		// TODO Auto-generated method stub
		return sqlSession.update("tmpFund.updateTmpPolicy",tf);
	}

}
