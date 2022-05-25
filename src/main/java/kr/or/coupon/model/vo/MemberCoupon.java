package kr.or.coupon.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberCoupon {
	private int memCouponNo;
	private int memberNo;
	private String useDate;
	private int couponUse;
	private int couponStatus;
	private int couponNo;
	private String validEnd;
}
