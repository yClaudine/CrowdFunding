package kr.or.fund.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.fund.model.service.FundTmpService;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.TmpFund;
import kr.or.fund.model.vo.TmpFundCalculate;
import kr.or.fund.model.vo.TmpReward;
import sun.security.tools.PathList;

@Controller
public class FundTmpController {
	@Autowired
	private FundTmpService service;
	
	//페이지 이동 반복패턴 메서드
	public void pageMove(int tfNo, Model model) {
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		TmpFund tmpF = service.selectOneTmpFund(tf);
		model.addAttribute("tmpF",tmpF);
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
	
	
	//펀드 생성
	@RequestMapping(value="/fundCreate.do")
	public String fundCreate(TmpFund f, Model model) {
		int tfNo = service.createTmpFund(f);
		model.addAttribute("tfNo",tfNo);
		return "redirect:/fundReadyFrm.do";
	}
	
	//펀드 준비 통합 페이지
	@RequestMapping(value="/fundReadyFrm.do")
	public String fundReadyFrm(int tfNo, Model model) {
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		TmpFund tmpF = service.selectOneTmpFund(tf);
		ArrayList<TmpReward> tRList = service.selectReward(tf);
		TmpFundCalculate tfc = service.selectOneFundCalculate(tf);
		model.addAttribute("tmpF",tmpF);
		model.addAttribute("tRList",tRList);
		model.addAttribute("tfc",tfc);
		/*
		if(tRList.size() != 0) {
			model.addAttribute("tRList",tRList);
		}
		if(tfc != null) {
			model.addAttribute("tfc",tfc);
		}
		*/
		return "fund/fundReadyFrm";
	}
	
	//FUND 신청하기 메서드 추후 작성
	@RequestMapping(value="/CreateFund.do")
	public String CreateFund(int tfNo) {
		return "redirect:/";
	}
	
	//요금제 선택 페이지로
	@RequestMapping(value="/fundFeeSelectFrm.do")
	public String fundFeeSelectFrm(int tfNo, Model model){
		pageMove(tfNo, model);
		return "fund/fundFeeSelect";
	}
	
	//요금제 선택 페이지 -> 저장하기 버튼
	@RequestMapping(value="/SaveTmpFees.do")
	public String SaveTmpFees(int tfNo, int tfFees, Model model) {
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		tf.setTfFees(tfFees);
		int result = service.updateTmpFees(tf);
		return "redirect:/fundReadyFrm.do?tfNo="+tfNo;
	}
	
	//기본 정보 수정 페이지로
	@RequestMapping(value="/fundInfoUpdateFrm.do")
	public String fundInfoUpdateFrm(int tfNo, Model model){
		pageMove(tfNo, model);
		return "fund/fundInfoUpdateFrm";
	}
	
	//요금 상세 설명 페이지로
	@RequestMapping(value="/TmpDetail.do")
	public String TmpDetail(int tfNo, int value, Model model) {
		pageMove(tfNo, model);
		model.addAttribute("value",value);
		return "fund/fundFeeDetail";
	}
	
	//기본 정보 업데이트
	@RequestMapping(value="/SaveTmpBasic.do")
	public String SaveTmpBasic(TmpFund tf, Model model) {
		int result = service.updateTmpBasic(tf);
		return "redirect:/fundReadyFrm.do?tfNo="+tf.getTfNo();
	}
	
	//스토리 작성 페이지로
	@RequestMapping(value="/fundStoryUpdateFrm.do")
	public String fundStoryUpdateFrm(int tfNo, Model model) {
		pageMove(tfNo, model);
		return "fund/fundStoryUpdateFrm";
	}
	
	//스토리 작성 업데이트
	@RequestMapping(value="/SaveTmpStory.do")
	public String SaveTmpStory(MultipartFile[] upfile, HttpServletRequest request, String[] status, int tfNo, String tfIntro){
		//기존 파일 제거 할 경우를 위해 tmpF 조회함
		TmpFund tmpF = new TmpFund();
		tmpF.setTfNo(tfNo);
		TmpFund tf = service.selectOneTmpFund(tmpF);
		//filepath를 저장할 list 생성
		ArrayList<String> pathList = new ArrayList<String>();
		//1. 파일업로드 경로 설정
		//request.getSession().getServletContext().getRealPath() -> /webapp/폴더 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image/fund/upload/");
		//1-1. 기존에 업로드 한 파일 바뀌거나 지울 시 제거하는 작업
		if(status[0].equals("remove")) {
			File file = new File(savePath+tf.getTfFilepath1());
			tf.setTfFilepath1("");
			file.delete();
		}
		if(status[1].equals("remove")) {
			File file = new File(savePath+tf.getTfFilepath2());
			tf.setTfFilepath2("");
			file.delete();
		}
		if(status[2].equals("remove")) {
			File file = new File(savePath+tf.getTfFilepath3());
			tf.setTfFilepath3("");
			file.delete();
		}
		if(status[3].equals("remove")) {
			File file = new File(savePath+tf.getTfFilepath4());
			tf.setTfFilepath4("");
			file.delete();
		}
		if(status[4].equals("remove")) {
			File file = new File(savePath+tf.getTfFilepath5());
			tf.setTfFilepath5("");
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
			tf.setTfFilepath1(pathList.get(0));
		}else if(!(status[0].equals("upload"))){
			tf.setTfFilepath1(null);
		}
		if(!(pathList.get(1).equals(""))) {
			tf.setTfFilepath2(pathList.get(1));
		}else if(!(status[1].equals("upload"))){
			tf.setTfFilepath2(null);
		}
		if(!(pathList.get(2).equals(""))) {
			tf.setTfFilepath3(pathList.get(2));
		}else if(!(status[2].equals("upload"))){
			tf.setTfFilepath3(null);
		}
		if(!(pathList.get(3).equals(""))) {
			tf.setTfFilepath4(pathList.get(3));
		}else if(!(status[3].equals("upload"))){
			tf.setTfFilepath4(null);
		}
		if(!(pathList.get(4).equals(""))) {
			tf.setTfFilepath5(pathList.get(4));
		}else if(!(status[4].equals("upload"))){
			tf.setTfFilepath5(null);
		}
		
		tfIntro = tfIntro.replace("\r\n","<br>");
		tf.setTfIntro(tfIntro);
		int result = service.updateTmpStory(tf);
		return "redirect:/fundReadyFrm.do?tfNo="+tf.getTfNo();
	}
	
	//리워드 설계 페이지로 가는 메소드
	@RequestMapping(value="/fundRewardCreateFrm.do")
	public String fundRewardCreateFrm(int tfNo, Model model) {
		pageMove(tfNo, model);
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		ArrayList<TmpReward> trl = service.selectReward(tf);
		model.addAttribute("tmpRewardList",trl);
		return "fund/fundRewardCreateFrm";
	}
	
	//리워드 설계 저장하기 버튼 눌렀을 시 작동하는 메소드
	@ResponseBody
	@RequestMapping(value="/SaveTmpReward.do", produces="application/json;charset=utf-8")
	public int SaveTmpReward(String data) {
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
			TmpReward tr = new TmpReward();
			int rewardNo = Integer.parseInt(reward.get("rewardNo").toString().replaceAll("\"", ""));
			tr.setTrNo(rewardNo);
			int tfNo = Integer.parseInt(reward.get("tfNo").toString().replaceAll("\"", ""));
			tr.setTfNo(tfNo);
			tr.setTrName(reward.get("rewardName").toString().replaceAll("\"", ""));
			tr.setTrIntro(reward.get("rewardIntro").toString().replaceAll("\"", ""));
			int price = Integer.parseInt(reward.get("rewardPrice").toString().replaceAll("\"", ""));
			tr.setTrPrice(price);
			int count = Integer.parseInt(reward.get("rewardCount").toString().replaceAll("\"", ""));
			tr.setTrCount(count);
			String option = reward.get("rewardOption").toString().replaceAll("\"", "");
			//option = option.replace("\r\n","<br>"); 줄바꿈 치환용인데 안바뀜
			tr.setTrOption(option);
			tr.setTrSend(reward.get("rewardSend").toString().replaceAll("\"", ""));
			int deliveryfee = Integer.parseInt(reward.get("rewardDeliveryFee").toString().replaceAll("\"", "")); 
			tr.setTrDeliveryfee(deliveryfee);
			//System.out.println(tr); 값들 잘 들어갔는지 확인용
			
			//각 status별로 명령 수행
			switch(status) {
			case "new":
				int createResult = service.createTmpReward(tr);
				result *= createResult;
				break;
			case "upload":
				//upload는 변경 사항이 없기 때문에 바꿀 필요 없음
				break;
			case "update":
				int updateResult = service.updateTmpReward(tr);
				result *= updateResult;
				break;
			case "delete":
				int deleteResult = service.deleteTmpReward(tr);
				result *= deleteResult;
				break;
			default:
				break;
			}//switch
		}//for
		
		return result;
	}
	
