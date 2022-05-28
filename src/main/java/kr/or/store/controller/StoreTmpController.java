package kr.or.store.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.store.model.service.StoreTmpService;
import kr.or.store.model.vo.TmpStore;

@Controller
public class StoreTmpController {
	@Autowired
	private StoreTmpService service;
	
	//페이지 이동 반복 패턴 메서드
	public void pageMove(int stNo, Model model) {
		TmpStore ts = new TmpStore();
		ts.setStNo(stNo);
		TmpStore tmp = service.selectOneTmpStore(ts);
		model.addAttribute("tmp",tmp);
	}
	
	//스토어 페이지 이동
	@RequestMapping(value="/storeStart.do")
	public String storeStart() {
		return"store/storeCreate";
	}
	
	//스토어 생성
	@RequestMapping(value="/storeCreate.do")
	public String storeCreate(TmpStore t, Model model) {
		int stNo = service.createTmpStore(t);
		model.addAttribute("stNo", stNo);
		return "store/storeCreate2";
	}
	
	/*
	@RequestMapping(value="/storeCreat2.do")
	public String storeCreate2(int stNo, Model model) {
		pageMove(stNo, model);
		return "store/storeCreate2";
	}
	*/
	
	//스토어 등록 홈페이지 시작	
	@RequestMapping(value="/storeReadyFrm.do")
	public String storeReadyFrm(int stNo, Model model) {
		TmpStore ts = new TmpStore();
		ts.setStNo(stNo);
		TmpStore tmp = service.selectOneTmpStore(ts);
		model.addAttribute("tmp", tmp);
		return "store/storeReadyFrm";
	}
	
	//스토어 기본 정보 등록
	@RequestMapping(value="/storeCreate3.do")
	public String storeCreate3(int stNo, Model model) {
		pageMove(stNo, model);
		return "store/storeCreate3";
	}
	
}
