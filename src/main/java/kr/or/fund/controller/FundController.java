package kr.or.fund.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.fund.model.service.FundService;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundCalculate;
import kr.or.fund.model.vo.FundPay;
import kr.or.fund.model.vo.PayBoardPageData;
import kr.or.fund.model.vo.Reward;
import kr.or.fund.model.vo.TmpFund;
import kr.or.fund.model.vo.TmpFundCalculate;
import kr.or.fund.model.vo.TmpReward;
import kr.or.member.vo.Member;

@Controller
public class FundController {
	@Autowired
	private FundService service;
	
	//페이지 이동 반복패턴 메서드
	public Fund pageMove(Fund f, Model model) {
		Fund fund = service.selectOneFund(f);
		model.addAttribute("fund",fund);
		return fund;
	}
	
	//파일 업로드 메서드 (file객체 + savePath 넣으면 filepath 리턴) 
	public String fileUpload(MultipartFile file, String savePath) {
		//파일명이 기존 파일과 겹치는 경우 기존파일을 삭제하고 ㅅ ㅐ파일만 남는 현상이 생김(덮어쓰기)
		//파일명 중복처리
		String filename = file.getOriginalFilename();
		//test.txt -> test_1.txt
		//test.txt -> test_2.txt
		//업로드한 파일명이 test.txt인 경우 -> text			.txt 두 부분으로 분리
		String onlyFilename = filename.substring(0,filename.lastIndexOf("."));	//test
		String extention = filename.substring(filename.lastIndexOf("."));		//.txt
		//실제 업로드할 파일명을 저장할 변수
		String filepath = null;
		//파일명 중복 시 뒤에 붙일 숫자 변수
		int count = 0;
		while(true) {
			if(count == 0) {
				//반복 첫번째 회차에는 원본파일명을 그대로 적용
				filepath = onlyFilename+extention;	//test.txt
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
			}
			count++;
		}
		//파일명 중복검사가 끝난 시점 -> 해당파일 업로드 작업
		try {
			//중복처리가 끝난 파일명 (filepath)으로 파일을 업로드할 FileOutputStream객체 생성
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
			//업로드 속도 증가를 위한 보조스트림 생성
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			//파일업로드
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
		return filepath;
	}
	
	//DB 연동 테스트한 메소드
	@RequestMapping(value="/test.do")
	public String test(){
		ArrayList<Fund> list = service.selectAllFund();
		System.out.println(list);
		return "test";
	}
	
	//로그인시 상품등록 버튼 클릭 -> 등록할 상품 종류 선택 페이지로
	@RequestMapping(value="/createProduct.do")
	public String createProduct(){
		return "common/createProduct";
	}
	
	//펀드 생성하기 페이지로
	@RequestMapping(value="/createFunding.do")
	public String createFunding(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("m");
		if(m != null) {
			ArrayList<Fund> fl = service.selectMemberFund(m);
			ArrayList<TmpFund> tfl = service.selectMemberTmpFund(m);
			model.addAttribute("fl",fl);
			model.addAttribute("tfl",tfl);
		}
		return "fund/createFunding";
	}
	
	//펀드 관리하기 페이지로
	@RequestMapping(value="/manageFundingFrm.do")
	public String manageFundingFrm(Fund f, Model model) {
		Fund fund = pageMove(f, model);
		return "fund/manageFundingFrm";
	}
	
	//스토리 수정 페이지로
	@RequestMapping(value="/fundStoryManageFrm.do")
	public String fundStoryManageFrm(Fund f, Model model){
		Fund fund = pageMove(f, model);
		return "fund/fundStoryManageFrm";
	}
	
	//스토리 수정하기
	@RequestMapping(value="/updateFundStory.do")
	public String updateFundStory(MultipartFile[] upfile, HttpServletRequest request, String[] status, Fund f){
		//기존 파일 제거 할 경우를 위해 Fund 조회함
		Fund fund = service.selectOneFund(f);
		//filepath를 저장할 list 생성
		ArrayList<String> pathList = new ArrayList<String>();
		//1. 파일업로드 경로 설정
		//request.getSession().getServletContext().getRealPath() -> /webapp/폴더 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image/fund/upload/");
		//1-1. 기존에 업로드 한 파일 바뀌거나 지울 시 제거하는 작업
		if(status[0].equals("remove")) {
			File file = new File(savePath+fund.getFundFilepath1());
			fund.setFundFilepath1("");
			file.delete();
		}
		if(status[1].equals("remove")) {
			File file = new File(savePath+fund.getFundFilepath2());
			fund.setFundFilepath2("");
			file.delete();
		}
		if(status[2].equals("remove")) {
			File file = new File(savePath+fund.getFundFilepath3());
			fund.setFundFilepath3("");
			file.delete();
		}
		if(status[3].equals("remove")) {
			File file = new File(savePath+fund.getFundFilepath4());
			fund.setFundFilepath4("");
			file.delete();
		}
		if(status[4].equals("remove")) {
			File file = new File(savePath+fund.getFundFilepath5());
			fund.setFundFilepath5("");
			file.delete();
		}
		//2. 반복문을 이용한 파일업로드 처리
		for(MultipartFile file : upfile) {
			//input이 5개라 빈 input 이면 작동하지 않도록
			if(file.isEmpty()){
				pathList.add("");
			}else {
				pathList.add(fileUpload(file, savePath));
			}
		}
		//update할 filepath 값으로 수정
		if(!(pathList.get(0).equals(""))) {
			fund.setFundFilepath1(pathList.get(0));
		}else if(!(status[0].equals("upload"))){
			fund.setFundFilepath1(null);
		}
		if(!(pathList.get(1).equals(""))) {
			fund.setFundFilepath2(pathList.get(1));
		}else if(!(status[1].equals("upload"))){
			fund.setFundFilepath2(null);
		}
		if(!(pathList.get(2).equals(""))) {
			fund.setFundFilepath3(pathList.get(2));
		}else if(!(status[2].equals("upload"))){
			fund.setFundFilepath3(null);
		}
		if(!(pathList.get(3).equals(""))) {
			fund.setFundFilepath4(pathList.get(3));
		}else if(!(status[3].equals("upload"))){
			fund.setFundFilepath4(null);
		}
		if(!(pathList.get(4).equals(""))) {
			fund.setFundFilepath5(pathList.get(4));
		}else if(!(status[4].equals("upload"))){
			fund.setFundFilepath5(null);
		}
		//펀드 요약 줄바꿈 <br>로 대체
		String fundIntro = f.getFundIntro().replace("\r\n","<br>");
		fund.setFundIntro(fundIntro);
		int result = service.updateFundStory(fund);
		return "redirect:/manageFundingFrm.do?fundNo="+f.getFundNo();
	}
	
	//리워드 추가 페이지로
	@RequestMapping(value="/fundRewardManageFrm.do")
	public String fundRewardManageFrm(Fund f, Model model) {
		pageMove(f, model);
		ArrayList<Reward> tr = service.selectReward(f);
		model.addAttribute("fundReward",tr);
		return "fund/fundRewardManageFrm";
	}
	
	//리워드 추가 저장하기
	@ResponseBody
	@RequestMapping(value="/saveReward.do", produces="application/json;charset=utf-8")
	public int saveReward(String data) {
		//받아온 String을 jsonObject화
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObj = (JsonObject)jsonParser.parse(data);
		
		//DB 처리가 잘 되었는지 반환 할 변수
		int result = 1;
		
		//각 jsonObject별로 명령을 수행한다.
		for(int i=0;i<jsonObj.size();i++) {
			//각 reward가 어떤 상태인지 status 부터 추출
			String cnt = ""+i;
			JsonObject reward = (JsonObject)jsonObj.get(cnt);
			String status = reward.get("rewardStatus").toString().replaceAll("\"", "");
			
			//reward 값을 reward VO에 넣음
			Reward r = new Reward();
			int rewardNo = Integer.parseInt(reward.get("rewardNo").toString().replaceAll("\"", ""));
			r.setRewardNo(rewardNo);
			int tfNo = Integer.parseInt(reward.get("tfNo").toString().replaceAll("\"", ""));
			r.setFundNo(tfNo);
			r.setRewardName(reward.get("rewardName").toString().replaceAll("\"", ""));
			r.setRewardIntro(reward.get("rewardIntro").toString().replaceAll("\"", ""));
			int price = Integer.parseInt(reward.get("rewardPrice").toString().replaceAll("\"", ""));
			r.setRewardPrice(price);
			int count = Integer.parseInt(reward.get("rewardCount").toString().replaceAll("\"", ""));
			r.setRewardCount(count);
			String option = reward.get("rewardOption").toString().replaceAll("\"", "");
			//option = option.replace("\r\n","<br>"); 줄바꿈 치환용인데 안바뀜
			r.setRewardOption(option);
			r.setRewardSend(reward.get("rewardSend").toString().replaceAll("\"", ""));
			int deliveryfee = Integer.parseInt(reward.get("rewardDeliveryFee").toString().replaceAll("\"", "")); 
			r.setRewardDeliveryfee(deliveryfee);
			//System.out.println(tr); 값들 잘 들어갔는지 확인용
			
			//각 status별로 명령 수행
			switch(status) {
			case "new":
				int createResult = service.createReward(r);
				result *= createResult;
				break;
			case "upload":
				//upload는 변경 사항이 없기 때문에 바꿀 필요 없음
				break;
			case "update":
				int updateResult = service.updateReward(r);
				result *= updateResult;
				break;
			case "delete":
				int deleteResult = service.deleteReward(r);
				result *= deleteResult;
				break;
			default:
				break;
			}//switch
		}//for
		
		return result;
	}
	
	//정산 수정 페이지로
	@RequestMapping(value="/fundCalculateManageFrm.do")
	public String fundCalculateManageFrm(Fund f, Model model) {
		pageMove(f, model);
		FundCalculate fc = service.selectFundCalculate(f);
		model.addAttribute("fc",fc);
		return "fund/fundCalculateManageFrm";
	}
	
	//정산정보 저장하기 버튼
		@RequestMapping(value="/saveCalculate.do")
		public String saveCalculate(MultipartFile upfile, HttpServletRequest request, FundCalculate fc, String status, String imageStatus, Model model) {
			//신규가 아닐 때 기존에 입력되어 있던 tfc 정보를 불러올 객체
			FundCalculate afc = null;
			//filepath를 저장할 Arr 생성
			String path = "";
			//수정일 경우 지울 파일의 경로를 저장할 arr
			String delete = "";
			if(status.equals("modify")) {
				Fund f = new Fund();
				f.setFundNo(fc.getFundNo());
				afc = service.selectFundCalculate(f);
				delete = afc.getFcBankFilepath();
			}
			
			//이미지 파일에 변동 있었을때 업로드 로직
			//1. 파일업로드 경로 설정
			//request.getSession().getServletContext().getRealPath() -> /webapp/폴더 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/image/fund/calculate/");
			//1-1. 업로드 파일 상태에 따라 업로드만 할지, 기존 파일 삭제 후 업로드 할지 결정
			if(imageStatus.equals("new")) {
				path = fileUpload(upfile, savePath);
			}else if(imageStatus.equals("modify")) {
				File file = new File(savePath+delete);
				file.delete();
				path = fileUpload(upfile, savePath);
			}else {
				path = delete;
			}
			//1-2. 앞으로 조작할 tfc 객체에 filepath경로 세팅
			fc.setFcBankFilepath(path);
			
			//status에 따라 비즈니스 로직 처리
			int result = 1;
			if(status.equals("new")) {
				//펀딩 관리에서는 new 일 경우가 없긴 함
				int insertResult = service.createFundCalculate(fc);
				result *= insertResult;
			}else if(status.equals("modify")) {
				int updateResult = service.updateFundCalculate(fc);
				result *= updateResult;
			}
			
			return "redirect:/manageFundingFrm.do?fundNo="+fc.getFundNo();
		}
		
		//펀드 현황 페이지로
		@RequestMapping(value="/fundStatusManageFrm.do")
		public String fundStatusManageFrm(Fund f, Model model, int reqPage){
			pageMove(f, model);
			PayBoardPageData pbpd = service.selectPayBoardList(reqPage,f);
			//ArrayList<FundPay> fpl = service.selectFundPay(f);
			int totalPay = service.selectTotalFund(f);
			model.addAttribute("fpl",pbpd.getList());
			model.addAttribute("pageNavi",pbpd.getPageNavi());
			model.addAttribute("totalPay",totalPay);
			return "fund/fundStatusManageFrm";
		}
	
}
