package kr.or.store.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.store.model.service.StoreTmpService;

@Controller
public class StoreTmpController {
	@Autowired
	private StoreTmpService service;
	
	@RequestMapping(value="/storeCreate.do")
	public String storeCreate() {
		
		return "store/storeCreate";
	}
}
