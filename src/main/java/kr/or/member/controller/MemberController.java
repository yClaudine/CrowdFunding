package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.member.service.MemberService;
import kr.or.member.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="login.do")
	public String loginMember(Member mem,HttpSession session) {
		
		Member m = service.selectOneMember(mem);
		System.out.println(m);
		if(m!=null) {
		session.setAttribute("m", m);
		}
		return "redirect:/";
	}
	@RequestMapping(value="logout.do")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping(value="signUpFrm.do")
	public String signUpFrm() {
		
		return "member/signup"; 
	}
	@RequestMapping(value="findId.do",produces ="application/json;charset=utf-8")
	@ResponseBody
	public String fineId(Member m) {
		Member id = service.selectOneMember(m);
		return new Gson().toJson(id);
	}
	
	@RequestMapping(value="signUp.do")
	public String signUp(Member m) {
		System.out.println(m);
		int result = service.signUpMember(m);
		if(result==1) {
			return "redirect:/";
		}else {
			return "redirect:signUpFrm.do";
		}
		
	}
}
