package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;

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
	@RequestMapping(value="myPageFrm.do")
	public String myPageFrm() {
		
		return "member/mypage";
	}
	@RequestMapping(value="pwChangeFrm.do")
	public String pwChangeFrm() {
		return "member/pwChange";
	}
	@RequestMapping(value="setting.do")
	public String setting() {
		return "member/setting";
	}
	@RequestMapping(value="updateMemberFrm.do")
	public String updateMemberFrm() {
		
		return "member/updateMember";
	}
	@RequestMapping(value="signoutFrm.do")
	public String signoutFrm() {
		
		return "member/signout";
	}
	@RequestMapping(value="findPw.do")
	@ResponseBody
	public String findPw(Member m){
		System.out.println(m);
		Member pwCh = service.selectOneMember(m);
		return new Gson().toJson(pwCh);
	}
	
	@RequestMapping(value="signout.do")
	public String deleteMember(@SessionAttribute(required=false) Member m) {
		
		int result = service.deleteMember(m);
		if(result>0) {
			
			return "redirect:logout.do";
		}else {
			return "redirect:signoutFrm.do";
		}
	}
	@RequestMapping(value="changePw.do")
	public String changePw(Member m) {
		int result = service.updatePwMember(m);
		if(result>0) {
			return "redirect:logout.do";
		}else {
			return "redirect:pwChangeFrm.do";
		}
		
	}
	@RequestMapping(value="memberUpdate.do")
	public String memberUpdate(Member member,@SessionAttribute(required=false)Member m,HttpSession session) {
		
		
		int result = service.updateMember(member);
		System.out.println(m);
		m.setMemberName(member.getMemberName());
		m.setMemEmail(member.getMemEmail());
		m.setMemPhone(member.getMemPhone());
		
		if(result>0) {
			session.setAttribute("m", m);
			return "member/mypage";	
		}else {
			return "member/updateMember";
		}
		
	}
	@RequestMapping(value="selectAllMember.do",produces ="application/json;charset=utf-8")
	@ResponseBody
	public String selectAllMember() {
		ArrayList<Member> list = new ArrayList<Member>();
		list = service.selectAllMember();
		
		return new Gson().toJson(list);
	}
	
	
		
	
	
}

