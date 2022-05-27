package kr.or.fund.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.fund.model.service.FundListService;
import kr.or.fund.model.vo.Fund;

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
	//펀딩 리스트 메인 - 카테고리

	
	//펀딩 상세 메인페이지-story
	@RequestMapping(value="/fundView.do")
	public String FundView(int fundNo, Model model)	{
		Fund f = service.selectOneFund(fundNo);
		model.addAttribute("f",f);
		return "fund/fundView";	
	}
	//펀딩 상세2 - 반환정책
	@RequestMapping(value="/fundViewReturnInfo.do")
	public String FundViewReturnInfo(int fundNo, Model model) {
		Fund f = service.selectOneFund(fundNo);
		model.addAttribute("f",f);
		return "fund/fundViewReturnInfo";	
	}
	//펀딩 상세3 - 새소식 게시판
	@RequestMapping(value="/fundViewNotice.do?")
	public String FundViewNotice(int fundNo, Model model) {
		Fund f = service.selectOneFund(fundNo);
		model.addAttribute("f",f);
		return "fund/fundViewNotice";	
	}
	//펀딩 상세4 - 서포터
	@RequestMapping(value="/fundViewSupporter.do")
	public String FundViewSupporter(int fundNo, Model model) {
		Fund f = service.selectOneFund(fundNo);
		model.addAttribute("f",f);
		return "fund/fundViewSupoorter";	
	}
	
	
	/*펀딩 리스트 검색 필터링
	@RequestMapping(value="/fundSearch.do")
	public String FundList(Model model) {
		ArrayList<Fund> list = service.searchFundList();
		model.addAttribute("list",list);
		return "fund/fundList";
	}*/
	
	
}
