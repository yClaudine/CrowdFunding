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
	
	@RequestMapping(value="/fund.do")
	public String selectAllFund(Model model) {
		ArrayList<Fund> list = service.selectAllFund();
		model.addAttribute("list",list);
		return "fund/fundList";
	}
	
}
