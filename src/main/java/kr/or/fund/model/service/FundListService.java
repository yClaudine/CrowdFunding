package kr.or.fund.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.fund.model.dao.FundListDao;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundLike;
import kr.or.fund.model.vo.FundViewData;
import kr.or.fund.model.vo.Reward;
import kr.or.member.vo.Seller;

@Service
public class FundListService {
	@Autowired
	private FundListDao dao;

	//펀딩 리스트 메인페이지
	public ArrayList<Fund> selectFundList(String category) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		return dao.selectFundList(map);
	}

	/*
	public Fund selectOneFundView(int fundNo) {
		return dao.selectOneFund(fundNo);
	}*/
	
	//펀딩 상세 페이지 데이터
	public FundViewData selectOneFundView(int fundNo) {
		Fund f = dao.selectOneFund(fundNo);
		Seller s = dao.selectOneSeller(fundNo);
		ArrayList<Reward> list = dao.selectRewardList(fundNo);
		FundViewData fvd = new FundViewData(f,list,s);
		return fvd;
	}
	
	

	//펀딩 신고하기
	public int updateReportCount(int fundNo) {
		return dao.updateReportCount(fundNo);
	}
	//좋아요 ajax
	public FundLike selectOneFundlike(HashMap<String, Object> map) {
		return dao.selectOneFundlike(map);
	}
	//좋아요 insert
	public int insertFundlike() {
		return dao.insertFundlike();
	}
	//좋아요 delete
	public int deleteFundlike(int fundNo) {
		return dao.deleteFundlike(fundNo);
	}

}
