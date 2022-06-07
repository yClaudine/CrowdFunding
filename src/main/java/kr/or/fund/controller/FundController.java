package kr.or.fund.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.or.fund.model.service.FundService;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.Reward;
import kr.or.fund.model.vo.TmpFund;
import kr.or.fund.model.vo.TmpReward;

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
	
	//펀드 생성하기 페이지로
	@RequestMapping(value="/CreateFunding.do")
	public String CreateFunding() {
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
	
}
