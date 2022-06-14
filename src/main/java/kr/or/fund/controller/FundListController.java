package kr.or.fund.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.mapping.ParameterMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.service.FundListService;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundLike;
import kr.or.fund.model.vo.FundNotice;
import kr.or.fund.model.vo.FundNoticeViewData;
import kr.or.fund.model.vo.FundOneNoticeViewData;
import kr.or.fund.model.vo.FundPay;
import kr.or.fund.model.vo.FundUpdateNoticeViewData;
import kr.or.fund.model.vo.FundViewData;
import kr.or.fund.model.vo.PayRewardViewData;
import kr.or.fund.model.vo.PayViewData;
import kr.or.fund.model.vo.Reward;
import kr.or.fund.model.vo.RewardCart;
import kr.or.member.vo.Seller;
import kr.or.notice.model.vo.Notice;

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
	
	//펀딩 리스트 검색 필터링
	@RequestMapping(value="/fundSearch.do")
	public String FundList(Model model, String keyword, String searchType, String fstatus) {
		ArrayList<Fund> list = service.searchFundList(keyword,searchType,fstatus);
		model.addAttribute("list",list);
		model.addAttribute("keyword",keyword);
		model.addAttribute("fstatus",fstatus);
		model.addAttribute("searchType",searchType);
		return "fund/fundList";
	}
	
	//펀딩 상세 메인페이지-story
	@RequestMapping(value="/fundView.do")
	public String FundView(int fundNo, String memberId, String sellerId, Model model)	{
		FundViewData fvd = service.selectOneFundView(fundNo,memberId,sellerId);
		model.addAttribute("s",fvd.getS());
		model.addAttribute("f",fvd.getF());
		model.addAttribute("fl",fvd.getFl());
		model.addAttribute("list",fvd.getRewardList());
		model.addAttribute("p", fvd.getP());
		model.addAttribute("plist",fvd.getPayList());
		return "fund/fundView";	
	}
	
	//펀딩 상세2 - 반환정책
	@RequestMapping(value="/fundViewReturnInfo.do")
	public String FundViewReturnInfo(int fundNo, String memberId, String sellerId, Model model) {
		FundViewData fvd = service.selectOneFundView(fundNo,memberId,sellerId);
		model.addAttribute("s",fvd.getS());
		model.addAttribute("f",fvd.getF());
		model.addAttribute("fl",fvd.getFl());
		model.addAttribute("list",fvd.getRewardList());
		model.addAttribute("p", fvd.getP());
		model.addAttribute("plist",fvd.getPayList());
		return "fund/fundViewReturnInfo";	
	}
	
	//펀딩 상세4 - 서포터
	@RequestMapping(value="/fundViewSupporter.do")
	public String FundViewSupporter(int fundNo, String memberId, String sellerId, Model model) {
		FundViewData fvd = service.selectOneFundView(fundNo,memberId,sellerId);
		model.addAttribute("s",fvd.getS());
		model.addAttribute("f",fvd.getF());
		model.addAttribute("fl",fvd.getFl());
		model.addAttribute("list",fvd.getRewardList());
		model.addAttribute("p", fvd.getP());
		model.addAttribute("plist",fvd.getPayList());
		return "fund/fundViewSupporter";	
	}

	//펀딩 신고
	@RequestMapping(value="/reportFund.do")
	public String reportFund(int fundNo) {
		int result = service.updateReportCount(fundNo);
		System.out.println(result);
		return "redirect:/fundView.do?fundNo="+fundNo;
		//location.href="/fundView.do?fundNo=${f.fundNo }";
	}
	

	//로그인 시 좋아요
	@ResponseBody
	@RequestMapping(value="/likeCheck.do",produces="application/json;charset=utf-8")
	public String fundCheck(int fundNo, String memberId) {
		int result = service.likeCheck(fundNo,memberId);
		return String.valueOf(result);		
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

	
	//최종 결제 정보 인서트
	@ResponseBody
	@RequestMapping(value="/PayInfo.do", produces="application/json;charset=utf-8")
	public String insertPay(String memberId,String memberName,int fundNo, int fpayDeliveryfee, int fpaySupport, 
			int fpayRewardTotal, int fpayFunding, int fpayFinalpay, int nameShow, int fundingShow, int payMethod, int couponNo, int memberNo) {
		int result = service.insertPay(memberId,memberName,fundNo,fpayDeliveryfee,fpaySupport,fpayRewardTotal,fpayFunding,fpayFinalpay,nameShow,fundingShow,payMethod,couponNo,memberNo);
		return new Gson().toJson(result);
		//return new Gson().toJson(String.valueOf(result));
	}

	//결제 확인 페이지 이동 - 무통장입금
	@RequestMapping(value="/payConfirm2.do")
	public String payConfirm2(int fpayNo, int fundNo, String memberId, Model model) {
		PayViewData pvd = service.payConfirm(fundNo,fpayNo,memberId);
		model.addAttribute("f",pvd.getF());
		model.addAttribute("list",pvd.getRewardList());
		model.addAttribute("fp",pvd.getFp());
		return "fund/payConfirm2";
	}
	@RequestMapping(value="/payConfirm.do")
	public String payConfirm(int fpayNo, int fundNo, String memberId, Model model) {
		PayViewData pvd = service.payConfirm(fundNo,fpayNo,memberId);
		model.addAttribute("f",pvd.getF());
		model.addAttribute("list",pvd.getRewardList());
		model.addAttribute("fp",pvd.getFp());
		return "fund/payConfirm";
	}
	
	/*결제 확인 페이지 이동 - 무통장입금
	@RequestMapping(value="/payConfirm2.do")
	public String payConfirm2(int fundNo, String memberId, int fpayFinalpay, Model model) {
		PayViewData pvd = service.payConfirm(fundNo,memberId,fpayFinalpay);
		model.addAttribute("f",pvd.getF());
		model.addAttribute("list",pvd.getRewardList());
		model.addAttribute("fp",pvd.getFp());
		return "fund/payConfirm2";
	}

	*/
	
	//결제 확인 페이지 이동 - 카드결제
	

	
	
	//쿠폰 리스트 ajax 버전
	@ResponseBody
	@RequestMapping(value="/selectCouponList.do",produces="application/json;charset=utf-8")
	public String CouponList(String fundCategory, int memberNo, int rewardSum, int maxFee) {
		ArrayList<Coupon> clist = service.selectCouponList(memberNo,fundCategory,rewardSum,maxFee);
		return new Gson().toJson(clist);
	}

	//리워드 카트 insert
	@ResponseBody
	@RequestMapping(value="/insertReward.do",produces="application/json;charset=utf-8")
	public String insertReward(String reward){
		JsonParser parser = new JsonParser();
		JsonArray jsonarray = parser.parse(reward).getAsJsonArray();
		ArrayList<RewardCart> cart = new ArrayList<RewardCart>();
		for(int i=0; i<jsonarray.size(); i++) {
			JsonObject object = jsonarray.get(i).getAsJsonObject();
			RewardCart r = new RewardCart();
			r.setMemberNo(object.get("memberNo").getAsInt());
			r.setFundNo(object.get("fundNo").getAsInt());
			r.setRewardNo(object.get("rewardNo").getAsInt());
			r.setAvailable(object.get("available").getAsInt());
			r.setSelected(object.get("selected").getAsInt());
			r.setRemain(object.get("remain").getAsInt());
			cart.add(r);
		}
		
		int result = service.insertReward(cart);	
		System.out.println(cart);
		return new Gson().toJson(reward);
	}
	

	
//-----------------------------------------------------------
	//펀딩 상세3 - 새소식 게시판 + 페이징처리
	@RequestMapping(value="/fundViewNotice.do")
	public String FundViewNotice(int fundNo, String memberId, int reqPage, String sellerId, String type, Model model) {
		FundNoticeViewData fnvd = service.selectFundNoticeView(fundNo,memberId,sellerId,reqPage,type);
		model.addAttribute("s",fnvd.getS());
		model.addAttribute("f",fnvd.getF());
		model.addAttribute("fl",fnvd.getFl());
		model.addAttribute("list",fnvd.getRewardList());
		model.addAttribute("p", fnvd.getP());
		model.addAttribute("plist",fnvd.getPayList());	
		//새소식
		model.addAttribute("fnList", fnvd.getFnList());
		model.addAttribute("pageNavi", fnvd.getPageNavi());
		model.addAttribute("reqPage", reqPage);
		model.addAttribute("type", type);
		return "fund/fundViewNotice";	
	}
	//새소식 작성 페이지 이동
	@RequestMapping(value="/fundNoticeFrm.do")
	public String insertNoticeFrm(int fundNo, String memberId, String sellerId, Model model) {
		FundViewData fvd = service.selectOneFundView(fundNo,memberId,sellerId);
		model.addAttribute("s",fvd.getS());
		model.addAttribute("f",fvd.getF());
		model.addAttribute("fl",fvd.getFl());
		model.addAttribute("list",fvd.getRewardList());
		model.addAttribute("p", fvd.getP());
		model.addAttribute("plist",fvd.getPayList());
		return "fund/fundNoticeFrm";
	}
	
	//새소식 등록
	@RequestMapping(value="/insertFundNotice.do")
	public String insertFundNotice(FundNotice fn, HttpServletRequest request, MultipartFile file) {
		if(!file.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/image/fund/notice/");
			String filename = file.getOriginalFilename();
			String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
			String extention = filename.substring(filename.lastIndexOf("."));
			String filepath = null;
			//파일명중복검사
			int count=0;
			while(true) {
				if(count == 0) {
					filepath = onlyFilename+extention;
				}else {
					filepath = onlyFilename+"_"+count+extention;
				}
				File checkFile = new File(savePath+filepath);
				if(!checkFile.exists()) {
					break;
				}
				count++;
			}
			//업로드
			try {
				FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			fn.setFnFilepath(filepath);
		}
		int result = service.insertFundNotice(fn);

		return "redirect:/fundViewNotice.do?fundNo="+fn.getFundNo()+"&memberId="+fn.getMemberId()+"&sellerId="+fn.getMemberId()+"&reqPage=1&type=all";
	
        //<a href="/fundView.do?fundNo=${f.fundNo }&memberId=${sessionScope.m.memberId }&sellerId=${f.memberId}"><span class="1">스토리</span></a>
	}
	
	//써머노트
	@ResponseBody
	@RequestMapping(value="/uploadImage2.do")
	public String uploadImage(HttpServletRequest request, MultipartFile file) {	
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image/fund/editor/");	
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
		String extention = filename.substring(filename.lastIndexOf("."));
		String filepath = null;
		//파일명중복검사
		int count=0;
		while(true) {
			if(count == 0) {
				filepath = onlyFilename+extention;
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		//파일업로드
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String realPath = "/resources/image/fund/editor/"+filepath;
		 return realPath;
	
	}	
	//새소식 상세보기
	@RequestMapping(value="/fundNoticeView.do")
	public String FundViewNotice(int fundNo, String memberId, String fnNo, String sellerId, Model model) {
		FundOneNoticeViewData fod = service.selectOneNotice(fundNo,memberId,fnNo,sellerId);
		model.addAttribute("s",fod.getS());
		model.addAttribute("f",fod.getF());
		model.addAttribute("fl",fod.getFl());
		model.addAttribute("list",fod.getRewardList());
		model.addAttribute("p", fod.getP());
		model.addAttribute("plist",fod.getPayList());	
		//새소식
		model.addAttribute("fn", fod.getFn());
		return "fund/fundNoticeView";	
	}
	//새소식 업데이트 페이지 이동
	@RequestMapping(value="/updateFundNoticeFrm.do")
	public String updateNoticeFrm(int fundNo, String memberId, String sellerId, String fnNo, Model model) {
		FundUpdateNoticeViewData fud = service.updateNoticeFrm(fundNo,memberId,fnNo,sellerId);
		model.addAttribute("s",fud.getS());
		model.addAttribute("f",fud.getF());
		model.addAttribute("fl",fud.getFl());
		model.addAttribute("list",fud.getRewardList());
		model.addAttribute("p", fud.getP());
		model.addAttribute("plist",fud.getPayList());	
		//새소식
		model.addAttribute("fn", fud.getFn());
		return "fund/fundNoticeUpdateFrm";
	}
	
	//새소식 업데이트 반영
	@RequestMapping(value="/updateFundNotice.do")
	public String updateFundNotice(FundNotice fn, HttpServletRequest request, MultipartFile file, String status, String oldFile) {
		//FundUpdateNoticeViewData fud = service.updateFundNotice(fundNo,memberId,fnNo);
		//기존
		if(status.equals("stay") && !oldFile.equals("none") ) {
			fn.setFnFilepath(oldFile);
		}else {
			if(!file.isEmpty()) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/image/fund/notice/");
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
				String extention = filename.substring(filename.lastIndexOf("."));
				String filepath = null;
				//파일명 중복 체크
				int count=0;
				while(true) {
					if(count == 0) {
						filepath = onlyFilename+extention;
					}else {
						filepath = onlyFilename+"_"+count+extention;
					}
					File checkFile = new File(savePath+filepath);
					if(!checkFile.exists()) {
						break;
					}
					count++;
				}
				//파일업로드
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				fn.setFnFilepath(filepath);
			}
		}
		int result = service.updateFundNotice(fn);
		return "redirect:/fundViewNotice.do?fundNo="+fn.getFundNo()+"&memberId="+fn.getMemberId()+"&sellerId="+fn.getMemberId()+"&reqPage=1&type=all";
	}
	
	//새소식 삭제
	@RequestMapping(value="/deleteFundNotice.do")
	public String deleteFundNotice(String fnNo, int fundNo, String memberId, String sellerId) {
		int result = service.deleteFundNotice(fnNo,fundNo,sellerId);
		return "redirect:/fundViewNotice.do?fundNo="+fundNo+"&memberId="+memberId+"&sellerId="+sellerId+"&reqPage=1&type=all";
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
	

	
}//class
	

