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
import kr.or.fund.model.vo.PayRewardViewData;
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
	
	//펀딩 상세 메인페이지-story
	@RequestMapping(value="/fundView.do")
	public String FundView(int fundNo,Model model)	{
		FundViewData fvd = service.selectOneFundView(fundNo);
		model.addAttribute("s",fvd.getS());
		model.addAttribute("f",fvd.getF());
		model.addAttribute("fl",fvd.getFl());
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
	
	//좋아요  
	@ResponseBody
	@RequestMapping(value="/fundLikeUp.do",produces="application/json;charset=utf-8")
	public String fundLikeUp(FundLike fl) {
		int result = service.insertFundlike(fl);
		return new Gson().toJson(result);
	}
	//좋아요 취소
	@ResponseBody
	@RequestMapping(value="/fundLikeDown.do",produces="application/json;charset=utf-8")
	public String fundLikeDown(int fundNo, String memberId) {
		int result = service.deleteFundlike(fundNo);
		return new Gson().toJson(result);
	}
	//좋아요 체크여부
	@ResponseBody
	@RequestMapping(value="/fundCheck.do",produces="application/json;charset=utf-8")
	public String fundCheck(int fundNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		FundLike fc = service.fundCheck(map);
		if(fc==null) {	//좋아요 안했을 때 -> insert
			
		}
		
		return "";
	}
	
	//결제 상세---------------------------------------------------
	//리워드 선택 페이지 이동
	@RequestMapping(value="/payReward.do")
	public String payRewardView(int fundNo, Model model) {
		PayRewardViewData prvd = service.selectPayReward(fundNo);
		model.addAttribute("f",prvd.getF());
		model.addAttribute("list",prvd.getRewardList());
		return "fund/payReward";	
	}

	//결제 최종 페이지 이동
	@RequestMapping(value="/pay.do")
	public String pay() {
		return "fund/pay";
	}
	//결제 확인 페이지 이동
	@RequestMapping(value="/payConfirm.do")
	public String payConfirm() {
		return "fund/payConfirm";
	}
	
}//class




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
	
	

