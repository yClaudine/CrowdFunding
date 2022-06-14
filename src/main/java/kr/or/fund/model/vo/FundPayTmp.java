package kr.or.fund.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundPayTmp {
	private long fpayNo;
	private String memberId;
	private String memberName;
	private long fundNo;
	private long fpayDeliveryfee;
	private long fpaySupport;
	private long fpayRewardTotal;	//선택한 모든 REWARD 금액 * 갯수
	private long fpayFunding;		//펀딩액(리워드 토탈 + 후원금)
	private long fpayFinalpay;		//배송비 포함 최종 결제할 금액
	private long fpayStatus;			//0:결제 완료 1:결제 취소 완료
	private String fpayDate;
	private long nameShow;			//0:공개	1:비공개
	private long fundingShow;		//0:공개 1:비공개
	private long payMethod;			//0:무통장입금/1:카드결제
	private long memCouponNo;
	
	//추가 컬럼
	private long fundingSum;
	private long supporterSum;
	private long msdate;
}
