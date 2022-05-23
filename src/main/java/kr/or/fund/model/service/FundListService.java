package kr.or.fund.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.fund.model.dao.FundListDao;
import kr.or.fund.model.vo.Fund;

@Service
public class FundListService {
	@Autowired
	private FundListDao dao;

	public ArrayList<Fund> selectAllFund() {
		return dao.selectAllFund();
	}

}
