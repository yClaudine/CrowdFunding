package kr.or.fund.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.fund.model.dao.FundTmpDao;
import kr.or.fund.model.vo.TmpFund;
import kr.or.fund.model.vo.TmpFundCalculate;
import kr.or.fund.model.vo.TmpReward;

@Service
public class FundTmpService {
	@Autowired
	private FundTmpDao dao;

	public int createTmpFund(TmpFund f) {
		// TODO Auto-generated method stub
		return dao.createTmpFund(f);
	}

	public TmpFund selectOneTmpFund(TmpFund tf) {
		// TODO Auto-generated method stub
		return dao.selectOneTmpFund(tf);
	}

	public ArrayList<TmpReward> selectReward(TmpFund tf) {
		// TODO Auto-generated method stub
		return dao.selectReward(tf);
	}

	public TmpFundCalculate selectOneFundCalculate(TmpFund tf) {
		// TODO Auto-generated method stub
		return dao.selectOneFundCalculate(tf);
	}

	public int updateTmpFees(TmpFund tf) {
		// TODO Auto-generated method stub
		return dao.updateTmpFees(tf);
	}

	public int updateTmpBasic(TmpFund tf) {
		// TODO Auto-generated method stub
		return dao.updateTmpBasic(tf);
	}

	public int updateTmpStory(TmpFund tf) {
		// TODO Auto-generated method stub
		return dao.updateTmpStory(tf);
	}

	public int createTmpReward(TmpReward tr) {
		// TODO Auto-generated method stub
		return dao.createTmpReward(tr);
	}

	public int updateTmpReward(TmpReward tr) {
		// TODO Auto-generated method stub
		return dao.updateTmpReward(tr);
	}

	public int deleteTmpReward(TmpReward tr) {
		// TODO Auto-generated method stub
		return dao.deleteTmpReward(tr);
	}

	public int updateTmpPolicy(TmpFund tf) {
		// TODO Auto-generated method stub
		return dao.updateTmpPolicy(tf);
	}

}
