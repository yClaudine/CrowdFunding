package kr.or.fund.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.TmpFund;
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

}
