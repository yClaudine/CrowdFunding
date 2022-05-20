package kr.or.store.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreAllPageData;

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
	@RequestMapping(value="/storeView.do")
	public String storeView(int storeNo, Model model) {
		Store s = service.selectOneStore(storeNo);
		model.addAttribute("s",s);
		return "store/storeView";
	}
	@RequestMapping(value = "/storeAllList.do")
	public String storeAllList(int reqPage, Model model) {
		StoreAllPageData spd = service.selectStoreAllList(reqPage);
		model.addAttribute("list",spd.getList());
		model.addAttribute("pageNavi",spd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "store/storeList";
	}
	//나중에 store와 합하면 지울 것
	@RequestMapping(value = "/storeAll.do")
	public String storeAll() {
		return "store/storeAll";
	}
	
	@RequestMapping(value="/Store.do")
	public String Store() {
		return "store/Store";
	}
}
