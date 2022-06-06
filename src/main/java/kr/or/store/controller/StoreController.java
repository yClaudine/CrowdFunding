package kr.or.store.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.vo.Fund;
import kr.or.member.vo.Member;
import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreAllPageData;
import kr.or.store.model.vo.StoreStar;
import kr.or.store.model.vo.StoreViewData;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	/*
	@RequestMapping(value="/storeList.do")
	public String selectAllStore(Model model) {	//데이터 주려면 model 객체
		//바로 비즈니스로직 시작
		ArrayList<Store> list = service.selectAllStore();
		model.addAttribute("list",list);
		return "store/storeList";
	}*/
	@RequestMapping(value="/storeList.do")
	public String selectAllStore(int reqPage, Model model,String storeCategory) {	//데이터 주려면 model 객체(string storeCategory넣기)
		StoreAllPageData spd = service.selectStoreAllList(reqPage,storeCategory);
		model.addAttribute("list",spd.getList());
		model.addAttribute("pageNavi",spd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		model.addAttribute("storeCategory", storeCategory);	//화면에 탭 선택을 보여주기 위해서 
		return "store/storeList";
	}

	@RequestMapping(value="/storeView.do")
	public String storeView(int storeNo, Model model,@SessionAttribute (required = false)Member m) {
		StoreViewData sv = service.selectOneStore(storeNo);
		ArrayList<Integer> storepayNo = service.selectStorepayNo(m.getMemberNo(),storeNo);
		model.addAttribute("s",sv.getS());
		model.addAttribute("list",sv.getList());
		model.addAttribute("starAvg", sv.getStarAvg());
		model.addAttribute("storepayNo", storepayNo);
		return "store/storeView";
	}
	/*
	@RequestMapping(value = "/storeAllList.do")
	public String storeAllList(int reqPage, Model model) {
		StoreAllPageData spd = service.selectStoreAllList(reqPage);
		model.addAttribute("list",spd.getList());
		model.addAttribute("pageNavi",spd.getPageNavi());
		model.addAttribute("reqPage",reqPage);
		return "store/storeList";
	}*/
	//나중에 store와 합하면 지울 것
	@RequestMapping(value = "/storeAll.do")
	public String storeAll() {
		return "store/storeAll";
	}

	@RequestMapping(value = "/insertStar.do")
	public String insertComment(Model model,@SessionAttribute (required = false)Member m,StoreStar ss) {
		int result = service.insertComment(ss);
		//되돌아 가기 위해서는 redirect:를 앞에 
		return "redirect:/storeView.do?storeNo="+ss.getStoreNo();
		
	}


	@RequestMapping(value = "/storePayment.do")
	public String storePayment(Model model,@SessionAttribute (required = false)Member m,int storeNo,int number,int totalprice,String storeCategory) {	//총금액이랑 카테고리
		StoreViewData sv = service.selectOneStore(storeNo);
		ArrayList<MemberCoupon> mcList = service.SelectMemberCouponList(m.getMemberNo());	//조회해오기
		ArrayList<Coupon> cList = new ArrayList<Coupon>();
		for(int i=0;i<mcList.size();i++){
			MemberCoupon mc = mcList.get(i);
		    Coupon c = service.selectOneCoupon(mc.getCouponNo(),totalprice,storeCategory);
		    System.out.println(mc.getCouponNo());
		    if(c != null){
		    	cList.add(c);
		    }
		}
		System.out.println(cList);
		System.out.println(mcList);
		model.addAttribute("cList",cList);
		model.addAttribute("number",number);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("s", sv.getS());
		return "store/storePayment";
	}
	
	@RequestMapping(value="/pay.do")
	public String pay(Model model, @SessionAttribute (required = false)Member m, int storeNo,int number,int couponNo,int storeDelivery,int storePrice, int storepayAllprice) {
		StoreViewData sv = service.selectOneStore(storeNo);
		int insertPay = service.insertPay(m.getMemberNo(),couponNo,storeNo,number,storeDelivery,storePrice,storepayAllprice);
		System.out.println(storeNo);
		System.out.println(couponNo);
		model.addAttribute("totalprice", storepayAllprice);
		model.addAttribute("number", number);
		model.addAttribute("s", sv.getS());
		return "store/pay";
	}
	
	@RequestMapping(value="/Store.do")
	public String Store() {
		return "store/Store";
	}
	
}