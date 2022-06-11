package kr.or.manager.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.fund.model.vo.Fund;
import kr.or.manager.model.service.ManagerService;
import kr.or.manager.model.vo.FundPageData;
import kr.or.manager.model.vo.MemberPageData;
import kr.or.member.vo.Dm;
import kr.or.member.vo.Member;
import kr.or.member.vo.Seller;
import kr.or.store.model.service.StoreService;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.StoreAllPageData;
import kr.or.store.model.vo.StoreStar;

@Controller
public class ManagerController {
		
	@Autowired
	private ManagerService service;
	
	//스토어 만족도 삭제 위한 스토어서비스
	@Autowired
	private StoreService storeService;
	
	//판매자 승인페이지
	@RequestMapping(value="/sellerManage.do")
	public String sellerManage(String keyword, String type, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("type", type);
		//총 데이터 수 
		int totalCount = service.totalSellerCount(map);
		model.addAttribute("totalCount", totalCount);
		
		//셀러리스트 불러오기
		/*
		ArrayList<Seller> sellerList = service.selectSellerForManager(map);
		model.addAttribute("sellerList", sellerList);
		*/
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		return "manager/sellerManage";
	}
	
	
	//판매자 허가 변경
	@RequestMapping(value="/authSellerChange.do")
	public String authSellerChange(String keyword, String type, String memberId, int sellerNo, String msg, int authSeller, int categoryNo, Model model ) {
		//멤버테이블 권한변경
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("categoryNo", categoryNo);
		int result1 = service.changeMemberAuth(map);
		
		//셀러테이블 승인상태, 메세지 변경
		Seller seller = new Seller();
		seller.setSellerNo(sellerNo);
		seller.setAuthSeller(authSeller);
		seller.setAuthMessage(msg);
		int result2 = service.changeSellerAuth(seller);
		
		if(result1>0 && result2>0) {
		
			model.addAttribute("title", "SUCCESS" );
			model.addAttribute("text", "변경 되었습니다.");
			model.addAttribute("icon", "info");
		}else {
			model.addAttribute("title", "FAIL" );
			model.addAttribute("text", "변경에 실패하였습니다.");
			model.addAttribute("icon", "info");
			
		}
		model.addAttribute("loc", "/sellerManage.do?keyword="+keyword+"&type="+type);
		return "manager/msg";
		
		
		//return "redirect:/sellerManage.do?keyword="+keyword+"&type="+type ;
	}
	
