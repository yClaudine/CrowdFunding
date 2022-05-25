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
	
	//스토어 생성
	@RequestMapping(value="/storeCreate.do")
	public String storeCreate(TmpStore t, Model model) {
		int stNo = service.createTmpStore(t);
		model.addAttribute("stNo", stNo);
		return "redirect:/";
	}
}
