package kr.or.fund.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.fund.model.service.FundListService;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundLike;
import kr.or.fund.model.vo.FundViewData;
import kr.or.fund.model.vo.Reward;
import kr.or.member.vo.Seller;

@Controller
public class FundListController {
	@Autowired
	private FundListService service;
	
	//펀딩 리스트 메인페이지
	//@ResponseBody
	//produces="application/json;charset=utf-8"
	@RequestMapping(value="/fund.do")
	public String FundList(Model model, String category) {
		ArrayList<Fund> list = service.selectFundList(category);
		model.addAttribute("list",list);
		model.addAttribute("category",category);
		return "fund/fundList";
	}
	/*펀딩 상세페이지
	@RequestMapping(value="/fundView.do")
	public String FundView(int fundNo, Model model)	{
		Fund f = service.selectOneFundView(fundNo);
		model.addAttribute("f",f);
		return "fund/fundView";	
	}*/
	
	//펀딩 상세 메인페이지-story 에러---------------------------------------------
	@RequestMapping(value="/fundView.do")
	public String FundView(int fundNo,Model model)	{
		FundViewData fvd = service.selectOneFundView(fundNo);
		model.addAttribute("s",fvd.getS());
		model.addAttribute("f",fvd.getF());
		model.addAttribute("list",fvd.getRewardList());
		return "fund/fundView";	
	}

	//펀딩 신고
	@RequestMapping(value="/reportFund.do")
	public String reportFund(int fundNo) {
		int result = service.updateReportCount(fundNo);
		System.out.println(result);
		return "redirect:/fundView.do?fundNo="+fundNo;
		//location.href="/fundView.do?fundNo=${f.fundNo }";
	}
	
	//좋아요 ajax
	@ResponseBody
	@RequestMapping(value="/fundLike.do", produces="application/json;charset=utf-8")
	public String fundLike(int fundNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		FundLike fl = service.selectOneFundlike(map);
		
		if(fl==null) { //해당 펀딩에 좋아요 한 회원 없음  -> 좋아요 row update, 총 row수
			int result = service.insertFundlike(/*FundLike f*/);
			return "0";
		}else{			//좋아요 한 회원 있음 -> 좋아요 row delete, 총 row수
			int result = service.deleteFundlike(fundNo);
			return "1";
		}
		//return new Gson().toJson();
	}
	
	/*fundlike 하나 insert??
	public String insertFundlike(FundLike flView) {
		int result = service.insertFundlike(flView);
		return "";
	}*/
	
}




	/*펀딩 상세2 - 반환정책
	@RequestMapping(value="/fundViewReturnInfo.do")
	public String FundViewReturnInfo(int fundNo, Model model) {

		return "fund/fundViewReturnInfo";	
	}
	//펀딩 상세3 - 새소식 게시판
	@RequestMapping(value="/fundViewNotice.do")
	public String FundViewNotice(int fundNo, Model model) {

		return "fund/fundViewNotice";	
	}
	//펀딩 상세4 - 서포터
	@RequestMapping(value="/fundViewSupporter.do")
	public String FundViewSupporter(int fundNo, Model model) {

		return "fund/fundViewSupporter";	
	}
	
	
	/*펀딩 리스트 검색 필터링
	@RequestMapping(value="/fundSearch.do")
	public String FundList(Model model) {
		ArrayList<Fund> list = service.searchFundList();
		model.addAttribute("list",list);
		return "fund/fundList";
	}*/
	
	

