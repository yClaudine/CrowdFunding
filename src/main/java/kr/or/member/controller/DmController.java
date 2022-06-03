package kr.or.member.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.service.DmService;
import kr.or.member.vo.Dm;

import kr.or.member.vo.pagiDm;

@Controller
public class DmController {

	@Autowired
	private DmService service;
	
	@RequestMapping(value="/dmMain.do")
	public String dmMain() {
		return "member/dmMain";
	}
	
	
	@RequestMapping(value="/getDmList.do",produces ="application/json;charset=utf-8")
	@ResponseBody
	public String getDmList(String memberId, int check,int req) {
		
		
		pagiDm dm = service.selectDmList(memberId,check,req);
		 
		
		return new Gson().toJson(dm);
	}
	
	@RequestMapping(value="/selectOneDm",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String selectOneDm(int dmNo) {
		Dm m = new Dm();
		m = service.selectOneDm(dmNo);
		
		return new Gson().toJson(m);
	}
	@RequestMapping(value="readCk.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String readCk(int dmNo) {
		int result = service.updateReadCk(dmNo);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value="/deleteMessage.do",produces="application/json;charset=utf-8")
	@ResponseBody
	public String deleteMessage(int dmNo) {
		
		int result = service.deleteMessage(dmNo);
		return new Gson().toJson(result);
	}
}
