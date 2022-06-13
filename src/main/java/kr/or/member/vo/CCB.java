package kr.or.member.vo;

import java.util.ArrayList;

import kr.or.coupon.model.vo.Coupon;
import kr.or.coupon.model.vo.MemberCoupon;
import kr.or.notice.model.vo.Notice;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CCB {
	private ArrayList<Notice> notice;
	private ArrayList<Coupon> coupon;
	private ArrayList<MemberCoupon> mCoupon;
	private String pagination;
}
