package kr.or.store.controller;


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


import kr.or.store.model.service.StoreTmpService;
import kr.or.store.model.vo.TmpStore;

@Controller
public class StoreTmpController {
	@Autowired
	private StoreTmpService service;
	
	//페이지 이동 반복 패턴 메서드
	public void pageMove(int stNo, Model model) {
		TmpStore ts = new TmpStore();
		ts.setStNo(stNo);
		TmpStore tmp = service.selectOneTmpStore(ts);
		model.addAttribute("tmp",tmp);
	}
	
	//스토어 페이지 이동
	@RequestMapping(value="/storeStart.do")
	public String storeStart() {
		return"store/storeCreate";
	}
	
	//스토어 생성
	@RequestMapping(value="/storeCreate.do")
	public String storeCreate(TmpStore t, Model model) {
		int stNo = service.createTmpStore(t);
		model.addAttribute("stNo", stNo);
		return "store/storeCreate2";
	}
	
	/*
	@RequestMapping(value="/storeCreat2.do")
	public String storeCreate2(int stNo, Model model) {
		pageMove(stNo, model);
		return "store/storeCreate2";
	}
	*/
	
	//스토어 등록 홈페이지 시작	
	@RequestMapping(value="/storeReadyFrm.do")
	public String storeReadyFrm(int stNo, Model model) {
		TmpStore ts = new TmpStore();
		ts.setStNo(stNo);
		TmpStore tmp = service.selectOneTmpStore(ts);
		model.addAttribute("tmp", tmp);
		return "store/storeReadyFrm";
	}
	
	//스토어 기본 정보 등록
	@RequestMapping(value="/storeCreate3.do")
	public String storeCreate3(int stNo, Model model) {
		pageMove(stNo, model);
		return "store/storeCreate3";
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
	
	@RequestMapping(value="/updateStore3.do")
	public String SaveTmpStory(MultipartFile[] upfile, HttpServletRequest request, String[] status, int stNo, String stTitle, String stCategory){
		//기존 파일 제거 할 경우를 위해 tmpF 조회함
		TmpStore tmp = new TmpStore();
		tmp.setStNo(stNo);
		TmpStore ts = service.selectOneTmpStore(tmp);
		//filepath를 저장할 list 생성
		ArrayList<String> pathList = new ArrayList<String>();
		//1. 파일업로드 경로 설정
		//request.getSession().getServletContext().getRealPath() -> /webapp/폴더 경로
		String savePath = request.getSession().getServletContext().getRealPath("/resources/image/store/upload/");
		//1-1. 기존에 업로드 한 파일 바뀌거나 지울 시 제거하는 작업
		if(status[0].equals("remove")) {
			File file = new File(savePath+ts.getStImg1());
			ts.setStImg1("");
			file.delete();
		}
		if(status[1].equals("remove")) {
			File file = new File(savePath+ts.getStImg2());
			ts.setStImg2("");
			file.delete();
		}
		if(status[2].equals("remove")) {
			File file = new File(savePath+ts.getStImg3());
			ts.setStImg3("");
			file.delete();
		}
		if(status[3].equals("remove")) {
			File file = new File(savePath+ts.getStImg4());
			ts.setStImg4("");
			file.delete();
		}
		if(status[4].equals("remove")) {
			File file = new File(savePath+ts.getStImg5());
			ts.setStImg5("");
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
			ts.setStImg1(pathList.get(0));
		}else if(!(status[0].equals("upload"))){
			ts.setStImg1(null);
		}
		if(!(pathList.get(1).equals(""))) {
			ts.setStImg2(pathList.get(1));
		}else if(!(status[1].equals("upload"))){
			ts.setStImg2(null);
		}
		if(!(pathList.get(2).equals(""))) {
			ts.setStImg3(pathList.get(2));
		}else if(!(status[2].equals("upload"))){
			ts.setStImg3(null);
		}
		if(!(pathList.get(3).equals(""))) {
			ts.setStImg4(pathList.get(3));
		}else if(!(status[3].equals("upload"))){
			ts.setStImg4(null);
		}
		if(!(pathList.get(4).equals(""))) {
			ts.setStImg5(pathList.get(4));
		}else if(!(status[4].equals("upload"))){
			ts.setStImg5(null);
		}
		
		ts.setStTitle(stTitle);
		ts.setStCategory(stCategory);
		int result = service.updateStore3(ts);
		System.out.println(ts);
		return "redirect:/storeReadyFrm.do?stNo="+ts.getStNo();
	}
	
	//스토어 상품 정보 등록 화면 구동
		@RequestMapping(value="/storeCreate4.do")
		public String storeCreate4(int stNo, Model model) {
			pageMove(stNo, model);
			return "store/storeCreate4";
		}
		
	//스토어 상품 정보 등록 insert
		@RequestMapping(value="/updateStore4.do")
		public String updateStore4(int stNo, Model model, int stDelivery, String stProduct, int stCount, String stProductcontent, int stPrice, String stContent) {
			TmpStore tmp = new TmpStore();
			tmp.setStNo(stNo);
			TmpStore ts = service.selectOneTmpStore(tmp);
			ts.setStDelivery(stDelivery);
			ts.setStProduct(stProduct);
			ts.setStProductcontent(stProductcontent);
			ts.setStPrice(stPrice);
			ts.setStCount(stCount);
			ts.setStContent(stContent);
			int result = service.updateStore4(ts);
			return "redirect:/storeReadyFrm.do?stNo="+ts.getStNo();
		}
		
	//스토어 반품/교환 화면 구동
		@RequestMapping(value="/storeCreate5.do")
		public String storeCreate5(int stNo, Model model) {
			pageMove(stNo, model);
			return "store/storeCreate5";
		}
		
	//스토어 반품/교환 등록
		@RequestMapping(value="/updateStore5.do")
		public String updateStore5(int stNo, Model model, String stReturn, String stChange) {
			TmpStore tmp = new TmpStore();
			tmp.setStNo(stNo);
			TmpStore ts = service.selectOneTmpStore(tmp);
			ts.setStReturn(stReturn);
			ts.setStChange(stChange);
			int result = service.updateStore5(ts);
			return "redirect:/storeReadyFrm.do?stNo="+ts.getStNo();
		}
		
		//Store 신청하기 추가하는 메서드
		@RequestMapping(value="/CreateStore.do")
		public String CreateStore(int stNo) {
			TmpStore ts = new TmpStore();
			ts.setStNo(stNo);
			TmpStore tmp = service.selectOneTmpStore(ts);
			
			int result = 1;
			
			int storeResult = service.createStore(tmp);
			result *= storeResult;
			int deleteResult = 0;
			/*
			if(result >0) {
				deleteResult = service.deleteTmpStore(ts);
			}else {
				System.out.println("오류");
			}*/
			
			return "redirect:/";
		}
}
