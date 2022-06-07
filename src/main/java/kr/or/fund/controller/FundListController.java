package kr.or.fund.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.mapping.ParameterMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sun.javafx.collections.MappingChange.Map;
import com.sun.xml.internal.ws.api.ha.StickyFeature;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.service.FundListService;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundLike;
import kr.or.fund.model.vo.FundPay;
import kr.or.fund.model.vo.FundViewData;
import kr.or.fund.model.vo.PayRewardViewData;
import kr.or.fund.model.vo.PayViewData;
import kr.or.fund.model.vo.Reward;
import kr.or.fund.model.vo.RewardCart;
import kr.or.member.vo.Seller;

@Controller
public class FundListController {
	@Autowired
	private FundListService service;
	
	//펀딩 리스트 메인페이지
	//@ResponseBody
	//produces="application/json;charset=utf-8"
	@RequestMapping(value="/fund.do")
	public String FundList(Model model, String category) {
		ArrayList<Fund> list = service.selectFundList(category);
		model.addAttribute("list",list);
		model.addAttribute("category",category);
		return "fund/fundList";
	}
	
	//펀딩 상세 메인페이지-story
	@RequestMapping(value="/fundView.do")
	public String FundView(int fundNo,Model model)	{
		FundViewData fvd = service.selectOneFundView(fundNo);
		model.addAttribute("s",fvd.getS());
		model.addAttribute("f",fvd.getF());
		model.addAttribute("fl",fvd.getFl());
		model.addAttribute("list",fvd.getRewardList());
		model.addAttribute("plist",fvd.getPayList());
		return "fund/fundView";	
	}
	
	//펀딩 신고
	@RequestMapping(value="/reportFund.do")
	public String reportFund(int fundNo) {
		int result = service.updateReportCount(fundNo);
		System.out.println(result);
		return "redirect:/fundView.do?fundNo="+fundNo;
		//location.href="/fundView.do?fundNo=${f.fundNo }";
	}
	
	/*펀딩 상세2 - 반환정책
	@RequestMapping(value="/fundViewReturnInfo.do")
	public String FundViewReturnInfo(int fundNo, Model model) {

		return "fund/fundViewReturnInfo";	
	}
	//펀딩 상세3 - 새소식 게시판
	@RequestMapping(value="/fundViewNotice.do")
	public String FundViewNotice(int fundNo, Model model) {

		return "fund/fundViewNotice";	
	}
	//펀딩 상세4 - 서포터
	@RequestMapping(value="/fundViewSupporter.do")
	public String FundViewSupporter(int fundNo, Model model) {

		return "fund/fundViewSupporter";	
	}
	

	
	//좋아요  --------------------------------------
	@ResponseBody
	@RequestMapping(value="/fundLikeUp.do",produces="application/json;charset=utf-8")
	public String fundLikeUp(FundLike fl) {
		int result = service.insertFundlike(fl);
		return new Gson().toJson(result);
	}
	//좋아요 취소
	@ResponseBody
	@RequestMapping(value="/fundLikeDown.do",produces="application/json;charset=utf-8")
	public String fundLikeDown(int fundNo, String memberId) {
		int result = service.deleteFundlike(fundNo);
		return new Gson().toJson(result);
	}
	*/
	//좋아요 체크여부
	@ResponseBody
	@RequestMapping(value="/fundCheck.do",produces="application/json;charset=utf-8")
	public String fundCheck(int fundNo, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fundNo",fundNo);
		map.put("memberId",memberId);
		FundLike fc = service.fundCheck(map);
		if(fc==null) {	//좋아요 안했을 때 -> insert
			
		}
		
		return "";
	}
	

	
	//결제 상세---------------------------------------------------
	//리워드, 결제 페이지로 이동
	@RequestMapping(value="/payFunding.do")
	public String payRewardView(int fundNo, Model model) {
		PayRewardViewData prvd = service.selectPayReward(fundNo);
		model.addAttribute("f",prvd.getF());
		model.addAttribute("list",prvd.getRewardList());
		return "fund/payFunding";	
	}
	//결제 확인 페이지 이동 - 카드결제
	@RequestMapping(value="/payConfirm.do")
	public String payConfirm(int fundNo, String memberId, int fpayFinalpay, Model model) {
		PayViewData pvd = service.payConfirm(fundNo,memberId,fpayFinalpay);
		model.addAttribute("f",pvd.getF());
		model.addAttribute("list",pvd.getRewardList());
		model.addAttribute("fp",pvd.getFp());
		return "fund/payConfirm";
	}
	
