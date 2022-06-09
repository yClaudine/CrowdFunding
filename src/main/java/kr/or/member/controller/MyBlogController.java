package kr.or.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.service.MyBlogService;
import kr.or.member.vo.MBP;

@Controller
public class MyBlogController {
	
	@Autowired
	private MyBlogService service;
	
	@ResponseBody
	@RequestMapping(value="insertMyblog.do",produces="application/json;charset=utf-8")
	public String insertMyblog(String memComment,String visitor,String memberId ) {
		
		int result = service.insertMyblog(memComment,visitor,memberId);
		return new Gson().toJson(result);
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectMyblog.do",produces="application/json;charset=utf-8")
	public String selectMyblog(String memberId,int req) {
		
		 MBP mbp = service.selectMyblog(memberId,req);
		 
		 
		return new Gson().toJson(mbp);
	}
	@ResponseBody
	@RequestMapping(value="updateMyblog.do",produces="application/json;charset=utf-8")
	public String updateMyblog(String memComment, int blogNo) {
			
		int result = service.updateMyblog(memComment,blogNo);
		return new Gson().toJson(result);
	}
	
	
	@ResponseBody
	@RequestMapping(value="deleteMyblog.do",produces="application/json;charset=utf-8")
	public String deleteMyblog(int blogNo) {
		
		int result =service.deleteMyblog(blogNo);
		return new Gson().toJson(result);
	}
}
