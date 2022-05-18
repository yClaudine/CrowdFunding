package kr.or.fund.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.fund.model.service.FundService;
import kr.or.fund.model.vo.Fund;

@Controller
public class FundController {
	@Autowired
	private FundService service;
	
	@RequestMapping(value="/test.do")
	public String test(){
		ArrayList<Fund> list = service.selectAllFund();
		System.out.println(list);
		return "test";
	}
}
