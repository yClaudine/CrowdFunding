package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.annotation.SessionScope;

import com.google.gson.Gson;


import kr.or.member.service.MemberService;
import kr.or.member.vo.CCB;
import kr.or.member.vo.FFP;
import kr.or.member.vo.Follow;
import kr.or.member.vo.MP;
import kr.or.member.vo.Member;
import kr.or.member.vo.SSP;

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
	@RequestMapping(value="mycouponFrm.do")
	public String mycouponFrm() {
		return "member/myCoupon";
				
	}
	
	//mycoupon데이터를 가져오기
	@ResponseBody
	@RequestMapping(value="myCoupon.do",produces="application/json;charset=utf-8")
	public String myCoupon(int memberNo,int status){
	
		CCB list = new CCB(); 
		//마이페이지에서 조회한 쿠폰 번호리스트를 가지고  조회해야합니다
		list = service.getMyCouponList(memberNo,status);
		return new Gson().toJson(list); 
				
	}
	@ResponseBody
	@RequestMapping(value="myCouponList.do",produces="application/json;charset=utf-8")
	public String myCouponList(String mainTarget,int req) {
		
		CCB list = new CCB();
		list =service.selectCouponZone(mainTarget,req);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="fundingFrm.do")
	public String fundingFrm() {
		
		return "member/fund";
	}
	
	@ResponseBody
	@RequestMapping(value="/myfund.do",produces="application/json;charset=utf-8")
	public String myfund(int req,String memberId) {
		//데이터를 가져와야하는 테이블 fund_pay 결제한 최종금액 
		//fund 목표금액, 펀드제목, 시작일 종료일 
		FFP list = service.selectFundList(req,memberId);
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/mystoreFrm.do")
	public String mystoreFrm() {
		
		return "member/mystore";
	}
	
	@ResponseBody
	@RequestMapping(value="/mystore.do",produces="application/json;charset=utf-8")
	public String mystore(int memberNo, int req) {
		//가져와야하는 데이터 상품번호로 조회 상품의 이름 
		
		SSP list = new SSP();
		list=service.getStoreList(memberNo,req);
		
		return new Gson().toJson(list);
	}
	
	@RequestMapping(value="/myfollowerFrm.do")
	public String myfollowerFrm() {
		
		return "member/follower";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectAllMS.do",produces="application/json;charset=utf-8")
	public String selectAllMS(int req) {
		
		MP list= service.selectAllMS(req);
		return new Gson().toJson(list);
	}
	@ResponseBody
	@RequestMapping(value="memberName.do",produces="application/json;charset=utf-8")
	public String memberName(String memberName) {
		
		ArrayList<Member> list = service.getMemberName(memberName);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="insertFollow.do",produces="application/json;charset=utf-8")
	public String inserFollow(String followerId,String targetId) {
		
		int result = service.insertFollow(followerId,targetId);
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="deleteFollow.do",produces="application/json;charset=utf-8")
	public String deleteFollow(String followerId,String targetId) {
		
		int result = service.deleteFollow(followerId,targetId);
		return new Gson().toJson(result);
	}
	@ResponseBody
	@RequestMapping(value="findFollow.do",produces="application/json;charset=utf-8")
	public String findFollow(String followerId,String targetId) {
		
		int result = service.findFollow(followerId,targetId);
		return new Gson().toJson(result);
	}
	@ResponseBody
	@RequestMapping(value="myFollower.do",produces="application/json;charset=utf-8")
	public String myFollower(String memberId) {
		
		ArrayList<Member> member = new ArrayList<Member>();
		member=service.myFollower(memberId);
		return new Gson().toJson(member);
	}
	
	@RequestMapping(value="myfollowingFrm.do")
	public String myfollowing() {
		
		return "member/myfollowing";
	}
	@ResponseBody
	@RequestMapping(value="myFollowing.do",produces="application/json;charset=utf-8")
	public String myfollowing(String memberId) {
		
		ArrayList<Member> member = new ArrayList<Member>();
		member = service.myFollowing(memberId);
		return new Gson().toJson(member);
	}
	
	@RequestMapping(value="myProfile.do")
	public String  myProfile(String memberId,Model model) {
		Member mem = new Member();
		mem.setMemberId(memberId);
		Member m = service.selectOne(mem);
		
		model.addAttribute("m", m);
		return "member/myProfile";
	}
	
	
}

