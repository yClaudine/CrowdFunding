package kr.or.fund.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.fund.model.service.FundListService;
import kr.or.fund.model.vo.Fund;

@Controller
public class FundListController {
	@Autowired
	private FundListService service;
	
	//펀딩 리스트 메인페이지
	@RequestMapping(value="/fund.do")
	public String FundList(Model model) {
		ArrayList<Fund> list = service.selectFundList();
		model.addAttribute("list",list);
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
	
	
	/*펀딩 리스트 검색 필터링
	@RequestMapping(value="/fundSearch.do")
	public String FundList(Model model) {
		ArrayList<Fund> list = service.searchFundList();
		model.addAttribute("list",list);
		return "fund/fundList";
	}*/
	
	
}