	//결제 확인 페이지 이동 - 무통장입금
	@RequestMapping(value="/payConfirm2.do")
	public String payConfirm2(int fundNo, String memberId, int fpayFinalpay, Model model) {
		PayViewData pvd = service.payConfirm(fundNo,memberId,fpayFinalpay);
		model.addAttribute("f",pvd.getF());
		model.addAttribute("list",pvd.getRewardList());
		model.addAttribute("fp",pvd.getFp());
		return "fund/payConfirm2";
	}
	

	
	

	
	//쿠폰 리스트 ajax 버전
	@ResponseBody
	@RequestMapping(value="/selectCouponList.do",produces="application/json;charset=utf-8")
	public String CouponList(String fundCategory, int memberNo, int rewardSum) {
		ArrayList<Coupon> clist = service.selectCouponList(memberNo,fundCategory,rewardSum);
		return new Gson().toJson(clist);
	}

	//최종 결제 정보 인서트
	@ResponseBody
	@RequestMapping(value="/PayInfo.do", produces="application/json;charset=utf-8")
	public String insertPay(String memberId,String memberName,int fundNo, int fpayDeliveryfee, int fpaySupport, 
			int fpayRewardTotal, int fpayFunding, int fpayFinalpay, int nameShow, int fundingShow, int payMethod) {
		int result = service.insertPay(memberId,memberName,fundNo,fpayDeliveryfee,fpaySupport,fpayRewardTotal,fpayFunding,fpayFinalpay,nameShow,fundingShow,payMethod);
		return new Gson().toJson(result);
	}
	
	//사용여부 X -----------------------------------------------------------------------
	/*카트 insert
	@ResponseBody
	@RequestMapping(value="/insertCart.do",produces="application/json;charset=utf-8")
	public String insertCart(int memberNo, int rewardAmount, int fundNo, int rewardNo) {
		int result = service.insertCart(memberNo,rewardAmount,fundNo,rewardNo);//, memberNo, rewardAmount, fundNo);
		return new Gson().toJson(result);
	}
	//카트 삭제
	@ResponseBody
	@RequestMapping(value="/deleteCart.do",produces="application/json;charset=utf-8")
	public String deleteCart(int memberNo, int rewardAmount, int fundNo, int rewardNo) {
		int result = service.deleteCart(memberNo,rewardAmount,fundNo,rewardNo);//, memberNo, rewardAmount, fundNo);
		return new Gson().toJson(result);
	}*/
	
	//리워드 카트 array insert
	@ResponseBody
	@RequestMapping(value="/insertReward.do",produces="application/json;charset=utf-8")
	public String insertReward(String reward){
		//JsonArray array = JsonArray.fromObject(reward.get("reward"));
		System.out.println(reward);
		//변환, 꺼내쓰는 작업 중요 (특히 검색엔진쪽, 데이터 편집)
		JsonParser parser = new JsonParser();
		JsonArray jsonarray = parser.parse(reward).getAsJsonArray();
		ArrayList<RewardCart> result = new ArrayList<RewardCart>();
		for(int i=0; i<jsonarray.size(); i++) {
			//json객체 배열 유연해서 확실히 타입 지정
			JsonObject object = jsonarray.get(0).getAsJsonObject();
			RewardCart r = new RewardCart();
			//소켓에서 json으로 꺼내는 방식 참고해야 함 -> ()에 키값
			r.setMemberNo(object.get("memberNo").getAsInt());
			r.setRewardNo(object.get("rewardNo").getAsInt());
			r.setFundNo(object.get("fundNo").getAsInt());
			r.setRewardAmount(object.get("rewardAmount").getAsInt());
			result.add(r);
		}
		//for문 끝나고 result에 add해주면 됨
		
		return new Gson().toJson(reward);
	}
	


	
}//class





	
	/*펀딩 리스트 검색 필터링
	@RequestMapping(value="/fundSearch.do")
	public String FundList(Model model) {
		ArrayList<Fund> list = service.searchFundList();
		model.addAttribute("list",list);
		return "fund/fundList";
	}*/
	
	

