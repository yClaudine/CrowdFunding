package kr.or.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	@RequestMapping(value="/storeList.do")
	public String selectAllStore(Model model) {	//데이터 주려면 model 객체
		//바로 비즈니스로직 시작
		ArrayList<Store> list = service.selectAllStore();
		model.addAttribute("list",list);
		return "store/storeList";
	}
}
