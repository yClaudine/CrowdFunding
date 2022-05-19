package kr.or.fund.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.fund.model.dao.FundTmpDao;
import kr.or.fund.model.vo.TmpFund;

@Service
public class FundTmpService {
	@Autowired
	private FundTmpDao dao;

	public int createTmpFund(TmpFund f) {
		// TODO Auto-generated method stub
		return dao.createTmpFund(f);
	}

}
