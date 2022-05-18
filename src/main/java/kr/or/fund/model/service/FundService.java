package kr.or.fund.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.fund.model.dao.FundDao;
import kr.or.fund.model.vo.Fund;

@Service
public class FundService {
	@Autowired
	private FundDao dao;

	public ArrayList<Fund> selectAllFund() {
		// TODO Auto-generated method stub
		return dao.selectAllFund();
	}

}
