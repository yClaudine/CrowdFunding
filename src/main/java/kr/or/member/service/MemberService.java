package kr.or.member.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundPay;
import kr.or.member.dao.MemberDao;
import kr.or.member.vo.CCB;
import kr.or.member.vo.FFP;
import kr.or.member.vo.Follow;
import kr.or.member.vo.MP;
import kr.or.member.vo.Member;
import kr.or.member.vo.SSP;
import kr.or.notice.model.vo.Notice;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.Storepay;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;
	
	
	
	public Member selectOneMember(Member mem) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(mem);
	}

	public int signUpMember(Member m) {
		// TODO Auto-generated method stub
		
		
		
		return dao.signUpMember(m);
	}

	public int deleteMember(Member m) {
		// TODO Auto-generated method stub
		return dao.deleteMember(m);
	}

	public int updatePwMember(Member m) {
		// TODO Auto-generated method stub
		return dao.changePw(m);
	}

	public int updateMember(Member m) {
		
		return dao.updateMember(m);
	}

	public ArrayList<Member> selectAllMember() {
		
		return dao.selectAllMember();
	}

	public CCB getMyCouponList(int memberNo, int status) {
		CCB list = new CCB();
		HashMap<String,Object> mCmap = new HashMap<String,Object>();
		mCmap.put("memberNo", memberNo);
		mCmap.put("status",status);
		ArrayList<MemberCoupon> mCoupon = dao.selectmCoupon(mCmap);
		list.setMCoupon(mCoupon);
		ArrayList<Coupon> coupon = new ArrayList<Coupon>();
		//쿠폰 구하기
		for(MemberCoupon mc: mCoupon) {
			Coupon cp = new Coupon();
			 cp= dao.selectCoupon(mc.getCouponNo());
			 coupon.add(cp);
		}
		//공지사항 구하기 
		ArrayList<Notice> notice=  new ArrayList<Notice>();
		for(Coupon c : coupon) {
			Notice nc= new Notice(); 
			nc= dao.selectNotice(c.getCouponNo());
			notice.add(nc);
		}
		
		list.setCoupon(coupon);
		list.setNotice(notice);
		
		
		
		
		return list;
	}

	public CCB selectCouponZone( String mainTarget, int req) {
		CCB list = new CCB();
		HashMap<String,Object> map =new HashMap<String,Object>();
		int numPerPage = 4; 
		int last =	numPerPage*req;
		int first = last - numPerPage + 1;
		//쿠폰의 갯수 종류를 넣어서 진행하기 
		map.put("first", first);
		map.put("last", last);
		map.put("mainTarget",mainTarget);
		
		//쿠폰을 먼저 값을 넘겨줘서 구해줌 
		ArrayList<Coupon> coupon = dao.selectCouponZone(map);
		
		ArrayList<Notice> notice = new ArrayList<Notice>();
		for (Coupon c : coupon) {
			Notice nc= new Notice(); 
			nc= dao.selectNotice(c.getCouponNo());
			notice.add(nc);
		}
		
		//totalCount 구하기 
		int totalCount = dao.CtotalCount(mainTarget);
		//전역변수 선언 
		int totalPage=0; 
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int pageNaviSize=4;
	
		int pageNo=1;
		String pageNavi="";
		pageNavi +="<div class='btn-group me-2 page' role='group' aria-label='First group'>";
		String mainTarget1 = "\""+mainTarget+"\"";
		if(req>3) {
			pageNo = req-2;
		}
		if(pageNo!=1) {
			int bC = pageNo-1;
			
			pageNavi +="<button class='btn btn-secondary btns' onclick='couponZon("+mainTarget1+","+bC+")'>《</button>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(req==pageNo) {
				pageNavi +="<button class='btn btn-secondary btns' id='active' onclick='couponZon("+mainTarget1+","+pageNo+")'>"+pageNo+"</button>";
			}else {
				pageNavi +="<button class='btn btn-secondary btns' onclick='couponZon("+mainTarget1+","+pageNo+")'>"+pageNo+"</button>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
			
		}//페이지 요소 끝 
		
		pageNavi+="</div>";
		list.setCoupon(coupon);
		list.setNotice(notice);
		list.setPagination(pageNavi);
		
		return list;
	}
	
	
	//펀드요소 구하기
	public FFP selectFundList(int req, String memberId, int fpayStatus) {
		FFP list = new FFP();
		int numPerPage = 4; 
		int last =	numPerPage*req;
		int first = last - numPerPage + 1;
		
		HashMap<String,Object> map =new HashMap<String,Object>();
		map.put("memberId", memberId);
		map.put("fpayStatus",fpayStatus);
		map.put("first", first);
		map.put("last", last);
		
		ArrayList<FundPay> fp = dao.selectFundpay(map); 
		//쿠폰의 갯수 종류를 넣어서 진행하기 
		
		ArrayList<Fund> fund  = new ArrayList<Fund>();
		for(FundPay f : fp) {
			Fund fd = dao.selectOneFund(f.getFundNo());
			fund.add(fd);
		}
		
		//쿠폰을 먼저 값을 넘겨줘서 구해줌 
		
		
		
		
		
		//totalCount 구하기 
		int totalCount = dao.fTotalCount(map);
		//전역변수 선언 
		int totalPage=0; 
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int pageNaviSize=4;
	
		int pageNo=1;
		String pageNavi="";
		pageNavi +="<div class='btn-group me-2 page' role='group' aria-label='First group'>";
		
		if(req>3) {
			pageNo =req-2;
		}
		if(pageNo!=1) {
			int bC = req-1;
			
			pageNavi +="<button class='btn btn-secondary btns' onclick='fundlist("+bC+")'>《</button>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(req==pageNo) {
				pageNavi +="<button class='btn btn-secondary btns' id='active' onclick='fundlist("+pageNo+")'>"+pageNo+"</button>";
			}else {
				pageNavi +="<button class='btn btn-secondary btns' onclick='fundlist("+pageNo+")'>"+pageNo+"</button>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
			
		}//페이지 요소 끝 
		
		pageNavi+="</div>";
		list.setFpayCount(totalCount);
		list.setFpay(fp);
		list.setFund(fund);
		list.setPagenation(pageNavi);
		return list;
	}

	public SSP getStoreList(int memberNo, int req) {
		
		SSP list = new SSP();
		HashMap<String,Object> map =new HashMap<String,Object>();
		int numPerPage = 4; 
		int last =	numPerPage*req;
		int first = last - numPerPage + 1;
		//쿠폰의 갯수 종류를 넣어서 진행하기 
		map.put("first", first);
		map.put("last", last);
		map.put("memberNo",memberNo);
		
		//쿠폰을 먼저 값을 넘겨줘서 구해줌 
		ArrayList<Storepay> storepay = dao.selectStorepay(map);
		ArrayList<Store> store = new ArrayList<Store>();
		for(Storepay sp : storepay) {
			Store s = new Store();
			s = dao.getStore(sp.getStoreNo());
			store.add(s);
		}
		
		
		//totalCount 구하기 
		int totalCount = dao.sTotalCount(memberNo);
		//전역변수 선언 
		int totalPage=0; 
		if(totalCount%numPerPage==0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		
		int pageNaviSize=4;
	
		int pageNo=1;
		String pageNavi="";
		pageNavi +="<div class='btn-group me-2 page' role='group' aria-label='First group'>";
		
		if(req>3) {
			pageNo=req-2;
		}
		if(pageNo!=1) {
			int bC = req-1;
			
			pageNavi +="<button class='btn btn-secondary btns' onclick='storelist("+bC+")'>《</button>";
		}
		for(int i=0; i<pageNaviSize; i++) {
			if(req==pageNo) {
				pageNavi +="<button class='btn btn-secondary btns' id='active' onclick='storelist("+pageNo+")'>"+pageNo+"</button>";
			}else {
				pageNavi +="<button class='btn btn-secondary btns' onclick='storelist("+pageNo+")'>"+pageNo+"</button>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
			
		}//페이지 요소 끝 
		
		pageNavi+="</div>";
		list.setStore(store);
		list.setStorePay(storepay);
		list.setPagenation(pageNavi);
		list.setStoreCount(totalCount);
		return list;
	}

	public MP selectAllMS(int req) {
		
		MP list = new MP();
		ArrayList<Member> member = new ArrayList<Member>();
		
		HashMap<String,Object> map =new HashMap<String,Object>();
		int numPerPage = 6; 
		int last =	numPerPage*req;
		int first = last - numPerPage + 1;
		//쿠폰의 갯수 종류를 넣어서 진행하기 
		map.put("first", first);
		map.put("last", last);
		
		
		//쿠폰을 먼저 값을 넘겨줘서 구해줌 
		member = dao.selectAllMemberL(map);
		
		int count = dao.mCount();
		
		int totalPage=0;
		if(count%numPerPage==0) {
			totalPage= count/numPerPage;
		}else {
			 totalPage = count/numPerPage+1;
		}
		//totalCount 구하기 
		
		//전역변수 선언 
		String pageNavi="";
		
		
		pageNavi +="<div class='btn-group me-2 page' role='group' aria-label='First group'>";
		
			if(req<=totalPage) {
				int bC=req+1;
				pageNavi +="<button class='btn btn-info btns bgm' onclick='allMember("+bC+")'>더보기</button>";
			}else if(req>totalPage) {
				
				pageNavi +="<button class='btn btn-info btns bgm'>더보기 완료</button>";
			}
			
	
		
				
		pageNavi+="</div>";
		list.setList(member);
		list.setPagenation(pageNavi);
		
		return list;
		
		
	}

	

	public ArrayList<Member> getMemberName(String memberName) {
		
		
		return dao.selectMemberName(memberName);
	}

	

	

	public int insertFollow(String followerId, String targetId) {
		Follow f = new Follow();
		f.setTargetId(targetId);
		f.setFollowerId(followerId);
		f.setMemberId(followerId);
		
		return dao.insertFolloew(f);
	}

	public int deleteFollow(String followerId, String targetId) {
		Follow f = new Follow();
		f.setTargetId(targetId);
		f.setFollowerId(followerId);
		
		return dao.deleteFollow(f);
	}

	public int findFollow(String followerId, String targetId) {
		Follow f = new Follow();
		f.setTargetId(targetId);
		f.setFollowerId(followerId);
		return dao.findFollow(f);
	}

	public ArrayList<Member> myFollower(String memberId) {
		ArrayList<Follow> fol = dao.selectFollower(memberId);
		
		ArrayList<Member> member= new ArrayList<Member>();
		for(Follow f : fol) {
			System.out.println(f);
			Member m =dao.selectTargetMember(f.getFollowerId());
			member.add(m);
		}
		
		return member;
	}

	public ArrayList<Member> myFollowing(String memberId) {
		ArrayList<Follow> fol = dao.selectFollowing(memberId);
		ArrayList<Member> member= new ArrayList<Member>();
		for(Follow f : fol) {
			System.out.println(f);
			Member m =dao.selectFollowerMember(f.getTargetId());
			member.add(m);
		}
		
		return member;
	}

	public Member selectOne(Member mem) {
		
		return dao.selectOneMember(mem);
	}
	

}
