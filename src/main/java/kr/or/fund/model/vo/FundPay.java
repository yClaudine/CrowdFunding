package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FundPay {
	private int fpayNo;
	private String memberId;
	private String memberName;
	private int fundNo;
	private int fpayDeliveryfee;
	private int fpaySupport;
	private int fpayRewardTotal;	//선택한 모든 REWARD 금액 * 갯수
	private int fpayFunding;		//펀딩액(리워드 토탈 + 후원금)
	private int fpayFinalpay;		//배송비 포함 최종 결제할 금액
	private int fpayStatus;			//0:결제 완료 1:결제 취소 완료
	private String fpayDate;
	private int nameShow;			//0:공개	1:비공개
	private int fundingShow;		//0:공개 1:비공개
	private int payMethod;			//0:무통장입금/1:카드결제
	private int memCouponNo;
}