	//위험요인 및 정책 페이지로
	@RequestMapping(value="/fundPolicyCreateFrm.do")
	public String fundPolicyCreateFrm(int tfNo, Model model) {
		pageMove(tfNo, model);
		return "fund/fundPolicyCreateFrm";
	}
	
	//위험요인 및 정책 페이지 저장하기 버튼
	@RequestMapping(value="/SaveTmpPolicy.do")
	public String SaveTmpPolicy(TmpFund tf, Model model){
		int result = service.updateTmpPolicy(tf);
		return "redirect:/fundReadyFrm.do?tfNo="+tf.getTfNo();
	}
	
	//대표자 및 정산정보 페이지로
	@RequestMapping(value="/fundCalculateFrm.do")
	public String fundCalculateFrm(int tfNo, Model model) {
		pageMove(tfNo, model);
		TmpFund tf = new TmpFund();
		tf.setTfNo(tfNo);
		TmpFundCalculate tfc = service.selectOneFundCalculate(tf);
		model.addAttribute("tfc",tfc);
		return "fund/fundCalculateFrm";
	}
	
	//정산정보 저장하기 버튼
	@RequestMapping(value="/saveTmpCalculate.do")
	public String saveTmpCalculate(MultipartFile[] upfile, HttpServletRequest request, TmpFundCalculate tfc, String status, String[] imageStatus, Model model) {
		//신규가 아닐 때 기존에 입력되어 있던 tfc 정보를 불러올 객체
		TmpFundCalculate atfc = null;
		//filepath를 저장할 Arr 생성
		String pathArr[] = {"",""};
		//수정일 경우 지울 파일의 경로를 저장할 arr
		String deleteArr[] = {"",""};
		if(status.equals("modify")) {
			TmpFund tf = new TmpFund();
			tf.setTfNo(tfc.getTfNo());
			atfc = service.selectOneFundCalculate(tf);
			deleteArr[0] = atfc.getTfcRepFilepath();
			deleteArr[1] = atfc.getTfcBankFilepath();
		}
		
		//이미지 파일에 변동 있었을때 업로드 로직
		//1. 파일업로드 경로 설정
		//request.getSession().getServletContext().getRealPath() -> /webapp/폴더 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image/fund/calculate/");
		//1-1. 업로드 파일 상태에 따라 업로드만 할지, 기존 파일 삭제 후 업로드 할지 결정
		for(int i=0; i<2; i++) {
			if(imageStatus[i].equals("new")) {
				pathArr[i] = fileUpload(upfile[i], savePath);
			}else if(imageStatus[i].equals("modify")) {
				File file = new File(savePath+deleteArr[i]);
				file.delete();
				pathArr[i] = fileUpload(upfile[i], savePath);
			}else {
				pathArr[i] = deleteArr[i];
			}
			//1-2. 앞으로 조작할 tfc 객체에 filepath경로 세팅
			tfc.setTfcRepFilepath(pathArr[0]);
			tfc.setTfcBankFilepath(pathArr[1]);
		}
		
		//status에 따라 비즈니스 로직 처리
		int result = 1;
		if(status.equals("new")) {
			int insertResult = service.createTmpFundCalculate(tfc);
			result *= insertResult;
		}else if(status.equals("modify")) {
			int updateResult = service.updateTmpFundCalculate(tfc);
			result *= updateResult;
		}

		return "redirect:/fundReadyFrm.do?tfNo="+tfc.getTfNo();
	}

}