	//사업자등록증 다운로드
	@RequestMapping(value="/photoFileDown.do")
	public void photoFileDown(String enPath, HttpServletRequest request, HttpServletResponse response) {
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image/member/");
		String downLoadFile = savePath+enPath;
		
		try {
			FileInputStream fis = new FileInputStream(downLoadFile);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream sos = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			String resFilename = new String(enPath.getBytes("utf-8"),"ISO-8859-1");
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename="+resFilename);
			while(true) {
				int read = bis.read();
				if(read != -1) {
					bos.write(read);
				}else {
					break;
				}
			}
			bos.close();
			bis.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//moreSeller ajax
	@ResponseBody
	@RequestMapping(value="/moreSeller.do", produces="application/json;charset=utf-8")
	public String moreSeller(int type, String keyword, int amount, int start) {
		int end = start+amount-1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		
		ArrayList<Seller> sellerList = service.moreSeller(map);
		return new Gson().toJson(sellerList);
	}
	
	//회원 관리 페이지
	@RequestMapping(value="/memberManage.do")
	public String memberManager(int reqPage, String type, String keyword, Model model) {
		//회원조회
		MemberPageData mpd = service.selectAllMember(reqPage, type, keyword);
		ArrayList<Member> mList = mpd.getList();
		
		model.addAttribute("list", mpd.getList());
		model.addAttribute("pageNavi", mpd.getPageNavi());
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("reqPage", reqPage);
		
		return "manager/memberManage";
	}
	
	//회원 상세보기
	@ResponseBody
	@RequestMapping(value="/memberDetail.do",produces="application/json;charset=utf-8")
	public String memberDetail(int memberNo) {
		Member m = service.selectOneMember(memberNo);
		return new Gson().toJson(m);
	}
	//회원 권한 변경
	@RequestMapping(value="/memberAuthChange.do")
	public String memberAuthChange(int reqPage, String type, String keyword, String memberId, int auth, Model model) {
		int result = service.updateMemberAuth(memberId, auth);
		if(result>0) {
			model.addAttribute("title", "SUCCESS" );
			model.addAttribute("text", "변경 되었습니다.");
			model.addAttribute("icon", "info");
		}else {
			model.addAttribute("title", "FAIL" );
			model.addAttribute("text", "변경을 실패하였습니다.");
			model.addAttribute("icon", "info");
		}
		model.addAttribute("loc", "/memberManage.do?keyword="+keyword+"&type="+type+"&reqPage="+reqPage);
		return "manager/msg";
	}
	
	//회원 신고 관리페이지
	@RequestMapping(value="/memberReportDetail.do")
	public String memberReportDetail(String memberId, Model model) {
		ArrayList<StoreStar> list = service.selectOneStar(memberId);
		model.addAttribute("starList", list);
		model.addAttribute("memberId", memberId);
		return "manager/memberReport";
	}
	
	//회원 리뷰신고 해제
	@RequestMapping(value="/cancelReviewReport.do")
	public String cancelReviewReport(String memberId) {
		int result = service.cancelReviewReport(memberId);
		return "redirect:/memberReportDetail.do?memberId="+memberId;
	}
	//회원 리뷰 삭제
	@RequestMapping(value="/deleteReview.do")
	public String deleteReview(int starNo, String memberId) {
		int result = storeService.storeCommentDelete(starNo);
		return "redirect:/memberReportDetail.do?memberId="+memberId;
	}
	
	
	//펀드 관리
	@RequestMapping(value="/fundManage.do")
	public String fundManage(int reqPage, String type, String keyword, Model model) {
		//펀드조회
		FundPageData fpd = service.selectAllFund(reqPage, type, keyword);
		model.addAttribute("list", fpd.getList());
		model.addAttribute("pageNavi", fpd.getPageNavi());
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("reqPage", reqPage);
		return "manager/fundManage";
	}
	//펀드 상세보기
	@ResponseBody
	@RequestMapping(value="/fundDetail.do",produces="application/json;charset=utf-8")
	public String fundDetail(int fundNo) {
		Fund f = service.selectOneFund(fundNo);
		return new Gson().toJson(f);
	}

	//펀드 신고 관리페이지
	@RequestMapping(value="/fundReportDetail.do")
	public String fundReportDetail(int fundNo, String memberId, Model model) {
		Fund f = service.selectOneFund(fundNo);
		model.addAttribute("f", f);
		model.addAttribute("fundNo", fundNo);
		model.addAttribute("memberId", memberId);
		return "manager/fundReport";
	}
	//펀드 신고해제
	@RequestMapping(value="/cancelFundReport.do")
	public String cancelFundReport(int fundNo, Model model) {
		int result = service.cancelFundReport(fundNo);
		if(result>0) {
			model.addAttribute("title", "SUCCESS" );
			model.addAttribute("text", "해제 되었습니다.");
			model.addAttribute("icon", "info");
		}else {
			model.addAttribute("title", "FAIL" );
			model.addAttribute("text", "해제 실패하였습니다.");
			model.addAttribute("icon", "info");
		}
		model.addAttribute("loc", "/fundManage.do?reqPage=1&keyword=&type=all");
		return "manager/msg";
	}
	
	/*펀드 삭제
	@RequestMapping(value="/deleteFund.do")
	public String deleteFund(int fundNo, Model model) {
		int result = service.deleteFund(fundNo);
		if(result>0) {
			model.addAttribute("title", "SUCCESS" );
			model.addAttribute("text", "삭제 되었습니다.");
			model.addAttribute("icon", "info");
		}else {
			model.addAttribute("title", "FAIL" );
			model.addAttribute("text", "삭제 실패하였습니다.");
			model.addAttribute("icon", "info");
		}
		model.addAttribute("loc", "/fundManage.do?reqPage=1&keyword=&type=all");
		return "manager/msg";
	}
	*/
	//스토어 관리
	@RequestMapping(value="/storeManage.do")
	public String storeManage(int reqPage, String type, String keyword, Model model) {
		StoreAllPageData spd = service.selectAllStore(reqPage, type, keyword);
		model.addAttribute("list", spd.getList());
		model.addAttribute("pageNavi", spd.getPageNavi());
		model.addAttribute("type", type);
		model.addAttribute("keyword", keyword);
		model.addAttribute("reqPage", reqPage);
		return "manager/storeManage";
	}
	//스토어 상세보기
	@ResponseBody
	@RequestMapping(value="/storeDetail.do", produces="application/json;charset=utf-8")
	public String storeDetail(int storeNo) {
		Store s = service.selectOneStore(storeNo);
		return new Gson().toJson(s);
	}
	//스토어 신고 관리페이지
	@RequestMapping(value="/storeReportDetail.do")
	public String storeReportDetail(int storeNo, String memberId, Model model) {
		Store s = service.selectOneStore(storeNo);
		model.addAttribute("s", s);
		model.addAttribute("storeNo", storeNo);
		model.addAttribute("memberId", memberId);
		return "manager/storeReport";
	}
	/*스토어 삭제
	@RequestMapping(value="/deleteStore.do")
	public String deleteStore(int storeNo, Model model) {
		int result = service.deleteStore(storeNo);
		if(result>0) {
			model.addAttribute("title", "SUCCESS" );
			model.addAttribute("text", "삭제 되었습니다.");
			model.addAttribute("icon", "info");
		}else {
			model.addAttribute("title", "FAIL" );
			model.addAttribute("text", "삭제 실패하였습니다.");
			model.addAttribute("icon", "info");
		}
		model.addAttribute("loc", "/storeManage.do?reqPage=1&keyword=&type=all");
		return "manager/msg";
	}
	*/
	//스토어 신고해제
	@RequestMapping(value="/cancelStoreReport.do")
	public String cancelStoreReport(int storeNo, Model model) {
		int result = service.cancelStoreReport(storeNo);
		if(result>0) {
			model.addAttribute("title", "SUCCESS" );
			model.addAttribute("text", "해제 되었습니다.");
			model.addAttribute("icon", "info");
		}else {
			model.addAttribute("title", "FAIL" );
			model.addAttribute("text", "해제 실패하였습니다.");
			model.addAttribute("icon", "info");
		}
		model.addAttribute("loc", "/storeManage.do?reqPage=1&keyword=&type=all");
		return "manager/msg";
	}
	
	//경고 보낸메세지 불러오기(ajax)
	@RequestMapping(value="/getReportList.do",produces ="application/json;charset=utf-8")
	@ResponseBody
	public String getReportList(String memberId, int category, int categoryNo) {
		
		ArrayList<Dm> list = service.selectReportList(memberId,category,categoryNo);
		
		return new Gson().toJson(list);
	}
	
	
}








