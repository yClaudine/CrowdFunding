package kr.or.fund.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.fund.model.dao.FundDao;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundCalculate;
import kr.or.fund.model.vo.FundPay;
import kr.or.fund.model.vo.PayBoardPageData;
import kr.or.fund.model.vo.Reward;
import kr.or.fund.model.vo.TmpFund;
import kr.or.member.vo.Member;
import kr.or.member.vo.Seller;

@Service
public class FundService {
	@Autowired
	private FundDao dao;

	public ArrayList<Fund> selectAllFund() {
		// TODO Auto-generated method stub
		return dao.selectAllFund();
	}

	public Fund selectOneFund(Fund f) {
		// TODO Auto-generated method stub
		return dao.selectOneFund(f);
	}

	public int updateFundStory(Fund fund) {
		// TODO Auto-generated method stub
		return dao.updateFundStory(fund);
	}

	public ArrayList<Reward> selectReward(Fund f) {
		// TODO Auto-generated method stub
		return dao.selectReward(f);
	}

	public int createReward(Reward r) {
		// TODO Auto-generated method stub
		return dao.createReward(r);
	}

	public int updateReward(Reward r) {
		// TODO Auto-generated method stub
		return dao.updateReward(r);
	}

	public int deleteReward(Reward r) {
		// TODO Auto-generated method stub
		return dao.deleteReward(r);
	}

	public FundCalculate selectFundCalculate(Fund f) {
		// TODO Auto-generated method stub
		return dao.selectFundCalculate(f);
	}

	public int createFundCalculate(FundCalculate fc) {
		// TODO Auto-generated method stub
		return dao.createFundCalculate(fc);
	}

	public int updateFundCalculate(FundCalculate fc) {
		// TODO Auto-generated method stub
		return dao.updateFundCalculate(fc);
	}

	public ArrayList<Fund> selectMemberFund(Member m) {
		// TODO Auto-generated method stub
		return dao.selectMemberFund(m);
	}

	public ArrayList<TmpFund> selectMemberTmpFund(Member m) {
		// TODO Auto-generated method stub
		return dao.selectMemberTmpFund(m);
	}

	public ArrayList<FundPay> selectFundPay(Fund f) {
		// TODO Auto-generated method stub
		return dao.selectFundPay(f);
	}

	public int selectTotalFund(Fund f) {
		// TODO Auto-generated method stub
		return dao.selectTotalFund(f);
	}

	public PayBoardPageData selectPayBoardList(int reqPage, Fund f) {
		//한 페이지당 보여줄 게시물 수
		int numPerPage = 10;
		//reqPage 1 -> 1~10, reqPage 2 -> 11~20
		//해당페이지 게시물 마지막 번호
		int end = reqPage * numPerPage;
		//해당페이지 첫번째 게시물 번호
		int start = end - numPerPage + 1;
		
		//계산한 start, end를 이용해서 게시물 목록 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",f.getFundNo());
		map.put("start", start);
		map.put("end", end);
		ArrayList<FundPay> list = dao.selectPayBoardList(map);
		
		//pageNavi 작성 시작
		//전체 페이지 수 계산이 필요 -> 전체 게시물의 수를 db에서 조회해와야 계산가능
		int totalCount = dao.selectPayBoardCount(f);
		//구해온 전체 게시물 수를 통해 전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		//페이지 네비 길이
		int pageNaviSize = 5;
		//페이지 네비 시작번호
		int pageNo = 1;
		if(reqPage > 3) {
			pageNo = reqPage - 2;
		}
		//pageNavi 생성 시작
		String pageNavi = "<ul class='pagination'>";
		//이전버튼
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/fundStatusManageFrm.do?fundNo="+f.getFundNo();
			pageNavi += "&reqPage="+(reqPage-3)+"'>&laquo;</a></li>";
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'><a class='page-link' href='/fundStatusManageFrm.do?";
				pageNavi += "fundNo="+f.getFundNo()+"&reqPage="+pageNo+"'>"+pageNo+"</a><li>";
			}else {
				pageNavi += "<li class='page-item'><a class='page-link' href='/fundStatusManageFrm.do?";
				pageNavi += "fundNo="+f.getFundNo()+"&reqPage="+pageNo+"'>"+pageNo+"</a><li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		//다음버튼
		if(pageNo<=totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/fundStatusManageFrm.do?fundNo="+f.getFundNo();
			pageNavi += "&reqPage="+(reqPage+3)+"'>&raquo;</a></li>";
		}
		
		PayBoardPageData pbpd = new PayBoardPageData(list, pageNavi);
		return pbpd;
	}

	public Seller selectOneSeller(Member m) {
		// TODO Auto-generated method stub
		return dao.selectOneSeller(m);
	}

}
