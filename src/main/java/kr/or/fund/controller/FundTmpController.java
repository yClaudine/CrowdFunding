package kr.or.fund.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.fund.model.service.FundTmpService;
import kr.or.fund.model.vo.TmpFund;

@Controller
public class FundTmpController {
	@Autowired
	private FundTmpService service;
	
	@RequestMapping(value="/fundReadyFrm.do")
	public String fundReadyFrm(TmpFund f, Model model) {
		int tfNo = service.createTmpFund(f);
		model.addAttribute("tfNo",tfNo);
		return "fund/fundReadyFrm";
	}

}
