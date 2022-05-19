package kr.or.fund.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.fund.model.service.FundTmpService;
import kr.or.fund.model.vo.TmpFund;
import kr.or.fund.model.vo.TmpFundCalculate;
import kr.or.fund.model.vo.TmpReward;

@Controller
public class FundTmpController {
	@Autowired
	private FundTmpService service;
	
	@RequestMapping(value="/fundCreate.do")
	public String fundCreate(TmpFund f, Model model) {
		int tfNo = service.createTmpFund(f);
		model.addAttribute("tfNo",tfNo);
		return "redirect:/fundReadyFrm.do";
	}
	
	@RequestMapping(value="/fundReadyFrm.do")
	public String fundReadyFrm(int tfNo, Model model) {
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		TmpFund tmpF = service.selectOneTmpFund(tf);
		ArrayList<TmpReward> tRList = service.selectReward(tf);
		TmpFundCalculate tfc = service.selectOneFundCalculate(tf);
		model.addAttribute("tmpF",tmpF);
		model.addAttribute("tRList",tRList);
		model.addAttribute("tfc",tfc);
		/*
		if(tRList.size() != 0) {
			model.addAttribute("tRList",tRList);
		}
		if(tfc != null) {
			model.addAttribute("tfc",tfc);
		}
		*/
		return "fund/fundReadyFrm";
	}

}
