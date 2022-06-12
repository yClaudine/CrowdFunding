package kr.or.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.fund.model.vo.Fund;
import kr.or.fund.model.vo.FundPay;
import kr.or.member.vo.Follow;
import kr.or.member.vo.Member;
import kr.or.notice.model.vo.Notice;
import kr.or.store.model.vo.Store;
import kr.or.store.model.vo.Storepay;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member selectOneMember(Member mem) {
		
		Member m = sqlSession.selectOne("member.selectOneMember",mem); 
		return m;
	}

	public int signUpMember(Member m) {
		
		int result = sqlSession.insert("member.signUpMember",m);
		return result;
	}

	public int deleteMember(Member m) {
		
		int result = sqlSession.delete("member.deleteMember",m);
		return result;
	}

	public int changePw(Member m) {
		
		int result = sqlSession.update("member.updatePw",m);
		return result;
	}

	public int updateMember(Member m) {
		
		int result = sqlSession.update("member.updateMember",m);
		return result;
	}

	public ArrayList<Member> selectAllMember() {
		List list = sqlSession.selectList("member.selectAllMember");
		return (ArrayList<Member>)list;
	}

	

	public ArrayList<MemberCoupon> selectmCoupon(HashMap<String, Object> mCmap) {
		List list = sqlSession.selectList("member.selectMCoupon",mCmap);
		return (ArrayList<MemberCoupon>)list;
	}

	public Coupon selectCoupon(int couponNo) {
		Coupon coupon = sqlSession.selectOne("member.selectCoupon",couponNo);
		return coupon;
	}

	public Notice selectNotice(int couponNo) {
		
		Notice notice = sqlSession.selectOne("member.selectNotice",couponNo);
		return notice;
	}

	public ArrayList<Coupon> selectCouponZone(HashMap<String, Object> map) {
		
		List list = sqlSession.selectList("member.selectCZone",map);
		return	(ArrayList<Coupon>) list;
	}

	public int CtotalCount(String mainTarget) {
		int totalCount = sqlSession.selectOne("member.selectCCount",mainTarget);
		return totalCount;
	}

	public ArrayList<Fund> selectFund(HashMap<String, Object> map) {
		
		List list =sqlSession.selectList("member.selectFund",map);
		return (ArrayList<Fund>)list;
	}

	

	public ArrayList<Storepay> selectStorepay(HashMap<String, Object> map) {
		
		List list = sqlSession.selectList("member.getStorepay",map);
		return (ArrayList<Storepay>)list;
	}

	public Store getStore(int storeNo) {
		
		Store s = sqlSession.selectOne("member.getStore",storeNo);
		return s;
	}

	public int sTotalCount(int memberNo) {
		int count = sqlSession.selectOne("member.getScount",memberNo);
		return count;
	}

	public ArrayList<Member> selectAllMemberL(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.selectAllMemberL",map);
		return (ArrayList<Member>) list;
	}

	public int mCount() {
		int count = sqlSession.selectOne("member.mCount");
		return count;
	}

	public ArrayList<Member> selectMemberName(String memberName) {
		
		List list = sqlSession.selectList("member.selectMemberName",memberName);
		return (ArrayList<Member>)list;
	}

	

	public int insertFolloew(Follow f) {
		int result = sqlSession.insert("member.insertFollow",f);
		return result;
	}

	public int deleteFollow(Follow f) {
		int result = sqlSession.delete("member.deleteFollow",f);
		return result;
	}

	public int findFollow(Follow f) {
		int result = sqlSession.selectOne("member.findFollow",f);
		return result;
	}

	public ArrayList<Follow> selectFollower(String memberId) {
		List list = sqlSession.selectList("member.selectFollower",memberId);
		return (ArrayList<Follow>)list;
	}

	public Member selectTargetMember(String followerId) {
		Member m  = sqlSession.selectOne("member.selectTargetM",followerId);
		return m;
	}

	public ArrayList<Follow> selectFollowing(String memberId) {
		 List list = sqlSession.selectList("member.selectFollowing",memberId);
		return (ArrayList<Follow>)list;
	}

	public Member selectFollowerMember(String targetId) {
		Member m = sqlSession.selectOne("member.selectFollowingM",targetId);
		return m;
	}

	public ArrayList<FundPay> selectFundpay(HashMap<String, Object> map1) {
		
		List list = sqlSession.selectList("member.selectFundPay",map1);
		return (ArrayList<FundPay>)list;
	}

	public Fund selectOneFund(int fundNo) {
		Fund f = sqlSession.selectOne("member.selectOneFund",fundNo);
		return f;
	}
	public int fTotalCount(HashMap<String, Object> map) {
		int count = sqlSession.selectOne("member.selectFcount",map);
		return count;
	}

	public ArrayList<Fund> selectSfund(HashMap<String, Object> map) {
		List list =sqlSession.selectList("member.selectSfund",map);
		return (ArrayList<Fund>)list;
	}

	public int fCount(String memberId) {
		int count = sqlSession.selectOne("member.selectSFCount",memberId);
		return count;
	}

	public ArrayList<Store> selectSstore(HashMap<String, Object> map) {
		List list =sqlSession.selectList("member.selectSstore",map);
		return (ArrayList<Store>)list;
		
	}

	public int sCount(String memberId) {
		int count = sqlSession.selectOne("member.selectSSCount",memberId);
		return count;
	}

	public ArrayList<FundPay> selectFundpay(int fundNo) {
		List list = sqlSession.selectList("member.selectFP",fundNo);
		return (ArrayList<FundPay>)list;
	}

	public int getFinalPay(int fpayNo) {
		int totalpay = sqlSession.selectOne("member.totalpay",fpayNo);
		return totalpay;
	}

	public int getFpaySupport(int fpayNo) {
		int totalpay = sqlSession.selectOne("member.totalpay1",fpayNo);
		return totalpay;
	}

	public ArrayList<Storepay> selectStorepay(int storeNo) {
		List list = sqlSession.selectList("member.selectSP",storeNo);
		return (ArrayList<Storepay>)list;
	}

	public int getFinalPay2(int storepayNo) {
		int totalpay = sqlSession.selectOne("member.totalpay2",storepayNo);
		return totalpay;
	}
	

}
