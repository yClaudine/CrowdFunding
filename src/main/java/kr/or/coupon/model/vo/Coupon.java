package kr.or.coupon.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {
	private int couponNo;
	private String couponName;
	private int couponType;
	private int discount;
	private String mainTarget;
	private String subTarget;
	private String validStart;
	private String validEnd;
	private int minPrice;
	private int couponStatus;
}
