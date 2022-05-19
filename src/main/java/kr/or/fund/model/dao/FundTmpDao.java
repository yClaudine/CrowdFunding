package kr.or.fund.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.TmpFund;

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

}
