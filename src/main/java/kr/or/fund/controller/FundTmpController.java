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
	
	//페이지 이동 반복패턴 메서드
	public void pageMove(int tfNo, Model model) {
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		TmpFund tmpF = service.selectOneTmpFund(tf);
		model.addAttribute("tmpF",tmpF);
	}
	
	//펀드 생성
	@RequestMapping(value="/fundCreate.do")
	public String fundCreate(TmpFund f, Model model) {
		int tfNo = service.createTmpFund(f);
		model.addAttribute("tfNo",tfNo);
		return "redirect:/fundReadyFrm.do";
	}
	
	//펀드 준비 통합 페이지
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
	
	//FUND 신청하기 메서드 추후 작성
	@RequestMapping(value="/CreateFund.do")
	public String CreateFund(int tfNo) {
		return "redirect:/";
	}
	
	//요금제 선택 페이지로
	@RequestMapping(value="/fundFeeSelectFrm.do")
	public String fundFeeSelectFrm(int tfNo, Model model){
		pageMove(tfNo, model);
		return "fund/fundFeeSelect";
	}
	
	//요금제 선택 페이지 -> 저장하기 버튼
	@RequestMapping(value="/SaveTmpFees.do")
	public String SaveTmpFees(int tfNo, int tfFees, Model model) {
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		tf.setTfFees(tfFees);
		int result = service.updateTmpFees(tf);
		return "redirect:/fundReadyFrm.do?tfNo="+tfNo;
	}
	
	//기본 정보 수정 페이지로
	@RequestMapping(value="/fundInfoUpdateFrm.do")
	public String fundInfoUpdateFrm(int tfNo, Model model){
		pageMove(tfNo, model);
		return "fund/fundInfoUpdateFrm";
	}
	
	@RequestMapping(value="/TmpDetail.do")
	public String TmpDetail(int tfNo, int value, Model model) {
		pageMove(tfNo, model);
		model.addAttribute("value",value);
		return "fund/fundFeeDetail";
	}

}
